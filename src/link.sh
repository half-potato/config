DIR=$(pwd)
for i in $(find files/ -type f -printf '%P\n'); do
  if [ ! -d "~/$(dirname $i)" ]; then 
    mkdir -p ~/$(dirname $i)
  fi
  echo $i
  rm -rf -- ~/$i
  ln -s $DIR/files/$i ~/$i
done
