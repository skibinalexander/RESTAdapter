//
//  RESTAdapter.swift
//  Parcel
//
//  Created by Skibin Alexander on 06.05.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import Alamofire
import SwiftyJSON

public final class RESTAdapter {
    
    // MARK: - Properties
    
    /// Singletone
    public static let shared: RESTAdapter = RESTAdapter()
    
    /// Текущая сессия
    private var session: Alamofire.Session
    private var logger: RESTLogger?
    
    // MARK: - Lifecycle
    
    public init() {
        session = Alamofire.Session.default
    }
    
    public init(
        session: Alamofire.Session,
        logger: RESTLogger? = nil
    ) {
        self.session = session
    }
    
    // MARK: - Public Implementation
    
    /// Обновить рабочую сессию адаптера
    /// - Parameter session: Обновлённая сессия адаптера
    public func update(session: Alamofire.Session) {
        self.session = session
    }
    
    /// Метод для выполнения всех запросов
    ///
    /// - Parameter request: Модель запроса
    /// - Parameter interceptor: Интерцептор запроса, для разделения логики перед отправкой запроса
    /// - Parameter success: Получение успешного выполнения запроса после выполнения валидаций
    /// - Parameter failure: Получение запроса с ошибкой после выполнения валидаций
    /// - Parameter result: Completion result работы запроса
    public func execute<R>(
        request: R,
        interceptor: RequestInterceptor? = nil,
        result: @escaping (Result<R.Response, Error>) -> Void
    ) where R: RequestModel {
        session
            .request(
                request.url,
                method: request.method,
                parameters: request.parameters,
                encoding: request.encoding,
                headers: request.headers,
                interceptor: interceptor
            )
            .validate(request.validate)
            .responseJSON { responseData in
                
                self.logger?.writeResponseLog(dataResponse: responseData)
                
                switch responseData.result {
                case .success(let data):
                    result(
                        .success(
                            R.Response(json: JSON(data))
                        )
                    )
                case .failure(let error):
                    result(
                        .failure(error)
                    )
                }
            }
    }
    
    public func executeData<R>(
        request: R,
        interceptor: RequestInterceptor? = nil,
        result: @escaping (Result<R.Response, Error>) -> Void
    ) where R: RequestModel {
        session
            .request(
                request.url,
                method: request.method,
                parameters: request.parameters,
                encoding: request.encoding,
                headers: request.headers,
                interceptor: interceptor
            )
            .validate(request.validate)
            .response { responseData in
                
                self.logger?.writeResponseLog(dataResponse: responseData)
                
                switch responseData.result {
                case .success(let data):
                    result(
                        .success(R.Response(json: JSON(data ?? Data())))
                    )
                case .failure(let error):
                    result(
                        .failure(error)
                    )
                }
            }
    }
    
}
