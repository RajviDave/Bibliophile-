import 'package:flutter/material.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({super.key});

  final List<String> genres = const [
    "Fiction",
    "Novel",
    "Mystery",
    "Science Fiction",
    "Biography",
    "History",
    "Fantasy",
    "Poetry",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Genres"),
        backgroundColor: Colors.lightBlue,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 cards per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                genres[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
