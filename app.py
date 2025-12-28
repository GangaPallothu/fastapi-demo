
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello from UV + FastAPI!"}

@app.get("/items")
def get_items():
    return {"items": ["Book1", "Book2", "Book3"]}

