/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   x_handler.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gozsertt <gozsertt@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/28 18:23:43 by gozsertt          #+#    #+#             */
/*   Updated: 2019/12/02 19:11:05 by gozsertt         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../ft_printf.h"

char	*x_handler(t_format format, t_data arg)
{
	intmax_t	temp;
	char		*intstr;

	if (format.length < L && format.precision != NONE)
		temp = (format.length == HH) ? arg.uchar_ : arg.short_;
	else
		temp = (format.length == NONE) ? arg.uint_ : arg.uintmax_;
	intstr = ft_strdup("");
	if (!(format.precision == 0 && temp == 0))
	{
		temp = (temp < 0) ? ~temp + 1 : temp;
		intstr = ft_strappend(intstr,
			ft_utoa_base(temp, HEX_LOWER_BASE, format.precision), 1, 1);
		format.width -= ft_strlen(intstr) +
			(format.flags & HASH && temp) ? 2 : 0;
	}
	if (format.width && format.pad == '0')
		intstr = apply_width(format, intstr);
	if (format.flags & HASH && temp)
		intstr = ft_strprepend(intstr, "0x", 1, 0);
	if (format.width && format.pad != '0')
		intstr = apply_width(format, intstr);
	return (intstr);
}
