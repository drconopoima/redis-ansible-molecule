#!/bin/sh

# Section constants
APT_PACKAGE_NAME='python3';
YUM_PACKAGE_NAME='python36';
DNF_PACKAGE_NAME='python3';
PACMAN_PACKAGE_NAME='python3';
ZYPPER_PACKAGE_NAME='python3';

# Debian/Ubuntu
if command -v apt-get >/dev/null 2>&1; then
  apt-get update && \
  apt-get install -y "${APT_PACKAGE_NAME}" && \
  (ln -s -T /usr/bin/${APT_PACKAGE_NAME} /usr/bin/python || true ) && \
  exit 0;
fi
# CentOS/RedHat
if command -v yum >/dev/null 2>&1; then
  yum install -y ${YUM_PACKAGE_NAME} && \
  (ln -s -T "/usr/bin/${YUM_PACKAGE_NAME}" /usr/bin/python || true ) && \
  exit 0;
fi
# Fedora
if command -v dnf >/dev/null 2>&1; then
  dnf install -y "${DNF_PACKAGE_NAME}" && \
  (ln -s -T "/usr/bin/${DNF_PACKAGE_NAME}" /usr/bin/python || true ) && \
  exit 0;
fi
# Arch Linux
if command -v pacman >/dev/null 2>&1; then
  pacman -Syy --noconfirm "${PACMAN_PACKAGE_NAME}" && \
  (ln -s -T "/usr/bin/${PACMAN_PACKAGE_NAME}" /usr/bin/python || true ) && \
  exit 0;
fi
# OpenSUSE
if command -v zypper >/dev/null 2>&1; then
  zypper install -y "${ZYPPER_PACKAGE_NAME}" && \
  (ln -sf -T "/usr/bin/${ZYPPER_PACKAGE_NAME}" /usr/bin/python || true ) && \
  exit 0;
fi

echo "ERROR: Cannot install python3 on destination"
exit 1;
