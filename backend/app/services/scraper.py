from newspaper import Article as NewsArticle

async def scrape_article(url: str):
    try:
        article = NewsArticle(url)
        article.download()
        article.parse()
        return article.text, article.title
    except:
        return None, None
