#! /bin/cat
# safeguard for accidental execution

# list tags with messages
git tag -n

# list tags with (dereferenced) commit checksum(or hash)
# http://stackoverflow.com/a/8796647
git show-ref --tags -d

# renaming tags
# http://stackoverflow.com/a/5719854
git tag $new $old
git tag -d $old
git push origin :refs/tags/$old
git push --tags

# tagging a commit(use git log [--pretty=oneline] to find commits)
git tag -a $name $commit_chksum
# or
git tag -a $name -m "$message" $commit_chksum

# delete all remote tags
git ls-remote --tags 2> /dev/null | grep -v '{}$' | awk '{print $2}' | xargs -n 1 git push --delete origin
# or
git ls-remote --tags 2> /dev/null | grep -v '{}$' | awk '{print ":"$2}' | xargs -n 1 git push origin

# branch a tag
git checkout -b $name $tag

