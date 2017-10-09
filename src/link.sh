DIR=$(pwd)
for i in $(ls -A files); do
  rm -rf ~/$i
  ln -s $DIR/files/$i ~/$i
done
