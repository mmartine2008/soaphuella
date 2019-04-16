#/bin/sh
javac -d bin src/sap/com/sap/document/sap/rfc/functions/*.java
javac -d bin -cp bin src/wsservice/*.java
