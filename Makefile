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
	# 1. Limpa absolutamente tudo antes de começar
	rm -f teste
	find . -name "*.gcda" -delete
	find . -name "*.gcno" -delete
	find . -name "*.gcov" -delete

	# 2. Compila com as flags de cobertura
	gcc --coverage tests/test_basic.c $(BASICS) $(ADVANCED) -o teste

	# 3. Executa o teste para gerar os dados de cobertura
	./teste

	# 4. Entra em cada diretório para gerar os relatórios .gcov locais
	gcov -o . tests/test_basic.c
	cd src/basics && gcov -o . *.c
	cd src/advanced && gcov -o . *.c

	# 5. Move todos os relatórios .gcov gerados para a raiz para facilitar sua leitura
	mv src/basics/*.gcov src/advanced/*.gcov ./ 2>/dev/null || true

profile:
	$(CC) $(CFLAGS) -pg tests/test_basic.c $(BASICS) $(ADVANCED) -o teste.exe
	./teste.exe
	gprof teste.exe gmon.out > profile.txt

clean:
	rm -f *.exe *.gcda *.gcno *.gcov gmon.out profile.txt teste
	rm -f src/basics/*.gcda src/basics/*.gcno src/advanced/*.gcda src/advanced/*.gcno
