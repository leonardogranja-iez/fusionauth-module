# # --- Variáveis ---
SEED_FILE := database/latest.sql
PROTO_SRC := grpc/wrapper.proto
PROTO_DESC := descripto.pb

# * FUSIONAUTH
.PHONY: dump
dump: ## 💾 Gera backup do banco de dados
	@echo "--> Executando dump..."
	@go run dump.go

.PHONY: restore
restore: ## ♻️ Restaura banco a partir do arquivo latest.sql
	@echo "--> Restaurando banco a partir de $(SEED_FILE)..."
	@cat $(SEED_FILE) | docker-compose exec -T db psql -U postgres -d fusionauth

.PHONY: setup
setup: down ## 🚀 Sobe containers, restaura o banco e inicia tudo
	@echo "--> Subindo banco de dados..."
	@docker-compose up -d db
	@sleep 5
	@if [ ! -f $(SEED_FILE) ]; then \
		echo "ERRO: Arquivo de seed '$(SEED_FILE)' não encontrado. Rode 'make dump' primeiro."; \
		docker-compose down; \
		exit 1; \
	fi
	@$(MAKE) restore
	@echo "--> Subindo os demais serviços..."
	@docker-compose up -d
	@echo "✅ Setup completo!"

.PHONY: up
up: ## 📦 Sobe containers (db + fusionauth)
	@docker-compose up -d

.PHONY: down
down: ## 🛑 Derruba containers
	@docker-compose down

.PHONY: clean
clean: ## ⚠️ Remove containers e volumes
	@docker-compose down -v --remove-orphans

# * GO

.PHONY: run
run: ## roda o projeto go
	@go run ./cmd

.PHONY: proto
proto: ## 🔧 Gera stubs gRPC e descriptor com buf+protoc
	@echo "--> Limpando diretórios antigos..."
	@rm -rf grpc/gerados
	@rm -f $(PROTO_DESC)
	@echo "--> Gerando stubs com buf..."
	@buf generate grpc
	@echo "--> Gerando descriptor (para Envoy transcoder)..."
	@protoc -Igrpc -I/usr/local/include \
	  --include_imports \
	  --include_source_info \
	  --descriptor_set_out=$(PROTO_DESC) \
	  $(PROTO_SRC)
	@echo "✅ Proto e descriptor gerados!"


# * GERAIS

.PHONY: all
all: down up proto run ## 🔄 Derruba, sobe, gera proto e roda o projeto

.PHONY: logs
logs: ## 📜 Logs dos containers
	@docker-compose logs -f

help: ## Mostra ajuda
	@echo "Comandos disponíveis:"
	@awk '\
	/^# \* / { \
	  line=$$0; \
	  sub(/^# \* /, "", line); \
	  print line; \
	  next; \
	} \
	/^[a-zA-Z0-9_.-]+:.*?##/ { \
	  split($$0,a,"##"); \
	  cmd=$$1; sub(":.*","",cmd); \
	  desc=a[2]; \
	  printf "  \033[36m%-15s\033[0m %s\n", cmd, desc; \
	}' $(MAKEFILE_LIST)
