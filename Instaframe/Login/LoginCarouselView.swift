//
//  LoginCarouselView.swift
//  Instaframe
//
//  Created by Jean-Baptiste Waring on 2021-01-28.
//

import SwiftUI
import URLImage
struct LoginCarouselView: View {
    @Binding var reversed:Bool
    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
                ForEach(0..<15){item in

                    URLImage(url: randomImageURL[item],
                             options: URLImageOptions(
                                               
                                cachePolicy: .ignoreCache(delay: 0.0)
                             ),
                             content: { image in
                                 image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 225, height: 225)
                                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                             })
                    
                }
                

                
                
            }
        .offset(x: reversed ? -1500 : 1500)
            .animation(
                Animation.linear(duration: 60)
                    .repeatForever(autoreverses: true)
            )

            
        }
        
    //}
}

//struct LoginCarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginCarouselView()
//    }
//}


let randomImageURL: [URL] = [URL(string: "https://source.unsplash.com/random/400x401")!, URL(string: "https://source.unsplash.com/random/400x402")!, URL(string: "https://source.unsplash.com/random/400x403")!, URL(string: "https://source.unsplash.com/random/400x404")!, URL(string: "https://source.unsplash.com/random/400x405")!, URL(string: "https://source.unsplash.com/random/400x406")!, URL(string: "https://source.unsplash.com/random/400x407")!, URL(string: "https://source.unsplash.com/random/400x408")!, URL(string: "https://source.unsplash.com/random/400x409")!, URL(string: "https://source.unsplash.com/random/400x410")!, URL(string: "https://source.unsplash.com/random/400x411")!, URL(string: "https://source.unsplash.com/random/400x412")!, URL(string: "https://source.unsplash.com/random/400x413")!, URL(string: "https://source.unsplash.com/random/400x414")!, URL(string: "https://source.unsplash.com/random/400x415")!]

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
