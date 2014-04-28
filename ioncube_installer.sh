#!/bin/bash
WHO=$(whoami)
if [ "${WHO}" == "root" ]
then
echo "Script Baslatildi | Murat USTA | muratusta.net  ..."
else
echo "ionCube Loader'i baslatabilmek icin root olarak baglanmalisiniz."
echo "Kapatiliyor ..."
exit 0
fi
yol=$(php -i | grep php.ini | grep ^Configuration | cut -f6 -d" ")
yol="$yol/php.ini"
echo "php.ini yolu: $yol .."
echo "Devam etmek için herhangi bir tusa yuklemeyi iptal etmek icin CTRL+C basin."
read -n 1
clear
echo "Yukleme Baslatildi.."
echo "Dizin Degistiriliyor.."
cd /usr/local/
echo "Tamamlandi."
if [ -e ioncube_loaders_lin_x86-64.tar.gz ]
then
rm -f ioncube_loaders_lin_x86-64.tar.gz
fi
clear
echo "Dosyalar indiriliyor.."
wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
echo "Tamamlandi."
echo "Yukleniyor..."
tar -zxvf ioncube_loaders_lin_x86-64.tar.gz
echo "Tamamlandi.."
echo "Yetkilendirme yapiliyor.."
chown -R root.root ioncube
echo "Tamamlandi.."
phpline=$(php -v | grep ^PHP | cut -f2 -d " "| awk -F "." '{print "zend_extension=\"/usr/local/ioncube/ioncube_loader_lin_"$1"."$2".so\""}')
clear
echo "$phpline"
echo "$yol"
echo "Su satir:  $phpline ,  $yol dosyasına ekleniyor"
echo "$phpline" >> "$yol"
rm -f ioncube_loaders_lin_x86-64.tar.gz
echo "ionCube basarili bir sekilde kuruldu."

