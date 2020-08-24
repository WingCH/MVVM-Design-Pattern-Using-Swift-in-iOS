//
// Created by WingCH on 24/8/2020.
// Copyright (c) 2020 WingCH. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
