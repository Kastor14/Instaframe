//
//  LoginCarouselView.swift
//  Instaframe
//
//  Created by Jean-Baptiste Waring on 2021-01-28.
//

import SwiftUI
import URLImage
struct LoginCarouselView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<10){item in
//                    URLImage(url: randomImageURL,
//                                         options: URLImageOptions(
//                                            expireAfter: 0.0,             // Expire after 5 minutes
//                                            cachePolicy: .ignoreCache() // Return cached image or download after delay
//                                         ),
//                                         empty: {
//                                            Text("Nothing here")            // This view is displayed before download starts
//                                         },
//                                         inProgress: { progress -> Text in  // Display progress
//                                            URLImageService.shared.cleanup()
//                                            return Text("Loading...")
//
//                                         },
//                                         failure: { error, retry in         // Display error and retry button
//                                            VStack {
//                                                Text(error.localizedDescription)
//                                                Button("Retry", action: retry)
//                                            }
//                                         },
//                                         content: { image in                // Content view
//                                            image
//
//                                         })
                    URLImage(url: randomImageURL,
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
                    
//                        .onAppear {
//                            URLImage(url: randomImageURL,
//                                     options: URLImageOptions(
//                                        expireAfter: 0.0,             // Expire after 5 minutes
//                                        cachePolicy: .ignoreCache() // Ensure we always get a new one
//                                     ),
//                                     empty: {
//                                        Text("Nothing here")            // This view is displayed before download starts
//                                     },
//                                     inProgress: { progress -> Text in  // Display progress
//
//                                        return Text("Loading...")
//
//                                     },
//                                     failure: { error, retry in         // Display error and retry button
//                                        VStack {
//                                            Text(error.localizedDescription)
//                                            Button("Retry", action: retry)
//                                        }
//                                     },
//                                     content: { image in                // Content view
//                                        image
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fill)
//                                            .frame(width: 225, height: 225)
//                                            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                                     })
//                        }
                }
                
    //            LazyHStack{
    //                ForEach(backgroundImages){ item in
    //                    item.image
    //
    //
    //                }
    //            }
                
                
                
            }
        }
    }
}

struct LoginCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        LoginCarouselView()
    }
}

//class LoginBackgroundImageData: Identifiable, ObservableObject {
//    var id = UUID()
//    let image =
////    func getMoreImages() -> some View {
////        return RandomLoginImage()
////    }
//
//}
//let backgroundImages = [ URLImage(url: randomImageURL,
//                                  options: URLImageOptions(
//                                     expireAfter: 300.0,             // Expire after 5 minutes
//                                     cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25) // Return cached image or download after delay
//                                  ),
//                                  empty: {
//                                     Text("Nothing here")            // This view is displayed before download starts
//                                  },
//                                  inProgress: { progress -> Text in  // Display progress
//
//                                     return Text("Loading...")
//
//                                  },
//                                  failure: { error, retry in         // Display error and retry button
//                                     VStack {
//                                         Text(error.localizedDescription)
//                                         Button("Retry", action: retry)
//                                     }
//                                  },
//                                  content: { image in                // Content view
//                                     image
//                                         .resizable()
//                                         .aspectRatio(contentMode: .fill)
//                                         .frame(width: 225, height: 225)
//                                         .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                                  }),URLImage(url: randomImageURL,
//                                              options: URLImageOptions(
//                                                 expireAfter: 300.0,             // Expire after 5 minutes
//                                                 cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25) // Return cached image or download after delay
//                                              ),
//                                              empty: {
//                                                 Text("Nothing here")            // This view is displayed before download starts
//                                              },
//                                              inProgress: { progress -> Text in  // Display progress
//
//                                                 return Text("Loading...")
//
//                                              },
//                                              failure: { error, retry in         // Display error and retry button
//                                                 VStack {
//                                                     Text(error.localizedDescription)
//                                                     Button("Retry", action: retry)
//                                                 }
//                                              },
//                                              content: { image in                // Content view
//                                                 image
//                                                     .resizable()
//                                                     .aspectRatio(contentMode: .fill)
//                                                     .frame(width: 225, height: 225)
//                                                     .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                                              }), URLImage(url: randomImageURL,
//                                                           options: URLImageOptions(
//                                                              expireAfter: 300.0,             // Expire after 5 minutes
//                                                              cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25) // Return cached image or download after delay
//                                                           ),
//                                                           empty: {
//                                                              Text("Nothing here")            // This view is displayed before download starts
//                                                           },
//                                                           inProgress: { progress -> Text in  // Display progress
//
//                                                              return Text("Loading...")
//
//                                                           },
//                                                           failure: { error, retry in         // Display error and retry button
//                                                              VStack {
//                                                                  Text(error.localizedDescription)
//                                                                  Button("Retry", action: retry)
//                                                              }
//                                                           },
//                                                           content: { image in                // Content view
//                                                              image
//                                                                  .resizable()
//                                                                  .aspectRatio(contentMode: .fill)
//                                                                  .frame(width: 225, height: 225)
//                                                                  .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                                                           })]
let randomImageURL: URL = URL(string: "https://source.unsplash.com/random/400x400")!

//struct RandomLoginImage: View {
//    var body: some View {
//
//    }
//}
