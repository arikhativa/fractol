# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yrabby <yrabby@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/15 15:29:13 by yoav              #+#    #+#              #
#    Updated: 2022/07/13 18:47:25 by yrabby           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fractol

SRC = $(wildcard *.c)

OBJ = $(SRC:.c=.o)
HED = include

# Libs
LIBFT_PATH = libft
LIBFT = $(LIBFT_PATH)/libft.a

LIBMLX_PATH = libmlx
LIBMLX = $(LIBMLX_PATH)/libmlx.a

CC = gcc
#  TODO
CFLAGS = -c -I$(HED) -I$(LIBFT_PATH)
# CFLAGS = -Wall -Werror -Wextra -c -I$(HED) -Ilibft
RM = rm -f

.PHONY: clean fclean re all bonus
.PRECIOUS: $(SRC) $(HED) $(LIBFT)

all: $(NAME)

$(LIBMLX):
	$(MAKE) -sC ./$(LIBMLX_PATH) 

$(LIBFT):
	$(MAKE) bonus -C ./$(LIBFT_PATH)

$(NAME): $(OBJ) $(LIBFT) $(LIBMLX)
	$(CC) $^ -o $@ -lmlx -framework OpenGL -framework AppKit

bonus: $(NAME) 

clean:
	$(MAKE) clean -C ./$(LIBMLX_PATH)
	$(MAKE) clean -C ./$(LIBFT_PATH)
	$(RM) $(OBJ)

fclean: clean
	$(MAKE) clean -C ./$(LIBMLX_PATH)
	$(MAKE) fclean -C ./$(LIBFT_PATH)
	$(RM) $(NAME)

re: fclean all
