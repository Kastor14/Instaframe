//
//  CameraView.swift
//  Instaframe
//
//  Created by Jean-Baptiste Waring on 2021-01-21.
//

import SwiftUI

struct CameraView: View {
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    @State var post = Post(username: "johnappleseed", image: Image("preview_gradient"), avatar: Image("sample_face"), loved: false)
    
    
    
    var body: some View {
        TabView {
            ZStack {
                VStack {
                    Spacer()
                    CardView(preview: true, post: $post)
                    
                    
                    Spacer()
                    Button(action: {
                        self.showCaptureImageView.toggle()
                        self.post.previewImage = Image("sample_image_1")
                    }) {
                        Image(systemName: "photo.on.rectangle.angled")
                        Text("Choose another Picture")
                        
                    }
                    .frame(width: 250, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .padding(.bottom, 30)
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
                    
                    
                    
                    
                }
                if (showCaptureImageView) {
                    CaptureImageView(isShown: $showCaptureImageView, image: $post.previewImage)
                    
                    
                }
            }
            .tabItem {
                    Image(systemName: "photo.on.rectangle.angled")
                    Text("Camera Roll")
                  }
            
//            ZStack {
//                VStack {
//                    Button(action: {
//                        self.showCaptureImageView.toggle()
//                    }) {
//                        Text("Choose photos")
//                    }
//                    image?.resizable()
//                        .frame(width: 250, height: 200)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                        .shadow(radius: 10)
//
//                }
//                if (showCaptureImageView) {
//                    CaptureImageView(isShown: $showCaptureImageView, image: $image)
//                }
//            }
//            .tabItem {
//                    Image(systemName: "camera")
//                    Text("Camera")
//                  }
        }
        
        
        
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

struct CaptureImageView {
    @Binding var isShown: Bool
    @Binding var image: Image?
//    @Binding var post:Post
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
}
extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
//        picker.sourceType = .camera
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}
