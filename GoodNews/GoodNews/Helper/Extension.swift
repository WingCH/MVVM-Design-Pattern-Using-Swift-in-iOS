//
// Created by WingCH on 11/8/2020.
// Copyright (c) 2020 Mohammad Azam. All rights reserved.
//

import Foundation

// Encode a URL with space, special words in Swift
// https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E6%95%99%E5%AE%A4/url-%E5%87%BA%E7%8F%BE%E7%89%B9%E6%AE%8A%E5%AD%97%E5%85%83-%E4%B8%AD%E6%96%87%E5%AD%97%E8%BD%89%E6%8F%9B-b3878821a46f
extension String {

    //將原始的url編碼轉為合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
        .urlQueryAllowed)
        return encodeUrlString ?? ""
    }

    //將編碼後的url轉換回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
}