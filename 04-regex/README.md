# Regex

![Common Patterns](common-patterns.png)

```
echo '1 é um numero' | sed 's/1/um/'
```

```
echo '1 é um numero, 1 é ímpar' | sed 's/1/um/g'
```

## Metacaracteres

```
echo 'Olar  Mundo' | sed 's/O..r/Hello/'
```

## Quantificadores

* ? - 0 ou 1
* \* - 0 ou mais
* \+ - 1 ou mais

```
echo 'cooooooooooooooool' | sed 's/o\+/ºº/g' 
```

```
echo 'cooooooooooooooool, very cool' | sed -r 's/o{3,}/ºº/g'
```
