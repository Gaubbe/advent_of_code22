# Programs and flags
ASM=nasm
ASM_FLAGS=-felf32
AR=ar
AR_FLAGS=rcs

# Directories and filenames
OUT_DIR=target
OBJ_DIR=$(OUT_DIR)/obj
TARGET_NAME=$(OUT_DIR)/stdlib.a

# Internal variables (DO NOT MODIFY)
REQUIRED_OBJ_FILES=$(patsubst %.asm,$(OBJ_DIR)/%.o, $(wildcard *.asm))

default: pre_build build archive

archive: $(TARGET_NAME)

$(TARGET_NAME): $(REQUIRED_OBJ_FILES)
	$(AR) $(AR_FLAGS) $@ $^

build: $(REQUIRED_OBJ_FILES)

$(OBJ_DIR)/%.o: %.asm
	$(ASM) $(ASM_FLAGS) $< -o $@

pre_build:
	mkdir -p $(OBJ_DIR)

.PHONY: clean
clean:
	rm -rf $(OUT_DIR)
