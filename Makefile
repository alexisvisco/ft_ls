
C_FILES += \
debug/printer.c \
\
main/main.c \
\
max/max.c \
max/max_fn.c \
\
construct_list.c \
ft_ls.c \
sorting.c \
printer.c \


PROJECT = generated_test
NAME = $(PROJECT)
CC = gcc -g
CFLAGS += 

SRC_PATH = ./src/
INC_PATH = ./includes/
LIBFT_INCLUDES_PATH = ./libft/includes/
OBJ_PATH = ./obj/
OBJ_PATHS = main debug max
LIBFT_PATH = ./libft

OBJ_SUB_PATHS = $(addprefix $(OBJ_PATH),$(OBJ_PATHS))
OBJ_NAME = $(C_FILES:.c=.o)

LIBFT_BIN_NAME = ft

SRC = $(addprefix $(SRC_PATH),$(C_FILES))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))
INC = $(addprefix -I,$(INC_PATH))

all: make_libft $(NAME)

$(OBJ_PATH)%.o: $(SRC_PATH)/%.c
	@mkdir -p $(OBJ_SUB_PATHS)
	$(CC) $(CFLAGS) $(INC) -I $(LIBFT_INCLUDES_PATH) -o $@ -c $<

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(INC) -I $(LIBFT_INCLUDES_PATH) -L$(LIBFT_PATH) -l$(LIBFT_BIN_NAME) $? -o $(NAME)

clean:
	/bin/rm -rf $(OBJ_PATH)

fclean: clean
	/bin/rm -rf $(NAME)

re: fclean all

download_libft:
	@git clone https://github.com/AlexisVisco/libft/
	@cd libft && rm -rf .git

update_libft:
	@rm -rf ./libft
	@git clone https://github.com/AlexisVisco/libft/
	@cd libft && rm -rf .git

make_libft:
	make -C libft/ 

.PHONY: clean fclean re download_libft update_libft make_libft

