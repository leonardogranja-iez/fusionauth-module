package main

import (
	"fusionauth-module/internos/config"
	"fusionauth-module/internos/dominios/fusionauth"
	"fusionauth-module/internos/server"
)

func main() {
	cfg := config.Load()
	faService := fusionauth.NewFusionAuthService(cfg.FusionAuthBaseURL, cfg.FusionAuthAPIKey)

	// Sobe o gRPC
	server.IniciarGrpc(faService)
}
