# Tipos básicos usados na calculadora
struct Operacao
    tipo::String
    operandos::Vector{Float64}
    resultado::Float64
end


mutable struct Calculadora
    historico::Vector{Operacao}
    Calculadora() = new(Operacao[])
end

# Funções básicas de cálculo
function somar(a::Number, b::Number)
    return a + b
end

function subtrair(a::Number, b::Number)
    return a - b
end

function multiplicar(a::Number, b::Number)
    return a * b
end

function dividir(a::Number, b::Number)
    return a / b
end

function potencia(a::Number, b::Number)
    return a ^ b
end

function raiz_quadrada(a::Number)
    return √a
end

function fatorial(a::Integer)
    a < 0 && error("Fatorial de número negativo não definido")
    return a == 0 ? 1 : prod(1:a)
end

function modulo(a::Number, b::Number)
    return a % b
end

function logaritmo(a::Number, base::Number)
    return log(base, a)
end

# Persistência em TXT
const ARQUIVO_TXT = "historico_calculadora.txt"

function salvar_historico(calc::Calculadora)
    if isempty(calc.historico)
        return
    end
    
    open(ARQUIVO_TXT, "w") do file
        for op in calc.historico
            operandos_str = join(op.operandos, ", ")
            write(file, "$(op.tipo) ($operandos_str) → $(op.resultado)\n")
        end
    end
end

function carregar_historico(calc::Calculadora)
    isfile(ARQUIVO_TXT) || return
    
    for line in eachline(ARQUIVO_TXT)
        if '→' in line
            parts = split(line, "→")
            op_part = strip(split(parts[1], "(")[1])  # Tipo da operação
            
            operandos_part = split(split(parts[1], "(")[2], ")")[1]
            operandos = [parse(Float64, strip(x)) for x in split(operandos_part, ",")]
            
            
            resultado_str = strip(parts[2])  # Remove espaços e \n
            resultado = parse(Float64, resultado_str)
            
            op = Operacao(op_part, operandos, resultado)
            push!(calc.historico, op)
        end
    end
end

# menu
function mostrar_menu()
    println("\nCalculadora Avançada")
    println("1. Somar")
    println("2. Subtrair")
    println("3. Multiplicar")
    println("4. Dividir")
    println("5. Potência")
    println("6. Raiz Quadrada")
    println("7. Fatorial")
    println("8. Módulo")
    println("9. Logaritmo")
    println("10. Ver histórico")
    println("11. Limpar histórico")
    println("12. Comparar Fatorial (Julia, Python, C)")
    println("13. Sair")
    print("Escolha uma opção: ")
end

function main()
    calc = Calculadora()
    carregar_historico(calc)
    
    while true
        mostrar_menu()
        opcao = tryparse(Int, readline())
        
        if opcao == 13
            salvar_historico(calc)
            println("Até logo!")
            break
        elseif opcao == 12
            comparar_fatorial()
        elseif opcao == 10
            println("\nHistórico:")
            for (i, op) in enumerate(calc.historico)
                operandos_str = join(op.operandos, ", ")
                println("$(op.tipo) ($operandos_str) → $(op.resultado)")
            end
        elseif opcao == 11
            calc.historico = Operacao[]
            println("Histórico limpo!")
        elseif opcao in 1:5 || opcao == 8 || opcao == 9
            print("Primeiro número: ")
            a = parse(Float64, readline())
            print("Segundo número: ")
            b = parse(Float64, readline())
            
            resultado, tipo_operacao = if opcao == 1
                (somar(a, b), "Soma")
            elseif opcao == 2
                (subtrair(a, b), "Subtração")
            elseif opcao == 3
                (multiplicar(a, b), "Multiplicação")
            elseif opcao == 4
                (dividir(a, b), "Divisão")
            elseif opcao == 5
                (potencia(a, b), "Potência")
            elseif opcao == 8
                (modulo(a, b), "Módulo")
            else # opcao == 9
                (logaritmo(a, b), "Logaritmo base $b")
            end
            
            operacao = Operacao(tipo_operacao, [a, b], resultado)
            push!(calc.historico, operacao)
            
            println("Resultado: ", resultado)
        elseif opcao == 6
            print("Número: ")
            a = parse(Float64, readline())
            resultado = raiz_quadrada(a)
            operacao = Operacao("Raiz Quadrada", [a], resultado)
            push!(calc.historico, operacao)
            println("Resultado: ", resultado)
        elseif opcao == 7
            print("Número inteiro: ")
            a = parse(Int, readline())
            resultado = fatorial(a)
            operacao = Operacao("Fatorial", [a], Float64(resultado))
            push!(calc.historico, operacao)
            println("Resultado: ", resultado)
        else
            println("Opção inválida!")
        end
    end
end


main()