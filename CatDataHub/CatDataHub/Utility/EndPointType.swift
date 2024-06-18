//
//  EndPointType.swift
//  CatDataHub
//
//  Created by Payal Porwal on 16/06/24.
//

import Foundation
import Alamofire


enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var parameters: Parameters? { get }
}

enum endPointItems {
    case product
}

struct ResponseHelper {
    let responseData : Data?
    let error : Error?
    let errorMessage: String?
    init(responseData : Data?, error : Error?, errorMessage: String? = nil) {
        self.responseData = responseData
        self.error = error
        self.errorMessage = errorMessage
    }
}


extension endPointItems: EndPointType {
    var path: String {
        switch self {
        case .product :
            return "images/search"
        }
    }
    
    var baseURL: String {
        return "https://api.thecatapi.com/v1/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethod {
        switch self {
        case .product:
            return .get
        }
    }
    
    var encoding: any ParameterEncoding {
        return URLEncoding.default
    }
    
    var parameters: Parameters? {
        switch self {
        case .product :
            return ["limit":15,
                    "api_key": "live_uQCb6nylypIv0ai28cHsuaHgs3K7gNju4UO6HmD1U3xBLneNOVHXmJi4UqAexPzO",
                    "breed_ids": "beng"
            ]
        }
    }
}
