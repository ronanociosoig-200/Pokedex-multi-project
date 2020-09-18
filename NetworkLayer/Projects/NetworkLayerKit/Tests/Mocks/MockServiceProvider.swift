//
//  MockServiceProvider.swift
//  Wefox PokedexTests
//
//  Created by Ronan on 10/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

// swiftlint:disable all

import Foundation
import Moya
import Combine
import PokedexCommon

@testable import NetworkLayerKit

class MockPokemonSearchService: PokemonSearchLoadingService {
    var provider: MoyaProvider<PokemonSearchEndpoint> {
        return MoyaProvider<PokemonSearchEndpoint>(stubClosure: MoyaProvider.immediatelyStub)
    }

    func search(identifier: Int) -> AnyPublisher<Pokemon, Error> {
        return mockPokemon()
    }
    
    
    private func mockPokemon() -> AnyPublisher<Pokemon, Error> {
        let data = try! MockData.loadResponse()
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let pokemon = try! decoder.decode(Pokemon.self, from: data!)
        let subject = CurrentValueSubject<Pokemon, Error>(pokemon)
        return subject.eraseToAnyPublisher()
    }
}
