//
//  PostsListViewModel.swift
//  TryConcurrency
//
//  Created by Motoshi Suzuki on 2023/06/11.
//

import Foundation

final class PostsListViewModel: ObservableObject {

    @Published var posts: [Post] = []
    var userId: Int?

    func fetchPosts() {
        guard let userId = self.userId else { return }

        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users/\(userId)/posts")
        apiService.getJson { (result: Result<[Post], APIError>) in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.posts = posts
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension PostsListViewModel {

    convenience init(isPreview: Bool = false) {
        self.init()
        if isPreview {
            self.posts = Post.mockSingleUserPostsArray
        }
    }
}
