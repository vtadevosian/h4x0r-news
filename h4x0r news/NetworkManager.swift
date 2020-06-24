//
//  NetworkManager.swift
//  h4xor news
//
//  Created by Vahram Tadevosian on 6/24/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData() {
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                // Handle the error
                print(error)
            } else {
                let decoder = JSONDecoder()
                guard let data = data else { return }
                do {
                    let results = try decoder.decode(Results.self, from: data)
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch {
                    // Handle the error
                    print(error)
                }
            }
        }
        
        task.resume()
    }
}
