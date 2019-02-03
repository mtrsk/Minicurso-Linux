# Hard & Soft links, Permissões

## Hard Links

Compartilham o mesmo inode

## Soft Links

## Permissões

#### Modo Octal

| Octal | r | w | x |
| :--- | :--- | :--- | :--- |
|  | 4 | 2 | 1 |
| 2^x | 2 | 1 | 0 |

```text
1       ->        x
2       ->        w
3   -> 2 + 1 ->   wx
4       ->        r
5   -> 4 + 1 ->   rx
6   -> 4 + 2 ->   rw
7 -> 4 + 2 + 1->  rwx
```

### chmod

### chgrp

### umask

