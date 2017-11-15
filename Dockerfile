FROM richarvey/nginx-php-fpm:1.3.8

# enable xdebug as default
ENV ENABLE_XDEBUG=1

# fix xdebug configuration
RUN echo "xdebug.remote_connect_back=on" > /usr/local/etc/php/conf.d/z-xdebug.ini;

# add xdebug switcher (xdebug on / xdebug off)
ADD scripts/debug /usr/bin/debug
RUN chmod 755 /usr/bin/debug

# saving .bash_history immediate
RUN echo shopt -s histappend >> ~/.bashrc
RUN echo 'PROMPT_COMMAND="history -a;$PROMPT_COMMAND"' >> ~/.bashrc