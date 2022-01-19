//
//  CityDTO.swift
//  wspr
//
//  Created by Pinto Junior, William James on 17/01/22.
//

import Foundation

class CityDTO: Codable {
    let id: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
    }
}
