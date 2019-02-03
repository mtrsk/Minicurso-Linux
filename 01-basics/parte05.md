# Dispositivos e Filesystems

##  FHS - Filesystem Hierarchy Standart <a id="fhs"></a>

![Filesystem Hierarchy Standart](../.gitbook/assets/fhs.png)

> The filesystem can be though as of comprising four main components:
>
> * A namespace - a way to name things and organize them in a hierarchy
> * An API - a set of system calls for navigating and manipulating objects
> * Security models - Schemes for protecting, hiding and sharing things
> * An implementation - software to tie logical model to the hardware
>
> Fonte: [Unix and Linux System Administration Handbook](parte05.md)

* bin/sbin/usr
* boot

  ```text
    ls /boot
  ```

* dev Possui arquivos especiais que representam os dispotivos do computador como arquivos
  * /dev/null
  * /dev/urandom

    ```text
    od -d
    ```
* etc Possui arquivos de configuração do sistema
  * fstab
  * profile
  * group
  * services
  * passwd
  * hostname
  * shadow & gshadow
  * login.defs
  * sudoers
* proc

  ```text
    cd /proc
    ls
  ```

  Podemos notar que alguns diretórios não nomeados apenas com números, esses números são `PIDs` de processos. Vamos investigar um deles:

  ```text
    cd <PID>
    ls -l cwd
    ls -l exe
  ```

  Esse diretório contém outras informações interessantes como:

  * Load Average:

    ```text
      cat loadavg
      0.56 0.50 0.36 1/520 12446
    ```

    | 1 min | 5 min | 15 min | \*ref | Ultimo PID |
    | :--- | :--- | :--- | :--- | :--- |
    | 0.56 | 0.50 | 0.36 | 1/520 | 12446 |

  * IRQ: Interrupt Requests

    ```text
      watch -n 1 cat /proc/interrupts
    ```

* sys Estruturas de dados do kernel que estão guardadas na memória

  ```text
    cat /sys/class/net/enp7s0/address
  ```

##  Prática <a id="pratica"></a>

###  lsblk - List Block Devices <a id="lsblk"></a>

```text
lsblk -f
NAME   FSTYPE   LABEL       UUID                                 MOUNTPOINT
sda
├─sda1 vfat                 C4DA-2C4D                            /boot
├─sda2 swap                 5b1564b2-2e2c-452c-bcfa-d1f572ae99f2 [SWAP]
└─sda3 ext4                 56adc99b-a61e-46af-aab7-a6d07e504652 /
```

###  blkid - Block ID <a id="lsblk"></a>

> **uuid = Universal Unique Id**

###  findmnt <a id="findmnt"></a>

###  fsck - File System Check <a id="fsck"></a>

Verifica a consistência do seu filesystem.

###  mount/umount <a id="mount-umount"></a>

###  df <a id="df"></a>

Reporta o uso de disco

```text
df -h /
```

###  du <a id="du"></a>

Estima o uso de disco para cada arquivo

```text
du -sh /home/ | sort -h
```

###  fuser <a id="fuser"></a>

```text
fuser -c /usr/home
```

###  stat <a id="stat"></a>

## Referências

* [/proc](https://linux.die.net/man/5/proc)

