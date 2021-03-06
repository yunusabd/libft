/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yabdulha <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/28 16:30:59 by yabdulha          #+#    #+#             */
/*   Updated: 2017/12/03 22:28:12 by yabdulha         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char			*ft_itoa(int n)
{
	char	*str;
	int		i;
	int		neg;

	i = 0;
	if (!(str = (char*)malloc(sizeof(*str) * 12)))
		return (NULL);
	neg = (n < 0) ? 1 : 0;
	while (n)
	{
		str[i] = ft_absolute(n % 10) + 48;
		n /= 10;
		i++;
	}
	if (neg)
		str[i] = '-';
	if (!i)
		str[i] = 48;
	if (neg || !i)
		i++;
	str[i] = '\0';
	return (ft_strrev(str));
}
