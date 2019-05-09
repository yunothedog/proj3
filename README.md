
## Document Tècnic

***Instal·lació*** 

En la carpeta d'usuari vam fer una carpeta específica per la tasca i a continuació vam fer la comanda **vagrant init** per tal de crear en fitxer *VagrantFile* dins de la carpeta creada

***Configuració***
Editem el fitxer *VagrantFile* i canviem les següents línies  
- Línia **15** *config.vm.box = "ubuntu/trusty64* **Especifica la màquina virtual que volem utilitzar (nosaltres la hem tret de  la pagina de VagrantCloud)**
- Línia **25** config.vm.network "forwarded_port", guest: 80, host: 8080  **Per tenir internet a la maquina**
- Línia **51**  *vb.memory = "2048"* **Especifica els GB que volem de memoria RAM per a la maquina**
- Línia **46** config.vm.provider "virtualbox" do |vb| **Des comentar el bucle per que no doni error a la memoria RAM**
- Línia **60** *config.vm.provision "shell", path: "proj3.sh"* **Especifica el que volem instal·lar mitjançant el script que hem fet**

***Instal·lació de la maquina***
*vagrant box add mimaquina /home/ausias/vagrant-proj3/trusty-server-cloudimg-amd64-vagrant-disk1.box*
vagrant up 
automaticament s'instal·lara la maquina i iniciant la maquina creada amb el virtualbox podrem entrar a la maquina creada, alla podem mirar si tenim instal·lats el programes que hem especificat en el Script amb la comanda netstat, i veurem que esta instalat lel HTTP, SSH, apache2 i php

