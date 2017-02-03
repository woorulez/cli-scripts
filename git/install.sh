#! /bin/bash

yum remove git
yum install -y epel-release
yum install curl-devel expat-devel gettext-devel openssl-devel perl-devel zlib-devel
yum install asciidoc xmlto docbook2X

if [ -f /usr/bin/db2x_docbook2texi ]; then
        ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi
else
        echo "/usr/bin/db2x_docbook2texi does not exist!" >&2
        exit 1
fi

wget https://www.kernel.org/pub/software/scm/git/git-2.9.0.tar.gz
if [ -f git-2.9.0.tar.gz ]; then
        tar -xzf git-2.9.0.tar.gz
else
        echo "git-2.9.0.tar.gz does not exist!" >&2
        exit 2
fi

cd git-2.9.0
pwd

make prefix=/usr/local/ all doc info
make prefix=/usr/local/ install install-doc install-html install-info

if [ ! -f /etc/profile.d/git.sh ]; then
        echo "pathmunge /usr/local/bin after" > /etc/profile.d/git.sh
else
        echo "/etc/profile.d/git.sh already exists!" >&2
        exit 3
fi
