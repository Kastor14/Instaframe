//
//  Home.swift
//  Instaframe
//
//  Created by Jean-Baptiste Waring on 2021-01-22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Home")
                    
                }
            PostCreator()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Post")
                }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
