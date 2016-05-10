CC= clang
FLAGS=-Wall -Wextra -Werror
NAME=opencl-get-info

SRC= main.c \
	get_devices_info.c \
	get_platforms_info.c

OBJ= $(SRC:.c=.o)

FRWK=  	-framework OpenCL

.PHONY: clean fclean re all
.SILENT:

all:$(NAME) 

$(NAME): $(OBJ)
		$(CC) -o $(NAME) $(OBJ) $(FRWK)
		echo "\t\xF0\x9F\x8F\x81   Compiling \033[35m$(NAME) \033[0mDONE!"

%.o: %.c
		echo "\t\xF0\x9F\x94\xA7   Building \033[34m $@ \033[0m" 
		$(CC) -c $(FLAGS) -o $@ $<

clean:
		echo "\t\xF0\x9F\x92\xA3   Cleaning"
		rm -rf $(OBJ)

fclean: clean
		echo "\t\xF0\x9F\x9A\xBD   Full Clean"
		rm -rf $(NAME)

re: fclean all
