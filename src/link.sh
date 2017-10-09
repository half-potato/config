DIR=$(pwd)
for i in $(find files/ -type f -printf '%P\n'); do
  if [ ! -d "~/$(dirname $i)" ]; then 
    mkdir -p ~/$(dirname $i)
  fi
  rm -rf -- ~/$i
  echo $i
  ln -s $DIR/files/$i ~/$i
done

cd ~/.emac.d
git pull origin develop
