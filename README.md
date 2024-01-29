# pants-issue-20467

Reproduction of ![https://github.com/pantsbuild/pants/issues/20467](https://github.com/pantsbuild/pants/issues/20467)

## Building
```
docker build -t pants-issue-20467 .
```

## running

1. Enter container 
```
docker run --rm -it pants-issue-20467
```

2. Generate Lockfiles
```
pants generate-lockfiles ::
```