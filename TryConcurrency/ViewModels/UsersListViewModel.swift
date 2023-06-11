//
//  UsersListViewModel.swift
//  TryConcurrency
//
//  Created by Motoshi Suzuki on 2023/05/30.
//

import Foundation

final class UsersListViewModel: ObservableObject {

    @Published var users: [User] = []

    func fetchUsers() {
        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
        apiService.getJson { (result: Result<[User], APIError>) in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension UsersListViewModel {

    convenience init(isPreview: Bool = false) {
        self.init()
        if isPreview {
            self.users = User.mockUsers
        }
    }
}
