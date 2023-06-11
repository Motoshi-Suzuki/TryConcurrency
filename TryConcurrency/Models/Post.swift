//
//  Post.swift
//  TryConcurrency
//
//  Created by Motoshi Suzuki on 2023/05/28.
//

import Foundation

// source https://jsonplaceholder.typicode.com/posts
// single users posts https://jsonplaceholder.typicode.com/users/1/posts

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
