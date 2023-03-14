#!/usr/bin/env bash

BRANCH_LIST=`git branch -r | grep -v -- '->'`
for branch in ${BRANCH_LIST[@]}
do  
    DEFAULT_BRANCH="origin/"${BRANCH_NAME}
    if [ $branch != $DEFAULT_BRANCH ]; then
        git branch --track ${branch##origin/} $branch; 
    fi
done
git checkout $BRANCH_NAME && git branch --merged | egrep -v "(^\*|${BRANCH_NAME})" | xargs git push origin -d
echo "🗑️ Done!"
