package config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	FusionAuthBaseURL string
	FusionAuthAPIKey  string
	FabricaAppID      string
	FabricaTenantID   string
}

func Load() *Config {
	if err := godotenv.Load(); err != nil {
		log.Println("Arquivo .env não encontrado, usando variáveis de ambiente.")
	}

	return &Config{
		FusionAuthBaseURL: os.Getenv("FUSIONAUTH_BASE_URL"),
		FusionAuthAPIKey:  os.Getenv("FUSIONAUTH_API_KEY"),
		FabricaAppID:      os.Getenv("FABRICA_APP_ID"),
		FabricaTenantID:   os.Getenv("FABRICA_TENANT_ID"),
	}
}