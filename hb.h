#include <X11/Xft/Xft.h>
#include <harfbuzz/hb.h>
#include <harfbuzz/hb-ft.h>

typedef struct {
	hb_buffer_t *buffer;
	hb_glyph_info_t *glyphs;
	hb_glyph_position_t *positions;
	unsigned int count;
} HbTransformData;

void hbunloadfonts();
void hbtransform(HbTransformData *, XftFont *, const Glyph *, int, int);
void hbcleanup(HbTransformData *);
