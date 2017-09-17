../scripts/convert.sh $1

TITLE="POST_TITLE"
echo "mkdir ../$TITLE"
echo "mv $TITLE _files ../$TITLE"
echo "git add ../_post/*.md & git add ../$TITLE"
echo "git commit & git push"

