//
//  RESTAdapterRequestProtocol.swift
//  Parcel
//
//  Created by Skibin Alexander on 06.05.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import Alamofire

public typealias ApiService = String
public typealias ApiFlow = String
public typealias ApiMiddlePath = String
public typealias ApiEndpoint = String

/// Реализация Api
public struct ApiPath {
    
    // MARK: - Private
    
    private var storedPath: String
    
    // MARK: - Public
    
    public var path: String {
        return storedPath.replacingOccurrences(of: "//", with: "/")
    }
    
    public init(service: ApiService?, flow: ApiFlow?, middlePaths: [ApiMiddlePath?], endpoint: ApiEndpoint?) {
        self.storedPath = ""
        
        self.storedPath.append((service ?? "") + "/")
        self.storedPath.append((flow ?? "") + "/")
        self.storedPath.append(middlePaths.compactMap { $0 }.joined(separator: "/") + "/")
        self.storedPath.append((endpoint ?? ""))
    }
    
}

/// Базовый интерфейс запроса
public protocol RequestModel {
    
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
    
}
