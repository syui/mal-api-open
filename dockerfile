FROM alpine:latest
ENV NGINX_CONFIG_OPT_ENV --with-http_stub_status_module \
                         --with-http_ssl_module \
                         --with-http_realip_module \
                         --with-http_addition_module \
                         --with-http_sub_module \
                         --with-http_gunzip_module \
                         --with-http_gzip_static_module \
                         --with-http_random_index_module \
                         --with-http_secure_link_module \
                         --prefix=/usr/share/nginx \
                         --sbin-path=/usr/local/sbin/nginx \
                         --conf-path=/etc/nginx/conf/nginx.conf \
                         --pid-path=/var/run/nginx.pid \
                         --http-log-path=/var/log/nginx/access.log \
                         --error-log-path=/var/log/nginx/error.log
RUN apk add --update \
	openssl-dev pcre-dev git zsh jq curl \
	python \
	python-dev \
	py-pip \
	build-base \
		&& pip install --upgrade pip \
		&& pip install virtualenv \
		&& pip install html2text \
		&& rm -rf /var/cache/apk/*
	
#RUN git clone https://gitlab.com/anicat/mal-api-open
#	cd mal-api-open
#	zsh ./scpt/editor_open.sh	
