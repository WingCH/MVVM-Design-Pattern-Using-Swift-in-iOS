//
// Created by WingCH on 24/8/2020.
// Copyright (c) 2020 WingCH. All rights reserved.
//

import Foundation

// https://island-bramble.glitch.me/stocks
// https://island-bramble.glitch.me/top-news
class Webservice {
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("Url is not correct")
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
        }.resume()
    }
}
