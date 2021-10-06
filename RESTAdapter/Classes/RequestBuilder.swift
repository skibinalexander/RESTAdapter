//
//  RequestBuilder.swift
//  RequestBuilder
//
//  Created by Скибин Александр on 06.10.2021.
//

import Alamofire
import SwiftyJSON

/// "Строитель" модели запроса
public final class RequestBuilder<R: ResponseModel> {
    
    /// Модель запроса
    public class Request: RequestModel {
        
        public typealias Response = R
        
        public var url: URL
        public var method: Alamofire.HTTPMethod
        public var headers: HTTPHeaders?
        public var parameters: Parameters?
        public var encoding: ParameterEncoding
        
        init(
            url: URL,
            method: Alamofire.HTTPMethod,
            headers: HTTPHeaders? = nil,
            parameters: Parameters? = nil,
            encoding: ParameterEncoding
        ) {
            self.url = url
            self.method = method
            self.headers = headers
            self.parameters = parameters
            self.encoding = encoding
        }
    }
    
    // MARK: - Properties
    
    public var apiPath: ApiPath
    public var headers: HTTPHeaders?
    public var parameters: Parameters?
    public var encoding: ParameterEncoding
    
    // MARK: - Init
    
    init(
        apiPath: ApiPath,
        headers: HTTPHeaders? = nil,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding
    ) {
        self.apiPath = apiPath
        self.headers = headers
        self.parameters = parameters
        self.encoding = encoding
    }
    
    // MARK: - Implementation
    
    public func buildGetRequest() -> Request {
        Request(
            url: URL(string: apiPath.path)!,
            method: .get,
            headers: headers,
            parameters: parameters,
            encoding: encoding
        )
    }
    
    public func buildPostRequest() -> Request {
        Request(
            url: URL(string: apiPath.path)!,
            method: .post,
            headers: headers,
            parameters: parameters,
            encoding: encoding
        )
    }
    
    public func buildPutRequest() -> Request {
        Request(
            url: URL(string: apiPath.path)!,
            method: .put,
            headers: headers,
            parameters: parameters,
            encoding: encoding
        )
    }
    
    func buildPatchRequest() -> Request {
        Request(
            url: URL(string: apiPath.path)!,
            method: .patch,
            headers: headers,
            parameters: parameters,
            encoding: encoding
        )
    }
    
}
