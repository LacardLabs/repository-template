# QUICKSTART

## 1) Clone
````sh
gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>
cd ~/GitHub/LacardLabs/<repo>
pwd  # confirm path
````

## 2) Python env

```sh
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -U pip
pip install -r requirements.txt 2>/dev/null || true
```

## 3) Discover commands

```sh
make help
```

## 4) One-time tools

```sh
make dev-install   # installs ruff, pytest, pre-commit and registers local hooks
```

## 5) First checks (non-interactive)

```sh
make verify   # runs ruff-check and pytest -q
```

## 6) Lint normalization (only if needed)

```sh
make ruff-baseline
make lint-all
make verify
```

## 7) Daily loop

* `make verify` before pushing
* open PR with a focused summary and next steps

````
