//
//  APIClient.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import Foundation
import Combine

class APIClient {
    static func makeRequest<T>(request: BaseRequestProtocol) -> AnyPublisher<T, ErrorResponse> where T: Decodable {
        let components = generateURLComponents(request: request)
        
        guard let url = components.url else { return Fail(error: ErrorResponse.network(description: "Couldn't create URL")).eraseToAnyPublisher() }
        
        return APIConfig.session
            .dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                ErrorResponse.network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
    
    static func makeRequestWithArrayResponse<T>(request: BaseRequestProtocol) -> AnyPublisher<[T], ErrorResponse> where T: Decodable {
        let components = generateURLComponents(request: request)
        
        guard let url = components.url else { return Fail(error: ErrorResponse.network(description: "Couldn't create URL")).eraseToAnyPublisher() }
        
        return APIConfig.session
            .dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                ErrorResponse.network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decodeArray(pair.data)
            }
            .eraseToAnyPublisher()
    }
    
    private static func generateURLComponents(request: BaseRequestProtocol) -> URLComponents {
        var components = URLComponents()
        components.scheme = APIConfig.scheme
        components.host = APIConfig.baseHost
        components.path = request.path
        components.queryItems = request.queryItems.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        return components
    }
}
