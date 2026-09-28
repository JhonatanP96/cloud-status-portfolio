# Cloud Status Portfolio

> Exercícios práticos de lógica condicional aplicados ao monitoramento de recursos e instâncias virtuais.

Este repositório registra a solução de três desafios introdutórios da formação **Análise Avançada de Imagens e Texto com IA na AWS**, adaptados para um cenário de cloud computing. A proposta foi transformar sinais simples de operação em decisões objetivas para um painel interno.

## O que foi desenvolvido

| Arquivo | Entrada | Saída |
|---|---|---|
| `src/validar_pedido.py` | projeto, quantidade solicitada e limite | `APPROVED`, `REJECTED` ou `INVALID` |
| `src/status_instancia.py` | `up`, `down`, `idle` ou outro texto | `running`, `alert`, `standby` ou `invalid` |
| `src/saude_instancia.py` | três sinais `ok`/`fail` | `normal`, `alerta`, `incidente` ou `invalido` |

## Como executar

Requer Python 3, sem bibliotecas externas:

```bash
printf 'alpha 3 5\n' | python3 src/validar_pedido.py
# APPROVED

printf 'ok fail ok\n' | python3 src/saude_instancia.py
# alerta
```

Para executar todos os casos de validação:

```bash
./tests/testes.sh
```

![Evidência dos testes](docs/prints/resultado-testes.svg)

## Raciocínio aplicado

1. **Validar antes de comparar:** números negativos e palavras desconhecidas são tratados como entradas inválidas.
2. **Comparar de forma exata:** não há conversões ou normalizações que alterem os valores recebidos.
3. **Contar falhas:** no verificador de saúde, a quantidade de `fail` determina a severidade do resultado.
4. **Manter cada caso independente:** cada programa lê uma única entrada e produz uma única resposta, sem estado compartilhado.

## Insights

- Condicionais simples já conseguem representar regras úteis de operação.
- A validação antecipada evita que dados fora do contrato sejam classificados incorretamente.
- A separação entre entrada, regra e saída torna o código fácil de testar e evoluir.
- O mesmo padrão pode ser conectado futuramente a logs, filas, métricas e alertas de serviços cloud.

## Possibilidades de evolução

- adicionar testes automatizados com `pytest`;
- transformar as regras em uma API para receber eventos de monitoramento;
- persistir histórico de incidentes em um banco de dados;
- integrar métricas e alertas de uma infraestrutura AWS;
- usar IA para resumir logs e apoiar a triagem de incidentes, mantendo as regras determinísticas como primeira camada de segurança.

## Evidência

A imagem acima foi gerada a partir da execução local de `tests/testes.sh`. Os testes cobrem os caminhos de aprovação, rejeição, invalidação, operação normal, alerta e incidente.

## Licença

Material educacional para portfólio.
