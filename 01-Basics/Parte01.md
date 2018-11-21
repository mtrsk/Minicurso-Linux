# Primeiros Passos

## pwd

## echo

O comando shell parece ser bem besta, mas já vamos aproveitar e usá-lo pra aprender algo legal.

```
echo $SHELL
```
e
```
echo $TERM
```

O valor guardado em `$SHELL` denota sua shell atual, enquanto o valor de `$TERM` é seu **emulador** de terminal.

A shell é um programa que gera outros programas, ela também interpreta comandos fornecidos pelo usuário (que digita esses comandos em algum emulador de terminal).

| ![Crianças dos anos 80 vão lembrar disso](terminal.jpg) |
|:--:| 
| *Um terminal de verdade* |

Para checar a origem dos nomes `shell` e `terminal` consulte as referências.

## cd

* `.` : Diretório atual
* `..` :  Diretório parente
* `~` : /home/usuario

## ls

```
ls
```

```
ls -a
```

```
ls -l
```

## mkdir

```
mkdir
```

```
mkdir -p
```

## cp

* -r

## mv

## cat

* -n
* -b
* -s
* -A

```
cat /etc/passwd
```

## head

* -n
* -c

## tail

* -n
* -c
* -f

## less

## wc

## sort

* -r
* -k

## uniq

* -d
* -c

## tr

* -d

## cut

* -c
* -b
* -f
* -d

---------

# man

Basicamente é o comando mais importante que você aprenderá nesse curso inteiro! 

```
man man
```

### Referências

* [UNIX Inodes and Files (Harry)](https://www.youtube.com/watch?v=3P8n1uC0tyI)
* [Origem do nome 'Shell'](https://unix.stackexchange.com/a/14939/117072)
* [Origem do nome 'Shell' (Wikipedia)](https://en.wikipedia.org/wiki/Thompson_shell#History)
* [What is the exact difference between a 'terminal', a 'shell', a 'tty' and a 'console'?](https://unix.stackexchange.com/questions/4126/what-is-the-exact-difference-between-a-terminal-a-shell-a-tty-and-a-con)