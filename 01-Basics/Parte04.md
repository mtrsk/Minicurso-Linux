# Controle de Processos

> A process represents a running program. It's an abstraction through which memory, processor time, and I/O resources can be managed and monitored.
>
> It is an Axiom of the UNIX philosophy that as much work as possible be done without the context of processes rather than being handled specially by the kernel. System and user processes follow the same rules, so you can use a single set of tools to control both.
> 
> Fonte: [Unix and Linux System Administration Handbook]()


<h2 id="pratica"> Prática </h2>

<h4 id="ps"> ps </h4>

```
ps
  PID TTY          TIME CMD
 2186 pts/0    00:00:04 zsh
 9258 pts/0    00:00:00 ps
```

```
ps -f
UID        PID  PPID  C STIME TTY          TIME CMD
usul      2186  2184  0 14:40 pts/0    00:00:05 /run/current-system/sw/bin/zsh
usul     10208  2186  0 18:28 pts/0    00:00:00 ps -f
```

```
man ps
(...)
       This version of ps accepts several kinds of options:

       1   UNIX options, which may be grouped and must be preceded by a dash.
       2   BSD options, which may be grouped and must not be used with a dash.
       3   GNU long options, which are preceded by two dashes.
(...)
```

```
ps -e
```

```
ps -elf
```

```
# BSD
ps aux
```

* a - all
* u - user
* x - mostra processos que não tenham tty associado

```
ps -e --forest
```

* Dica: `pstree` é melhor

Na prática é melhor usar o comando `ps` com pipes e `grep`.

```
ps -elf | grep sshd
```

ou se deseja saber qual processo roda com um determinado `pid`:

```
ps -p1 -f
root         1     0  0 14:09 ?        00:00:01 systemd
```

<h4 id="pgrep"> pgrep </h4>

```
pgrep sshd
918
```

```
ps -F -p $(pgrep sshd)
UID        PID  PPID  C STIME TTY          TIME CMD
root       918     1  0 14:10 ?        00:00:00 (...)-openssh-7.9p1/bin/sshd -f /etc/ssh/sshd_config
```

<h4 id="kill"> kill </h4>

* Signals: Signals são interrupts a nível de processos.
```
kill -l
```

```
kill -9 <pid>
```

<h4 id="killall"> killall </h4>

Mata um processo pelo nome.

```
killall <nome>
```

<h4 id="pkill"> pkill </h4>

```
sudo pkill -u foo
```

<h4 id="nice"> nice </h4>

A prioridade de um processo determina quanta memória ou tempo de CPU serão alocados para o mesmo. É possível modificar a prioridade de um processo usando os comandos `nice/unice`.

```
ps -l
F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
0 S  1000  2186  2184  0  80   0 - 42692 -      pts/0    00:00:05 zsh
4 R  1000 10474  2186  0  80   0 - 39765 -      pts/0    00:00:00 ps
```

```
sleep 10; echo "acabou"
C-Z
```

```
bg
```

```
fg
C-Z
```

```
ps -elf| grep -v grep | grep sleep   
0 S usul     18347  2186  0  80   0 - 36193 -      21:07 pts/0    00:00:00 sleep 1000
```

```
sudo renice -n 19 -p 18347
```

<h4 id="htop"> htop </h4>

<h4 id="strace"> strace </h4>

* `truss` no FreeBSD

```
top
strace -p $(pgrep top)
```

* `truss` no FreeBSD