#! /bin/cat

# create a branch pointing to current HEAD and checkout
git checkout -b $branch
# create a branch from a tag and checkout
git checkout -b $branch $tag
# to skip the checkout part, use the branch command
git branch $branch [$tag]

# list all branches(including remote)
git branch -a

# changing branch
git checkout $branch

# cleaning up, is this safe?
# http://stackoverflow.com/a/1499824
git clean -nd # -n for dry-run
git clean -fd # -f for force, removes untracked files and directories(may not be empty)

# remove local branch
git branch -d $branch
# remove remote branch
# http://stackoverflow.com/a/2003515
git push origin --delete $branch
git push origin :$branch

# if git complains about more then one matches, use the full-path form(?) i.e. /refs/heads/branchname
# http://www.markhneedham.com/blog/2013/06/13/git-having-a-branchtag-with-the-same-name-error-dst-refspec-matches-more-than-one/
