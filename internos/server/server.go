package server

import (
	"log"
	"net"

	"fusionauth-module/internos/dominios/fusionauth"
	wrapperGrpc "fusionauth-module/grpc/gerados"

	"google.golang.org/grpc"
)

func IniciarGrpc(faService *fusionauth.FusionAuthService) {
	lis, err := net.Listen("tcp", ":50051")
	if err != nil {
		log.Fatalf("erro ao abrir porta: %v", err)
	}

	grpcSrv := grpc.NewServer()
	wrapperGrpc.RegisterFusionAuthWrapperServer(grpcSrv, fusionauth.NewFusionAuthGrpcHandler(faService))

	log.Println("Servidor gRPC escutando em :50051")
	if err := grpcSrv.Serve(lis); err != nil {
		log.Fatalf("erro no servidor gRPC: %v", err)
	}
}
