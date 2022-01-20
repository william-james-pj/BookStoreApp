//
//  StateDTO.swift
//  wspr
//
//  Created by Pinto Junior, William James on 17/01/22.
//

import Foundation

class State: Codable {
    let id: Int?
    let name: String?
    let initials: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case initials = "sigla"
    }
}
