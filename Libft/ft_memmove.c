/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gozsertt <gozsertt@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/09 15:55:45 by gozsertt          #+#    #+#             */
/*   Updated: 2019/08/24 17:44:34 by gozsertt         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memmove(void *dst, const void *src, size_t n)
{
	unsigned char	*srcc;
	unsigned char	*dstc;
	size_t			i;

	i = 0;
	srcc = (unsigned char *)src;
	dstc = (unsigned char *)dst;
	if (srcc < dstc)
		while (n--)
			*(dstc + n) = *(srcc + n);
	else
		while (i < n)
		{
			*(dstc + i) = *(srcc + i);
			i++;
		}
	return (dst);
}
