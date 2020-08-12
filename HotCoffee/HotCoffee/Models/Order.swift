//
// Created by WingCH on 12/8/2020.
// Copyright (c) 2020 Mohammad Azam. All rights reserved.
//

import Foundation

enum CoffeeType: String, CodableEnumeration {
    static var defaultCase: CoffeeType {
        return .unknown
    }
    case cappuccino
    case latte
    case espressino
    case cortado
    case unknown


}

enum CoffeeSize: String, CodableEnumeration {
    static var defaultCase: CoffeeSize {
        return .unknown
    }
    case small
    case medium
    case large
    case unknown
}

struct Order: Codable {
    let name: String?
    let email: String?
    let type: CoffeeType?
    let size: CoffeeSize?
}

protocol CodableEnumeration: RawRepresentable, Codable where RawValue: Codable {
    static var defaultCase: Self { get }
}

extension CodableEnumeration {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            let decoded = try container.decode(RawValue.self)
            self = Self.init(rawValue: decoded) ?? Self.defaultCase
        } catch {
            self = Self.defaultCase
        }
    }
}
