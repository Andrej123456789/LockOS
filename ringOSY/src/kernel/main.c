// Includes
#include "../include/print.h"

// Kernel main
void kernel_main() 
{
    // Clear the screen
    print_clear();
    // Set the front and back colors
    print_set_color(PRINT_COLOR_YELLOW, PRINT_COLOR_BLACK);
    // Print "Welcome to ringOSY!!"
    print_str("Welcome to ringOSY!!\n");
    //New line
    print_str("New line\n");
    print_str(to_string(320));
}