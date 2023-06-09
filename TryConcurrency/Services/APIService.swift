//
//  APIService.swift
//  TryConcurrency
//
//  Created by Motoshi Suzuki on 2023/05/28.
//

import Foundation

struct APIService {
    let urlString: String

    func getJson<T: Decodable>(
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        completion: @escaping (Result<T, APIError >) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpRes = response as? HTTPURLResponse,
                  httpRes.statusCode == 200 else {
                completion(.failure(.invalidResponseStatus))
                return
            }
            guard error == nil else {
                completion(.failure(.dataTaskError))
                return
            }
            guard let data else {
                completion(.failure(.corruptData))
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        .resume()
    }
}

enum APIError: Error {
    case invalidURL
    case invalidResponseStatus
    case dataTaskError
    case corruptData
    case decodingError
}
