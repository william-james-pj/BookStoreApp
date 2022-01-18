//
//  NetworkMoya.swift
//  wspr
//
//  Created by Pinto Junior, William James on 18/01/22.
//

import Foundation
import Moya

class NetworkMoya {
    fileprivate static let provider = MoyaProvider<API>()
    
    static func getStates(completion: @escaping(Result<[StateDTO], Error>) -> Void) {
        provider.request(.states) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let statesResponse = try decoder.decode([StateDTO].self, from: response.data)
                    completion(.success(statesResponse))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func getCity(_ idUF: Int, completion: @escaping(Result<[CityDTO], Error>) -> Void) {
        provider.request(.cities(idUF: idUF)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let statesResponse = try decoder.decode([CityDTO].self, from: response.data)
                    completion(.success(statesResponse))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
