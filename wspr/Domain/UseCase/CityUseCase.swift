//
//  CityUseCase.swift
//  wspr
//
//  Created by Pinto Junior, William James on 20/01/22.
//

import Foundation
import Moya

protocol CityUseCase {
    func getCity(_ idUF: Int, completion: @escaping(Result<[City], Error>) -> Void)
}

class GetCity: CityUseCase {
    fileprivate let provider = MoyaProvider<API>()
    
    func getCity(_ idUF: Int, completion: @escaping (Result<[City], Error>) -> Void) {
        provider.request(.cities(idUF: idUF)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let statesResponse = try decoder.decode([City].self, from: response.data)
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
