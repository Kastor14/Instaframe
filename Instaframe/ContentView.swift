//
//  ContentView.swift
//  Instaframe
//
//  Created by Jean-Baptiste Waring on 2021-01-20.
//

import SwiftUI

struct ContentView: View {
    @State var samplePost:Post = Post(username: "@johnappleseed", image: Image("sample_image_1"), avatar: Image("sample_face"), loved: true)

    var body: some View {

        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 250) {
                ForEach(data) { item in
                    GeometryReader { geometry in
                        CardView(post: $samplePost)
                    }
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardData: Identifiable {
    var id = UUID()
}

let data = [ CardData(), CardData(), CardData()]
