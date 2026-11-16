from datetime import datetime, timezone
from fastapi import FastAPI

app = FastAPI(
    title="BHOW API",
    version="0.6.3",
    description="BHOW dog wellbeing and lost-dog reunification prototype API."
)

@app.get("/api/health")
def health():
    return {
        "status": "ok",
        "service": "bhow-api",
        "version": app.version,
        "time": datetime.now(timezone.utc).isoformat(),
