#ifndef RESISTOR_COLOR_H
#define RESISTOR_COLOR_H

typedef enum {
   BLACK = 0,
   BROWN,
   RED,
   ORANGE,
   YELLOW,
   GREEN,
   BLUE,
   VIOLET,
   GREY,
   WHITE
} resistor_band_t;

int color_code(resistor_band_t rbc);
resistor_band_t *colors(void);

#endif
