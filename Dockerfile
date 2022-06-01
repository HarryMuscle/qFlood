FROM hotio/qflood:release-4.4.3.1--4.7.0

# Copy files
COPY root/ /

# Remove check for the net.ipv4.conf.all.src_valid_mark kernel parameter in the
#   /etc/cont-init.d/02-setup-wg file to allow running on Kubernetes without privleged mode
RUN sed --in-place \
  '/^\s*if \[\[ "\$(cat \/proc\/sys\/net\/ipv4\/conf\/all\/src_valid_mark)" != "1" \]\]; then$/,/^$/d' \
  /etc/cont-init.d/02-setup-wg

# Remove setting of the net.ipv4.conf.all.src_valid_mark kernel parameter in the /usr/bin/wg-quick
#   file to allow running on Kubernetes without privleged mode
RUN sed --in-place \
  '/^\s\+\[\[ \$proto == -4 \]\] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=1$/d' \
  /usr/bin/wg-quick
