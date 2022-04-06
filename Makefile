main: src/main.cpp
	g++ -c src/main.cpp -o build/main.o
	g++ build/main.o -o bin/bitten-adventure -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio -Wall
macos: src/main.cpp
	g++ -c src/main.cpp -o build/*.o -I ~/homebrew/include
	g++ build/*.o -o bin/bitten-adventure -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio -Wall -L ~/homebrew/lib
run:
	bin/bitten-adventure.exe
run-unix: bin/bitten-adventure
	bin/bitten-adventure
makeandrun: src/main.cpp
	g++ -c src/main.cpp -o build/*.o
	g++ build/main.o -o bin/bitten-adventure -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio -lvorbis -Wall
	bin/bitten-adventure
windows-linux: src/main.cpp
	/usr/bin/x86_64-w64-mingw32-windres icon.rc -O coff -o build/icon.res
	/usr/bin/x86_64-w64-mingw32-windres bitten.rc -O coff -o build/bitten.res
	x86_64-w64-mingw32-g++ src/main.cpp -c -o build/*.o -I/usr/x86_64-w64-mingw32/SDL2-2.0.20/x86_64-w64-mingw32/include
	x86_64-w64-mingw32-g++ build/main.o build/bitten.res build/icon.res -o bin/bitten-adventure -L/usr/x86_64-w64-mingw32/SDL2-2.0.20/x86_64-w64-mingw32/lib -lSDL2main -lmingw32  -lSDL2_image -lSDL2 -Wall

#debug build windows
#OBJS specifies which files to compile as part of the project
OBJS = src/main.cpp

#OBJ_NAME specifies the name of our exectuable
OBJ_NAME = bin/lsdl2bitten

#This is the target that compiles our executable
windows : $(OBJS)
	g++ $(OBJS) -IC:\mingw_dev_lib\include\SDL2 -LC:\mingw_dev_lib\lib -w -Wl,-subsystem,windows -lmingw32 -lSDL2main -lSDL2_image -lSDL2 -o $(OBJ_NAME)