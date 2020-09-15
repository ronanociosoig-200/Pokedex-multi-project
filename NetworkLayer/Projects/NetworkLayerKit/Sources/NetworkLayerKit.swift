import Foundation
import Combine
import PokedexCommon

public protocol SearchProviding {
    // func search(identifier: Int, completion: @escaping (_ data: Data?, _ error: String?) -> Void)
    func search(identifier: Int) -> AnyPublisher<Pokemon, Error>
}

public final class NetworkLayerKit: SearchProviding {
    
    private let searchService =  PokemonSearchService()
    
    public init() {
        
    }
    
    public func search(identifier: Int, completion: @escaping (Data?, String?) -> Void) {
        searchService.search(identifier: identifier) { (data, errorMessage) in
            completion(data, errorMessage)
        }
    }
    
    public func search(identifier: Int) -> AnyPublisher<Pokemon, Error> {
        return searchService.search(identifier: identifier)
    }
}
