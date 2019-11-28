/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   x_handler.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gozsertt <gozsertt@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/28 18:23:43 by gozsertt          #+#    #+#             */
/*   Updated: 2019/11/28 20:10:03 by gozsertt         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../ft_printf.h"

char	*x_handler(t_format format, t_data arg)
{
	char	*intstr;

	intstr = ft_strdup("");
	if (!(format.precision == 0 && arg.intptr_ == 0))
	{
		intstr = ft_strappend()
	}


}