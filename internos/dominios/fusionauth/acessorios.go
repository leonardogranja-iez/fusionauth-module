package fusionauth

import (
	"fmt"
)

func getGroupIdByName(name string, s FusionAuthService) (string, error) {
	// Busca todos os grupos
	resp, err := s.client.RetrieveGroups()
	if err != nil {
		return "", fmt.Errorf("erro ao buscar grupos: %w", err)
	}

	// Percorre a lista e compara pelo nome
	for _, g := range resp.Groups {
		if g.Name == name {
			return g.Id, nil
		}
	}

	return "", fmt.Errorf("grupo '%s' não encontrado", name)
}
