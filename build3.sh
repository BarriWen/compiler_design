#!/usr/bin/bash
java -classpath javacc.jar javacc PA5.jj
javac PA5.java
javac CodeGen_Visitor.java
javac JavaToCConverter.java
cd tests; gcc -c -S print.c
cd ..
java JavaToCConverter tests/mjPP.java tests/output_file.c
java PA5 < tests/output_file.c > tests/output_file.s
cd tests; gcc output_file.s print.s -o output_file; ./output_file

