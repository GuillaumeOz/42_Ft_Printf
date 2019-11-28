# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gozsertt <gozsertt@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/08/15 16:10:16 by gozsertt          #+#    #+#              #
#    Updated: 2019/10/02 18:42:50 by gozsertt         ###   ########.fr        #
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

correction:

	@echo '==============================================================='
	@echo && echo $(GREEN) "I - Checking Author File:" && echo $(WHITE);
	@sleep 1
	cat auteur
	@echo
	@sleep 1

	@echo '==============================================================='
	@echo && echo $(GREEN) "II - Checking Norme:" && echo $(WHITE);

	@sleep 1
	@echo && echo $(GREEN) "a - Checking Norme -- Header Files:" && echo $(WHITE);
	@sleep 1
	@norminette $(shell find . -name  '*.h')
	@echo

	@sleep 1
	@echo && echo $(GREEN) "b - Checking Norme -- Source Files:" && echo $(WHITE);
	@sleep 1
	@norminette $(shell find . -name '*.c')
	@echo

	@echo '==============================================================='
	@sleep 1
	@echo && echo $(GREEN) "III - Checking Compilation:" && echo $(WHITE);
	@sleep 1
	@echo 'make all'
	@echo
	@sleep 1
	@make all
	@sleep 1
	@sleep 1
	@echo

	@echo '==============================================================='
	@echo && echo $(GREEN) "a - make clean" && echo $(WHITE);
	@sleep 1
	@echo 'Current working directory:'
	@echo
	@sleep 1
	@echo 'ls -1'
	@echo
	@sleep 1
	@ls -1
	@echo
	@sleep 1
	@echo

	@echo '==============================================================='
	@echo && echo $(GREEN) "b - make fclean" && echo $(WHITE);
	@sleep 1
	@echo 'make fclean'
	@echo
	@make fclean
	@sleep 1
	@sleep 1
	@ls -1
	@echo
	@sleep 1
	@echo

	@echo '==============================================================='
	@echo && echo $(GREEN) "V - Explain code/approach" && echo $(WHITE);
	@echo $(GREEN) "VI - Q&A" && echo $(WHITE);
	@echo '==============================================================='
	@echo

.PHONY : all clean fclean re nc nh na correction