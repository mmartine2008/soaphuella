echo Eliminando archivos ...
#/bin/sh
find . -name "*.class" | xargs rm#/bin/sh

echo Compilando ...
javac -d bin src/sap/com/sap/document/sap/rfc/functions/*.java
javac -d bin -cp bin src/wsservice/*.java

echo Ejecutando ...
cd bin
#java wsserver.HuellaServiceStarter
java wsserver.ProdemanSOAPClient
cd ..