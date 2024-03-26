import SwiftUI

class Book: Identifiable, ObservableObject {
    let id = UUID() // Unique identifier for the book
    @Published var imageName: String = "" // Name of the image file associated with the book
    @Published var smallThumbnailUrl: String = "" // URL for a small thumbnail image of the book
    @Published var thumbnailUrl: String = "" // URL for the full-size thumbnail image of the book
    @Published var name: String = "" // Title of the book
    @Published var author: String = "" // Author of the book
    @Published var price: Double = 0.0 // Price of the book
    @Published var summary: String = "" // Summary or description of the book
    @Published var publisher: String = "" // Publisher of the book
    @Published var genre: String = "" // Genre or category of the book
    
    // Initialize a Book instance with provided values
    init(
        imageName: String,
        smallThumbnailUrl: String,
        thumbnailUrl: String,
        name: String,
        author: String,
        price: Double,
        summary: String,
        publisher: String,
        genre: String
    ) {
        self.imageName = imageName
        self.smallThumbnailUrl = smallThumbnailUrl
        self.thumbnailUrl = thumbnailUrl
        self.name = name
        self.author = author
        self.price = price
        self.summary = summary
        self.publisher = publisher
        self.genre = genre
    }
    
    // Implement the hash(into:) method for hashing Book instances
    func hash(into hasher: inout Hasher) {
        hasher.combine(name) // Hash based on the book's name (can be customized)
    }
    
    // Implement the == operator for comparing two Book instances
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.name == rhs.name && lhs.author == rhs.author // Compare based on name and author
    }
}


class BookList: ObservableObject {
    @Published var books: [Book] = [
        Book(imageName: "to_kill_a_mockingbird",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "To Kill a Mockingbird",
             author: "Harper Lee",
             price: 10.99,
             summary: "A novel set in the American South during the 1930s, dealing with themes of racism and injustice.",
             publisher: "J.B. Lippincott & Co.",
             genre: "Fiction"),
        
        Book(imageName: "",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "1984",
             author: "George Orwell",
             price: 12.99,
             summary: "A dystopian novel set in a totalitarian regime, exploring themes of government surveillance and manipulation.",
             publisher: "Secker & Warburg",
             genre: "Science Fiction"),
        
        Book(imageName: "",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "The Great Gatsby",
             author: "F. Scott Fitzgerald",
             price: 9.99,
             summary: "A novel set in the Jazz Age, following the lives of wealthy socialites in Long Island, New York.",
             publisher: "Charles Scribner's Sons",
             genre: "Fiction"),
        
        Book(imageName: "",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "Moby-Dick",
             author: "Herman Melville",
             price: 11.99,
             summary: "A novel about the voyage of the whaling ship Pequod, captained by the obsessed Captain Ahab.",
             publisher: "Richard Bentley",
             genre: "Adventure"),
        
        Book(imageName: "",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "Pride and Prejudice",
             author: "Jane Austen",
             price: 8.99,
             summary: "A romantic novel following the life of Elizabeth Bennet as she deals with issues of marriage, morality, and class.",
             publisher: "T. Egerton, Whitehall",
             genre: "Romance"),
        
        Book(imageName: "",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "The Catcher in the Rye",
             author: "J.D. Salinger",
             price: 10.49,
             summary: "A novel narrated by Holden Caulfield, a young man who is expelled from prep school and goes on a journey of self-discovery in New York City.",
             publisher: "Little, Brown and Company",
             genre: "Literary Fiction"),
        
        Book(imageName: "",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "The Lord of the Rings",
             author: "J.R.R. Tolkien",
             price: 14.99,
             summary: "A high fantasy novel set in the fictional world of Middle-earth, following the quest to destroy the One Ring and defeat the Dark Lord Sauron.",
             publisher: "George Allen & Unwin",
             genre: "Fantasy"),
        
        Book(imageName: "harry_potter_1",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "Harry Potter and the Philosopher's Stone",
             author: "J.K. Rowling",
             price: 9.99,
             summary: "The first book in the Harry Potter series, following the adventures of a young wizard, Harry Potter, and his friends at Hogwarts School of Witchcraft and Wizardry.",
             publisher: "Bloomsbury",
             genre: "Fantasy"),
        
        Book(imageName: "",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "The Hobbit",
             author: "J.R.R. Tolkien",
             price: 9.99,
             summary: "The prelude to the epic fantasy novel The Lord of the Rings, following the adventure of Bilbo Baggins as he accompanies a group of dwarves to reclaim their homeland from the dragon Smaug.",
             publisher: "George Allen & Unwin",
             genre: "Fantasy"),
            
        Book(imageName: "jane_eyre",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "Jane Eyre",
             author: "Charlotte Brontë",
             price: 7.99,
             summary: "A classic romance novel following the life of Jane Eyre, an orphan who becomes a governess and falls in love with her employer, Mr. Rochester, while dealing with social class and morality issues.",
             publisher: "Smith, Elder & Co.",
             genre: "Romance"),
            
        Book(imageName: "",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "The Chronicles of Narnia",
             author: "C.S. Lewis",
             price: 19.99,
             summary: "A series of seven high fantasy novels set in the fictional world of Narnia, following the adventures of various children who play central roles in the unfolding history of that world.",
             publisher: "Geoffrey Bles",
             genre: "Fantasy"),
            
        Book(imageName: "",
             smallThumbnailUrl: "",
             thumbnailUrl: "",
             name: "Frankenstein",
             author: "Mary Shelley",
             price: 6.99,
             summary: "A novel exploring themes of ambition, hubris, and the consequences of scientific discovery, as Dr. Victor Frankenstein creates a sentient creature in an unorthodox scientific experiment.",
             publisher: "Lackington, Hughes, Harding, Mavor, & Jones",
             genre: "Gothic Fiction")

        // Add more books as needed
    ]
    
    func fetchImageURL(for book: Book, completion: @escaping (Book?) -> Void) {
        // Construct the search query using book name and author
        let query = "\(book.name) by \(book.author)"
        let formattedQuery = query.replacingOccurrences(of: " ", with: "+")
        
        // Google Books API URL
        let baseURL = "https://www.googleapis.com/books/v1/volumes"
        let url = URL(string: "\(baseURL)?q=\(formattedQuery)")
        
        // Perform the API request
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let items = json?["items"] as? [[String: Any]],
                       let volumeInfo = items.first?["volumeInfo"] as? [String: Any],
                       let imageLinks = volumeInfo["imageLinks"] as? [String: String],
                       let smallThumbnailUrl = imageLinks["smallThumbnail"],
                       let thumbnailUrl = imageLinks["thumbnail"] {
                        let updatedBook = book
                        updatedBook.smallThumbnailUrl = smallThumbnailUrl
                        updatedBook.thumbnailUrl = thumbnailUrl
                        DispatchQueue.main.async {
                            completion(updatedBook)
                        }
                    } else {
                        DispatchQueue.main.async {
                            completion(nil)
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }

    func populateImageUrls() {
        // Iterate over each book in the array
        for index in books.indices {
            // Check if thumbnail URLs are already populated for the book
            guard books[index].thumbnailUrl.isEmpty, books[index].smallThumbnailUrl.isEmpty else {
                return // If URLs are already populated, exit the loop
            }
            
            // Fetch the thumbnail URLs for the current book asynchronously
            fetchImageURL(for: books[index]) { updatedBook in
                // Update the books array with the retrieved thumbnail URLs
                DispatchQueue.main.async {
                    if let updatedBook = updatedBook {
                        self.books[index] = updatedBook
                    }
                }
            }
        }
    }

}
