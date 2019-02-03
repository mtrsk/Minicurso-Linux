# Controle de Processos

> A process represents a running program. It's an abstraction through which memory, processor time, and I/O resources can be managed and monitored.
>
> It is an Axiom of the UNIX philosophy that as much work as possible be done without the context of processes rather than being handled specially by the kernel. System and user processes follow the same rules, so you can use a single set of tools to control both.
>
> Fonte: [Unix and Linux System Administration Handbook](parte04.md)

##  Prática <a id="pratica"></a>

###  ps <a id="ps"></a>

```text
ps
  PID TTY          TIME CMD
 2186 pts/0    00:00:04 zsh
 9258 pts/0    00:00:00 ps
```

```text
ps -f
UID        PID  PPID  C STIME TTY          TIME CMD
usul      2186  2184  0 14:40 pts/0    00:00:05 /run/current-system/sw/bin/zsh
usul     10208  2186  0 18:28 pts/0    00:00:00 ps -f
```

```text
man ps
(...)
       This version of ps accepts several kinds of options:

       1   UNIX options, which may be grouped and must be preceded by a dash.
       2   BSD options, which may be grouped and must not be used with a dash.
       3   GNU long options, which are preceded by two dashes.
(...)
```

```text
ps -e
```

```text
ps -elf
```

```text
# BSD
ps aux
```

* a - all
* u - user
* x - mostra processos que não tenham tty associado

```text
ps -e --forest
```

* Dica: `pstree` é melhor

Na prática é melhor usar o comando `ps` com pipes e `grep`.

```text
ps -elf | grep sshd
```

ou se deseja saber qual processo roda com um determinado `pid`:

```text
ps -p1 -f
root         1     0  0 14:09 ?        00:00:01 systemd
```

###  pgrep <a id="pgrep"></a>

```text
pgrep sshd
918
```

```text
ps -F -p $(pgrep sshd)
UID        PID  PPID  C STIME TTY          TIME CMD
root       918     1  0 14:10 ?        00:00:00 (...)-openssh-7.9p1/bin/sshd -f /etc/ssh/sshd_config
```

###  kill <a id="kill"></a>

* Signals: Signals são interrupts a nível de processos.

  ```text
  kill -l
  ```

```text
kill -9 <pid>
```

###  killall <a id="killall"></a>

Mata um processo pelo nome.

```text
killall <nome>
```

###  pkill <a id="pkill"></a>

```text
sudo pkill -u foo
```

###  nice <a id="nice"></a>

A prioridade de um processo determina quanta memória ou tempo de CPU serão alocados para o mesmo. É possível modificar a prioridade de um processo usando os comandos `nice/unice`.

```text
ps -l
F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
0 S  1000  2186  2184  0  80   0 - 42692 -      pts/0    00:00:05 zsh
4 R  1000 10474  2186  0  80   0 - 39765 -      pts/0    00:00:00 ps
```

```text
sleep 10; echo "acabou"
C-Z
```

```text
bg
```

```text
fg
C-Z
```

```text
ps -elf| grep -v grep | grep sleep   
0 S usul     18347  2186  0  80   0 - 36193 -      21:07 pts/0    00:00:00 sleep 1000
```

```text
sudo renice -n 19 -p 18347
```

###  htop <a id="htop"></a>

###  strace <a id="strace"></a>

* `truss` no FreeBSD

```text
top
strace -p $(pgrep top)
```

* `truss` no FreeBSD

