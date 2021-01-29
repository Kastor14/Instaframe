//
//  LoginView.swift
//  Instaframe
//
//  Created by Jean-Baptiste Waring on 2021-01-28.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        
        ZStack {
            ZStack {
                
                
                VStack(spacing: 20) {
                    LoginCarouselView()
                    LoginCarouselView()
                    LoginCarouselView()
                }
                Text("Instafame")
                    .foregroundColor(.white)
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .offset(y: -250)
                    .shadow(color: Color(.black).opacity(0.83), radius: 20, x: 0, y: 3)
    
            }
            LoginWindow()
        }
        
        //        ZStack {
        //            VStack(spacing: 20) {
        //
        //
        //            }
        //        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension URL {
    private static var baseUrl: String {
        return "https://api.unsplash.com/"
    }
    
    static func with(string: String) -> URL? {
        return URL(string: "\(baseUrl)\(string)")
    }
}



struct LoginWindow: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack(spacing: 60) {
            
            ZStack {
                Path() { path in
                    path.move(to: CGPoint(x: 0, y: 62.5))
                    path.addLine(to: CGPoint(x: 280, y: 62.5))
                }
                .stroke(Color(#colorLiteral(red: 0.8431372549, green: 0.8431372549, blue: 0.8431372549, alpha: 1)).opacity(0.8), lineWidth: 1.2)
                
                VStack(spacing: 40) {
                    TextField("Email", text: $email)
                    
                    
                    
                    SecureField("Password", text: $password)
                }
                .padding(.leading, 28)
                
            }
            .frame(width: 280, height: 125)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style:.continuous))
            
            
            
            
            HStack(spacing: 25) {
                
                Button(action: {}) {
                    Text("Login")
                        .font(.system(size: 21, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(width: 125, height: 45)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3490196078, green: 0.3960784314, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.5098039216, green: 0.3725490196, blue: 0.9647058824, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                        .clipShape(RoundedRectangle(cornerRadius: 22.5))
                        .shadow(color: Color(.black).opacity(0.3), radius: 10, x: 0, y: 4)
                    
                }
                Button(action: {}) {
                    Text("SignUp!")
                        .font(.system(size: 21, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(width: 125, height: 45)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3490196078, green: 0.3960784314, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.5098039216, green: 0.3725490196, blue: 0.9647058824, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                        .clipShape(RoundedRectangle(cornerRadius: 22.5))
                        .shadow(color: Color(.black).opacity(0.3), radius: 10, x: 0, y: 4)
                }
            }
        }
        .frame(width: 345, height: 315)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.9843137255, blue: 0.9843137255, alpha: 1)), Color(#colorLiteral(red: 0.9137254902, green: 0.9098039216, blue: 0.9764705882, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: Color(.black).opacity(0.3), radius: 20, x: 0, y: 4)
    }
}

