CXXFLAGS=-std=c++14
CLANGFLAGS=-O3 -ffast-math -flto -fuse-ld=lld -std=c++14 -fdiagnostics-color=always -Weverything -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-c++11-compat -Wno-c++11-compat-pedantic

main: main.o funcs.o
		g++ -o main main.o funcs.o

main.o: main.cpp funcs.h
		g++ $(CXXFLAGS) -c main.cpp

funcs.o: funcs.cpp funcs.h
		g++ $(CXXFLAGS) -c funcs.cpp
clean:
		rm -f main.o funcs.o tests.o


tests: tests.o funcs.o
		g++ -o tests tests.o funcs.o

tests.o: tests.cpp funcs.h


clang: mainclang.o funcsclang.o
		clang++-6.0 $(CLANGFLAGS) -o main main.o funcs.o

mainclang.o: main.cpp funcs.h
		clang++-6.0 $(CLANGFLAGS) -c main.cpp

funcsclang.o: funcs.cpp funcs.h
		clang++-6.0 $(CLANGFLAGS) -c funcs.cpp