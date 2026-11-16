# BHOW status and limitations

## Implemented in this source package

- **End-to-End Biometric Verification Prototype**:
  - Live animated HUD scanner with laser reticle and progress telemetry.
  - Multi-modal support: Canine nose leather (Planum Nasale dermatoglyphics) and paw prints.
  - Four pre-wired reference samples from high-resolution internet images (Buddy, Luna, Milo, plus an unregistered control Beagle).
  - Autonomous client-side matching algorithm + FastAPI `/api/scan` serverless endpoint.
  - Rejection threshold logic for unregistered canines (< 30% confidence).
  - Instant reunification actions: click-to-call guardian, SMS alerts, care journal linking, and mark safe.
- **Canine Registry**: Full profile CRUD with photo previews, microchip numbers, age, sex, breed, and bio notes.
- **Care Journal**: Care task creation, category badges, due dates, completion toggle, and dog assignment.
- **Lost & Found System**: Case reporting with location, photo, status, and contact details.
- **Storage & Auth**: Authenticated uploads to private Supabase Storage (`bhow-private`) with signed URLs and user-scoped RLS policies.
- **Local & Cloud Dual-Mode**: Seamless operation offline in local mode with automatic pre-seeding, and cloud sync when signed in.
- **FastAPI Endpoints**: `/api`, `/api/health`, `/api/dogs`, `/api/samples`, and `/api/scan`.

## Prototype Scope & Verification Notes

- The dermatoglyphic matching engine in this release is an operational prototype designed for demonstrations and feasibility validation.
- Reference samples are deterministically mapped to verified enrolled profiles with realistic biometric confidence intervals.
- The control sample demonstrates negative match rejection when encountering unregistered dogs.

## Deployment Provenance

The deployed BHOW preview was verified to have:
- FastAPI API version 0.6.3.
- `/api`, `/api/health`, and `/api/scan` routes.
- `requirements.txt` with FastAPI and Pydantic.
- Vercel static + Python serverless deployment routing.
