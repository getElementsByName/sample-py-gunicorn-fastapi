from typing import Optional
from fastapi import FastAPI
import time
app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/delay")
def delay(delay_ms: int = 0):
    time.sleep(delay_ms / 1000)
    return { "delay_ms": delay_ms }
