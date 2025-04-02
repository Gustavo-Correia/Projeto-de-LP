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

