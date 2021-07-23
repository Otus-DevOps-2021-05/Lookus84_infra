#Выполнено ДЗ №5


	1. Rонфиги перенес в созданную директорию config-scripts
	2. Установил packer:
		packer$ packer -v
		1.7.4
	3. Добавил сервисный аккаунт и создал ключ (вкомитил в ветку packer-base)
		yc iam service-account list
		+----------------------+---------------+
		|          ID          |     NAME      |
		+----------------------+---------------+
		| ajean3fj3kqg89fhsrns | infra-account |
		+----------------------+---------------+

	4. Создаk файл-шаблон Packer 
	{
    "builders": [
        {
            "type": "yandex",
            "service_account_key_file": "{{user `service_account_key_file`}}",
            "folder_id": "{{user `folder_id`}}",
            "source_image_family":"{{user `source_image_family`}}",
            "target_image_folder_id": "{{user `target_image_folder_id`}}",
            "image_name": "reddit-base-{{timestamp}}",
            "image_family": "reddit-base",
            "use_ipv4_nat": true,
            "ssh_username": "ubuntu",
            "platform_id": "standard-v1"
        }
    ],

    "provisioners": [
        {
            "type": "shell",
            "script": "scripts/install_ruby.sh",
            "execute_command": "sudo {{.Path}}"
        },
        {
            "type": "shell",
            "script": "scripts/install_mongodb.sh",
            "execute_command": "sudo {{.Path}}"
        }
    ]
}


---	Создал ВМ из образа reddit-base-1626979079.
		Установил reddit.
		ssh -i ~/.ssh/zagretdinov zagretdinov@178.154.207.107
		sudo apt-get update
		sudo apt-get install -y git
		git clone -b monolith https://github.com/express42/reddit.git
		cd reddit && bundle install
		puma -d

	5. Cоздал variables.json, variables.json.examples(выложен в ветку). 
	6. Создал immutable.json и immutable-vars.json. А также create-reddit-vm.sh, puma.service, start_puma.sh для запекания образа(image_family - reddit-full).
	

