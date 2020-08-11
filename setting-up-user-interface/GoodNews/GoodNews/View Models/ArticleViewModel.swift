//
// Created by WingCH on 11/8/2020.
// Copyright (c) 2020 Mohammad Azam. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    private let article: String

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
    init(_ article: String) {
        self.article = article;
    }
}
