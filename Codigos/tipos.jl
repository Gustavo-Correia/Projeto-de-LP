#tipos primitivos
x = 9 #define como int
c = 'a' #define como char
s = "palavra" #define como string
f = 3.14 #define como float
t = true #define como boolean

#tipos compostos
v = [1,2,3] #define como vetor
m = [1 2 3; 4 5 6] #define como matriz
d = Dict("a" => 1, "b" => 2) #define como dicionário
t = (1,"palavra",3.14) #define como tupla

#tipos compostos definidos pelo usuário
struct Pessoa
    nome::String
    idade::Int
end
p = Pessoa("Thiago", 20) #define como Pessoa

#tipos abstratos
abstract type Animal end
struct Cachorro <: Animal
    nome::String
end
struct Gato <: Animal
    nome::String
end
c = Cachorro("Taylor") #define como Cachorro
g = Gato("Swift") #define como Gato


#tipos paramétricos
struct Par{T1,T2}
    x::T1
    y::T2
end
p = Par(1, "dois") #define como Par

#tipos mutáveis
mutable struct Contador
    valor::Int
end
c = Contador(0) #define como Contador
c.valor = 99 #altera valor
println(c.valor) #imprime 99

#tipos imutáveis
struct Ponto
    x::Int
    y::Int
end
p = Ponto(1,2) #define como Ponto
p.x = 3 #erro, Ponto é imutável
#vale destacar que os tipos primitivos são imutáveis por padrão
#e os tipos compostos são mutáveis por padrão
#para alterar isso, basta adicionar o modificador mutable ou imutável

#tipos importantes que vale a atenção

#Any: tipo que aceita qualquer valor
x::Any = 1
x::Any = "dois"
x::Any = 3.14

#Nothing: tipo que não aceita nenhum valor
x::Nothing = 1 #erro, 1 não é Nothing
x::Nothing = "dois" #erro, "dois" não é Nothing
x::Nothing = 3.14 #erro, 3.14 não é Nothing

#Union: tipo que aceita qualquer valor de um conjunto de tipos
x::Union{Int, String} = 1
x::Union{Int, String} = "dois"
x::Union{Int, String} = 3.14 #erro, Float64 não está no conjunto

