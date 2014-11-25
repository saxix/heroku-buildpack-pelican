if [[ ! -d "$CACHE_DIR/$PYTHON_VERSION" ]]; then
  cd $CACHE_DIR
  puts-step "Installing Python ($PYTHON_VERSION)"
  curl http://envy-versions.s3.amazonaws.com/$PYTHON_VERSION.tar.bz2 -s | tar jx &> /dev/null
  mv python $PYTHON_VERSION
fi
