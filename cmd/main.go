package main

import (
	"fusionauth-module/internos/config"
	"fusionauth-module/internos/services"
	"fusionauth-module/internos/server"
)

func main() {
	cfg := config.Load()
	faService := services.NewFusionAuthService(cfg.FusionAuthBaseURL, cfg.FusionAuthAPIKey)

	// Sobe o gRPC
	server.IniciarGrpc(faService)
}
