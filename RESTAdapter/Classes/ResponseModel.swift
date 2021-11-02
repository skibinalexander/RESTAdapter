//
//  RESTAdapterResponseProtocol.swift
//  Parcel
//
//  Created by Skibin Alexander on 06.05.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import SwiftyJSON

/// Базовый интерфейс отвеса сервера
public protocol ResponseModel {
    
    /// Инициализатор
    /// - Parameter json: Data JSON object
    init(json: JSON)
    
    /// Опциональный инициализатор
    /// - Parameter json: Data JSON object optional
    init?(json: JSON?)
    
}
