//
//  BookDetailView.swift
//  BookStore
//
//  Created by amorn.narula on 26/3/24.
//

import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject var book: Book
    @State private var showAlert = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ZStack {
                // Background gradient spanning the entire screen
                LinearGradient(
                    gradient: Gradient(colors: [.indigoMedium, .salmonLight]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                Image(systemName: "book")
                    .imageModifier(maxHeight: 250)
                    .padding(.all, 8)
                    .frame(maxWidth: .infinity)
                //TODO: Display the book cover image asynchronously if the thumbnailUrl is valid
                //TODO: Display a placeholder image while the book cover image is loading
                //TODO: Display a default book cover image if the thumbnailUrl is empty or invalid
                //TODO: Display the book cover image specified by the imageName property
                
            }

            // TODO: Display // Book name, auther, genre, publisher, price, summary

            
            Spacer() // Pushes content to the top
            
            Button {
                showAlert.toggle() // Toggle the boolean value to show/hide the alert
            } label: {
                CustomButtonView() // Custom button view
                    .padding(.horizontal, 16) // Adds 16 pixels leading and trailing to the button
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    // Title and message for the alert
                    title: Text("Uh-Oh! The Button Took a Vacation"),
                    message: Text("Seems like the button decided to go on an unexpected holiday! Don't worry, we've sent it a postcard with a gentle reminder to return soon. In the meantime, let's enjoy some button-free adventures!"),
                    dismissButton: .default(Text("OK")) // Dismiss button with "OK" text
                )
            }
        } //: VStack
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(book.name)
                    .foregroundColor(.salmonLight)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
            }
        } //: Toolbar
        
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        let book = Book(
            imageName: "to_kill_a_mockingbird",
            smallThumbnailUrl: "",
            thumbnailUrl: "",
            name: "To Kill a Mockingbird",
            author: "Harper Lee",
            price: 10.99,
            summary: "A novel set in the American South during the 1930s, dealing with themes of racism and injustice.",
            publisher: "J.B. Lippincott & Co.",
            genre: "Fiction")

        BookDetailView()
            .environmentObject(book)
    }
}
