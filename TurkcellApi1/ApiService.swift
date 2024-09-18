//
//  ApiService.swift
//  TurkcellApi1
//
//  Created by Sefa Aycicek on 18.09.2024.
//

import UIKit

class ApiService: NSObject {
    func fetchPosts() async throws -> [Post] {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        if let url = URL(string: urlString) {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            
            return try JSONDecoder().decode([Post].self, from: data)
        }
        return []
    }
}

struct PostResponse : Codable {
    let data : [Post]
}

struct Post : Codable {
    let id : Int
    let title : String
    let body : String
}
