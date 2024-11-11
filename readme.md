# Lexical-Analyzer-Code-Comments

Laboratório 04 - Ferramentas de Análise Léxica

Foi utilizado como código-base oo material de laboratório 14 de Compiladores do professor Judson Santos Santiago. [Link aqui.](https://github.com/JudsonSS/Compiladores/tree/2e1b81ba859e18e938ea149d1cef2edea04dde36/Labs/Lab14/Sample)

# Funcionalidades Implementadas
- Suporte a Strings com Escape: Reconhecimento de strings com aspas escapadas (\") e barras invertidas (\\).
- Identificadores com Sublinhado: Identificadores podem conter o caractere _ em qualquer posição.
- Operadores Relacionais do C++: Suporte aos operadores ==, !=, <, <=, >, >=.
- Ignorando Comentários: Reconhecimento e ignorância de comentários de linha (//) e de bloco (/* ... */).

  
# Compilação e Execução
Para compilar o projeto com CMake:
`
mkdir build
cd build
cmake ..
cmake --build .
`

Para executar o analisador com um arquivo de teste:

`./sample < caminho/para/arquivo_de_teste.cpp`
