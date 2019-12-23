//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Mustafa Alsoffi on 22/12/2019.
//  Copyright © 2019 Mustafa Alsoffi. All rights reserved.
//

import Foundation


class NetworkManager: ObservableObject {
   @Published var posts = [Post]()
   func fetch() {
    if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, err) in
            if err == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
               let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                         self.posts = results.hits

                        }
                    } catch {
                        print(err)
                  }
                }
              }
           }
        task.resume()
       }
    }
}
