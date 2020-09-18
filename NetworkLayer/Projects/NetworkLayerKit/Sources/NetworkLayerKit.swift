import Foundation
import Combine
import PokedexCommon

public protocol SearchProviding {
    func search(identifier: Int) -> AnyPublisher<Pokemon, Error>
}

public final class NetworkLayerKit: SearchProviding {
    
    private let searchService =  PokemonSearchService()
    
    public init() {
        
    }
    
    public func search(identifier: Int) -> AnyPublisher<Pokemon, Error> {
        return searchService.search(identifier: identifier)
    }
}
