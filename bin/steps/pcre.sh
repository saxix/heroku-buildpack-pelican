if [[ ! -d "$CACHE_DIR/$PCRE_VERSION" ]]; then
  puts-step "Installing pcre ($PCRE_VERSION)"
  cd $CACHE_DIR
  curl -L http://downloads.sourceforge.net/pcre/$PCRE_VERSION.tar.bz2 -s | tar jx &> /dev/null
else
  puts-step "pcre found ($CACHE_DIR/$PCRE_VERSION)"

fi
