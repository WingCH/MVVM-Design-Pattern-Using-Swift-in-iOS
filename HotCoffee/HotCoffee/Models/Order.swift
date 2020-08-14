//
// Created by WingCH on 12/8/2020.
// Copyright (c) 2020 Mohammad Azam. All rights reserved.
//

import Foundation

enum CoffeeType: String, CodableEnumeration, CaseIterable {

    static var defaultCase: CoffeeType {
        return .unknown
    }

    static var allCases: [CoffeeType] {
        return [.cappuccino, .latte, .espressino, .cortado]
    }
    case cappuccino
    case latte
    case espressino
    case cortado
    case unknown
}

enum CoffeeSize: String, CodableEnumeration, CaseIterable {

    static var defaultCase: CoffeeSize {
        return .unknown
    }

    static var allCases: [CoffeeSize] {
        return [.small, .medium, .large]
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

extension Order {

    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL is incorrect!")
        }

        return Resource<[Order]>(url: url)
    }()

    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        let order = Order(vm)
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL is incorrect!")
        }
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }

        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        return resource;
    }
}

extension Order {
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased())
                else {
            return nil
        }
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}

// handle enum unknown case
// https://zhuanlan.zhihu.com/p/83816429
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
