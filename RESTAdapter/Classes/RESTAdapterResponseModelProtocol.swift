//
//  ServerAccessProtocols.swift
//  Parcel
//
//  Created by Skibin Alexander on 06.05.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import SwiftyJSON

/// Базовый интерфейс модели ответа сервера
public protocol RESTAdapterResponseModelProtocol {
    static func parse(json: JSON) -> Self
}
