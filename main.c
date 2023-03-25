#include "libasm.h"

int	main(void)
{
	char	*s1 = "0123456789";
//	char	*s2 = NULL;

	printf("ft: %ld\n", ft_strlen(s1));
	printf("std: %ld\n", strlen(s1));

//	printf("ft: %ld\n", ft_strlen(s2));
//	printf("std: %ld\n", strlen(s2));

	char	s3[11];
	printf("ft\t: %s (source), %s (dest) == %s3\n", s1, ft_strcpy(s3, s1), s3);
	printf("std\t: %s (source), %s (dest) == %s3\n", s1, strcpy(s3, s1), s3);

	return 0;
}
