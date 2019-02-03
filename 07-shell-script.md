# Shell Scripting

## Sumário

1. [O que é um Shell Script](07-shell-script.md#intro-shell)
2. [Estrutura de um Shell Script](07-shell-script.md#estrutura-shell)
3. [Prática](07-shell-script.md#pratica1)
   * [Echo](07-shell-script.md#echo)
   * [Parâmetros](07-shell-script.md#parametros)
   * [Condicionais](07-shell-script.md#condicionais)
   * [Loops](07-shell-script.md#loops)
   * [Flags](07-shell-script.md#flags)
   * [Shift](07-shell-script.md#shift)
   * [Funções](07-shell-script.md#funcoes)
4. [Exercício 1](07-shell-script.md#exercicio1)
5. [Tópicos adicionais](07-shell-script.md#pratica2)
   * [Debug](07-shell-script.md#debug)
   * [Status](07-shell-script.md#status)
   * [Coproc](07-shell-script.md#coproc)
   * [Eval](07-shell-script.md#eval)
   * [Getopt](07-shell-script.md#getopt)
6. [Exercício 2](07-shell-script.md#exercicio2)
7. [Referências](07-shell-script.md#ref)

###  O que é um Shell Script? <a id="intro-shell"></a>

* Um script é uma sequência de comandos
* Um interpretador é um programa que interpreta e executa comandos 

Todos os comandos que aprendemos anteriormente podem ser colocados em arquivos, serem rodados como scripts que serão interpretados por alguma shell. Você pode estar se perguntando por que alguém faria isso e a resposta é bem simples:

* Automatizar tarefas chatas

###  A estrutura de um Shell Script <a id="estrutura-shell"></a>

* Shebang \(\#!\): Denota qual shell você pretende usar
  * csh

    ```text
    #!/usr/bin/csh
    ```

  * ksh

    ```text
    #!/usr/bin/ksh
    ```

  * tsh

    ```text
    #!/usr/bin/tsh
    ```

  * zsh

    ```text
    #!/usr/bin/zsh
    ```

Por padrão se você não especifica a shebang no começo do arquivo, o script é executado na sua shell atual. Ser explícito é sempre uma boa prática de programação, então vamos adotar como padrão no curso o Bash como shell:

```text
#!/usr/bin/bash
```

Uma motivação extra é que não precisamos nos limitar apenas à shell, o seguinte script é válido, por exemplo:

```text
#!/usr/bin/python

print("Hello")
```

Um primeiro script para servir de exemplo, sobre como declarar e usar variáveis junto de comandos normais da shell. Será que isso vai rodar?

```text
#!/usr/bin/env bash

SERVER_NAME=$(hostname)

echo "$SERVER_NAME"
```

Peraí, não acabamos de ver que os scripts tem que ser declarados com `#!/usr/bin/bash`? Qual diferença entre esses dois?

###  Prática <a id="pratica1"></a>

####  Echo <a id="echo"></a>

```text
#!/usr/bin/env bash

echo Hello, world!
echo "Hello, World!"
echo "Hello,
    World!"
```

####  Parametros <a id="parametros"></a>

```text
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

####  Condicionais <a id="condicionais"></a>

* if

  ```text
    if [ -e /etc/passwd ]
    then
        echo "Legal!"
    fi
  ```

  Um if também pode ser escrito em sua forma reduzida:

  ```text
    [ -e /etc/passwd ] && echo "Legal!"
  ```

  Uma dica, você pode usar:

  ```text
    help test
  ```

  numa shell do bash para olhar outros tipos de teste. Alternativamente, se você estiver em outra shell:

  ```text
    man test
  ```

  Outras construções possíveis usando `if` são:

  ```text
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

  ```text
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

  ```text
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

  Também é possível expressar `ifs` numa forma reduzida.

  ```text
    [ "$1" = "-h" ] && echo "Forma reduzida"
  ```

* case

  Estrutura de um case:

  ```text
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

  ```text
    case "$1" in
        -h) echo "$HELP" && exit 0;;
        -a) ls -a && exit 0;;
        -l) ls -l && exit 0;;
        *) ls -a;;
    esac
  ```

####  Loops <a id="loops"></a>

* for

  Estrutura do for:

  ```text
    for VAR_NAME in ITEM_1 ITEM_K
    do
        comando1
        comando2
        comandoN
    done
  ```

  exemplo 1:

  ```text
    for COR in vermelho verde azul branco preto
    do
        echo $COR
    done
  ```

* while

  Estrutura do While

  ```text
    while [ COND_VERDADEIRA ] 
    do
        comando1
        comando2
        comandoN
    done
  ```

####  Flags <a id="flags"></a>

####  Shift <a id="shift"></a>

####  Funções <a id="funcoes"></a>

Maneiras de se escrever uma função:

```text
function nome-funcao() {
    # corpo
}
```

ou

```text
nome-funcao() {
    # corpo
}
```

_obs_: Chamadas de função não necessitam de parênteses

```text
function data() {
    echo "data: $(date +%a" "%D" "%r)"
}
data
```

_obs II_: É sempre bom declarar todas as funções primeiro, e depois chamá-las.

## Exercício 1:

## Parte 2:

####  Debug <a id="debug"></a>

* set -x
* function

####  Coproc <a id="coproc"></a>

####  Status <a id="status"></a>

Verifique os returnos dos seguintes comandos

```text
true; echo $?
```

e

```text
false; echo $?
```

Nos Unixes os códigos de saída dos programas estão entre 0 e 255 e são retornados quando um processo filho retorna controle ao pai. Outros números podem ser usados, porém eles serão computados módulo 256.

* 0 representa sucesso
* Qualquer coisa diferente de 0 denota algum erro
* O valor padrão da saída de um script é o valor retornado pelo último comando que foi executado

```text
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

####  Signals <a id="signals"></a>

####  Eval <a id="eval"></a>

####  Getopt <a id="getopt"></a>

###  Exercício 2 <a id="exercicio2"></a>

## Revisando

O que um \(relativamente bom\) shell script deve contem:

1. Shebang
2. Comentários \(o que seu código faz exatamente?\)
3. Variáveis Globais
4. Funções
   * Use variáveis locais dentro das funções
5. Resto do script
6. Status Codes

##  Referências <a id="ref"></a>

* [Shell Script Tutorial](https://www.shellscript.sh/index.html)
* [How do regular expressions differ from wildcards used to filter files](https://unix.stackexchange.com/questions/57957/how-do-regular-expressions-differ-from-wildcards-used-to-filter-files)

