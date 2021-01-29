//
//  PostCreator.swift
//  Instaframe
//
//  Created by Jean-Baptiste Waring on 2021-01-22.
//

import SwiftUI

struct PostCreator: View {
    @State var showNext:Bool = false
    @State var viewModel = ViewModel(username: "@johndoe", avatar: Image("sample_face"))
    var body: some View {
        

                HStack {
                    VStack {
                        ZStack {
                            CameraView(viewModel: $viewModel)
                            HStack {
                                Spacer()
                                Button(action: {
                                    showNext.toggle()
                                }) {
                                    Image(systemName: "arrow.right.circle.fill")
                                        .renderingMode(.original)
                                        .font(.system(size: 30, weight: .medium))
                                        .frame(width: 36, height: 36)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                                }
                                .padding(.trailing, 30)
                                .fullScreenCover(isPresented: $showNext, content: {
                                    CardView(post: $viewModel.previewPost)
                                })
                               
                            }
                        }
                        
                    }
                    .frame(width: screen.width)
              
                      
                }
                
            
        
    }
}

struct PostCreator_Previews: PreviewProvider {
    static var previews: some View {
        PostCreator()
    }
}

let screen = UIScreen.main.bounds
