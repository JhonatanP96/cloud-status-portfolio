cpu, memoria, rede = input().split()
sinais = [cpu, memoria, rede]

if any(sinal not in ("ok", "fail") for sinal in sinais):
    print("invalido")
else:
    falhas = sinais.count("fail")
    if falhas == 0:
        print("normal")
    elif falhas == 1:
        print("alerta")
    else:
        print("incidente")
