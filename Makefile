# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yrabby <yrabby@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/15 15:29:13 by yoav              #+#    #+#              #
#    Updated: 2022/07/13 16:58:33 by yrabby           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fractol

SRC = $(wildcard *.c)

OBJ = $(SRC:.c=.o)
HED = include
LIBFT_PATH = libft
LIBFT = $(LIBFT_PATH)/libft.a

CC = gcc
#  TODO
CFLAGS =  -c -I$(HED) -Ilibft
# CFLAGS = -Wall -Werror -Wextra -c -I$(HED) -Ilibft
RM = rm -f

.PHONY: clean fclean re all bonus
.PRECIOUS: $(SRC) $(HED) $(LIBFT)

all: $(NAME)

$(LIBFT):
	$(MAKE) bonus -C ./$(LIBFT_PATH)

$(NAME): $(OBJ) $(HED) Makefile $(LIBFT)
	$(CC) $(OBJ) $(LIBFT) -o $(NAME)

bonus: $(NAME) 

clean:
	$(MAKE) clean -C ./libft
	$(RM) $(OBJ)

fclean: clean
	$(MAKE) fclean -C ./libft
	$(RM) $(NAME)

re: fclean all
