#include "libasm.h"

void	ft_printFctName(const char *s)
{
	printf("\033[32m%s\n\033[0m", s);
}

int	main(void)
{
	char	*s1 = "0123456789";
//	char	*s2 = NULL;

	ft_printFctName("strlen");
	printf("ft: %ld\n", ft_strlen(s1));
	printf("std: %ld\n\n", strlen(s1));

//	printf("ft: %ld\n", ft_strlen(s2));
//	printf("std: %ld\n", strlen(s2));

	/*********************************************/

	ft_printFctName("strcpy");
	char	s3[11];
	printf("ft\t: %s (source), %s (dest) == %s\n", s1, ft_strcpy(s3, s1), s3);
	printf("std\t: %s (source), %s (dest) == %s\n\n", s1, strcpy(s3, s1), s3);

	/*********************************************/

	ft_printFctName("strcmp");
	char	*s4 = "0123456789";
	char	*s5 = "012345678";
	char	*s6 = "0123456789012";
	printf("ft\t: %s (s1), %s (s4), %d (ret)\n", s1, s4, ft_strcmp(s1, s4));
	printf("std\t: %s (s1), %s (s4), %d (ret)\n\n", s1, s4, strcmp(s1, s4));
	printf("ft\t: %s (s1), %s (s5), %d (ret)\n", s1, s5, ft_strcmp(s1, s5));
	printf("std\t: %s (s1), %s (s5), %d (ret)\n\n", s1, s5, strcmp(s1, s5));
	printf("ft\t: %s (s1), %s (s6), %d (ret)\n", s1, s6, ft_strcmp(s1, s6));
	printf("std\t: %s (s1), %s (s6), %d (ret)\n\n", s1, s6, strcmp(s1, s6));

	/*********************************************/

	ft_printFctName("write");
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
	printf(" (%ld chars)\n", res);

	write(1, "std\t: ", 5);
	res = write(-1, s1, 11);
	printf(" (%ld chars)\n\n", res);
	
	/*********************************************/

	char	s8[11];
	
	ft_printFctName("read");
	write(1, "ft\t: ", 5);
	res = ft_read(1, s8, 11);
	printf("%s8 (%ld chars)\n", s8, res);

	write(1, "std\t: ", 5);
	res = read(1, s8, 11);
	printf("%s8 (%ld chars)\n", s8, res);

	char	s9[3];

	write(1, "ft\t: ", 5);
	res = ft_read(1, s9, 11);
	printf("%s9 (%ld chars)\n", s9, res);

	write(1, "std\t: ", 5);
	res = read(1, s9, 11);
	printf("%s9 (%ld chars)\n", s9, res);

	char	s10[10];

	write(1, "ft\t: ", 5);
	res = ft_read(-1, s1, 11);
	printf("%s10 (%ld chars)\n", s10, res);

	write(1, "std\t: ", 5);
	res = read(-1, s1, 11);
	printf("%s10 (%ld chars)\n\n", s10, res);

	/*********************************************/

	ft_printFctName("strdup");
	char	*s11 = ft_strdup(s1);
	printf("ft\t: %s (s1)\n", s11);
	free(s11);
	s11 = strdup(s1);
	printf("std\t: %s (s1)\n", s11);
	free(s11);

	return 0;
}
