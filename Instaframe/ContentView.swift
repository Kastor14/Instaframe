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
        
        
      
        VStack {
            
            HStack {
                Text("Instaframe")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                Spacer()
                Image("sample_face")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color.white)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                
                Button(action: {}) {
                    Image(systemName: "gearshape")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                }
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 250) {
                    ForEach(data) { item in
                        GeometryReader { geometry in
                            CardView(post: $samplePost)
                                .padding(.horizontal, 30)
                                .padding(.top, 30)
                        }
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

let data = [ CardData(), CardData(), CardData(),CardData(),CardData(),CardData()]
