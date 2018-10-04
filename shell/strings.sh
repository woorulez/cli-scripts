#! /bin/cat

# https://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable
# liked this one, works in bash
function trim() {
    local var="$1"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   
    echo -n "$var"
}
