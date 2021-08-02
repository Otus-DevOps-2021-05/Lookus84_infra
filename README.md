#Выполнено ДЗ №6


	1. Предусловие - собран образ fd8dhsouoede05f5v0ff
	2. Установил terraform
		Terraform v1.0.3
		on linux_amd64
	3. По статье https://cloud.yandex.ru/docs/solutions/infrastructure-management/terraform-quickstart#configure-provider 
		добавил в main.tf настройки провайдера, иначе ловил ошибку с некорректным репозиторием
		terraform {
		  required_providers {
			yandex = {
			  source = "yandex-cloud/yandex"
					 }
		  }
		}

	4. добавил переменную окружения export YC_SERVICE_ACCOUNT_KEY_FILE=

	5. terraform init

		Initializing the backend...

		Initializing provider plugins...
		- Reusing previous version of yandex-cloud/yandex from the dependency lock file
		- Using previously-installed yandex-cloud/yandex v0.61.0

		Terraform has been successfully initialized!

		You may now begin working with Terraform. Try running "terraform plan" to see
		any changes that are required for your infrastructure. All Terraform commands
		should now work.

		If you ever set or change modules or backend configuration for Terraform,
		rerun this command to reinitialize your working directory. If you forget, other
		commands will detect it and remind you to do so if necessary.
	6. Определил input переменную для приватного ключа
			variable "public_key_path" {
			# Описание переменной
			description = "Path to the public key used for ssh access"
			}
	7.	Определил input переменную для задания зоны в ресурсе
		"yandex_compute_instance" "app". У нее должно быть значение
		по умолчанию;
			variable "zone" {
			  description = "Zone"
			  # Значение по умолчанию
			  default = "ru-central1-c"
			}
	8. Отформатировал  все конфигурационные файлы используя команду terraform fmt
	9. Сделал рядом файл terraform.tfvars.example, в котором будут указаны переменные для образца
	10*. Создал файл lb.tf и описал в нем в коде terraform создание HTTP балансировщика, направляющего трафик на развернутое приложение на инстансе reddit-app. Проверил доступность приложения по адресу балансировщика. Добавил в output переменные адрес балансировщика.
				output "loadbalancer_ip_address" {
		  value = yandex_lb_network_load_balancer.load_balancer.listener.*.external_address_spec[0].*.address
		}
	11**. Добавил в код еще один terraform ресурс для нового инстанса приложения, reddit-app-1, добавьте его в балансировщик и проверьте, что при остановке на одном из инстансов приложения (например systemctl stop puma), приложение продолжает быть доступным по адресу балансировщика; Добавьте в output переменные адрес второго инстанса (сделал для всех в предыдущем задании)
	12**. Добавил переменную count, задается в variables.tf.  проверил. создается count машин. 
	13. terraform destroy
		Destroy complete! Resources: 4 destroyed.


