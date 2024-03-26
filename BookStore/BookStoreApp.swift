import SwiftUI

@main
struct BookStoreApp: App {
    @StateObject private var bookList = BookList()
    
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environmentObject(bookList)
        }
    }
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
