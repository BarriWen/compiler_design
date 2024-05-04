!/usr/bin/bash
java -classpath javacc.jar javacc PA5.jj
javac PA5.java
javac Arm_Visitor.java
cd tests; gcc -c -S print.c
cd ..
java PA5 < tests/demo.c > tests/demo1.s
cd tests; gcc demo1.s print.s -o demo1; ./demo1