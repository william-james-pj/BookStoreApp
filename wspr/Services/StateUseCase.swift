//
//  StateUseCase.swift
//  wspr
//
//  Created by Pinto Junior, William James on 20/01/22.
//

import Foundation
import Moya

protocol StateUseCase {
    func getStates(completion: @escaping(Result<[StateDTO], Error>) -> Void)
}

class GetStates: StateUseCase {
    fileprivate let provider = MoyaProvider<API>()
    
    func getStates(completion: @escaping (Result<[StateDTO], Error>) -> Void) {
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
}
