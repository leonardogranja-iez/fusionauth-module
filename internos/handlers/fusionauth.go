package handlers

import (
	"context"
	"fmt"

	"fusionauth-module/internos/services"
	wrapperGrpc "fusionauth-module/grpc/gerados"

	"google.golang.org/protobuf/types/known/emptypb"
)

type FusionAuthGrpcHandler struct {
	wrapperGrpc.UnimplementedFusionAuthWrapperServer
	service *services.FusionAuthService
}

func NewFusionAuthGrpcHandler(service *services.FusionAuthService) *FusionAuthGrpcHandler {
	return &FusionAuthGrpcHandler{service: service}
}

func (h *FusionAuthGrpcHandler) CriarUsuario(
	ctx context.Context, 
	req *wrapperGrpc.CriarUsuarioRequest,
) (*emptypb.Empty, error) {
	
	err := h.service.CriarUsuario(
		req.Email,
		req.Senha,
		req.Nome,
		req.Grupo,
		req.Sistema,
	)
	if err != nil {
		return nil, fmt.Errorf("erro ao criar usuário: %w", err)
	}
	
	return &emptypb.Empty{}, nil
}

// internos/handlers/fusionauth_grpc_handler.go

func (h *FusionAuthGrpcHandler) DeletarUsuario(
	ctx context.Context, 
	req *wrapperGrpc.DeletarUsuarioRequest,
) (*emptypb.Empty, error) {
	
    err := h.service.DeletarUsuario(req.UserId)
    if err != nil {
        return nil, fmt.Errorf("erro ao deletar usuário: %w", err)
    }

    return &emptypb.Empty{}, nil
}

