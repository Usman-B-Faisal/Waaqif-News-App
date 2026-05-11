from fastapi import APIRouter
from app.models import SearchRequest, Article
from app.services.search_engine import search_articles
from app.services.scraper import scrape_article
from app.services.summarizer import summarize_text

router = APIRouter()

@router.post("/search", response_model=List[Article])
async def search_news(req: SearchRequest):
    urls = await search_articles(req.query, req.sources)
    articles = []

    for url in urls:
        content, title = await scrape_article(url)
        if content:
            summary = await summarize_text(content)
            articles.append(Article(title=title, summary=summary, link=url))

    return articles
