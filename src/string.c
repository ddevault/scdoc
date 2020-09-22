#include <stdlib.h>
#include <stdint.h>
#include "str.h"
#include "unicode.h"

static int ensure_capacity(struct str *str, size_t len) {
	if (len + 1 >= str->size) {
		char *new = realloc(str->str, str->size * 2);
		if (!new) {
			return 0;
		}
		str->str = new;
		str->size *= 2;
	}
	return 1;
}

struct str *str_create() {
	struct str *str = calloc(1, sizeof(struct str));
	str->str = malloc(16);
	str->size = 16;
	str->len = 0;
	str->str[0] = '\0';
	return str;
}

void str_free(struct str *str) {
	if (!str) return;
	free(str->str);
	free(str);
}

int str_append_ch(struct str *str, uint32_t ch) {
	int size = utf8_chsize(ch);
	if (size <= 0) {
		return -1;
	}
	if (!ensure_capacity(str, str->len + size)) {
		return -1;
	}
	utf8_encode(&str->str[str->len], ch);
	str->len += size;
	str->str[str->len] = '\0';
	return size;
}
