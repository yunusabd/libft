/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yabdulha <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/28 16:30:59 by yabdulha          #+#    #+#             */
/*   Updated: 2017/11/29 18:27:48 by yabdulha         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static char		*ft_strrev(const char *s)
{
	int		len;
	int		i;
	char	*rev;

	len = ft_strlen(s);
	if (!(rev = (char*)malloc(sizeof(*rev) * len + 1)))
		return (NULL);
	i = 0;
	len--;
	while (s[i])
	{
		rev[i] = s[len];
		i++;
		len--;
	}
	rev[i] = '\0';
	return (rev);
}

static int		get_absolute(int n)
{
	return ((n < 0) ? -n : n);
}

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
		str[i] = get_absolute(n % 10) + 48;
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
