import Foundation

public protocol SearchProviding {
    func search(identifier: Int, completion: @escaping (_ data: Data?, _ error: String?) -> Void)
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
}
