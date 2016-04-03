#!/bin/bash
# author: Zhichao Cao

javac EightQueensSAT.java

for i in `seq 1 100`; 
do
	echo "Running $i Queens"
	java EightQueensSAT $i
	./MiniSat_v1.14_linux input$i.cnf output$i > statistics$i 
done
