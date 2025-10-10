package services

import (
	"fmt"
	"log"
	"net/url"

	"github.com/FusionAuth/go-client/pkg/fusionauth"
)

type FusionAuthService struct {
	client *fusionauth.FusionAuthClient
}

func NewFusionAuthService(baseURL, apiKey string) *FusionAuthService {
	fusionAuthURL, err := url.Parse(baseURL)
	if err != nil {
		log.Fatalf("ERRO: URL base do FusionAuth inválida '%s': %v", baseURL, err)
	}
	client := fusionauth.NewClient(nil, fusionAuthURL, apiKey)
	return &FusionAuthService{client: client}
}

// FindUserTenant busca um usuário pelo e-mail em todos os tenants e retorna o tenantId.
func (s *FusionAuthService) FindUserTenant(email string) (string, error) {
	// Limpa o TenantId para garantir que a busca seja global
	s.client.SetTenantId("")

	// --- MUDANÇA AQUI ---
	// Colocamos o QueryString dentro da struct aninhada BaseElasticSearchCriteria
	resp, _, err := s.client.SearchUsersByQuery(fusionauth.SearchRequest{
		Search: fusionauth.UserSearchCriteria{
			BaseElasticSearchCriteria: fusionauth.BaseElasticSearchCriteria{
				QueryString: fmt.Sprintf(`{"queryString": "email:\"%s\""}`, email),
			},
		},
	})
	if err != nil {
		return "", err
	}

	if resp.Total == 0 {
		return "", fmt.Errorf("usuário com e-mail '%s' não encontrado", email)
	}

	return resp.Users[0].TenantId, nil
}

// Login realiza a chamada de login para a API do FusionAuth.
func (s *FusionAuthService) Login(email, password, appId, tenantId string) (*fusionauth.LoginResponse, error) {
	req := fusionauth.LoginRequest{
		BaseLoginRequest: fusionauth.BaseLoginRequest{
			ApplicationId: appId,
		},
		LoginId:  email,
		Password: password,
	}

	s.client.SetTenantId(tenantId)

	resp, _, err := s.client.Login(req)
	if err != nil {
		return nil, err
	}

	return resp, nil
}
