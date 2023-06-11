//
//  PostsListView.swift
//  TryConcurrency
//
//  Created by Motoshi Suzuki on 2023/06/11.
//

import SwiftUI

struct PostsListView: View {

    @StateObject private var vm = PostsListViewModel(isPreview: true)
    private(set) var userId: Int
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .onAppear {
                vm.userId = self.userId
                vm.fetchPosts()
            }
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostsListView(userId: 1)
        }
    }
}
