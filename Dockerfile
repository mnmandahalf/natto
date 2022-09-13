FROM ruby:2.7.0
WORKDIR /app

# mecab
RUN set -ex \
	&& wget --no-check-certificate https://github.com/buruzaemon/natto/raw/master/etc/mecab-0.996.tar.gz && tar zxf mecab-0.996.tar.gz \
  && cd mecab-0.996 && ./configure --enable-utf8-only && make && make install \
  && ldconfig
 # mecab-ipadic
RUN set -ex \
  && wget --no-check-certificate https://github.com/buruzaemon/natto/raw/master/etc/mecab-ipadic-2.7.0-20070801.tar.gz && tar zxf mecab-ipadic-2.7.0-20070801.tar.gz \
  && cd mecab-ipadic-2.7.0-20070801 && ./configure --with-charset=utf8 && make && make install \
  && ldconfig

RUN gem install minitest
RUN gem install ffi
ENV RUBYOPT -EUTF-8
