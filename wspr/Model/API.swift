//
//  API.swift
//  wspr
//
//  Created by Pinto Junior, William James on 18/01/22.
//

import Foundation
import Moya

enum API {
    case states
    case cities(idUF: Int)
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: EndPoint.baseURL) else {
            return URL(fileURLWithPath: "")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .states:
            return EndPoint.UFS.states
        case .cities(idUF: let idUF):
            return EndPoint.Cities.base + "/\(idUF)" + EndPoint.Cities.cities
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .states:
            return .get
        case .cities:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .states:
            return .requestPlain
        case .cities:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
