//
//  Parsing.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 17.7.21.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, ErrorResponse> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970
    
  do {
    _ = try decoder.decode(T.self, from: data)
  } catch {
    print(String(describing: error))
  }

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
        .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}

func decodeArray<T: Decodable>(_ data: Data) -> AnyPublisher<[T], ErrorResponse> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970
    
  do {
    _ = try decoder.decode([T].self, from: data)
  } catch {
    print(String(describing: error))
  }
    
  return Just(data)
    .decode(type: [T].self, decoder: decoder)
    .mapError { error in
        .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
