//
//  RESTLogger.swift
//  RESTLogger
//
//  Created by Скибин Александр on 09.08.2021.
//

import Alamofire

/// Протокол описывающий результат запроса к серверу
public protocol LogResponse {
    var request: URLRequest? { get }
    var response: HTTPURLResponse? { get }
    var data: Data? { get }
    var metrics: URLSessionTaskMetrics? { get }
}

extension AFDataResponse: LogResponse {}


/// Протокол для логгеров используемых в ServerAccess
public protocol RESTLogger {
    func writeResponseLog(dataResponse: LogResponse)
}
