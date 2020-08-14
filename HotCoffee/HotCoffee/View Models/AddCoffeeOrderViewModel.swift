//
// Created by WingCH on 14/8/2020.
// Copyright (c) 2020 Mohammad Azam. All rights reserved.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var email: String?
    var types: [String] {
        return CoffeeType.allCases.map {

           return $0.rawValue.capitalized
        }
    }

    var sizes: [String] {
        return CoffeeSize.allCases.map {
            $0.rawValue.capitalized
        }
    }
}