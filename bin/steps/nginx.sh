if [[ ! -d "$CACHE_DIR/$NGINX_VERSION" ]]; then
  puts-step "Installing nginx ($NGINX_VERSION)"
  cd $CACHE_DIR
  curl http://nginx.org/download/$NGINX_VERSION.tar.gz -s | tar xz &> /dev/null
  cd $NGINX_VERSION
  ./configure --prefix=$BUILD_DIR/local \
    --with-pcre=$CACHE_DIR/$PCRE_VERSION \
    --without-select_module \
    --without-poll_module \
    --without-http_gzip_module \
    --without-http_proxy_module \
    --with-http_gzip_static_module &> /dev/null
  make -j2 &> /dev/null
  make install &> /dev/null
else
  puts-step "nginx found ($CACHE_DIR/$NGINX_VERSION)"
fi

mkdir -p $BUILD_DIR/.profile.d
cp $ROOT_DIR/conf/path.sh $BUILD_DIR/.profile.d/

if [[ ! -f $BUILD_DIR/nginx.conf.erb ]]; then
  cp $ROOT_DIR/conf/nginx.conf.erb $BUILD_DIR/nginx.conf.erb
fi

cp $ROOT_DIR/conf/mime.types $BUILD_DIR/
cp $BIN_DIR/launch-nginx "$BUILD_DIR/local/sbin"

