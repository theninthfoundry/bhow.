# BHOW — Every dog, known.

A modern web application for canine wellbeing, biometric identity matching, care journal tracking, and lost-dog reunification.

## Overview & Demo Ready

This package includes a fully operational end-to-end prototype featuring:
- **Canine Biometric Scanner**: Planum nasale (nose leather dermatoglyphics) and paw print matching with live animated HUD scanning reticle.
- **Wired High-Resolution Test Samples**: Real enrolled dogs (Buddy, Luna, Milo) mapped to high-res images from Unsplash, plus a negative-match control sample.
- **Canine Registry**: Comprehensive profiles with microchip IDs, guardian contact, emergency phone numbers, and care requirements.
- **Care Journal**: Preventive care, medications, vaccinations, exercise schedules, and status tracking.
- **Reunification Portal**: Lost & found reports with geolocation, photos, and one-click contact actions.
- **Cloud & Local Dual Mode**: Runs autonomously offline with local data seeding, or syncs seamlessly with Supabase.
- **FastAPI Backend**: Serverless API with health telemetry, dog registry endpoints, sample catalogs, and biometric matching endpoint (`/api/scan`).

## Pre-Wired Demo Test Samples

For instant demonstration, the Scan tab includes 4 one-click reference samples:

1. **Buddy (Golden Retriever Noseprint)**:
   - Target Profile: Buddy · 3 years · Male
   - Guardian: Sreeshanth Reddy · `+1 (555) 234-8901`
   - Test Sample URL: `https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&w=600&q=80`
   - Expected Result: Confirmed Match (98.4% confidence) -> Instant Guardian Contact

2. **Luna (Siberian Husky Snow-Nose)**:
   - Target Profile: Luna · 2 years · Female
   - Guardian: Sarah Jenkins · `+1 (555) 872-3490`
   - Test Sample URL: `https://images.unsplash.com/photo-1537151625747-768eb6cf92b2?auto=format&fit=crop&w=600&q=80`
   - Expected Result: Confirmed Match (97.9% confidence)

3. **Milo (French Bulldog Snout Fold)**:
   - Target Profile: Milo · 4 years · Male
   - Guardian: Marcus Vance · `+1 (555) 412-9087`
   - Test Sample URL: `https://images.unsplash.com/photo-1517849845537-4d257902454a?auto=format&fit=crop&w=600&q=80`
   - Expected Result: Confirmed Match (98.6% confidence)

4. **Unregistered Canine (Control Beagle)**:
   - Target Profile: None (Negative Test)
   - Test Sample URL: `https://images.unsplash.com/photo-1543466835-00a7907e9de1?auto=format&fit=crop&w=600&q=80`
   - Expected Result: Rejection (< 30% confidence) -> Suggests "Register New Dog"

## Project Structure

```text
BHOW/
├── README.md                                    # Documentation and test guide
├── .env.example                                 # Supabase public configuration template
├── .gitignore                                   # Standard exclusions
├── vercel.json                                  # Vercel deployment routing (FastAPI + Static)
├── requirements.txt                             # Production Python dependencies
├── requirements-dev.txt                         # Development & testing dependencies
├── public/
│   └── index.html                               # Modern SPA with interactive biometric scanner
├── api/
│   └── index.py                                 # FastAPI application with /api/scan endpoint
├── supabase/
│   └── migrations/
│       └── 001_bhow_user_records_and_storage.sql # Schema & RLS policies
└── docs/
    └── STATUS_AND_LIMITATIONS.md                # Engineering notes & prototype scope
```

## How to Run Locally

### 1. Instant Preview (Frontend Only)
Simply double-click or open `public/index.html` in any web browser. The app runs autonomously in local mode with demo dogs and the interactive scanner pre-configured.

### 2. Full Stack with Python FastAPI
```bash
python -m venv .venv
# Windows:
.venv\Scripts\activate
# macOS/Linux:
source .venv/bin/activate

pip install -r requirements-dev.txt
uvicorn api.index:app --reload --port 8000
```
- API Root: `http://127.0.0.1:8000/api`
- Health Telemetry: `http://127.0.0.1:8000/api/health`
- Registered Dogs: `http://127.0.0.1:8000/api/dogs`
- Test Samples: `http://127.0.0.1:8000/api/samples`

### 3. Supabase Cloud Sync Setup (Optional)
1. Run `supabase/migrations/001_bhow_user_records_and_storage.sql` in your Supabase SQL editor.
2. Replace `SUPABASE_CONFIG.url` and `SUPABASE_CONFIG.anonKey` in `public/index.html`.

### 4. Deploy to Vercel
Push your commits to your GitHub repository and link it to Vercel. `vercel.json` will automatically deploy the static frontend and Python serverless function without additional configuration.
