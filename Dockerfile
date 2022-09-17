FROM ruby:2.7.0
WORKDIR /app

# mecab-ko
RUN set -ex \
	&& wget --no-check-certificate https://github.com/mnmandahalf/natto/raw/add-mecab-ko/etc/mecab-0.996-ko-0.9.2.tar.gz && tar xvf mecab-0.996-ko-0.9.2.tar.gz \
  && cd mecab-0.996-ko-0.9.2 && ./configure && make && make install \
  && ldconfig
# mecab-ko-dic
RUN set -ex \
  && wget --no-check-certificate https://github.com/mnmandahalf/natto/raw/add-mecab-ko/etc/mecab-ko-dic-2.1.1-20180720.tar.gz && tar xvf mecab-ko-dic-2.1.1-20180720.tar.gz \
  && cd mecab-ko-dic-2.1.1-20180720 && ./autogen.sh && ./configure && make && make install \
  && ldconfig

RUN gem install minitest
RUN gem install ffi
RUN gem install pry-byebug
ENV RUBYOPT -EUTF-8
