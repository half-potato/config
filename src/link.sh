for i in $(ls -A files); do
  rm -rf ~/$i
  ln -s files/$i ~/$i
done
