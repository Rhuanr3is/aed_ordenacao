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
	# Limpa arquivos de execuções anteriores
	rm -rf *.gcda *.gcno *.gcov src/basics/*.gcda src/basics/*.gcno src/advanced/*.gcda src/advanced/*.gcno teste

	# Compila com as flags de cobertura
	gcc --coverage tests/test_basic.c $(BASICS) $(ADVANCED) -o teste

	# Executa o teste para gerar os dados (.gcda)
	./teste

	# Roda o gcov passando os arquivos fontes. Ele vai encontrar os arquivos teste-*.gcda na raiz automaticamente!
	gcov tests/test_basic.c $(BASICS) $(ADVANCED)

profile:
	$(CC) $(CFLAGS) -pg tests/test_basic.c $(BASICS) $(ADVANCED) -o teste.exe
	./teste.exe
	gprof teste.exe gmon.out > profile.txt

clean:
	rm -f *.exe *.gcda *.gcno *.gcov gmon.out profile.txt teste
	rm -f src/basics/*.gcda src/basics/*.gcno src/advanced/*.gcda src/advanced/*.gcno
