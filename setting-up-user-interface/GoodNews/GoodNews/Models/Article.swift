//
// Created by WingCH on 11/8/2020.
// Copyright (c) 2020 Mohammad Azam. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}