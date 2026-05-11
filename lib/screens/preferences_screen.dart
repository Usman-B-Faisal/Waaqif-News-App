import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {
  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  List<String> selectedTopics = ['PSL', 'Gaza', 'FIFA World Cup', 'Dollar Rate'];
  List<String> topicSuggestions = [
    'Travel', 'Politics', 'Health', 'Business', 'Science', 'Music', 'Films and Television'
  ];

  List<String> selectedSources = ['BBC', 'CNN'];
  List<String> sourceSuggestions = ['Al Jazeera'];

  final topicController = TextEditingController();
  final sourceController = TextEditingController();

  void addTopic(String topic) {
    if (topic.isNotEmpty && !selectedTopics.contains(topic)) {
      setState(() {
        selectedTopics.add(topic);
        topicController.clear();
      });
    }
  }

  void addSource(String source) {
    if (source.isNotEmpty && !selectedSources.contains(source)) {
      setState(() {
        selectedSources.add(source);
        sourceController.clear();
      });
    }
  }

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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back button and title
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back), // back arrow
                              SizedBox(width: 4),
                              Text(
                                "Back", // Text for "Back"
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16), // Spacing below the back arrow

                        // Title of Preferences screen
                        Text(
                          "Preferences",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),

                        SizedBox(height: 22), // Spacing between title and the first container

                        /// TOPICS
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(16),
                          decoration: _cardStyle(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Topics", style: Theme.of(context).textTheme.titleLarge),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(child: TextField(controller: topicController)),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () => addTopic(topicController.text),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text("Add"),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: selectedTopics
                                    .map((topic) => Chip(
                                  label: Text(topic),
                                  onDeleted: () => setState(() => selectedTopics.remove(topic)),
                                  backgroundColor: Color(0xFFEFE9F5),
                                ))
                                    .toList(),
                              ),
                              SizedBox(height: 16),
                              Text("Suggestions", style: Theme.of(context).textTheme.bodyMedium),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: topicSuggestions
                                    .map((sugg) => ActionChip(
                                  label: Text(sugg),
                                  onPressed: () => addTopic(sugg),
                                  backgroundColor: Colors.white,
                                ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),

                        /// SOURCES
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: _cardStyle(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("News Sources", style: Theme.of(context).textTheme.titleLarge),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(child: TextField(controller: sourceController)),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () => addSource(sourceController.text),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text("Add"),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: selectedSources
                                    .map((source) => Chip(
                                  label: Text(source),
                                  onDeleted: () =>
                                      setState(() => selectedSources.remove(source)),
                                  backgroundColor: Color(0xFFEFE9F5),
                                ))
                                    .toList(),
                              ),
                              SizedBox(height: 16),
                              Text("Suggestions", style: Theme.of(context).textTheme.bodyMedium),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: sourceSuggestions
                                    .map((sugg) => ActionChip(
                                  label: Text(sugg),
                                  onPressed: () => addSource(sugg),
                                  backgroundColor: Colors.white,
                                ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Card-style decoration
  BoxDecoration _cardStyle() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.9),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
