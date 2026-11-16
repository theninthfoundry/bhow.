from datetime import datetime, timezone
from fastapi import FastAPI

app = FastAPI(
    title="BHOW API",
    version="0.6.3",
    description="BHOW dog wellbeing and lost-dog reunification prototype API."
)
