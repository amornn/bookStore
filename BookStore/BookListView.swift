import SwiftUI

struct BookListView: View {
    @EnvironmentObject var bookList: BookList
    @State private var imageUrlsPopulated = false
    var body: some View {
        // Navigation view to wrap the list of books
        NavigationView {
            // List of books
            List {
                // Loop through each book in the book list
                ForEach(bookList.books) { book in
                    // Navigation link to navigate to the book detail view
                    NavigationLink(destination: BookDetailView().environmentObject(book)) {
                        // Display each book row
                        BookRow(book: book)
                    }
                }
            }
            // Pull-to-refresh functionality to populate image URLs
            .refreshable {
                bookList.populateImageUrls()
            }
            // Perform actions when the view appears
            .onAppear {
                // Check if image URLs are not populated yet
                if !imageUrlsPopulated {
                    // Populate image URLs
                    bookList.populateImageUrls()
                    // Set the flag to true
                    imageUrlsPopulated = true
                }
            }
            // Perform actions when the book list changes
            .onChange(of: bookList.books.first?.smallThumbnailUrl, {
                DispatchQueue.main.async {
                    // Set the flag to true when image URLs are populated
                    imageUrlsPopulated = true
                }
            })
            // Set the navigation bar title display mode to inline
            .navigationBarTitleDisplayMode(.inline)
            // Set the navigation bar toolbar
            .toolbar {
                ToolbarItem(placement: .principal) {
                    // Title text with elliptical gradient and large title font
                    Text("Books")
                        .foregroundStyle(
                            EllipticalGradient(colors: [.grayDark, .grayLight, .grayMedium])
                        )
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                }
            } //: Toolbar
        } //: Navigation View
        // Set the accent color
        .tint(.salmonLight)

    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        let bookList = BookList() // Create an instance of BookList
        BookListView()
            .environmentObject(bookList) // Provide the BookList instance as an environment object
    }
}
