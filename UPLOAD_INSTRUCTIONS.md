# How to use this download

## Safest option: inspect it as a separate folder

1. Download and unzip the archive.
2. Open Terminal in the extracted folder.
3. Read `README.md`.
4. Run the setup only when you are ready.

## Add it to your existing RetailPulse Git repository

Do not copy or replace any `.git` directory. This download does not contain one.

From the parent directory of both folders, copy the project files into your
existing repository:

```bash
rsync -av   retailpulse_sql_complete/   retailpulse_sql/
```

Then enter the existing repository:

```bash
cd retailpulse_sql
git status
```

Review the changes before committing:

```bash
git diff
git add .
git commit -m "feat: complete RetailPulse SQL analytics project"
git push
```

## Build or update the database

```bash
chmod +x scripts/*.sh
./scripts/setup_database.sh retailpulse
```

The seed files use `ON CONFLICT DO NOTHING`, so running them again will not
duplicate rows that use the same email, category name, SKU, order reference or
order-product combination.

## Completely rebuild the retail schema

Only use this when you are comfortable deleting the existing project data:

```bash
./scripts/reset_database.sh retailpulse
```
