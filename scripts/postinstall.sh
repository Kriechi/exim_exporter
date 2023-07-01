#!/bin/sh
set -e
# Automatically added by dh_systemd_enable/11.1.6ubuntu2
if [ "$1" = "configure" ] || [ "$1" = "abort-upgrade" ] || [ "$1" = "abort-deconfigure" ] || [ "$1" = "abort-remove" ] ; then
	# This will only remove masks created by d-s-h on package removal.
	deb-systemd-helper unmask 'prometheus-exim-exporter.service' >/dev/null || true

	# was-enabled defaults to true, so new installations run enable.
	if deb-systemd-helper --quiet was-enabled 'prometheus-exim-exporter.service'; then
		# Enables the unit on first installation, creates new
		# symlinks on upgrades if the unit file has changed.
		deb-systemd-helper enable 'prometheus-exim-exporter.service' >/dev/null || true
	else
		# Update the statefile to add new symlinks (if any), which need to be
		# cleaned up on purge. Also remove old symlinks.
		deb-systemd-helper update-state 'prometheus-exim-exporter.service' >/dev/null || true
	fi
fi
# End automatically added section
# Automatically added by dh_systemd_start/11.1.6ubuntu2
if [ "$1" = "configure" ] || [ "$1" = "abort-upgrade" ] || [ "$1" = "abort-deconfigure" ] || [ "$1" = "abort-remove" ] ; then
	if [ -d /run/systemd/system ]; then
		systemctl --system daemon-reload >/dev/null || true
		if [ -n "$2" ]; then
			_dh_action=restart
		else
			_dh_action=start
		fi
		deb-systemd-invoke $_dh_action 'prometheus-exim-exporter.service' >/dev/null || true
	fi
fi
# End automatically added section
# Automatically added by dh_installinit/11.1.6ubuntu2
if [ "$1" = "configure" ] || [ "$1" = "abort-upgrade" ] || [ "$1" = "abort-deconfigure" ] || [ "$1" = "abort-remove" ] ; then
	if [ -x "/etc/init.d/prometheus-exim-exporter" ]; then
		update-rc.d prometheus-exim-exporter defaults >/dev/null
		if [ -n "$2" ]; then
			_dh_action=restart
		else
			_dh_action=start
		fi
		invoke-rc.d prometheus-exim-exporter $_dh_action || exit 1
	fi
fi
# End automatically added section
