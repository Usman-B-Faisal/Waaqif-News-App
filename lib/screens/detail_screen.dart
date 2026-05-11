import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> article =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(
      body: Stack(  // Added this: Stack to keep the background static
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF9D8AC2), // top-left
                  Color(0xFFE49293), // middle
                  Color(0xFFBE7D9D), // bottom-right
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // Scrollable Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: SingleChildScrollView(  // Keep only the article content scrollable
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back),
                          SizedBox(width: 4),
                          Text("Back", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    // Title
                    Text(
                      article['title'] ?? '',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    // Timestamp + Author (mocked for now)
                    Text(
                      "2h ago · By John Doe",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),

                    SizedBox(height: 20),

                    // Article body (scrollable content)
                    Text(
                      article['summary'] ?? 'No article content provided.',
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}