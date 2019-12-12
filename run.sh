#/bin/sh
cd bin
# Activa el mocking:
java wsserver.HuellaServiceStarter http localhost 1212 huella mocking
#java wsserver.HuellaServiceStarter http 192.168.1.102 1212 huella mocking
#java wsserver.HuellaServiceStarter http 192.168.1.102 1212 huella 
#java wsserver.HuellaServiceStarter http localhost 1212 huella
#java wsserver.ProdemanSOAPClient
#java wsserver.EasyClient
cd ..
