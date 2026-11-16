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
        "note": (
            "Registry records and private media sync are handled through Supabase. "
            "Nose/paw biometric identification is experimental and not validated."
        )
    }

@app.get("/api")
def root():
    return {
        "name": "BHOW API",
        "health": "/api/health",
        "note": "BHOW prototype API"
    }
