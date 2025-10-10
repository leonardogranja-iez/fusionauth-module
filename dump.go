package main

import (
	"fmt"
	"io"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"time"
)

func main() {
	// --- Configuração ---
	dbService := "db"              // Nome do serviço do banco de dados no docker-compose.yml
	dbUser := "postgres"         // Usuário do banco de dados
	dbName := "fusionauth"         // Nome do banco de dados
	outputDir := "database"        // Pasta onde os backups serão salvos
	latestFilename := "latest.sql" // Nome do arquivo de seed para desenvolvimento

	fmt.Println("Iniciando dump do banco de dados do FusionAuth...")

	// 1. Garante que o diretório de saída exista
	if err := os.MkdirAll(outputDir, 0755); err != nil {
		log.Fatalf("ERRO: Falha ao criar o diretório de backup '%s': %v\n", outputDir, err)
	}

	// 2. Cria o nome do arquivo de backup com data e hora
	timestamp := time.Now().Format("2006-01-02-150405")
	filename := fmt.Sprintf("backup-%s.sql", timestamp)
	fullPath := filepath.Join(outputDir, filename)

	// 3. Cria o arquivo de saída onde o dump será salvo
	backupFile, err := os.Create(fullPath)
	if err != nil {
		log.Fatalf("ERRO: Falha ao criar o arquivo de backup '%s': %v\n", fullPath, err)
	}
	defer backupFile.Close() // Garante que o arquivo será fechado no final

	// 4. Prepara o comando 'docker-compose exec'
	// O comando é separado do seus argumentos para segurança e clareza
	cmd := exec.Command("docker-compose", "exec", "-T", dbService, "pg_dump", "-U", dbUser, "-d", dbName)

	// Redireciona a saída padrão do comando (o dump SQL) para o nosso arquivo
	cmd.Stdout = backupFile
	// Redireciona a saída de erro do comando para o terminal, para vermos qualquer problema
	cmd.Stderr = os.Stderr

	// 5. Executa o comando
	if err := cmd.Run(); err != nil {
		log.Fatalf("ERRO: Falha ao executar o comando de dump: %v\n", err)
	}

	fmt.Printf("✔ Dump concluído com sucesso em: %s\n", fullPath)

	// 6. Opcional: Cria a cópia 'latest.sql' para ser usada como seed
	if err := copyFile(fullPath, filepath.Join(outputDir, latestFilename)); err != nil {
		log.Fatalf("ERRO: Falha ao criar a cópia 'latest.sql': %v\n", err)
	}

	fmt.Printf("✔ Cópia de desenvolvimento criada em: %s\n", filepath.Join(outputDir, latestFilename))
}

// copyFile é uma função auxiliar para copiar o conteúdo de um arquivo para outro
func copyFile(src, dst string) error {
	sourceFile, err := os.Open(src)
	if err != nil {
		return err
	}
	defer sourceFile.Close()

	destinationFile, err := os.Create(dst)
	if err != nil {
		return err
	}
	defer destinationFile.Close()

	_, err = io.Copy(destinationFile, sourceFile)
	return err
}