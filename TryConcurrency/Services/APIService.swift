//
//  APIService.swift
//  TryConcurrency
//
//  Created by Motoshi Suzuki on 2023/05/28.
//

import Foundation

struct APIService {
    let urlString: String

    func getUsers(completion: @escaping ([User]) -> Void) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpRes = response as? HTTPURLResponse,
                  httpRes.statusCode == 200 else { return }
            guard error == nil else { return }
            guard let data else { return }

            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode([User].self, from: data)
                completion(decodedData)
            } catch {
                print("Unnn error")
            }
        }
        .resume()
    }
}
