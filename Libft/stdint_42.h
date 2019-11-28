/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   stdint_42.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gozsertt <gozsertt@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/08/29 15:11:50 by gozsertt          #+#    #+#             */
/*   Updated: 2019/09/17 15:12:02 by gozsertt         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef STDINT_42_H
# define STDINT_42_H

# include <stdbool.h>
# include <stddef.h>
# include <stdint.h>

typedef char* t_bigint;

typedef union			u_double
{
	double				val;
	char				body[sizeof(double)];
}						t_dbl;

typedef union			u_long_double
{
	long double			val;
	char				body[sizeof(long double)];
}						t_ldbl;

typedef struct			s_double
{
	bool				sign;
	short				exponent;
	uintmax_t			mantissa;
	t_dbl				dbl_;
}						t_double;

typedef struct			s_long_double
{
	bool				sign;
	short				exponent;
	uintmax_t			mantissa;
	t_ldbl				ldbl_;
}						t_long_double;

typedef union			u_data
{
	char				*str_;
	bool				bool_;
	signed char			char_;
	signed short		short_;
	signed int			int_;
	signed long			long_;
	signed long long	long_long_;
	unsigned char		uchar_;
	unsigned short		ushort_;
	unsigned int		uint_;
	unsigned long		ulong_;
	unsigned long long	ulong_long_;
	double				double_;
	long double			long_double_;
	t_dbl				dbl_;
	t_ldbl				ldbl_;
	intmax_t			intmax_;
	uintmax_t			uintmax_;
	intptr_t			intptr_;
	uintptr_t			uintptr_;
	ptrdiff_t			ptrdiff_;
	size_t				size_;
}						t_data;

#endif