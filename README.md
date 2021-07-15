#Выполнено ДЗ №3

1. создана ветка cloud-bastion
2. созданы ВМ 
	bastion: 84.201.157.102
	someinternalhost: 10.129.0.25 
3. для прямого соединения к someinternalhost необходимо выполнит команду: ssh -J appuser@bastion appuser@someinternalhost
4. Для подключения вида ssh -J bastion someinternalhost необходимо добавить в каталог .ssh  файл config, в котором указать параметры подключения к обоим машинам:
	Host bastion
	    HostName bastion
	    User appuser
            Port 22
	Host someinternalhost
	    HostName someinternalhost
	    User appuser
	    Port 22

При этом необходимо внести указанные хосты в /etc/hosts
