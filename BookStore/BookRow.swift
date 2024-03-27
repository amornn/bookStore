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
            
            // Vertical stack to display book name, author, and genre
            VStack(alignment: .leading, spacing: 4) {
                // Display the book name
                Text(book.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                // Display the book author
                Text(book.author)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
                
                // Display the book genre
                Text(book.genre)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }
            
            Spacer() // Spacer to push the price text to the right
            
            // Display the book price
            Text("$\(String(format: "%.2f", book.price))")
                .font(.headline)
                .fontWeight(.semibold)
        }
        .padding(.vertical, 8) // Add vertical padding to the entire stack
    }
}

struct BookImageView: View {
    let book: Book
    
    var body: some View {
        // Display the book cover image asynchronously if the smallThumbnailUrl is valid
        if let url = URL(string: book.smallThumbnailUrl) {
            AsyncImage(url: url) { image in
                image
                    .imageModifier(maxWidth: 50)
            } placeholder: {
                // Display a placeholder image while the book cover image is loading
                Image(systemName: "arrowshape.down.circle")
                    .imageModifier(maxWidth: 50)
            }
            .padding(.all, 8)
        } else {
            // Display a default book cover image if the smallThumbnailUrl is empty or invalid
            if book.imageName.isEmpty {
                Image(systemName: "book")
                    .imageModifier(maxWidth: 50)
                    .padding(.all, 8)
            } else {
                // Display the book cover image specified by the imageName property
                Image(book.imageName)
                    .imageModifier(maxWidth: 50)
                    .padding(.all, 8)
            }
        }
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
