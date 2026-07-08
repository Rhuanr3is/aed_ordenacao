CC = gcc
CFLAGS = -Wall -Wextra --coverage

BASICS = src/basics/bubble.c \
         src/basics/selection.c \
         src/basics/insertion.c

ADVANCED = src/advanced/merge.c \
           src/advanced/quick.c \
           src/advanced/heap.c

# Transforma a lista de .c em uma lista de .o correspondente
OBJS = tests/test_basic.o \
       src/basics/bubble.o \
       src/basics/selection.o \
       src/basics/insertion.o \
       src/advanced/merge.o \
       src/advanced/quick.o \
       src/advanced/heap.o

all:
	$(CC) -Wall -Wextra src/main.c src/basics/*.c src/advanced/*.c -o programa.exe

coverage:
	# 1. Limpa tudo antes de começar
	rm -f teste
	find . -name "*.gcda" -delete -o -name "*.gcno" -delete -o -name "*.gcov" -delete -o -name "*.o" -delete

	# 2. Compila cada arquivo individualmente gerando os objetos e notas locais
	$(CC) $(CFLAGS) -c tests/test_basic.c -o tests/test_basic.o
	$(CC) $(CFLAGS) -c src/basics/bubble.c -o src/basics/bubble.o
	$(CC) $(CFLAGS) -c src/basics/selection.c -o src/basics/selection.o
	$(CC) $(CFLAGS) -c src/basics/insertion.c -o src/basics/insertion.o
	$(CC) $(CFLAGS) -c src/advanced/merge.c -o src/advanced/merge.o
	$(CC) $(CFLAGS) -c src/advanced/quick.c -o src/advanced/quick.o
	$(CC) $(CFLAGS) -c src/advanced/heap.c -o src/advanced/heap.o

	# 3. Linka todos os objetos no executável final
	$(CC) $(CFLAGS) $(OBJS) -o teste

	# 4. Executa o teste para gerar os dados de cobertura (.gcda)
	./teste

	# 5. Roda o gcov cirurgicamente dentro de cada diretório
	gcov -o tests/ tests/test_basic.c
	gcov -o src/basics/ src/basics/*.c
	gcov -o src/advanced/ src/advanced/*.c

	# 6. Recolhe todos os relatórios .gcov para a raiz do seu projeto
	mv tests/*.gcov src/basics/*.gcov src/advanced/*.gcov ./ 2>/dev/null || true

profile: clean
	# 1. Compila cada arquivo individualmente com a flag -pg
	gcc -Wall -Wextra -pg -c tests/test_basic.c -o tests/test_basic.o
	gcc -Wall -Wextra -pg -c src/basics/bubble.c -o src/basics/bubble.o
	gcc -Wall -Wextra -pg -c src/basics/selection.c -o src/basics/selection.o
	gcc -Wall -Wextra -pg -c src/basics/insertion.c -o src/basics/insertion.o
	gcc -Wall -Wextra -pg -c src/advanced/merge.c -o src/advanced/merge.o
	gcc -Wall -Wextra -pg -c src/advanced/quick.c -o src/advanced/quick.o
	gcc -Wall -Wextra -pg -c src/advanced/heap.c -o src/advanced/heap.o

	# 2. Linka os objetos gerando o executável sort_profile
	gcc -Wall -Wextra -pg tests/test_basic.o src/basics/bubble.o src/basics/selection.o src/basics/insertion.o src/advanced/merge.o src/advanced/quick.o src/advanced/heap.o -o sort_profile

	# 3. Executa para gerar o gmon.out
	./sort_profile

	# 4. Garante que a pasta docs existe e gera o relatório lá dentro
	mkdir -p docs
	gprof sort_profile gmon.out > docs/perfil_bruto.txt

	# 5. Mensagens de sucesso idênticas ao seu exemplo
	@echo "✅ Profiling gerado em docs/perfil_bruto.txt"
	@echo "💡 Abra o arquivo e analise a seção 'Flat Profile'"

clean:
	rm -f *.exe *.gcda *.gcno *.gcov gmon.out profile.txt teste
	find . -name "*.gcda" -delete -o -name "*.gcno" -delete -o -name "*.gcov" -delete -o -name "*.o" -delete
