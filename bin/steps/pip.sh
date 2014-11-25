if [[ ! -d "$CACHE_DIR/$PIP_VERSION" ]]; then
  cd $CACHE_DIR
  puts-step "Install pip ($PIP_VERSION)"
  curl https://pypi.python.org/packages/source/p/pip/$PIP_VERSION.tar.gz -s | tar xz &> /dev/null
  cd $PIP_VERSION
  python setup.py install &> /dev/null
fi
