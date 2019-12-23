//
//  ContentView.swift
//  H4X0R News
//
//  Created by Mustafa Alsoffi on 22/12/2019.
//  Copyright © 2019 Mustafa Alsoffi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts)  { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        
                        
                        Text(String(post.points))
                        Text(post.title)
                        
                    }
                    
                }
                
            }
            .navigationBarTitle("H4X0R NEWS")
        }
        .onAppear {
            self.networkManager.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



