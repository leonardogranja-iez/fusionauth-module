# Makefile para gerenciar o ambiente de desenvolvimento do FusionAuth

# --- Variaveis ---
# Nome do arquivo SQL usado para popular o banco de dados no setup.
# Nosso script dump.go já cria este arquivo como uma cópia do último backup.
SEED_FILE := database/latest.sql

# --- Comandos do Ambiente ---

.PHONY: help
help: ## Mostra esta lista de ajuda
	@echo "Comandos disponíveis:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup: down ## 🚀 Sobe os contêineres e popula o banco de dados com os dados de 'latest.sql'
	@echo "--> Iniciando o serviço de banco de dados..."
	@docker-compose up -d db
	@echo "--> Aguardando o banco de dados ficar pronto..."
	@sleep 5
	@if [ ! -f $(SEED_FILE) ]; then \
		echo "ERRO: Arquivo de seed '$(SEED_FILE)' não encontrado. Rode 'make dump' primeiro."; \
		docker-compose down; \
		exit 1; \
	fi
	@echo "--> Restaurando dados do arquivo $(SEED_FILE)..."
	@cat $(SEED_FILE) | docker-compose exec -T db psql -U postgres -d fusionauth
	@echo "--> Subindo todos os serviços..."
	@docker-compose up -d
	@echo "✅ Ambiente pronto e populado!"

.PHONY: up
up: ## Sobe todos os contêineres (sem recriar o banco)
	@echo "--> Subindo todos os serviços..."
	@docker-compose up -d

.PHONY: down
down: ## Para todos os contêineres
	@echo "--> Parando todos os serviços..."
	@docker-compose down

.PHONY: clean
clean: ## ⚠️ Para e remove contêineres, redes E VOLUMES (apaga todos os dados)
	@echo "--> Removendo contêineres, redes e volumes..."
	@docker-compose down -v --remove-orphans

.PHONY: logs
logs: ## Mostra os logs de todos os contêineres em tempo real
	@docker-compose logs -f

# --- Comandos de Banco de Dados ---

.PHONY: dump
dump: ## Gera um backup do estado atual do banco de dados (usando o script Go)
	@echo "--> Executando o script de dump..."
	@go run dump.go

.PHONY: restore
restore: ## Restaura o banco de dados a partir do arquivo 'latest.sql' (requer que o 'db' esteja rodando)
	@echo "--> Restaurando dados do arquivo $(SEED_FILE)..."
	@cat $(SEED_FILE) | docker-compose exec -T db psql -U postgres -d fusionauth
	@echo "✅ Banco de dados restaurado!"