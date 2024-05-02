#!/usr/bin/bash
java -classpath javacc.jar javacc PA5.jj
javac PA5.java
javac CodeGen_Visitor.java
echo "compiled java files"
cd tests; gcc -c -S print.c
cd ..
java PA5 < tests/demo_while.c > tests/demo_while.s
cd tests; gcc demo_while.s print.s -o demo_while; ./demo_while

