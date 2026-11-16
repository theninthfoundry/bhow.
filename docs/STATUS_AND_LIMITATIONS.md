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
