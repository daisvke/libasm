NAME		= libasm.a
TEST_NAME	= test

ASM			= nasm $(ASFLAGS)
ASFLAGS		= -f elf64

LD			= ld
LIB			= ar rcs 

CC			= clang $(CFLAGS)
CFLAGS		= -g3 -Wall -Wextra -Werror

SRCS_DIR	= srcs/
SRCS_FILES	=	ft_strlen.s	\
				ft_strcpy.s	\
				ft_strcmp.s	\
				ft_write.s	\
				ft_read.s	\
				ft_strdup.s
SRCS		= $(addprefix $(SRCS_DIR), $(SRCS_FILES))

OBJS_DIR	= objs/
OBJS_FILES	= $(SRCS_FILES:.s=.o)
OBJS		= $(addprefix $(OBJS_DIR), $(OBJS_FILES))

MAIN_OBJ	= objs/main.o
HEADER		= libasm.h

.PHONY: all astest ctest clean fclean re

all: $(NAME)

$(NAME): $(OBJS)
	$(LIB) $(NAME) $(OBJS)
	@echo "\033[32mGenerated library!\033[0m"

$(OBJS_DIR)%.o: $(SRCS_DIR)%.s
	mkdir -p objs/
	$(ASM) $< -o $@

astest: $(MAIN_OBJ) $(NAME)
	$(LD) $^ -o $(TEST_NAME)
	@echo "\033[32mGenerated executable test file using asm main!\033[0m"

$(MAIN_OBJ): main.s
	mkdir -p objs/
	$(ASM) $< -o $@

ctest: main.c $(HEADER) $(NAME)
	$(CC) main.c $(NAME) -o $(TEST_NAME)
	@echo "\033[32mGenerated executable test file using C main!\033[0m"

clean:
	rm -rf $(OBJS_DIR)

fclean: clean
	rm -f $(NAME) $(TEST_NAME)

re: fclean all
