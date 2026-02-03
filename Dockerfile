FROM libretranslate/libretranslate:latest

# Solo inglés y español
ENV LT_LOAD_ONLY=en,es

# Instalar SOLO los modelos necesarios durante el build
RUN python -m pip install --no-cache-dir argostranslate && \
    python -c "from argostranslate import package; package.update_package_index(); \
pkgs=package.get_available_packages(); \
need=[p for p in pkgs if (p.from_code,p.to_code) in [('en','es'),('es','en')]]; \
[package.install_from_path(p.download()) for p in need]"
