//
// Created by WingCH on 12/8/2020.
// Copyright (c) 2020 Mohammad Azam. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

struct Resource<T: Codable> {
    let url: URL
}

class Webservice {
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)

                DispatchQueue.main.async {
                    completion(.success(result))
                }

            } catch {
                print(error)
                completion(.failure(.decodingError))
            }

        }.resume()
    }
}
