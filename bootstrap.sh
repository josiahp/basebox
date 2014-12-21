#!/bin/sh

COLOR_DEFAULT="\e[39m"
COLOR_GREEN="\e[32m"
COLOR_RED="\e[31m"

PACKAGES="yum:git yum:ruby gem:puppet"

checkpackage () {
  CHECK=$(which ${1} 2>/dev/null)
  if [ -z $CHECK ]; then
    return 1
  else
    return 0
  fi
}

red () {
  echo -ne "${COLOR_RED}${1}${COLOR_DEFAULT}"
}

green () {
  echo -ne "${COLOR_GREEN}${1}${COLOR_DEFAULT}"
}

echo "Checking for required packages..."

for PACKAGE in $PACKAGES; do
  PROVIDER=$(echo $PACKAGE | cut -d: -f1)
  PACKAGE=$(echo $PACKAGE | cut -d: -f2)
  
  echo -n "${PACKAGE}: "
  checkpackage $PACKAGE
  PACKAGE=$?

  if [ -z $PACKAGE ]; then
    red [MISSING]
    echo
    INSTALL_PACKAGES="${INSTALL_PACKAGES} ${PROVIDER}:${PACKAGE}"
  else
    green [OK]
    echo
  fi
done

echo

for PACKAGE in $INSTALL_PACKAGES; do
  PROVIDER=$(echo $PACKAGE | cut -d: -f1)
  PACKAGE=$(echo $PACKAGE | cut -d: -f2)

  echo -ne "Installing ${PACKAGE}: "
  if [ "$PROVIDER" == "gem" ]; then
    gem install --no-ri --no-rdoc $PACKAGE 2>/dev/null 1>/dev/null
  elif [ "${PROVIDER}" == "yum" ]; then
    yum install -y $PACKAGE 2>/dev/null 1>/dev/null
  fi

  checkpackage $PACKAGE
  PACKAGE=$?
  if [ -z $PACKAGE ]; then
    red [ERROR]
    echo
  else
    green [OK]
    echo
  fi
done

echo -ne "\e[39m"
echo "Applying configurations..."
puppet apply --modulepath=modules -e 'include basebox'


