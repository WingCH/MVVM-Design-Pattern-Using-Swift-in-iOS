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

    private var articleListVM: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

        self.navigationController?.navigationBar.prefersLargeTitles = true

        let url = URL(string: "https://newsapi.org/v2/top-headlines?apiKey=a0619c76d3084717bc466b69ea59a7c6&country=hk&q=蘋果".urlEncoded())!

        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles);
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowInSection(section)
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }

        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)

        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
}
