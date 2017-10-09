for i in $(ls -A files); do
  rm ~/$i
  ln -s files/$i ~/$i
done
