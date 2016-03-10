#! /bin/cat
# safeguard for accidental execution

# svn export -> git archive
# http://stackoverflow.com/a/353830
git archive --format=tar --remote=ssh://remote_server/remote_repository master | tar -xf -
# or exporting particular directories
git archive --format=tar --remote=ssh://remote_server/remote_repository master path1/ path2/ | tar -xv

