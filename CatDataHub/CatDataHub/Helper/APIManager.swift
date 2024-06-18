//
//  APIManager.swift
//  CatDataHub
//
//  Created by Payal Porwal on 14/06/24.
//

import Foundation
import Alamofire

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case Network(Error)
}


final class APIManager {
    
    typealias Handler<T> = (T?, Error?) -> Void
    
    static let shared = APIManager()
    private init() {}
    
    // MARK: - request
    /**
     - description: - Request function is used for api call.
     - Parameters:
     - modelType: modelType parameter is type of generic which wil set the input model type and decode the data accordingly.
     - type: it is type of EndPointType protocol.
     */
    func request<T: Codable>(modelType: T.Type,
                             type: EndPointType,
                             completion: @escaping Handler<T>) {
        guard let url = type.url else { return }
        AF.request(url, method: type.method, parameters: type.parameters)
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    do {
                        if let data = response.data {
                            let catData = try JSONDecoder().decode(modelType, from: data)
                            completion(catData, response.error)
                        }
                    } catch {
                        completion([] as? T, response.error)
                    }
                case.failure(let error):
                    completion([] as? T, error)
                }
            }
    }
}
