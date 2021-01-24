//
//  RESTAdapterErrors.swift
//  Parcel
//
//  Created by Skibin Alexander on 13.10.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import Foundation

/// Ошибки транспорта
public enum TransportError: Error {
    
    /// Успешно
    case success
    
    /// Неизвестная ошибка
    case undefined
    
    /// Ошибка доступа
    case access
    
    // MARK: - Static Implementation
    //swiftlint:disable:next cyclomatic_complexity superfluous_disable_command
    public static func status(by code: Int?) -> TransportError {
        guard let code = code else { return .undefined }
        
        switch code {
        case 200..<300:
            return .success
        case 401, 403:
            return .access
        default:
            return .undefined
        }
    }

}
