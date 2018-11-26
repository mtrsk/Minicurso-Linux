# O que é o Systemd?

System & Service Manager

* System
    * Inicialização do Sistema
    * Power State da máquina: up, down, hybrid, etc.
* Service Manager
    * Gerenciamento de deamons no user-space
    * Gerenciamento de `units`: devices, deamons, sockets, d-bus, etc.

A maioria das distribuições mainstream usam (Debian, Ubuntu, Fedora...), por isso decidi abordar. 

## Detalhe:

O Systemd viola vários principios de simplicidade do Unix que nós temos discutido desde o começo do mini-curso.

-----------------------

### Tutorial

```
systemctl list-units --type=timer
```

```
systemctl list-units --type=service   
```

```
systemctl status cron.service
```

```
systemctl list-unit-files --type=service   
```

```
journalctl
```