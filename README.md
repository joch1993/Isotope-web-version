# Isotope correction (web)

Statisk shinylive-udgave af **workspace-root `app.R`** (Thermo GasBench | Thermo EA | Sercon EA).  
Ikke `isotope_app/app.R`.

Første indlæsning kan tage et minut (R kører i browseren). Upload af `.xlsx` kan fejle i browseren — brug CSV hvis det sker.

## Publicér på GitHub Pages

1. Opret et nyt GitHub-repo (fx `isotope-web`).
2. Upload **indholdet af denne mappe** til roden af repoet (`index.html` skal ligge i roden — ikke inde i en undermappe).
3. Repo → **Settings** → **Pages** → Source: **Deploy from a branch** → `main` / `/ (root)`.
4. Vent 1–2 minutter. Adressen bliver:

`https://<dit-brugernavn>.github.io/<repo-navn>/`

`.nojekyll` skal med, ellers kan GitHub Pages blokere shinylive-filerne.
