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
git branch --merged $BRANCH_NAME | grep -v 'main$' | xargs git branch -d
if [ `git branch --merged | wc -l` == 1 ]; then
    echo "🥳 No merged branch found"
    exit 0
else
    git branch --merged $BRANCH_NAME | egrep -v "(^\*|'$BRANCH_NAME')" | xargs git push origin -d
    echo "🗑️ Delete All Merged Branch!" 
fi