# Parte 5 - Shell Scripting

## Sumário

1. [O que é um Shell Script](#intro-shell)
2. [Estrutura de um Shell Script](#estrutura-shell)
3. [Prática](#pratica1)
    - [Echo](#echo)
    - [Parâmetros](#parametros)
    - [Condicionais](#condicionais)
    - [Loops](#loops)
    - [Flags](#flags)
    - [Shift](#shift)
    - [Funções](#funcoes)
4. [Exercício 1](#exercicio1)
5. [Tópicos adicionais](#pratica2)
    - [Debug](#debug)
    - [Status](#status)
    - [Coproc](#coproc)
    - [Eval](#eval)
    - [Getopt](#getopt)
6. [Exercício 2](#exercicio2)
6. [Referências](#ref)

---------

<h3 id="intro-shell"> O que é um Shell Script? </h3>

* Um script é uma sequência de comandos
* Um interpretador é um programa que interpreta e executa comandos 

Todos os comandos que aprendemos anteriormente podem ser colocados em arquivos, serem rodados como scripts que serão interpretados por alguma shell. Você pode estar se perguntando por que alguém faria isso e a resposta é bem simples:

* Automatizar tarefas chatas

<h3 id="estrutura-shell"> A estrutura de um Shell Script </h3>

* Shebang (\#!): Denota qual shell você pretende usar

    * csh
    ```
    #!/usr/bin/csh
    ```
    * ksh
    ```
    #!/usr/bin/ksh
    ```
    * tsh
    ```
    #!/usr/bin/tsh
    ```
    * zsh
    ```
    #!/usr/bin/zsh
    ```

Por padrão se você não especifica a shebang no começo do arquivo, o script é executado na sua shell atual. Ser explícito é sempre uma boa prática de programação, então vamos adotar como padrão no curso o Bash como shell:

```
#!/usr/bin/bash
```

Uma motivação extra é que não precisamos nos limitar apenas à shell, o seguinte script é válido, por exemplo:

```
#!/usr/bin/python

print("Hello")
```

Um primeiro script para servir de exemplo, sobre como declarar e usar variáveis junto de comandos normais da shell. Será que isso vai rodar?

```
#!/usr/bin/env bash

SERVER_NAME=$(hostname)

echo "$SERVER_NAME"
```

Peraí, não acabamos de ver que os scripts tem que ser declarados com `#!/usr/bin/bash`? Qual diferença entre esses dois?

<h3 id="pratica1"> Prática </h3>

<h4 id="echo"> Echo </h4>


```
#!/usr/bin/env bash

echo Hello, world!
echo "Hello, World!"
echo "Hello,
    World!"
```

<h4 id="parametros"> Parametros </h4>

```
#!/usr/bin/env bash

echo "Nome do script: $0"
echo "Parâmetro 1: $1"
echo "Parâmetro 2: $2"
echo "Parâmetro 3: $3"
echo "Parâmetro 3: $4"
echo "Quantidade de parâmetros: $#"
echo "Todos os parâmetros: $*"
echo "PID: $$"
```

<h4 id="condicionais"> Condicionais </h4>

* if

    ```
    if [ -e /etc/passwd ]
    then
        echo "Legal!"
    fi
    ```

    Um if também pode ser escrito em sua forma reduzida:

    ```
    [ -e /etc/passwd ] && echo "Legal!"
    ```

    Uma dica, você pode usar:
    ```
    help test
    ```
    numa shell do bash para olhar outros tipos de teste. Alternativamente, se você estiver em outra shell:
    ```
    man test
    ```

    Outras construções possíveis usando `if` são:

    ```
    if [ cond-e-verdadeira ]
    then
        comando1
        comando2
    else
        comando3
        comando4
    fi
    ```
    ou, utilizando `elif`:
    ```
    if [ cond-e-verdadeira ]
    then
        comando1
        comando2
    elif [ outra-cond-e-verdadeira ]
    then
        comando3
        comando4
    else
        comando5
    fi
    ```

    Aplicando isso num código real:

    ```
    #!/usr/bin/env bash

    HELP="
    HELP
    -h  help
    -a  all
    -l  l
    "

    if [[ "$1" = "-h" ]]; then
        echo "$HELP"
    fi

    if [[ "$1" = "-a" ]]; then
        ls -a
    fi

    if [[ "$1" = "-a" ]]; then
        ls -l
    fi
    ```

    Também é possível expressar  `ifs`  numa forma reduzida.

    ```
    [ "$1" = "-h" ] && echo "Forma reduzida"
    ```

* case

    Estrutura de um case:

    ```
    case "$VARIAVEL" in
        caso_1)
            # comandos
            ;;
        caso_2)
            # comandos
            ;;
        caso_k)
            # comandos
            ;;
    esac
    ```

    refatorando o exemplo anterior como um case:

    ```
    case "$1" in
        -h) echo "$HELP" && exit 0;;
        -a) ls -a && exit 0;;
        -l) ls -l && exit 0;;
        *) ls -a;;
    esac
    ```


<h4 id="loops"> Loops </h4>

* for

    Estrutura do for:

    ```
    for VAR_NAME in ITEM_1 ITEM_K
    do
        comando1
        comando2
        comandoN
    done
    ```

    exemplo 1:

    ```
    for COR in vermelho verde azul branco preto
    do
        echo $COR
    done
    ```

* while

    Estrutura do While

    ```
    while [ COND_VERDADEIRA ] 
    do
        comando1
        comando2
        comandoN
    done
    ```

<h4 id="flags"> Flags </h4>

<h4 id="shift"> Shift </h4>

<h4 id="funcoes"> Funções </h4>

Maneiras de se escrever uma função:
```
function nome-funcao() {
    # corpo
}
```
ou
```
nome-funcao() {
    # corpo
}
```

*obs*: Chamadas de função não necessitam de parênteses

```
function data() {
    echo "data: $(date +%a" "%D" "%r)"
}
data
```

*obs II*: É sempre bom declarar todas as funções primeiro, e depois chamá-las.

--------------------

## Exercício 1:

--------------------


## Parte 2:

<h4 id="debug"> Debug </h4>

* set -x
* function

<h4 id="coproc"> Coproc </h4>

<h4 id="status"> Status </h4>

Verifique os returnos dos seguintes comandos

```
true; echo $?
```
e
```
false; echo $?
```

Nos Unixes os códigos de saída dos programas estão entre 0 e 255 e são retornados quando um processo filho retorna controle ao pai. Outros números podem ser usados, porém eles serão computados módulo 256.

* 0 representa sucesso
* Qualquer coisa diferente de 0 denota algum erro
* O valor padrão da saída de um script é o valor retornado pelo último comando que foi executado

```
#!/usr/bin/env bash

TEST="8.8.8.8"

ping -q -c 1 -W 1 $TEST >/dev/null;

PING_STATUS=$?

if [ $PING_STATUS -eq 0 ]
then
  echo "IPv4 is up"
else
  echo "IPv4 is down"
fi
```

Uma forma mais reduzida de utilzar os status é através dos operadores lógicos `&&` e `||`, como mostram os exemplos a seguir:

Você também pode controlar diferentes tipos de saída pros seus scripts via o comando `exit`.

<h4 id="signals"> Signals </h4>

<h4 id="eval"> Eval </h4>

<h4 id="getopt"> Getopt </h4>

-------------

<h3 id="exercicio2"> Exercício 2</h3>

-------------

## Revisando

O que um (relativamente bom) shell script deve contem:

1. Shebang
2. Comentários (o que seu código faz exatamente?)
3. Variáveis Globais
4. Funções
    * Use variáveis locais dentro das funções
5. Resto do script
6. Status Codes

-------------

<h2 id="ref"> Referências </h2>

* [Shell Script Tutorial](https://www.shellscript.sh/index.html)
* [How do regular expressions differ from wildcards used to filter files](https://unix.stackexchange.com/questions/57957/how-do-regular-expressions-differ-from-wildcards-used-to-filter-files)