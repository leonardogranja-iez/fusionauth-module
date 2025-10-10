package handlers

import (
	"encoding/json"
	"net/http"
	"fusionauth-model/wrapper/config" // Mude para o path do seu módulo
	"fusionauth-model/wrapper/services"
)

type AuthHandler struct {
	service *services.FusionAuthService
	config  *config.Config
}

type LoginPayload struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

func NewAuthHandler(s *services.FusionAuthService, c *config.Config) *AuthHandler {
	return &AuthHandler{service: s, config: c}
}

func (h *AuthHandler) Login(w http.ResponseWriter, r *http.Request) {
	var payload LoginPayload
	if err := json.NewDecoder(r.Body).Decode(&payload); err != nil {
		http.Error(w, "Corpo da requisição inválido", http.StatusBadRequest)
		return
	}

	// Por enquanto, estamos usando o ID da Fabrica hardcoded para teste
	appId := h.config.FabricaAppID
	tenantId := h.config.FabricaTenantID

	resp, err := h.service.Login(payload.Email, payload.Password, appId, tenantId)
	if err != nil {
		// Em um caso real, você trataria melhor os erros (ex: senha incorreta)
		http.Error(w, "Falha na autenticação", http.StatusUnauthorized)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resp)
}
