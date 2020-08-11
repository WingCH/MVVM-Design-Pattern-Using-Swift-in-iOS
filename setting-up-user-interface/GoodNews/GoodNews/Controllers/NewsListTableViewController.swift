//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Mohammad Azam on 2/5/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

        self.navigationController?.navigationBar.prefersLargeTitles = true

        let url = URL(string: "https://newsapi.org/v2/top-headlines?apiKey=a0619c76d3084717bc466b69ea59a7c6&country=hk&q=蘋果".urlEncoded())!

        Webservice().getArticles(url: url) { _ in

        }

    }

}
