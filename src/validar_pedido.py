projeto, solicitados, limite = input().split()
solicitados = int(solicitados)
limite = int(limite)

if solicitados < 0 or limite < 0:
    print("INVALID")
elif solicitados <= limite:
    print("APPROVED")
else:
    print("REJECTED")
