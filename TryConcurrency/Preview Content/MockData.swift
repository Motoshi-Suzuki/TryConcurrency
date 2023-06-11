//
//  MockData.swift
//  TryConcurrency
//
//  Created by Motoshi Suzuki on 2023/06/11.
//

import Foundation

extension User {

    static var mockUsers: [User] {
        return Bundle.main.decode([User].self, from: "users.json")
    }

    static var mockSingleUser: User {
        return Self.mockUsers[0]
    }
}

extension Post {

    static var mockPosts: [Post] {
        return Bundle.main.decode([Post].self, from: "posts.json")
    }

    static var mockSingleUser: Post {
        return Self.mockPosts[0]
    }

    static var mockSingleUserPostsArray: [Post] {
        Self.mockPosts.filter { $0.userId == 1 }
    }
}
