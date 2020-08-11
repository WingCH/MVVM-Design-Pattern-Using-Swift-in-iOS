//
// Created by WingCH on 11/8/2020.
// Copyright (c) 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class Webservice {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let articleList = try JSONDecoder().decode(ArticleList.self, from: data);
                    
                    completion(articleList.articles)
                    
                    print(articleList.articles)
                } catch {
                    print("error: \(error)")
                }
                
                
            }
        }.resume()
    }
}
