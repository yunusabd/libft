# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yabdulha <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/10 22:06:52 by yabdulha          #+#    #+#              #
#    Updated: 2018/08/21 13:05:17 by yabdulha         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
CC = gcc
FLAGS = -Wall -Werror -Wextra
FILES = ft_putchar ft_putstr ft_strcmp ft_strlen ft_strdup ft_strcpy ft_strcat \
		ft_strncat ft_strlcat ft_strstr ft_strncmp ft_atoi ft_toupper \
		ft_tolower ft_putnbr ft_isalpha ft_isdigit ft_isprint ft_itoa \
		ft_memset ft_bzero ft_memcpy ft_memccpy ft_memmove ft_memchr \
		ft_memcmp ft_strncpy ft_strchr ft_strrchr ft_strnstr ft_isalnum \
		ft_isascii ft_memalloc ft_memdel ft_strnew ft_strdel ft_strclr \
		ft_striter ft_striteri ft_strmap ft_strmapi ft_strequ ft_strnequ \
		ft_strsub ft_strjoin ft_strtrim ft_strsplit ft_putendl ft_putchar_fd \
		ft_putstr_fd ft_putendl_fd ft_putnbr_fd ft_lstnew ft_lstdelone \
		ft_lstdel ft_lstadd ft_lstiter ft_lstmap ft_strndup ft_strndup_len \
		ft_strrev ft_absolute ft_print_array ft_sqrt ft_power \
		ft_printf parser converter uconverter padding convert_unicode \
		set_conv get_flags

SRCS_PATH = srcs
FILENAMES =	$(patsubst %,%.c,$(FILES))
SRCS = $(addprefix $(SRCS_PATH)/,$(FILENAMES))

OBJS_PATH = objects
OBJS_NAME  = $(patsubst %,%.o,$(FILES))
OBJS = $(addprefix $(OBJS_PATH)/,$(OBJS_NAME))

INCLUDES_PATH = includes
INCLUDES_NAME = libft.h ft_printf.h
INCLUDES = $(addprefix $(INCLUDES_PATH)/,$(INCLUDE_NAME))

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(OBJS)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)

$(OBJS): $(OBJS_PATH) $(SRCS:PATH) $(INCLUDES_PATH)
	@echo "compiling source"
	gcc -c $(SRCS) $(CFLAGS) -I$(INCLUDES_PATH)
	@mv $(OBJS_NAME) $(OBJS_PATH)

$(OBJS_PATH):
	@mkdir $(OBJS_PATH) 2> /dev/null || true

clean:
	@echo "\033[32;5mCleaning..."
	@rm -f $(OBJS)
	@rmdir $(OBJS_PATH) 2> /dev/null || true
	@echo "\033[32;3mCleaning Done !\n\033[0m"

fclean: clean
	@echo "\033[32;5mFcleaning..."
	@rm -f $(NAME)
	@echo "\033[32;3mFcleaning Done !\n\033[0m"

re: fclean all
