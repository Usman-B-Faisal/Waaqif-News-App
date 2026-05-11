from fastapi import FastAPI
from app.routes import search, feed

app = FastAPI(
    title="Waaqif News Backend",
    description="FastAPI backend to serve personalized summarized news",
    version="0.1.0"
)

# Include route modules
app.include_router(search.router)
app.include_router(feed.router)