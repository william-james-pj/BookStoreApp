//
//  Endpoint.swift
//  wspr
//
//  Created by Pinto Junior, William James on 17/01/22.
//

import Foundation

struct EndPoint {
    static let baseURL = "https://servicodados.ibge.gov.br"
    
    struct UFS {
        static let states = "/api/v1/localidades/estados"
    }
    
    struct Cities {
        static let base = "/api/v1/localidades/estados"
        static let cities = "/distritos"
    }
}
