import httpx
from typing import List
from bs4 import BeautifulSoup

async def search_articles(query: str, sources: List[str] = []) -> List[str]:
    search_url = f"https://html.duckduckgo.com/html/?q={'+'.join(query.split())}"
    urls = []

    async with httpx.AsyncClient() as client:
        resp = await client.get(search_url, timeout=10)
        soup = BeautifulSoup(resp.text, "html.parser")

        for link in soup.find_all("a", class_="result__url"):
            href = link.get("href")
            if any(source.lower() in href.lower() for source in sources) if sources else True:
                urls.append(href)

    return urls[:5]  # limit for MVP
