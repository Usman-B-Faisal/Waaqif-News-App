from fastapi import APIRouter
from app.models import FeedRequest, Article
from app.services.search_engine import search_articles
from app.services.scraper import scrape_article
from app.services.summarizer import summarize_text

router = APIRouter()

@router.post("/feed", response_model=List[Article])
async def generate_feed(req: FeedRequest):
    all_articles = []

    for topic in req.topics:
        urls = await search_articles(topic, req.sources)
        for url in urls:
            content, title = await scrape_article(url)
            if content:
                summary = await summarize_text(content)
                all_articles.append(Article(title=title, summary=summary, link=url))

    return all_articles
