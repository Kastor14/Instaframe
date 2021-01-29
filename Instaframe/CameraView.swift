//
//  CameraView.swift
//  Instaframe
//
//  Created by Jean-Baptiste Waring on 2021-01-21.
//

import SwiftUI
import UIKit
struct CameraView: View {
    @State var image: Image? = nil
    @Binding var viewModel: ViewModel
    
    var body: some View {
        
        
        
        ZStack {
//            Need to find a better way to handle showing the camera!
//            Color(.black).opacity(viewModel.usingCamera ? 1 : 0)
//                .ignoresSafeArea(.all)
//
            VStack {
                Spacer()
                CardView(preview: true, post: $viewModel.previewPost)
                
                
                Spacer()
                Button(action: viewModel.choosePhoto, label: {
                    Image(systemName: "photo.on.rectangle.angled")
                    Text("Choose Photo")
                })
                .frame(width: 250, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .padding(.bottom, 30)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
                .sheet(isPresented: $viewModel.isPresentingImagePicker, onDismiss: {}, content: {
                    ImagePicker(sourceType: viewModel.sourceType, completionHandler: viewModel.didSelectImage)
                })
                
                Button(action: viewModel.takePhoto, label: {
                    Image(systemName: "camera")
                    Text("Take a Picture")
                })
                .frame(width: 250, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .padding(.bottom, 30)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
                .fullScreenCover(isPresented: $viewModel.isPresentingImagePicker, onDismiss: {}, content: {
                    ImagePicker(sourceType: viewModel.sourceType, completionHandler: viewModel.didSelectImage)
                })
                
                
                
                
                Spacer()
                
                
            }
            
            
        }
        
    }
}

//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraView(postInCreation: )
//    }
//}


    final class ViewModel: ObservableObject {
        var previewPost: Post
        @Published var selectedImage: UIImage?
        @Published var isPresentingImagePicker = false
        @Published var usingCamera = false
        private(set) var sourceType: ImagePicker.SourceType = .camera
        
        public init(username: String, avatar: Image) {
            previewPost = Post(username: username, image: Image("preview_gradient"), avatar: avatar, loved: false)
        }
        
        func choosePhoto() {
            
            sourceType = .photoLibrary
            isPresentingImagePicker = true
        }
        
        func takePhoto() {
            sourceType = .camera
            usingCamera = true
            isPresentingImagePicker = true
        }
        
        func didSelectImage(_ image: UIImage?) {
            selectedImage = image
            isPresentingImagePicker = false
            usingCamera = false
            if( image != nil){
     self.previewPost.previewImage = Image(uiImage: image!)
                
            }
            
        }
        func getPost() -> Post {
            return previewPost
        }
        
    }




struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    typealias SourceType = UIImagePickerController.SourceType
    
    let sourceType: SourceType
    let completionHandler: (UIImage?) -> Void
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let viewController = UIImagePickerController()
        viewController.delegate = context.coordinator
        viewController.sourceType = sourceType
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(completionHandler: completionHandler)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let completionHandler: (UIImage?) -> Void
        
        init(completionHandler: @escaping (UIImage?) -> Void) {
            self.completionHandler = completionHandler
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            let image: UIImage? = {
                if let image = info[.editedImage] as? UIImage {
                    return image
                }
                return info[.originalImage] as? UIImage
            }()
            completionHandler(image)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            completionHandler(nil)
        }
    }
}
