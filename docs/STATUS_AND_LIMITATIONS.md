# BHOW status and limitations

## Implemented in this source package

- Dog profile CRUD in local mode and authenticated cloud sync.
- Care task CRUD and completion.
- Lost-dog case CRUD.
- Image selection from gallery/files with preview.
- Authenticated upload to private Supabase Storage.
- Signed URL display for private uploaded images.
- Supabase email/password sign-in and registration.
- User-owned JSONB records protected by RLS.
- FastAPI health and root endpoints.

## Not implemented / not validated

- No trained noseprint or pawprint recognition model is included.
- No identity-confirmation claim is made.
- The scanner view is an image intake and workflow placeholder; it does not return scientifically meaningful biometric matches.
- No independent biometric dataset, training pipeline, benchmark or evaluation report is included.
- No public lost-dog discovery feed or moderation service is included in this reconstructed minimal source package.
- No production security audit has been performed.

## Deployment provenance

The deployed BHOW preview was verified to have:
- FastAPI API version 0.6.3.
- `/api` and `/api/health` routes.
- `requirements.txt` with FastAPI and Pydantic.
- Vercel static + Python deployment routing.
- Supabase Auth/cloud-sync architecture.
- Private `bhow-private` storage bucket and user-scoped `bhow_user_records` table.

The complete deployed HTML source was not retrievable through the available Vercel file-content response because the large file was truncated by the connector. Therefore this package is a clean reconstruction, not a byte-for-byte source export.
