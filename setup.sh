#!/usr/bin/env bash

BRANCH_LIST=`git branch -r | grep -v -- '->'`
for branch in ${BRANCH_LIST[@]}
do  
    DEFAULT_BRANCH="origin/"${BRANCH_NAME}
    if [ $branch != $DEFAULT_BRANCH ]; then
        git branch --track ${branch##origin/} $branch; 
    fi
done
git checkout $BRANCH_NAME 
if [ `git branch --merged | wc -l` == 1 ]; then
    echo "🥳 No merged branch found"
    exit 0
else
    for branch in `git branch --merged`
    do  
        DEFAULT_BRANCH="origin/"${BRANCH_NAME}
        if [ $branch != $DEFAULT_BRANCH ]; then
            git push origin -d $branch
        fi
    done
    echo "🗑️ Delete All Merged Branch!" 
fi

