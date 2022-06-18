
.ifndef data_s
.equ data_s, 1


.data

//Configs
    //Modifique segun la velocidad en su procesador
    //un mayor numero implica una velocidad mas alta,
    //uno menor implica una velocidad mas baja
.equ DELAY_ADJUST,      0x0

// Screen
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGHT, 	480


// Delay times
delay_start_dynamic: .dword 0x90000000 - DELAY_ADJUST


// Colors
// Frequents
red: .dword 0x00ec4738 //used in nintendo logo, machine panel, mouse eyes...
black: .dword 0x0
white: .dword 0xffffffff
light_grey: .dword 0x00bfbfbf

// Machine
machine_white: .dword 0x00f9faf5
machine_cyan: .dword 0x0064defe
machine_grey: .dword 0x00bebebe
machine_light_yellow: .dword 0x00feea64
machine_dark_yellow: .dword 0x00ffa200
machine_door_grey: .dword 0x00777777

//Panel
panel_blue: .dword 0x00263b59
panel_light_blue: .dword 0x002962ff
panel_joystick_silver: .dword 0x00ecfbef

//Screen
screen_border_golden: .dword 0x00514621
screen_border_brown: .dword 0x00724526
screen_border_purple: .dword 0x00422d42
screen_off: .dword 0x00001a0d
screen_short_reflex: .dword 0x00012413
screen_large_reflex: .dword 0x0000542a

//Mouse
mouse_eyes: .dword 	0xdddddddd

//Switchers
switch_on_cyan: .dword 0x0021c59b
switch_background: .dword 0x00c9d7da
switch_silver: .dword 0x00616161

//Wire
wire_electricity: .dword 0x00ffa200
wire_base_silver: .dword 0x00424242



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


//Screen-Glitch
pink_glitch_screen: .dword 0x00f700ff
light_brown_palm: .dword 0x00ae5020
cream_palm: .dword 0x00ffdba6

.endif
