//
// Created by WingCH on 11/8/2020.
// Copyright (c) 2020 Mohammad Azam. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1;
    }

    func numberOfRowInSection(_ section: Int) -> Int {
        return self.articles.count
    }

    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }

}

struct ArticleViewModel {
    private let article: Article

    // 預設init
//    init(article: String) {
//        self.article = article
//    }
}

extension ArticleViewModel {
    // 無左 "_" 會 Invalid redeclaration of synthesized memberwise 'init(article:)'
    // 因為同預設個init 撞左
    // 預設會生成init 如上 ArticleViewModel.init(article: "AAA")
    // 如果用左"_" 只需要ArticleViewModel.init("AAA")
    // 因為呢個特性 所以無撞到
    init(_ article: Article) {
        self.article = article;
    }
}

extension ArticleViewModel {
    var title: String {
        self.article.title ?? "no title";
    }

    var description: String {
        self.article.description ?? "no description";
    }
}
