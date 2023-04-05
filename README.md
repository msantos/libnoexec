# libnoexec

libnoexec: disable exec(3) for dynamically linked executables

# DESCRIPTION

libnoexec prevents dynamically linked executables from calling exec(3).

# EXAMPLES

```
$ LD_PRELOAD=libnoexec.so sh -c "ls"
sh: 1: ls: Permission denied

# echo is a shell builtin
$ LD_PRELOAD=libnoexec.so sh -c "echo test"
test
```

# ENVIRONMENT VARIABLES

None.
