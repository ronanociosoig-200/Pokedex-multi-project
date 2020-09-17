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

class PokemonSearchServiceTests: XCTestCase {
    let searchService =  PokemonSearchService()
    let validIdentifier = 182
    let invalidIdentifier = 900
    var anyPublisher: AnyPublisher<Pokemon, Error>?
    var cancellable: AnyCancellable?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchWithValidIdentifierPasses() throws {
        anyPublisher = searchService.search(identifier: validIdentifier)
        
        if let publisher = anyPublisher {
            cancellable = publisher.sink(receiveCompletion: { completion in
                
            }, receiveValue: { (pokemon) in
                
            })
        }
    }
}
