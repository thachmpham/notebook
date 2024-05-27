Run a specific testcase
```sh
$ cd ~/repo/binutils-gdb/gdb/testsuite
$ runtest -v --directory gdb.base add-symbol-file-attach.exp

$ runtest -v --directory gdb.base add-symbol-file-attach.exp GDB=/usr/bin/gdb
```