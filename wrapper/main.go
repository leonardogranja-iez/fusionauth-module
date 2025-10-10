// A PRIMEIRA LINHA DEVE SER ESTA:
package main

import (
	"log"
	"net/http"

	"fusionauth-model/wrapper/config"
	"fusionauth-model/wrapper/handlers"
	"fusionauth-model/wrapper/services"
)

func main() {
	// 1. Carrega as configurações
	cfg := config.Load()

	// 2. Cria o serviço do FusionAuth
	faService := services.NewFusionAuthService(cfg.FusionAuthBaseURL, cfg.FusionAuthAPIKey)

	// 3. Cria o handler de autenticação
	authHandler := handlers.NewAuthHandler(faService, cfg)

	// 4. Define a rota de login
	http.HandleFunc("/login", authHandler.Login)

	// 5. Sobe o servidor
	port := "8080"
	log.Printf("Servidor do Wrapper escutando na porta %s\n", port)
	if err := http.ListenAndServe(":"+port, nil); err != nil {
		log.Fatalf("Não foi possível iniciar o servidor: %v", err)
	}
}