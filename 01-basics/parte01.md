# Primeiros Passos

## Primeiros Passos

### pwd

### echo

O comando shell parece ser bem besta, mas já vamos aproveitar e usá-lo pra aprender algo legal.

```text
echo $SHELL
```

e

```text
echo $TERM
```

O valor guardado em `$SHELL` denota sua shell atual, enquanto o valor de `$TERM` é seu **emulador** de terminal.

A shell é um programa que gera outros programas, ela também interpreta comandos fornecidos pelo usuário \(que digita esses comandos em algum emulador de terminal\).

| ![Crian&#xE7;as dos anos 80 v&#xE3;o lembrar disso](../.gitbook/assets/terminal.jpg) |
| :---: |
| _Um terminal de verdade_ |

Para checar a origem dos nomes `shell` e `terminal` consulte as referências.

### cd

* `.` : Diretório atual
* `..` :  Diretório parente
* `~` : /home/usuario

### ls

```text
ls
```

```text
ls -a
```

```text
ls -l
```

### mkdir

```text
mkdir
```

```text
mkdir -p
```

### cp

* -r

### mv

### cat

* -n
* -b
* -s
* -A

```text
cat /etc/passwd
```

### head

* -n
* -c

### tail

* -n
* -c
* -f

### less

### wc

```text
wc /etc/passwd
wc -l /etc/passwd
```

### tr

* -d

### sort

* -r
* -k

### uniq

* -d
* -c

### cut

* -c
* -b
* -f
* -d

```text
cut -d: -f7 /etc/passwd | sort | uniq -c
```

## man

Basicamente é o comando mais importante que você aprenderá nesse curso inteiro!

```text
man man
```

#### Referências

* [UNIX Inodes and Files \(Harry\)](https://www.youtube.com/watch?v=3P8n1uC0tyI)
* [Origem do nome 'Shell'](https://unix.stackexchange.com/a/14939/117072)
* [Origem do nome 'Shell' \(Wikipedia\)](https://en.wikipedia.org/wiki/Thompson_shell#History)
* [What is the exact difference between a 'terminal', a 'shell', a 'tty' and a 'console'?](https://unix.stackexchange.com/questions/4126/what-is-the-exact-difference-between-a-terminal-a-shell-a-tty-and-a-con)

