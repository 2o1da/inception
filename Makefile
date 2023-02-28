all:
	@mkdir -p /home/daskim/data/wordpress
	@mkdir -p  /home/daskim/data/mariadb	
	docker-compose -f ./srcs/docker-compose.yml up --build -d
	
down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -qa)
	@docker system prune -a

.PHONY: all re down clean
