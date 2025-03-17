struct Ponto #essa struct já é definida como imutavel de começo.
    x::Float64
    y::Float64
end

mutable struct Pessoa #utilizar o mutable faz com que a struct possa ser modifiicada
    nome::String
    idade::Int
end

x :: Int = 2 #Declaração, se depois vc fizer ela receber um double por exemplo, ira dar erro



abstract type Exemplo end #tipo abstrato
x = 42    # Tipo Int64
y = Int32(123)  # Tipo Int32
a = 3.14    # Tipo Float64
b = Float32(2.71)   # Tipo Float32
flag = true   # Tipo Bool
c = 'a'   # Tipo Char
name = "Julia"  # Tipo String
x = nothing   # Representa o valor NULL
t = (1, 3.14, "Hello") #TUPLA
v = [1, 2, 3]#vetor
d = Dict("a" => 1, "b" => 2, "c" => 3)  # Dicionario ou Dictoniary
print(v[0]) #vai dar erro
print(v[1]) #vai exibir o 1
m = [1 2 3; 4 5 6] #arraymultidimensional