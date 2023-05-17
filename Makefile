.PHONY: all clean test

all:
	$(CC) -Wall -Wextra -pedantic -D_GNU_SOURCE -DRESTRICT_PROCESS_seccomp -nostartfiles -shared -fpic -fPIC \
		-fvisibility=hidden \
		-Wconversion -Wshadow \
		-Wpointer-arith -Wcast-qual \
		-Wstrict-prototypes -Wmissing-prototypes \
	 	-o libnoexec.so libnoexec.c restrict_process_seccomp.c -ldl \
	 	-Wl,-z,relro,-z,now -Wl,-z,noexecstack

clean:
	-@rm libnoexec.so

test:
	@env LD_LIBRARY_PATH=. bats test
