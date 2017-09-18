#~/bin/bash

if [ ! -n `which git` ]; then
  echo "Please install git";
  exit 0;
elif [ $(id -u) -ne 0 ]; then
  echo "You need to use root permission";
  exit 0;
else
  #git clone --progress -v "https://github.com/pro-w-xuan/YaHei-Consolas.git" "./YaHei-Consolas";

  echo "Consolas font folder creating...";
  echo "path:/usr/share/fonts/Consolas";
  mkdir -p /usr/share/fonts/Consolas;

  echo "cp fonts to user font folder";
  cp ./Consolas/*.ttf /usr/share/fonts/Consolas/;

  echo "Modifying font permissions...";
  chmod 644 /usr/share/fonts/Consolas/*.ttf;

  echo "Setup font";
  cd /usr/share/fonts/Consolas/;
  mkfontscale;
  mkfontdir;
  fc-cache -fv;

  echo "Setup font <Consolas> Complete";
fi
