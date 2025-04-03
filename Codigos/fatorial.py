import sys

def fatorial(n):
    if n < 0:
        raise ValueError("Fatorial de número negativo não definido")
    if n == 0:
        return 1

    resultado = 1
    for i in range(1, n + 1):
        resultado *= i
    return resultado

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Uso: python fatorial.py <numero>")
        sys.exit(1)

    n = int(sys.argv[1])
    print(f"Resultado: {fatorial(n)}")
