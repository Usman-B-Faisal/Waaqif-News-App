from pydantic import BaseModel
from typing import List, Optional

class SearchRequest(BaseModel):
    query: str
    sources: Optional[List[str]] = None

class FeedRequest(BaseModel):
    topics: List[str]
    sources: List[str]

class Article(BaseModel):
    title: str
    summary: str
    link: str
