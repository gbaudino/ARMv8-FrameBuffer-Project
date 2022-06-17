
.ifndef data_s
.equ data_s, 1


.data

seed: .dword 0xbed6d5055ff3ed40

// Screen
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGHT, 	480


//Constants


// Delay times
delay_start_dynamic: .dword 0x90000000


// Colors
// Frequents
frequent_red: .dword 0x00ec4738 //used in nintendo logo, machine panel, mouse eyes...
black: .dword 0x0
white: .dword 0xffffffff


// Machine
machine_white: .dword 0x00f9faf5
machine_cyan: .dword 0x0064defe
machine_grey: .dword 0x00bebebe
machine_light_yellow: .dword 0x00feea64
machine_dark_yellow: .dword 0x00ffa200
panel_blue: .dword 0x00263b59
panel_light_blue: .dword 0x002962ff


//Poster
brown_donkey: .dword 0x004e2005
dark_brown_donkey: .dword 0x00381503
light_pink_donkey: .dword 0x00e9c8a5
red_tie: .dword 0x00f61b26
donkey_white: .dword 0x00ececec
yellow_poster: .dword 0x00f0ac14

//Background
purple_wall : .dword 0x005f4d84
light_brown_floor: .dword 0x00795548
dark_grey_cave: .dword 0x00222222
light_grey_socket: .dword 0x00bfbfbb

//Screen-Glitch
pink_glitch_screen: .dword 0x00f700ff
light_brown_palm: .dword 0x00ae5020
cream_palm: .dword 0x00ffdba6

.endif
