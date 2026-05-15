from __future__ import annotations

from flask import Flask

app = Flask(__name__)


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}


@app.get("/")
def root() -> dict[str, str]:
    return {"service": "Simple flask API on AWS EC2"}
