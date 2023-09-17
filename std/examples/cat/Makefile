SRC_DIR=.
OUT_DIR=target
OUT_NAME=cat.out
OBJ_DIR=$(OUT_DIR)/obj

STD_LIB_LOCATION=../../target
STD_LIB_NAME=stdlib.a
STD_LIB=$(STD_LIB_LOCATION)/$(STD_LIB_NAME)

ASM=nasm
ASM_FLAGS=-felf32
LINK=ld
LINK_FLAGS=-melf_i386 -L$(STD_LIB_LOCATION)
LINK_LIBS=-l:$(STD_LIB_NAME)

OBJ_FILES=$(patsubst %.asm,$(OBJ_DIR)/%.o, $(wildcard *.asm))

default: pre_build build $(STD_LIB) link

.PHONY:pre_build
pre_build:
	mkdir -p $(OBJ_DIR)

.PHONY: build
build: $(OBJ_FILES)

$(OBJ_DIR)/%.o: %.asm
	$(ASM) $(ASM_FLAGS) -o $@ $^

.PHONY: link
link: $(OBJ_FILES)
	$(LINK) $(LINK_FLAGS) -o $(OUT_DIR)/$(OUT_NAME) $^ $(LINK_LIBS)

$(STD_LIB):
	make -C ../../

.PHONY: clean
clean:
	rm -rf $(OUT_DIR)
