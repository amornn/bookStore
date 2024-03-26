//
//  BookRow.swift
//  BookStore
//
//  Created by amorn.narula on 26/3/24.
//

import SwiftUI

struct BookRow: View {
    let book: Book
    
    var body: some View {
        // Horizontal stack to display book details
        HStack(spacing: 16) {
            // Display the book image
            BookImageView(book: book)
            
            //TODO: Display book name, author, and genre
            //TODO: Display the book price
        }
        .padding(.vertical, 8) // Add vertical padding to the entire stack
    }
}

struct BookImageView: View {
    let book: Book
    
    var body: some View {
        Image(systemName: "book")
        //TODO: Display the book cover image asynchronously if the smallThumbnailUrl is valid
        //TODO: Display a placeholder image while the book cover image is loading
        //TODO: Display a default book cover image if the smallThumbnailUrl is empty or invalid
        //TODO: Display the book cover image specified by the imageName property
    }
}


struct BookRow_Previews: PreviewProvider {
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
        BookRow(book: book)
            .padding(.all, 16)
    }
}
