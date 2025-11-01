CC = gcc
DEPS = buffer.h gui_ncs.h
OUT_DIR = ./build



project: main.c buffer.c gui_ncs.c buffer.h gui_ncs.h
	$(CC) -Wall main.c buffer.c gui_ncs.c -o ./build/project -lncurses


clean:
	rm project