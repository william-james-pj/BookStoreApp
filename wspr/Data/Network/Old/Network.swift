//
//  Network.swift
//  wspr
//
//  Created by Pinto Junior, William James on 17/01/22.
//

import Foundation

class Network {
    fileprivate static var session = URLSession.shared
    
    static func getStates(completion: @escaping(Result<[State], Error>) -> Void) {
        guard let url = getURL(EndPoint.UFS.states) else { return }
        
        let dataTask = session.dataTask(with: url) { response, urlResponse, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let jsonData = response else { return }
            do {
                let decoder = JSONDecoder()
                let statesResponse = try decoder.decode([State].self, from: jsonData)
                completion(.success(statesResponse))
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
    static func getCity(stateId: Int, completion: @escaping(Result<[City], Error>) -> Void) {
        guard let url = getURL(EndPoint.Cities.base + "/\(stateId)" + EndPoint.Cities.cities) else { return }
        
        let dataTask = session.dataTask(with: url) { response, urlResponse, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let jsonData = response else { return }
            do {
                let decoder = JSONDecoder()
                let statesResponse = try decoder.decode([City].self, from: jsonData)
                completion(.success(statesResponse))
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
    fileprivate static func getURL(_ path: String) -> URL? {
        return URL(string: EndPoint.baseURL + path)
    }
}
