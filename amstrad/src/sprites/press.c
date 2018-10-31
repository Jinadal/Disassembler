#include "press.h"
// Data created with Img2CPC - (c) Retroworks - 2007-2017
// Palette uses hardware values.
const u8 press_pal[16] = { 0x54, 0x44, 0x55, 0x5c, 0x4c, 0x56, 0x57, 0x5e, 0x40, 0x4e, 0x47, 0x52, 0x53, 0x4a, 0x43, 0x4b };

// Tile press_sp: 80x40 pixels, 40x40 bytes.
const u8 press_sp[40 * 40] = {
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x44, 0xcc, 0xcc, 0x88, 0x00, 0x44, 0xcc, 0xcc, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00,
	0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x44, 0xcc, 0xcc, 0x88, 0x00, 0x44, 0xcc, 0xcc, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x44, 0xcc, 0x88, 0x00, 0x00, 0x44, 0xcc, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x44, 0xcc, 0x88, 0x00, 0x00, 0x44, 0xcc, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x44, 0xcc, 0xcc, 0x88, 0x00, 0x44, 0xcc, 0xcc, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00,
	0x00, 0xcc, 0x00, 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x00, 0x44, 0xcc, 0xcc, 0x88, 0x00, 0x44, 0xcc, 0xcc, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00, 0x00, 0x00, 0x44, 0x88, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};
