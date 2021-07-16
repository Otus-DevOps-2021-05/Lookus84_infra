#Выполнено ДЗ №2

- добавлены:
PULL_REQUEST_TEMPLATE/PULL_REQUEST_TEMPLATE.md
pre-commit
канал в slack (приглашены Матвей Михайлов и Виталий Хабаров)
уведомления о новых комитах в канале
Github Actions

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

5. Установить VPN  по инструкции из домашнего задания не получилось. возникали конфликты в зависимостях, в результате не встали сервисы pritunl и mongodb. 
	- Установил по инструкции с сайта https://www.howtoforge.com/how-to-setup-pritunl-vpn-server-on-ubuntu-20-04/?__cf_chl_captcha_tk__=7254c8f7f26dc5feec0dfea8f4f3e3cc068b0e6d-1626264436-0-Ae8ZPnunSFeGVYt1SQ8GVkTvL5AMlryXRWNgFobK-KIeDsnEKck8CqjD5sEcYvg6-LtsaEcGsUh2XNlr2d4D9wXbElPzPvZz9Nw2UskCgw5zAlvMkmy4D3co6S6uweFTiyoJadT70OvHQknC-gY3Wa6a4TbbwFHBtgB88zVizSnLv34VOVCll5aQxeectwrflLvVyPEPpedGoioc199DtmESOLmYk0xYXGtxH_ren6CRIkD-fMgF0LWYmpKdOJqlMoBdNeNRLcfxHL0bR55TMW2fEVTkFMeVXxCTgV3YMw8kAGO-G-Y78ZryZPsnI4OdqU76N7xtvHnscJ-rGGWuzRwazkoeve293u4r1RYR2sFeRneQV7rdEy4jE1eRLun-VQWAvb2LkYWokC0GsR2C6LheiPR57FuCD9a-_Y77RdcyrTIUqOrg14ZxfEngLg8z9TlvhIbuU9yvlJcQy5bdAjTLfrdyny_dSuq85CBInPdj9xiGbXFUyV56_W1O_gb5qPmu7umSLhTRKshfcgKLj3PGjC8vXEzYaUrqgRrQ8o7sQ3cR_pb3q4PrSBRg2ZsK5h4ceugiPZvG3dR3fcx0pSQg4i4a-Dv-PPI6U2FQRSANpzFyu05r85Sfbyl3Ay8fjR_EzWZKLg1p07AwWYUsyhCY_yqSAfWagu4kGyE7DNFW
	- Настроил ВПН сервер. файл конфигурации закомитил в ветку cloud-bastion
	- Подключился с локальной машины к ВПН серверу: 

Thu Jul 15 16:30:27 2021 Notified TAP-Windows driver to set a DHCP IP/netmask of 192.168.227.2/255.255.255.0 on interface {C8D36AC9-2129-467F-A0A2-27B19EF67316} [DHCP-serv: 192.168.227.254, lease-time: 31536000]
Thu Jul 15 16:30:27 2021 Successful ARP Flush on interface [19] {C8D36AC9-2129-467F-A0A2-27B19EF67316}
Thu Jul 15 16:30:32 2021 Initialization Sequence Completed

	- подключился напрямую к ВМ someinternalhost:

Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-42-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Thu Jul 15 13:06:58 2021 from 10.128.0.4
appuser@someinternalhost:~$

bastion_IP = 84.201.157.102
someinternalhost_IP = 10.129.0.25

#Выполнено ДЗ №4


	1. Перенес файлы *.ovpn и setupvpn.sh , созданные в прошлом ДЗ в директорию VPN
	2. Установил ruby используя install_ruby.sh.
	3. Установил mongodb используя install_mongodb.sh
	4. Установил приложение reddit используя deploy.sh
	5. Доп. задание: создал скрипт и yaml для автоматического создания и установки приложения. Данные автоматически созданного хоста(для проверки приложения)
		testapp_IP = 84.252.133.140
	    testapp_port = 9292
