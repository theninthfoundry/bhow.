# BHOW — source package

A lightweight web application for dog records, basic care tasks and lost-dog reports.

## Important source-provenance note

This is a **clean, reconstructed source package** based on the verified BHOW deployment configuration, API contract, Supabase architecture and feature requirements available during preparation. It is not a byte-for-byte export of the currently deployed frontend: the Vercel file-content endpoint truncated the large deployed HTML file, so the complete original frontend could not be recovered. The frontend in this package is a complete, maintainable implementation of the core workflows, not a claim that every pixel or legacy interaction is identical to the preview.

The verified deployed API was FastAPI `0.6.3` with `/api` and `/api/health`. The verified deployment used `requirements.txt` containing `fastapi` and `pydantic`, and a Vercel static + Python function configuration. The deployed app also used Supabase Auth, a private `bhow-private` Storage bucket, and a user-scoped `bhow_user_records` table.

## Features in this package

- Dog registry: create, view and delete dog records.
- Care tasks: add, complete and delete tasks.
- Lost & Found: create and remove lost-dog reports.
- Image selection: choose images from gallery/files, preview them and upload private media when signed in.
- Supabase email/password authentication.
- User-scoped cloud record sync through `public.bhow_user_records`.
- Browser-local mode when Supabase is not configured or the user is signed out.
- API health endpoint.
- SQL migration with row-level security and private Storage policies.
- Scanner UI clearly marked as experimental. This package does **not** implement validated noseprint/pawprint identification or claim identity matches.

## Project structure

```text
BHOW/
├── README.md
├── .env.example
├── .gitignore
├── vercel.json
├── requirements.txt
├── requirements-dev.txt
├── public/
│   └── index.html
├── api/
│   └── index.py
├── supabase/
│   └── migrations/
│       └── 001_bhow_user_records_and_storage.sql
└── docs/
    └── STATUS_AND_LIMITATIONS.md
```

## Run locally

### 1. Frontend only

Open `public/index.html` in a browser. Local mode works without Supabase. For Supabase auth/cloud sync, configure the values in the `SUPABASE_CONFIG` object near the top of the JavaScript in `public/index.html`.

### 2. Backend

```bash
python -m venv .venv
# Windows:
.venv\Scripts\activate
# macOS/Linux:
source .venv/bin/activate

pip install -r requirements-dev.txt
uvicorn api.index:app --reload
```

Health endpoint: `http://127.0.0.1:8000/api/health`

### 3. Supabase setup
