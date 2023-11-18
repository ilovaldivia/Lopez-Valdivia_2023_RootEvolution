#!/bin/bash
#ILV, 2022: This script will create new directories for OpenSimRoot inputfiles replacing values in .xml indicated in the code.
#The replacements are taken from a spreadsheet (OSR_parameterization.csv) that contains 3 header values (0,1,2) and the rest are the replacements values (3,...,n) 
set –e
set –u
set –o pipefail

 while IFS=',' read -a line || [ -n "$line" ]
do
   echo ${line[0]}_${line[1]}_${line[2]}_${line[3]}_${line[23]}
   cp -R ./Reference ./"${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"
   sed -i s/numeroRandom1/${line[4]}/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/densidad1/${line[5]}/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/respiracion1/${line[6]}/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/riego1/"${line[7]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/penetracionaxial1/"${line[8]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/penetracionaxial2/"${line[9]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/densidadaparente1/"${line[10]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/seminales1/"${line[11]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/nodo1/"${line[12]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/nodo2/"${line[13]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/nodo3/"${line[14]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/nodo4/"${line[15]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/nodo5/"${line[16]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/nodo6/"${line[17]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/nodo7/"${line[18]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/nodo8/"${line[19]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/dioxido1/"${line[20]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/Temperatura1/"${line[21]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/semilla/"${line[22]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/nitrogeno1/"${line[24]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/riego2/"${line[25]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/mineralizacion1/"${line[26]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml
   sed -i s/materia_organica1/"${line[27]}"/g "${line[0]}"_"${line[1]}"_"${line[2]}"_"${line[3]}"_"${line[23]}"/runMaize.xml

   
done < <(tail -n +2 OSR_parameterization_Figure3_v15.csv)


#for a in NF ROS
# do
#	for b in "PI 608619" "PI 516002" "PI 571439" "PI 571523" "PI 571629" "PI 571913" "PI 571994" "PI 471823"
#	do
#		for c in High Low
#		do
#			for d in HN LN
#			do
#				for e in rep1 rep2 rep3 rep4 rep5 
#				do
#				echo "$b"_"$a"_"$c"_"$d"_"$e"
#				cd "$b"_"$a"_"$c"_"$d"/"$e"
#				qsub -A open ../../../job.pbs
#				done
#			done
#		done
#	done
#done
