//
// Created by WingCH on 24/8/2020.
// Copyright (c) 2020 WingCH. All rights reserved.
//

import Foundation

class StockListViewModel: ObservableObject {
    var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()

    func load() {
        fetchStocks()
    }

    private func fetchStocks() {
        Webservice().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.sync {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
}
