#include "bar.h"
// Data created with Img2CPC - (c) Retroworks - 2007-2017
// Palette uses hardware values.
const u8 bar_pal[16] = { 0x54, 0x44, 0x55, 0x5c, 0x4c, 0x56, 0x57, 0x5e, 0x40, 0x4e, 0x47, 0x52, 0x53, 0x4a, 0x43, 0x4b };

// Tile bar_sp: 16x4 pixels, 8x4 bytes.
const u8 bar_sp[8 * 4] = {
	0x03, 0x03, 0x0c, 0x0c, 0x0c, 0x0c, 0x03, 0x03,
	0x03, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x03,
	0x03, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x03,
	0x03, 0x03, 0x0c, 0x0c, 0x0c, 0x0c, 0x03, 0x03
};

