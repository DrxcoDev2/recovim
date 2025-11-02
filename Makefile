CC = gcc
CFLAGS = -Wall -I$(I_DIR)
OUT_DIR = ./build
I_DIR = ./includes
SRC_DIR = ./src
TEST_DIR = ./tests

SRCS = $(SRC_DIR)/main.c $(SRC_DIR)/buffer.c $(SRC_DIR)/gui_ncs.c $(SRC_DIR)/alloc.c
OBJS = $(SRCS:.c=.o)
TARGET = $(OUT_DIR)/project

TEST_SRCS = $(wildcard $(TEST_DIR)/*.c)
TEST_BINS = $(TEST_SRCS:$(TEST_DIR)/%.c=$(OUT_DIR)/test_%)

# ------------------------------------------
# 📦 BUILD PRINCIPAL
# ------------------------------------------
project: $(SRCS)
	@mkdir -p $(OUT_DIR)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET) -lncurses
	@echo "✅ Proyecto compilado: $(TARGET)"

# ------------------------------------------
# 🧪 COMPILAR TESTS INDIVIDUALES
# Cada .c en tests/ genera un binario en build/
# ------------------------------------------
tests: $(TEST_BINS)
	@echo "✅ Todos los tests compilados en $(OUT_DIR)/"

$(OUT_DIR)/test_%: $(TEST_DIR)/%.c $(SRC_DIR)/alloc.c $(I_DIR)/alloc.h
	@mkdir -p $(OUT_DIR)
	$(CC) $(CFLAGS) $< $(SRC_DIR)/alloc.c -o $@
	@echo "🧩 Compilado test: $@"

# ------------------------------------------
# 🧫 EJECUTAR TODOS LOS TESTS
# ------------------------------------------
run-tests: tests
	@echo "🚀 Ejecutando tests..."
	@for t in $(TEST_BINS); do \
		echo "▶️ Ejecutando $$t"; \
		$$t || exit 1; \
	done
	@echo "✅ Todos los tests pasaron correctamente."

# ------------------------------------------
# 🧹 LIMPIAR COMPILADOS
# ------------------------------------------
clean:
	rm -f $(SRC_DIR)/*.o $(OUT_DIR)/project $(OUT_DIR)/test_* 
	@echo "🧹 Limpieza completa."
