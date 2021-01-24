//
//  ServerAccessProtocols.swift
//  Parcel
//
//  Created by Skibin Alexander on 06.05.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import Alamofire

/// Базовый интерфейс запроса
public protocol RESTAdapterRequestProtocol {
    
    associatedtype Response: СoreRESTResponseProtocol
    
    /// Адрес обращения запроса
    var url: URL { get set }
    
    /// Тип запроса по REST
    var method: Alamofire.HTTPMethod { get set }
    
    /// Заголовок обращения
    var headers: HTTPHeaders? { get set }
    
    /// Параметры запроса
    var parameters: Parameters? { get set }
    
    /// Способ отправки параметров запроса
    var encoding: ParameterEncoding { get set }
    
    /// Валидация запроса
    ///
    /// - Parameters:
    ///   - request: The metadata associated with the request.
    ///   - response: The metadata associated with the response.
    ///   - data: Data, received from server.
    /// - Returns: Validation result. Error or success.
    func validate(_ request: URLRequest?, _ response: HTTPURLResponse, _ data: Data?) -> Result<Void, Error>
    
}
