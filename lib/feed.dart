import 'package:flutter/material.dart';
import 'dart:math';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> allBooks = [
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

  List<Map<String, String>> feedBooks = [];

  @override
  void initState() {
    super.initState();
    _loadMoreBooks();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _loadMoreBooks();
      }
    });
  }

  void _loadMoreBooks() {
    List<Map<String, String>> newBooks = [];
    var rng = Random();
    for (int i = 0; i < 10; i++) {
      newBooks.add(allBooks[rng.nextInt(allBooks.length)]);
    }
    setState(() {
      feedBooks.addAll(newBooks);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bibliophile"), backgroundColor: Colors.red),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Pinterest-like 2 columns
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemCount: feedBooks.length,
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
                        feedBooks[index]["img"]!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error, size: 50),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      feedBooks[index]["title"]!,
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
