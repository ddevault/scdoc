#ifndef _SCDOC_STRING_H
#define _SCDOC_STRING_H
#include <stdint.h>

struct str {
	char *str;
	size_t len, size;
};

struct str *str_create();
void str_free(struct str *str);
void str_reset(struct str *str);
int str_append_ch(struct str *str, uint32_t ch);

#endif
