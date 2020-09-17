//
//  PokemonSearchServiceTests.swift
//  NetworkLayerKitTests
//
//  Created by Ronan O'Ciosoig on 15/09/2020.
//

import XCTest
import OHHTTPStubs
import OHHTTPStubsSwift
import Combine
import PokedexCommon

@testable import NetworkLayerKit

// swiftlint:disable force_try force_unwrapping

class PokemonSearchServiceTests: XCTestCase {
    let expectationTimeOut: TimeInterval = 10.0
    let sut =  PokemonSearchService()
    let validIdentifier = 182
    let invalidIdentifier = 900
    let validResponseJSON = "Pokemon182"
    var anyPublisher: AnyPublisher<Pokemon, Error>?
    var cancellable: AnyCancellable?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        HTTPStubs.removeAllStubs()
    }

    func testSearchWithValidIdentifierPasses() throws {
        let fileWithExtension = validResponseJSON + ".json"
        guard let stubPath = OHPathForFile(fileWithExtension, type(of: self)) else {
            XCTFail("No mock data from file \(fileWithExtension)")
            return
        }
        
        let urlRequest = try! sut.getEndpoint(with: validIdentifier).urlRequest()
        let url = urlRequest.url!
        let pattern = url.path
        
        let stubResponse = HTTPStubsResponse(fileAtPath: stubPath, statusCode: 200, headers: makeMockHeaders())
    
        stub(condition: isMethodGET() && pathContains(pattern),
             response: { request in
                return stubResponse
        })
        
        let expectation = self.expectation(description: "Completes succesfully")
        anyPublisher = sut.search(identifier: validIdentifier)
        
        let expectedPokemon = loadMockPokemon(from: validResponseJSON)
        
        if let publisher = anyPublisher {
            cancellable = publisher.sink(receiveCompletion: { completion in
                expectation.fulfill()
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print(error)
                    XCTFail()
                    return
                }
                
            }, receiveValue: { (pokemon) in
                XCTAssert(pokemon == expectedPokemon, "Pokemen objects should be equal")
            })
        }
        
        waitForExpectations(timeout: expectationTimeOut)
    }
    
    func loadMockPokemon(from fileName: String) -> Pokemon {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let data = try! MockData.load(name: fileName, bundle: Bundle(for: PokemonSearchServiceTests.self))
        
        return try! decoder.decode(Pokemon.self, from: data!)
    }
    
    func makeMockHeaders() -> [String: String] {
        return ["Accept": "application/json", "Content-Type": "application/json" ]
    }
}

public func pathContains(_ string: String) -> HTTPStubsTestBlock {
    return { $0.url?.path.contains(string) ?? false }
}
