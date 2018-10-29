CC=gcc
CFLAGS=-Wall -fPIC -I/usr/include/libxml2 -shared
ifeq ($(shell uname),Darwin)
LDFLAGS=-lxml2 -undefined suppress -flat_namespace
else
LDFLAGS=-lxml2
endif

all: 
	$(CC) $(CFLAGS) -o luaxml2.so src/luaxml2.c $(LDFLAGS) 

install:
	cp luaxml2.so /usr/local/lib/lua/5.1/

clean:
	rm -f luaxml2.so
