/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   u_handler.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gozsertt <gozsertt@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/10/02 18:14:47 by gozsertt          #+#    #+#             */
/*   Updated: 2019/10/02 18:57:01 by gozsertt         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../ft_printf.h"

/*
**             Flags: '-', '0'
**             Width: defined or '*'
**             Precision: defined or '*'
**             Length: 'hh', 'h', 'l', 'll', 'j', 'z', 't'
*/

char	*u_handler(t_format format, t_data arg)
{
	intmax_t	temp;
	char		*intstr;

//	if (format.length < L && format.length != NONE)
//		temp = (format.length == HH) ? arg.uchar_ : arg.ushort_;
//	else
//		temp = (format.length == NONE) ? arg.uint_ : arg.uintmax_;
	temp = (format.length < L && format.length != NONE) ?
		arg.uint_ :
		arg.uintmax_;
	intstr = ft_strdup("");
	if (!(format.precision == 0 && temp == 0))
	{
		intstr = ft_strjoinfre(
			intstr, ft_utoa_base(temp, DECIMAL_BASE, format.precision), 1, 1);
		format.width -= ft_strlen(intstr);
	}
	if (format.width)
		intstr = apply_width(format, intstr);
	return (intstr);
}
