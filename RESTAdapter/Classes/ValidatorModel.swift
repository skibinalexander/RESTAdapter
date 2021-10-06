//
//  ValidatorModel.swift
//  ValidatorModel
//
//  Created by Скибин Александр on 06.10.2021.
//

import Alamofire

/// Базовый интерфейс отвеса сервера
public protocol ValidatorModel {
    
    /// Валидация запроса
    ///
    /// - Parameters:
    ///   - request: The metadata associated with the request.
    ///   - response: The metadata associated with the response.
    ///   - data: Data, received from server.
    /// - Returns: Validation result. Error or success.
    func validate(_ request: URLRequest?, _ response: HTTPURLResponse, _ data: Data?) -> Result<Void, Error>
    
}
