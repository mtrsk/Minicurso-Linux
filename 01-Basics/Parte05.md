# Dispositivos e Filesystems

<h2 id="fhs"> FHS - Filesystem Hierarchy Standart </h2>

| ![Filesystem Hierarchy Standart](fhs.png) |
|:--:| 

* proc

    ```
    cd /proc
    ls
    ```

    Podemos notar que alguns diretórios não nomeados apenas com números, esses números são `PIDs` de processos. Vamos investigar um deles:

    ```
    cd <PID>
    ls -l cwd
    ls -l exe
    ```

    Esse diretório contém outras informações interessantes como:

    - Load Average:
        ```
        cat loadavg
        0.56 0.50 0.36 1/520 12446
        ```
        | 1 min  | 5 min  | 15 min  | *ref  | Ultimo PID  |
        |---|---|---|---|---|
        | 0.56  | 0.50  | 0.36  | 1/520  | 12446  |

    - IRQ: Interrupt Requests

        ```
        watch -n 1 cat /proc/interrupts
        ```

<h2 id="pratica"> Prática </h2>

<h4 id="lsblk"> lsblk - List Block Devices </h4>

```
lsblk -f
NAME   FSTYPE   LABEL       UUID                                 MOUNTPOINT
sda
├─sda1 vfat                 C4DA-2C4D                            /boot
├─sda2 swap                 5b1564b2-2e2c-452c-bcfa-d1f572ae99f2 [SWAP]
└─sda3 ext4                 56adc99b-a61e-46af-aab7-a6d07e504652 /
```

<h4 id="lsblk"> blkid - Block ID </h4>

> **uuid = Universal Unique Id**

<h4 id="fsck"> fsck - File System Check</h4>

Verifica a consistência do seu filesystem.

<h4 id="mount-umount"> mount/umount </h4>

<h4 id="df"> df </h4>

Reporta o uso de disco

```
df -h /
```

<h4 id="du"> du </h4>

Estima o uso de disco para cada arquivo


## Referências

* [/proc](https://linux.die.net/man/5/proc)

