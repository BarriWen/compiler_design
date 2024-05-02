#!/usr/bin/bash
java -classpath javacc.jar javacc PA5.jj
javac PA5.java
javac CodeGen_Visitor.java
echo "compiled java files"
cd tests; gcc -c -S print.c
cd ..
java PA5 < tests/tests/demo_array.c > tests/tests/demo_array.s
cd tests; gcc demo_array.s print.s -o demo_array; ./demo_array