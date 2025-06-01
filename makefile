# Makefile pour projet compilation
# Étudiant: KEBBAS Chiheb Eddine

all: test

clean:
    rm -f *.o *.s compilateur tokeniser.cpp

tokeniser.cpp: tokeniser.l
    flex++ -d -otokeniser.cpp tokeniser.l

compilateur: compilateur.cpp tokeniser.o
    g++ -ggdb -o compilateur compilateur.cpp tokeniser.o

test.s: compilateur test.p
    ./compilateur < test.p > test.s

test: test.s
    gcc -ggdb -no-pie -fno-pie test.s -o test