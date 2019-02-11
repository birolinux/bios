#!/bin/bash 


# Script para atualizar rom para placa mãe de telecentros da PMSP - SES - CCCD. 
#O pacote flashrom deve estar instalado no sistema para funcionar
# Escrito por Walter Maciel Junior walter.maciel@gmail.com
# 
# versão:1 data: 27/08/2015

placa=`dmidecode -s baseboard-product-name`
echo fabricante $(dmidecode -s baseboard-manufacturer)
echo placa $placa

if [ $(echo ${#placa}) = "17" ]; then
echo Deseja atualizar usando a rom D42S da FOXCONN? 1 ou 2
select i in SIM NAO
do
	case "$i" in
		"SIM")
		echo atualizando $placa 
		flashrom -w D42S.rom
		exit 0 
		;;
		"NAO")
		echo "Parei"
		exit 0
		;;
		*)
		echo "opção inválida"
		exit 0
		;;
	esac
done

else
ls ~ > biosdir

grep $placa biosdir

 
	if [ $? = 0 ]; then
	echo  atualizando $placa
	flashrom -w $placa.rom
	fi
fi

