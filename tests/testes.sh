#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."

test_case() {
  local script="$1" input="$2" expected="$3"
  actual=$(printf '%s\n' "$input" | python3 "$script")
  [[ "$actual" == "$expected" ]] || { echo "FALHA: $script | $input | esperado=$expected obtido=$actual"; exit 1; }
  echo "OK: $script | $input -> $actual"
}

test_case src/validar_pedido.py 'alpha 3 5' 'APPROVED'
test_case src/validar_pedido.py 'beta 8 4' 'REJECTED'
test_case src/validar_pedido.py 'gamma -1 6' 'INVALID'
test_case src/status_instancia.py 'up' 'running'
test_case src/status_instancia.py 'down' 'alert'
test_case src/status_instancia.py 'error' 'invalid'
test_case src/saude_instancia.py 'ok ok ok' 'normal'
test_case src/saude_instancia.py 'ok fail ok' 'alerta'
test_case src/saude_instancia.py 'fail fail ok' 'incidente'
test_case src/saude_instancia.py 'ok erro ok' 'invalido'
