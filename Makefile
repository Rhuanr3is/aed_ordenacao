CC = gcc

CFLAGS = -Wall -Wextra

BASICS = src/basics/bubble.c \
         src/basics/selection.c \
         src/basics/insertion.c

ADVANCED = src/advanced/merge.c \
           src/advanced/quick.c \
           src/advanced/heap.c

all:
	$(CC) $(CFLAGS) src/main.c $(BASICS) $(ADVANCED) -o programa.exe

test:
	$(CC) $(CFLAGS) tests/test_basic.c $(BASICS) $(ADVANCED) -o teste.exe

coverage:
	$(CC) $(CFLAGS) --coverage tests/test_basic.c $(BASICS) $(ADVANCED) -o teste.exe
	./teste.exe
	gcov tests/test_basic.c

profile:
	$(CC) $(CFLAGS) -pg tests/test_basic.c $(BASICS) $(ADVANCED) -o teste.exe
	./teste.exe
	gprof teste.exe gmon.out > profile.txt

clean:
	rm -f *.exe *.gcda *.gcno *.gcov gmon.out profile.txt