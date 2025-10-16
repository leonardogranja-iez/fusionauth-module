package services

import (
	"fmt"
	"net/url"

	"github.com/FusionAuth/go-client/pkg/fusionauth"
	"fusionauth-module/internos/config"
)

type FusionAuthService struct {
	client *fusionauth.FusionAuthClient
}

func NewFusionAuthService(baseURL, apiKey string) *FusionAuthService {
	u, err := url.Parse(baseURL)
	if err != nil {
		panic(fmt.Errorf("URL base do FusionAuth inválida '%s': %w", baseURL, err))
	}
	cli := fusionauth.NewClient(nil, u, apiKey)
	return &FusionAuthService{client: cli}
}

func (s *FusionAuthService) CriarUsuario(
	email,
	senha,
	nome,
	groupName string, // ignora groupId vindo da chamada
	sistema bool, // ignora tenantId vindo da chamada
) error {
	// ⚠️ Hardcoded UUIDs válidos do FusionAuth
	var tenantId string
	var appId string

	//TODO: Por enquanto precisa ser passado na request para definir a empresa
	//TODO: Trocar por outro método, passando o próprio grupo do usuário (se for um cliente)
	//TODO: Fazendo-o escolher dentre os grupos existentes, caso seja um usuario Fabrica

	groupId, err := getGroupIdByName(groupName, *s)
	if err != nil {
		return fmt.Errorf("grupo não encontrado: %+v", err)
	}

	if sistema {
		tenantId = config.Load().FabricaTenantID
		appId = config.Load().FabricaAppID
	} else { 
		tenantId = config.Load().WebTenantID
		appId = config.Load().WebAppID
	}

	// 1) Cria o usuário + registra
	req := fusionauth.RegistrationRequest{
		User: fusionauth.User{
			Active:   true,
			Email:    email,
			FullName: nome,
			TenantId: tenantId,
		},
		Registration: fusionauth.UserRegistration{
			ApplicationId: appId,
		},
	}

	regResp, regErrs, err := s.client.Register("", req)
	if err != nil {
		return fmt.Errorf("erro na chamada Register: %w", err)
	}
	if regErrs != nil {
		return fmt.Errorf("erro de validação no Register: %+v", regErrs)
	}

	// Se não veio regErrs, mas userId está vazio, também é erro
	if regResp.User.Id == "" {
		fmt.Printf("[ERROR] Register response sem userId: %+v\n", regResp)
		return fmt.Errorf("registro falhou, resposta inesperada: %+v", regResp)
	}

	// 2) Define a senha fixa
	if senha != "" {
		_, pwdErrs, err := s.client.ChangePasswordByIdentity(fusionauth.ChangePasswordRequest{
			LoginId:      email,
			Password:     senha,
			ApplicationId: appId,
		})
		if err != nil {
			return fmt.Errorf("erro ao definir senha: %w", err)
		}
		if pwdErrs != nil {
			return fmt.Errorf("erro de validação ao definir senha: %+v", pwdErrs)
		}
	}

	// 3) Adiciona ao grupo
	if groupId != "" {
		memReq := fusionauth.MemberRequest{
			Members: map[string][]fusionauth.GroupMember{
				groupId: {
					{
						UserId:  regResp.User.Id,
						GroupId: groupId,
					},
				},
			},
		}
		_, gmErrs, err := s.client.CreateGroupMembers(memReq)
		if err != nil {
			fmt.Printf("[ERROR] CreateGroupMembers: %v\n", err)
			return fmt.Errorf("erro ao adicionar usuário ao grupo: %w", err)
		}
		if gmErrs != nil {
			fmt.Printf("[ERROR] CreateGroupMembers validation: %+v\n", gmErrs)
			return fmt.Errorf("erro de validação ao adicionar ao grupo: %+v", gmErrs)
		}
	}

	return nil
}

