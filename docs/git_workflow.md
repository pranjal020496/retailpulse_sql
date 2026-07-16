# Git Workflow

```bash
git switch main
git pull origin main
git switch -c feature/complete-retailpulse

git status
git add .
git commit -m "feat: complete RetailPulse SQL project"
git push -u origin feature/complete-retailpulse
```

Create a pull request from `feature/complete-retailpulse` into `main`.

After merging:

```bash
git switch main
git pull origin main
git branch -d feature/complete-retailpulse
```

GitHub compares commits, not uncommitted local files.
