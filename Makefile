# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gozsertt <gozsertt@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/08/15 16:10:16 by gozsertt          #+#    #+#              #
#    Updated: 2019/12/06 12:33:58 by gozsertt         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC          =   gcc
CFLAGS      =   -Wall -Wextra -Werror #$(DEBUG_FLAGS)

DEBUG_FLAGS =   -O0 -g                                                      \
                                                                            \
                -fsanitize=address                                          \
                -fsanitize=undefined                                        \
                -fsanitize=bounds                                           \
                -fsanitize=nullability-arg                                  \
                -fsanitize=nullability-return                               \
                -fsanitize=nullability-assign                               \
                -fsanitize-address-use-after-scope                          \
                # -fsanitize=integer                                        \
                # -fsanitize=object-size                                    \

NAME        =   libftprintf.a

HEADERS     =   ft_printf.h

SOURCES		=	ft_printf.c													\
				ft_vdprintf.c												\
																			\
				formatter.c													\
				parser.c													\
																			\
				$(PLUGINS)													\

PLUGINS     =	Handlers/style_handler.c									\
				Handlers/mod_handler.c										\
				Handlers/c_handler.c										\
				Handlers/s_handler.c										\
				Handlers/p_handler.c										\
				Handlers/d_handler.c										\
				Handlers/i_handler.c										\
				Handlers/o_handler.c										\
				Handlers/u_handler.c										\
				Handlers/x_handler.c										\
				Handlers/xx_handler.c										\

OBJECTS		=	$(SOURCES:.c=.o)

# MAIN part --------------------------------------------------------

all : $(NAME)

$(NAME) : Libft/libft.a $(OBJECTS)
	@ar -rcs $(NAME) $(OBJECTS) $(shell find Libft/ -name '*.o')
	@echo && echo $(GREEN) "[√]     [Extended Library Successfully Compiled!]"
	@echo $(WHITE)

Libft/libft.a :
	@make -C Libft

%.o: %.c $(HEADERS)
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "Compiling => " $<

DEL = /bin/rm -rf

clean :
	@$(DEL) $(shell find . -name '*.o')
	@make clean -C Libft/

fclean : clean
	@$(DEL) $(NAME)
	@make fclean -C Libft/

re : fclean all

GREEN = "\033[1;32m"
WHITE = "\033[1;37m"

nh :
	@echo && echo $(GREEN) "Checking Norme -- Header Files:" && echo $(WHITE);
	@norminette $(shell find . -name '*.h')

nc :
	@echo && echo $(GREEN) "Checking Norme -- Source Files:" && echo $(WHITE);
	@norminette $(shell find . -name '*.c')

na : nh nc

.PHONY : all clean fclean re nc nh na