<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>README - Explicação do Código em Julia</title>
</head>
<body>
    <h1>README - Explicação do Código em Julia</h1>
    <p>Este arquivo contém a explicação do código em Julia que define e utiliza algumas estruturas de dados e conceitos importantes, como tipagem estática, estruturas de dados e estruturas definidas pelo usuário.</p>
    <h2>Estruturas Definidas pelo Usuário</h2>
    <h3>Structs (Estruturas)</h3>
    <p>No Julia, as <strong>structs</strong> são usadas para criar tipos compostos, ou seja, tipos que agrupam diferentes variáveis (campos) sob um nome único.</p>
    
    <h4>Estrutura Imutável</h4>
    <pre><code>
struct Ponto
    x::Float64
    y::Float64
end
    </code></pre>
    <p>Aqui, definimos uma struct chamada <strong>Ponto</strong> com dois campos: <code>x</code> e <code>y</code>, ambos do tipo <code>Float64</code>. Após a criação de um <code>Ponto</code>, não podemos modificar seus valores.</p>
    
    <h4>Estrutura Mutável</h4>
    <pre><code>
mutable struct Pessoa
    nome::String
    idade::Int
end
    </code></pre>
    <p>A struct <strong>Pessoa</strong> permite alterar os valores de <code>nome</code> e <code>idade</code> após a criação de uma instância.</p>
    
    <h2>Tipos Primitivos e Tipagem Estática</h2>
    <pre><code>
x = 42          # Tipo Int64
y = Int32(123)  # Tipo Int32
a = 3.14        # Tipo Float64
b = Float32(2.71) # Tipo Float32
flag = true     # Tipo Bool
c = 'a'        # Tipo Char
name = "Julia"  # Tipo String
x = nothing    # Representa o valor NULL
    </code></pre>
    
    <h2>Tuplas</h2>
    <pre><code>
t = (1, 3.14, "Hello")  # Tipo Tuple{Int64, Float64, String}
    </code></pre>
    
    <h2>Arrays</h2>
    <h4>Vetor Unidimensional</h4>
    <pre><code>
v = [1, 2, 3]  # Array{Int64, 1}
    </code></pre>
    <h4>Matriz Bidimensional</h4>
    <pre><code>
m = [1 2 3; 4 5 6]  # Array{Int64, 2}
    </code></pre>
    
    <h2>Dicionários (Dict)</h2>
    <pre><code>
d = Dict("a" => 1, "b" => 2, "c" => 3)
    </code></pre>
    
    <h2>Erro ao Acessar Índice Inválido</h2>
    <pre><code>
print(v[0])  # Vai gerar um erro
print(v[1])  # Exibe o valor 1
    </code></pre>
    
    <h2>Tipos Abstratos</h2>
    <pre><code>
abstract type Exemplo end
    </code></pre>
    
    <h2>Conclusão</h2>
    <p>Este código demonstra como Julia lida com tipos de dados, structs, arrays e dicionários. Se tiver dúvidas, fique à vontade para perguntar!</p>
</body>
</html>
