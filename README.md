# Waaqif

**AI-powered personalized news app** that aggregates, summarizes, and recommends news articles based on user preferences.

## Overview

Waaqif is a cross-platform mobile application built with Flutter that leverages AI to deliver a personalized news experience. The app combines web scraping, natural language processing, and intelligent recommendation algorithms to keep users informed about topics they care about.

### Key Features

- 📰 **Personalized News Feed** - Curated articles based on user preferences
- 🔍 **Smart Search** - AI-powered search with LLaMA Index
- 📝 **Article Summarization** - Auto-generated summaries using LangChain
- 🎯 **Preference Management** - Customize content topics and interests
- 📱 **Cross-Platform** - Runs on Android, iOS, and more
- 🤖 **AI-Powered** - Uses modern LLMs for intelligent content processing

## Project Structure

```
waaqif/
├── lib/                    # Flutter frontend
│   ├── main.dart          # App entry point
│   ├── screens/           # UI screens (home, detail, preferences)
│   ├── models/            # Data models
│   ├── services/          # API communication
│   └── widgets/           # Reusable UI components
├── backend/               # Python FastAPI backend
│   ├── app/
│   │   ├── main.py        # FastAPI server
│   │   ├── models.py      # Database models
│   │   ├── routes/        # API routes (feed, search)
│   │   └── services/      # Business logic (scraper, search, summarizer)
│   └── requirements.txt    # Python dependencies
├── android/               # Android native code
├── ios/                   # iOS native code
└── assets/                # App assets and fonts
```

## Tech Stack

### Frontend
- **Framework**: Flutter 3.4.4+
- **Language**: Dart
- **UI**: Material Design 3
- **State Management**: Provider pattern

### Backend
- **Framework**: FastAPI
- **Server**: Uvicorn
- **AI/ML**: 
  - LangChain (LLM orchestration)
  - LLaMA Index (semantic search)
- **Web Scraping**: BeautifulSoup, Newspaper3k
- **API Communication**: HTTPX

## Prerequisites

### For Development

- Flutter SDK (3.4.4 or higher)
- Dart SDK (included with Flutter)
- Python 3.8+
- Git

### For Running

- Android Studio / Xcode (for emulator) or physical device
- Python environment for backend

## Installation & Setup

### 1. Frontend Setup

```bash
# Clone the repository
cd waaqif

# Install Flutter dependencies
flutter pub get

# Generate code (if needed)
flutter pub run build_runner build
```

### 2. Backend Setup

```bash
# Navigate to backend directory
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate

# Install Python dependencies
pip install -r requirements.txt
```

## Running the Application

### Backend

```bash
cd backend
# Make sure virtual environment is activated
python app/main.py
```

The backend API will be available at `http://localhost:8000`

### Frontend

```bash
# Run on Android emulator
flutter run -d emulator-5554

# Run on iOS simulator
flutter run -d iPhone

# Run on connected physical device
flutter run
```

## API Endpoints

The backend provides the following endpoints:

- **GET /feed** - Get personalized news feed
- **POST /feed** - Filter feed based on preferences
- **GET /search** - Search articles
- **POST /search** - Advanced search with filters

Detailed API documentation is available at `http://localhost:8000/docs` when running the backend.

## Project Components

### Screens
- **Home Screen** - Displays personalized news feed
- **Detail Screen** - Shows full article content with summary
- **Preferences Screen** - Allows users to customize interests and topics

### Services
- **Feed Service** - Aggregates news from multiple sources
- **Search Engine** - AI-powered search functionality
- **Scraper** - Extracts article content from web sources
- **Summarizer** - Generates concise summaries using LLMs

## Development Guidelines

### Flutter Best Practices
- Keep widgets small and focused
- Use proper state management patterns
- Follow Dart naming conventions
- Run `flutter analyze` before commits

### Python Best Practices
- Follow PEP 8 style guide
- Use type hints
- Add docstrings to functions
- Run tests before deployment

## Contributing

1. Create a feature branch (`git checkout -b feature/AmazingFeature`)
2. Commit your changes (`git commit -m 'Add AmazingFeature'`)
3. Push to the branch (`git push origin feature/AmazingFeature`)
4. Open a Pull Request

## Dependencies

### Key Flutter Packages
- `flutter` - Core framework
- `cupertino_icons` - iOS-style icons
- `flutter_lints` - Linting rules

### Key Python Packages
- `fastapi` - Web framework
- `uvicorn` - ASGI server
- `langchain` - LLM framework
- `llama-index` - Vector database & semantic search
- `beautifulsoup4` - HTML parsing
- `newspaper3k` - Article extraction
- `pydantic` - Data validation

## Troubleshooting

### Common Issues

**Flutter build fails**
```bash
flutter clean
flutter pub get
flutter run
```

**Backend won't start**
```bash
# Ensure virtual environment is activated
# Check if port 8000 is available
# Verify all dependencies are installed: pip install -r requirements.txt
```

**Connection issues between frontend and backend**
- Ensure backend is running at `http://localhost:8000`
- Check firewall settings
- Verify network connectivity

## License

This project is licensed under the MIT License - see LICENSE file for details.

## Support

For issues, questions, or suggestions, please open an issue in the repository.

## Acknowledgments

- Flutter team for the excellent framework
- FastAPI for the powerful backend framework
- LangChain and LLaMA Index communities
