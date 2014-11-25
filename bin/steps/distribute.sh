if [[ ! -d "$CACHE_DIR/$DISTRIBUTE_VERSION" ]]; then
  cd $CACHE_DIR
  puts-step "Installing Distribute ($DISTRIBUTE_VERSION)"
  curl https://pypi.python.org/packages/source/d/distribute/$DISTRIBUTE_VERSION.tar.gz -s | tar xz &> /dev/null
  cd $DISTRIBUTE_VERSION
  python setup.py install &> /dev/null
fi
