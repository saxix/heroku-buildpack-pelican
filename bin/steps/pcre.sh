puts-step "Installing pcre ($PCRE_VERSION)"
if [[ ! -d "$CACHE_DIR/$PCRE_VERSION" ]]; then
  cd $CACHE_DIR
  curl -L http://downloads.sourceforge.net/pcre/$PCRE_VERSION.tar.bz2 -s | tar jx &> /dev/null
fi
