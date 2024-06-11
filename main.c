#include "libasm.h"
#include <errno.h>

void	_print_ftc_name(const char *s)
{
	printf("\033[32m%s\n\033[0m", s);
}

int	main(void)
{
	char	*s1 = "0123456789";
	char	*s12 = "0123456789\n";

	_print_ftc_name("strlen");
	printf("ft: %ld\n", ft_strlen(s1));
	printf("std: %ld\n\n", strlen(s1));
	// Now with a newline character at the end
	printf("ft: %ld\n", ft_strlen(s12));
	printf("std: %ld\n\n", strlen(s12));

//	char	*s2 = NULL;
//	Both segfault when s2 = NULL
//	printf("ft: %ld\n", ft_strlen(s2));
//	printf("std: %ld\n", strlen(s2));

	/******************************************** strcpy */

	_print_ftc_name("strcpy");
	char	s3[11];
	printf("ft\t: %s (source), %s (dest) == %s\n", s1, ft_strcpy(s3, s1), s3);
	printf("std\t: %s (source), %s (dest) == %s\n\n", s1, strcpy(s3, s1), s3);

	/******************************************** strcmp */

	_print_ftc_name("strcmp");
	char	*s4 = "0123456789";
	char	*s5 = "012sdf sdf sd  UIHIUèçè çà78";
	char	*s6 = "01234qs sd __çà q)à__ç_à_qsdf_ qsdf qs_q_56789012";
	printf("ft\t: %s (s1), %s (s4), %d (ret)\n", s1, s4, ft_strcmp(s1, s4));
	printf("std\t: %s (s1), %s (s4), %d (ret)\n\n", s1, s4, strcmp(s1, s4));
	printf("ft\t: %s (s1), %s (s5), %d (ret)\n", s1, s5, ft_strcmp(s1, s5));
	printf("std\t: %s (s1), %s (s5), %d (ret)\n\n", s1, s5, strcmp(s1, s5));
	printf("ft\t: %s (s1), %s (s6), %d (ret)\n", s1, s6, ft_strcmp(s1, s6));
	printf("std\t: %s (s1), %s (s6), %d (ret)\n\n", s1, s6, strcmp(s1, s6));

	/******************************************** write */

	_print_ftc_name("write");
	write(1, "ft\t: ", 5);
	ssize_t	res = ft_write(1, s1, 11);
	printf(" (%ld chars)\n", res);

	write(1, "std\t: ", 5);
	res = write(1, s1, 11);
	printf(" (%ld chars)\n", res);

	char	*s7 = NULL;

	write(1, "ft\t: ", 5);
	res = ft_write(1, s7, 11);
	printf(" (%ld chars)\n", res);

	write(1, "std\t: ", 5);
	res = write(1, s7, 11);
	printf(" (%ld chars)\n", res);

	write(1, "ft\t: ", 5);
	res = ft_write(-1, s1, 11);
	printf(" (%ld chars), error number: %d\n", res, errno);

	write(1, "std\t: ", 5);
	res = write(-1, s1, 11);
	printf(" (%ld chars), error number: %d\n\n", res, errno);
	
	/******************************************** read */

	char	s8[11];
	
	_print_ftc_name("read");
	write(1, "ft\t: ", 5);
	res = ft_read(1, s8, 11);
	printf("%s8 (%ld chars)\n\n", s8, res);

	write(1, "std\t: ", 5);
	res = read(1, s8, 11);
	printf("%s8 (%ld chars)\n\n\n", s8, res);

	char	s9[3];

	write(1, "ft\t: ", 5);
	res = ft_read(1, s9, 11);
	printf("%s9 (%ld chars)\n\n", s9, res);

	write(1, "std\t: ", 5);
	res = read(1, s9, 11);
	printf("%s9 (%ld chars)\n\n\n", s9, res);

	char	s10[10];

	write(1, "ft\t: ", 5);
	res = ft_read(-1, s1, 11);
	printf("%s10 (%ld chars), error number: %d\n\n", s10, res, errno);

	write(1, "std\t: ", 5);
	res = read(-1, s1, 11);
	printf("%s10 (%ld chars), error number: %d\n\n", s10, res, errno);

	/******************************************** strdup */

	_print_ftc_name("strdup");
	char	*s11 = ft_strdup(s1);
	printf("ft\t: %s (s1)\n", s11);
	free(s11);
	s11 = strdup(s1);
	printf("std\t: %s (s1)\n", s11);
	free(s11);

	// Both segfault when s7 = NULL
	// char	*s12 = ft_strdup(s7);
	// printf("ft\t: %s (7)\n", s12);
	// free(s12);
	// // s12 = strdup(s7);
	// // printf("std\t: %s (7)\n", s12);
	// // free(s12);

	char	*s13 = ft_strdup(s6);
	printf("ft\t: %s (s6)\n", s13);
	free(s13);
	s13 = strdup(s6);
	printf("std\t: %s (s6)\n", s13);
	free(s13);

	return 0;
}
