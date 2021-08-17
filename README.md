
#Выполнено ДЗ №10
- Перенесены созданные плейбуки в раздельные роли
- Описаны два окружения (+ вывод информации об окружении во время выполнения буки)
- Использовал коммьюнити роль nginx (jdauphant.nginx)
- Использовал Ansible Vault для наших окружений (users.yml, добавлен в site.yml)
 Результат: в сисему добавлены юзеры:


- ssh admin@178.154.205.80
admin@178.154.205.80's password:
Welcome to Ubuntu 16.04.7 LTS (GNU/Linux 4.4.0-142-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

$


- ssh qauser@178.154.205.80
qauser@178.154.205.80's password:
Welcome to Ubuntu 16.04.7 LTS (GNU/Linux 4.4.0-142-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

$
