//
//  ContentView.swift
//  Instaframe
//
//  Created by Jean-Baptiste Waring on 2021-02-06.
//

import SwiftUI
import CoreData
import CloudKit


struct ContentView: View {
   // @State var userUUID:String
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: InstaframePost.getPostFetchRequest())  var listItems: FetchedResults<InstaframePost>
     
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(listItems) { post in
                     CardView(preview: false, lovedCard: false, post: post)
                        
                    }
                    .onDelete(perform: deleteItem)
                    .onAppear(perform: {
                        print("ContentView() User UUID: \(String(describing: currentUser.userID))")
                    })
                }
                Button(action: addItem) {
                    Text("Add Item")
                }
            }
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    
    
    func deleteItem(indexSet: IndexSet) {
        let source = indexSet.first!
        let listItem = listItems[source]
        managedObjectContext.delete(listItem)
        saveItems()
    }
    
    func addItem() {
        let newItem = InstaframePost(context: managedObjectContext)
        newItem.userID = "New Item \(listItems.count+1)"
        print("There are \(listItems[0].likeCount) records")
        
        saveItems()
       
    }
    
    func saveItems() {
        do {
            try managedObjectContext.save()
            print("saved Item")
        } catch {
            print(error)
        }
    }
    
//
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let sampleUser = InstaUser()

