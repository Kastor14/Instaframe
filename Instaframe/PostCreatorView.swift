//
//  PostCreatorView.swift
//  Instaframe
//
//  Created by Jean-Baptiste Waring on 2021-02-14.
//

import SwiftUI

struct PostCreatorView: View {
   // @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var currentUser:InstaUser
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PostCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        PostCreatorView(currentUser: .constant(sampleUser))
    }
}
