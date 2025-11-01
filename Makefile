CC = gcc
DEPS = buffer.h gui_ncs.h
OUT_DIR = ./build
I_DIR = ./includes
SRC_DIR = ./src/



project: ./src/main.c ./src/buffer.c ./src/gui_ncs.c ./includes/buffer.h ./includes/gui_ncs.h
	$(CC) -Wall $(SRC_DIR)main.c $(SRC_DIR)buffer.c $(SRC_DIR)gui_ncs.c -o ./build/project -lncurses


clean:
	rm project