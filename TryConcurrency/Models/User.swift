//
//  User.swift
//  TryConcurrency
//
//  Created by Motoshi Suzuki on 2023/05/28.
//

import Foundation

// source https://jsonplaceholder.typicode.com/users

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
