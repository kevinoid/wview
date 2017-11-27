Debian Packaging TODO List
==========================

- [ ] Get OpenSSL GPL exception from upstream or build against GnuTLS.
- [ ] Fix insecure temporary file usage in dbexport scripts.
- [ ] Either replace gawk with awk or depend on gawk.
- [ ] Don't include `wviewmgmt/functions.php.sh`, `wviewmgmt/Makefile.*` in deb
      The problem is cp -r wviewmgmt in root Makefile.am.
- [ ] Avoid duplicating files between `/etc` and `/usr/share/wview/etc`
      and between `/var` and `/usr/share/wview/var`.
- [ ] Move PID files to /var/run per FHS
- [ ] Change `wview-*-export` to avoid writing to `/etc/wview/export`.
- [ ] Convert removal prompt in postrm to debconf (like mysql-server)
- [ ] Replace/divert wviewconfig with debconf and dpkg-reconfigure and create
      config in postinst from debconf answers.
- [ ] Add wview user to group of `STATION_DEVICE` from debconf
      (and save device in debconf so it can be removed on STATION_DEVICE change)
- [ ] Split wviewmgmt into separate package.
- [ ] Ensure packages meet Debian PHP/webapp policy and conventions.
- [ ] Prompt for adding www-data to wview group in wviewmgmt postinst?  Prompt
      for installing www-data sudo access rules?  Makes me uncomfortable.
- [ ] Add nginx, lighttpd configuration.
- [ ] Add systemd unit files.
- [ ] Make init.d status command LSB compliant?
      https://wiki.debian.org/LSBInitScripts/StatusSupport
- [ ] Add AppArmor profile.
