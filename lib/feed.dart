import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      "title": "The Great Gatsby",
      "img": "https://covers.openlibrary.org/b/id/7222246-L.jpg",
    },
    {
      "title": "To Kill a Mockingbird",
      "img": "https://covers.openlibrary.org/b/id/8228691-L.jpg",
    },
    {
      "title": "1984",
      "img": "https://covers.openlibrary.org/b/id/7222246-M.jpg",
    },
    {
      "title": "Pride and Prejudice",
      "img": "https://covers.openlibrary.org/b/id/8081561-L.jpg",
    },
    {
      "title": "The Catcher in the Rye",
      "img": "https://covers.openlibrary.org/b/id/8231856-L.jpg",
    },
    {
      "title": "Moby-Dick",
      "img": "https://covers.openlibrary.org/b/id/7222161-L.jpg",
    },
    {
      "title": "The Hobbit",
      "img": "https://covers.openlibrary.org/b/id/6979861-L.jpg",
    },
    {
      "title": "Jane Eyre",
      "img": "https://covers.openlibrary.org/b/id/8228780-L.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bibliophile"), backgroundColor: Colors.red),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns like Pinterest
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7, // taller cards
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.network(
                        books[index]["img"]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      books[index]["title"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
