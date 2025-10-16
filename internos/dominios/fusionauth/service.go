package fusionauth

import (
	"fmt"
	"net/url"

	"fusionauth-module/internos/config"

	"github.com/FusionAuth/go-client/pkg/fusionauth"
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

func (s *FusionAuthService) criarUsuario(
	email,
	senha,
	nome,
	groupName string,
	sistema bool,
) error {

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
		return fmt.Errorf("registro falhou, resposta inesperada: %+v", regResp)
	}

	// 2) Define a senha fixa
	if senha != "" {
		_, pwdErrs, err := s.client.ChangePasswordByIdentity(fusionauth.ChangePasswordRequest{
			LoginId:       email,
			Password:      senha,
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
			return fmt.Errorf("erro ao adicionar usuário ao grupo: %w", err)
		}
		if gmErrs != nil {
			return fmt.Errorf("erro de validação ao adicionar ao grupo: %+v", gmErrs)
		}
	}

	return nil
}

func (s *FusionAuthService) deletarUsuario(userID string) error {
	// realiza a chamada de deleção de usuário
	_, faErrs, err := s.client.DeleteUser(userID) //"_" é o retorno do uuid do cliente, importante pros logs
	if err != nil {
		return fmt.Errorf("erro ao chamar DeleteUser: %w", err)
	}
	if faErrs != nil {
		return fmt.Errorf("erro de validação no DeleteUser: %+v", faErrs)
	}

	return nil
}
