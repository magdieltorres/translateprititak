FROM libretranslate/libretranslate:latest

ENV LT_LOAD_ONLY=en,es
RUN ./venv/bin/python scripts/install_models.py --update
