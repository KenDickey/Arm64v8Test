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
		bytes_per_pixel, 
		bytes_per_row;


/**
 * Show an image
 */
void showImage(char* lfb)
{
    int x, y;
    unsigned char *ptr = lfb;
    char *data = balloon_data, pixel[4];

    /* draw image in mid screen */
    ptr +=  (((screen_height_pixels - balloon_height_pixels) / 2) * bytes_per_row)
	    + (((screen_width_pixels - balloon_width_pixels) / 2) * bytes_per_pixel);

    for (y = 0; y < balloon_height_pixels; y++) {
        for (x = 0; x < balloon_width_pixels; x++) {
            BALLOON_PIXEL( data, pixel ); /* side effect: data += bytes_per_pixel */
            *((unsigned int*)ptr) = *((unsigned int *)&pixel);
            ptr += bytes_per_pixel;
        }
	/* skip to next row, less balloon_width in bytes */
        ptr += bytes_per_row - balloon_width_bytes;
    }
}

int main()
{
    int fbfd = 0;
    struct fb_var_screeninfo vinfo;
    struct fb_fix_screeninfo finfo;
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

    if (vinfo.bits_per_pixel != 32) {
	printf("\nYOU NEED TO: sudo fbset -depth 32\n\n");
	exit(-1);
    }

    // Figure out the size of the screen in bytes
    screensize_bytes = vinfo.xres * vinfo.yres * vinfo.bits_per_pixel / 8;
    
    screen_width_pixels  = vinfo.xres;
    screen_height_pixels = vinfo.yres;

    /* bytes_per_row is  (width_pixels * depth / bits-per-byte) */
    bytes_per_pixel = vinfo.bits_per_pixel / 8;
/*  bytes_per_row  = ((screen_width_pixels + 10) * bytes_per_pixel) ?WTF? */
    bytes_per_row = finfo.line_length; /* Nota Bene !! */

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

