//
//  CustomViewModel.swift
//  TurkcellApi1
//
//  Created by Sefa Aycicek on 18.09.2024.
//

import UIKit

class CustomViewModel {
    private var postList : [PostCellViewModel] = []
    
    func getData(onCompleted : @escaping ()->()) {
        Task {
            do {
                let apiService = ApiService()
                let posts = try await apiService.fetchPosts()
                posts.forEach { thePost in
                    print(thePost.title)
                }
                self.postList = posts.map { PostCellViewModel(title: $0.title, body: $0.body) }
                await MainActor.run {
                    onCompleted()
                }
            } catch {
                self.postList = []
                await MainActor.run {
                    onCompleted()
                }
                print("Exception occured \(error)")
            }
        }
    }
    
    var rowCount : Int {
        return postList.count
    }
    
    func getItem(index : Int) -> PostCellViewModel {
        return postList[index]
    }
    
    func deleteItem(_ index : Int) {
        postList.remove(at: index)
    }
}
