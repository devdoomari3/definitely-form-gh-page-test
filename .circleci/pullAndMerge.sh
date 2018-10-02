git pull origin $CIRCLE_BRANCH
git merge -X theirs --no-edit $CIRCLE_BRANCH
git add -f lib docs
mkdir -p ~/.git && git config --global user.email "devdoomari@gmail.com" && git --global config user.name "devdoomari.circleci"
git commit --allow-empty -m $'generated from:'"$CIRCLE_SHA1"$'\ntriggered by:'"$CIRCLE_USERNAME"$'\n[ci skip]'
git tag -a $'dist_'"$CIRCLE_BRANCH"'_'"$CIRCLE_BUILD_NUM" -m "."