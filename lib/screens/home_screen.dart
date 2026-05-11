import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> mockNews = [
    {
      'title': 'World Hunger Has Finally Been Solved',
      'summary':
      'A solution to world hunger has finally been found. The rich have decided to put their wealth to good use and have joined forces to provide free food to the poor all around the world.'
    },
    {
      'title': 'War Has Been Abolished',
      'summary':
      'You heard it here first, folks: war has been abolished, and there are no longer any unresolved conflicts in the world. Humanity has decided that enough is enough—we need not suffer anymore.'
    },
    {
      'title': 'Education Is Now Free For All',
      'summary':
      'Every child on Earth now has access to free, quality education. Countries united, resources were shared, and no one is left behind anymore. A smarter, brighter world begins today.'
    },
    {
      'title': 'Climate Change Is Over',
      'summary':
      'This is not a drill, climate change has been reversed. World leaders finally worked together, switching to clean energy and restoring nature. The planet is healing, and the future looks green. '
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Row with settings icon + search bar
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.pushNamed(context, '/preferences');
                      },
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                Text(
                  "The Only News You Need!",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                    itemCount: mockNews.length,
                    itemBuilder: (context, index) {
                      final item = mockNews[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: item,
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'] ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                item['summary'] ?? '',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
