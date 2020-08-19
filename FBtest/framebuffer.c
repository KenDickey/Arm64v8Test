/*
To test that the Linux framebuffer is set up correctly, and that the device permissions
are correct, use the program below which opens the frame buffer and draws a squeak balloon.

retrieved from:
Testing the Linux Framebuffer for Qtopia Core (qt4-x11-4.2.2);
http://cep.xor.aps.anl.gov/software/qt4-x11-4.2.2/qtopiacore-testingframebuffer.html

Then annotated with units;  Balloon from Squeak Smalltalk image (www.squeak.org).
*/

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <linux/fb.h>
#include <sys/mman.h>
#include <sys/ioctl.h>

#include "Balloon.h"

unsigned int	screen_width_pixels, 
		screen_height_pixels,
		fb_bytes_per_pixel, 
		fb_bytes_per_row;

static  struct fb_var_screeninfo vinfo;
static  struct fb_fix_screeninfo finfo;


static inline unsigned long fb_pixel_position(int x, int y) {
  return (x + vinfo.xoffset) * (vinfo.bits_per_pixel / 8)
      +  (y + vinfo.yoffset) * finfo.line_length ;
}

static inline unsigned long fb_pixel_color(int red, int green, int blue) {
  switch (vinfo.bits_per_pixel) {
  case 16:
    return (((red >> 3) & 31) << 11) 
         | (((green >> 2) & 63) <<  5)
         | (((blue >> 3) & 31) <<  0);
  case 24:
  case 32:
    return (red << 16) | (green << 8) | (blue << 0);
  default:
     printf("\nUnhandled framebuffer depth: %ld\n", vinfo.bits_per_pixel);
     exit (-1 );
  }
}

/**
 * Show an image
 */
void showImage(char* lfb)
{
    int x, y, bytes_per_pixel;
    unsigned char *ptr = lfb;
    unsigned long myPixel;
    char *data = balloon_data, pixel[4];

    bytes_per_pixel = 4; /* Balloon has 32 bit pixels -> 4 bytes */
    /* draw image in mid screen */
    ptr +=  (((screen_height_pixels - balloon_height_pixels) / 2) * fb_bytes_per_row)
	    + (((screen_width_pixels - balloon_width_pixels) / 2) * fb_bytes_per_pixel);

    for (y = 0; y < balloon_height_pixels; y++) {
        for (x = 0; x < balloon_width_pixels; x++) {
            BALLOON_PIXEL( data, pixel ); /* side effect: data += balloon's bytes_per_pixel */
            myPixel = fb_pixel_color( pixel[0], pixel[1], pixel[2] );
	    *((unsigned int*)(ptr + fb_pixel_position(x,y))) = *((unsigned int *)&myPixel);
        }
    }
}

int main()
{
    int fbfd = 0;
    long int screensize_bytes = 0;
    char *fbp = 0;
    int x = 0, y = 0;
    long int location = 0;

    // Open the file for reading and writing
    fbfd = open("/dev/fb0", O_RDWR);
    if (fbfd == -1) {
        perror("Error: cannot open framebuffer device");
        exit(1);
    }
    printf("The framebuffer device was opened successfully.\n");

    // Get fixed screen information
    if (ioctl(fbfd, FBIOGET_FSCREENINFO, &finfo) == -1) {
        perror("Error reading fixed information");
        exit(2);
    }

    printf("Line length in bytes is %d\n", finfo.line_length);

    // Get variable screen information
    if (ioctl(fbfd, FBIOGET_VSCREENINFO, &vinfo) == -1) {
        perror("Error reading variable information");
        exit(3);
    }

    printf("%dx%d, %dbpp\n", vinfo.xres, vinfo.yres, vinfo.bits_per_pixel);

    printf("Framebuffer depth: %ld\n",vinfo.bits_per_pixel);

    // Figure out the size of the screen in bytes
    screensize_bytes = vinfo.xres * vinfo.yres * vinfo.bits_per_pixel / 8;
    
    screen_width_pixels  = vinfo.xres;
    screen_height_pixels = vinfo.yres;

    /* bytes_per_row is  (width_pixels * depth / bits-per-byte) */
    fb_bytes_per_pixel = vinfo.bits_per_pixel / 8;
/*  bytes_per_row  = ((screen_width_pixels + 10) * bytes_per_pixel) ?WTF? */
    fb_bytes_per_row = finfo.line_length; /* Nota Bene !! */

    // Map the device to memory
    fbp = (char *)mmap(0, screensize_bytes, PROT_READ | PROT_WRITE, MAP_SHARED, fbfd, 0);
    if ((int)fbp == -1) {
        perror("Error: failed to map framebuffer device to memory");
        exit(4);
    }
    printf("The framebuffer device was mapped to memory successfully.\n");

    showImage(fbp); /*@@*/

    munmap(fbp, screensize_bytes);
    close(fbfd);
    return 0;
}

