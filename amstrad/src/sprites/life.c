#include "life.h"
// Data created with Img2CPC - (c) Retroworks - 2007-2017
// Palette uses hardware values.
const u8 life_pal[16] = { 0x54, 0x44, 0x55, 0x5c, 0x4c, 0x56, 0x57, 0x5e, 0x40, 0x4e, 0x47, 0x52, 0x53, 0x4a, 0x43, 0x4b };

// Tile life_sp: 16x16 pixels, 8x16x2 bytes.
// Mask data is interlaced (MASK BYTE, DATA BYTE).
const u8 life_sp[2 * 8 * 16] = {
	0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00,
	0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00,
	0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xaa, 0x50, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00,
	0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0xd8, 0x55, 0x88, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00,
	0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0xcf, 0x55, 0xa0, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00,
	0xff, 0x00, 0xff, 0x00, 0xaa, 0x44, 0x00, 0xe5, 0x00, 0xce, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00,
	0xff, 0x00, 0xff, 0x00, 0xaa, 0x01, 0x00, 0x03, 0x00, 0x52, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00,
	0xff, 0x00, 0xff, 0x00, 0x00, 0x89, 0x00, 0x03, 0x00, 0x52, 0x55, 0x88, 0xff, 0x00, 0xff, 0x00,
	0xff, 0x00, 0xff, 0x00, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x55, 0xa0, 0xff, 0x00, 0xff, 0x00,
	0xff, 0x00, 0xaa, 0x44, 0x00, 0x03, 0x00, 0xe5, 0x00, 0xe5, 0x00, 0xce, 0xff, 0x00, 0xff, 0x00,
	0xff, 0x00, 0xaa, 0x01, 0x00, 0x46, 0x00, 0xcc, 0x00, 0x89, 0x00, 0x47, 0xff, 0x00, 0xff, 0x00,
	0xff, 0x00, 0x00, 0xcc, 0x00, 0xd8, 0x00, 0x03, 0x00, 0xe4, 0x00, 0x89, 0x55, 0x88, 0xff, 0x00,
	0xff, 0x00, 0x00, 0xcc, 0x00, 0xab, 0x00, 0xf0, 0x00, 0x57, 0x00, 0x46, 0x55, 0xa0, 0xff, 0x00,
	0xaa, 0x44, 0x00, 0x8b, 0x00, 0x57, 0x00, 0xff, 0x00, 0xff, 0x00, 0x03, 0x00, 0xce, 0xff, 0x00,
	0xaa, 0x50, 0x00, 0x8b, 0x00, 0x03, 0x00, 0x03, 0x00, 0x47, 0x00, 0x47, 0x00, 0xf0, 0xff, 0x00,
	0x00, 0xd8, 0x00, 0xf0, 0x00, 0xf0, 0x00, 0x52, 0x00, 0x03, 0x00, 0xf0, 0x00, 0xf0, 0x55, 0x88
};

