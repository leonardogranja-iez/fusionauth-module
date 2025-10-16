package server

import (
	"log"
	"net"

	"fusionauth-module/internos/handlers"
	"fusionauth-module/internos/services"
	wrapperGrpc "fusionauth-module/grpc/gerados"

	"google.golang.org/grpc"
)

func IniciarGrpc(faService *services.FusionAuthService) {
	lis, err := net.Listen("tcp", ":50051")
	if err != nil {
		log.Fatalf("erro ao abrir porta: %v", err)
	}

	grpcSrv := grpc.NewServer()
	wrapperGrpc.RegisterFusionAuthWrapperServer(grpcSrv, handlers.NewFusionAuthGrpcHandler(faService))

	log.Println("Servidor gRPC escutando em :50051")
	if err := grpcSrv.Serve(lis); err != nil {
		log.Fatalf("erro no servidor gRPC: %v", err)
	}
}
