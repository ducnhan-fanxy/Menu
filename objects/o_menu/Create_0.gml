/// @description Insert description here
#macro MAIN			0
#macro SETTINGS		1
#macro TOTAL		2

global.dsm_settings = ds_map_create();
#macro set		global.dsm_settings

ds_map_add(set, "sound", [5, [0, 10]]);
ds_map_add(set, "music", [5, [0, 10]]);
ds_map_add(set, "subtitles", [0, ["On", "Off"]]);
ds_map_add(set, "text_speed", [1, ["Slow", "Normal", "Fast", "Instant"]]);

time_held_right = 0;
time_held_left = 0;

menu[MAIN][0] = "Start";
menu[MAIN][1] = "Settings";
menu[MAIN][2] = "Exit";

//option submenu 1
menu[SETTINGS][0] = ["< Sound FX >", "sound"];
menu[SETTINGS][1] = ["< Music >", "music"];
menu[SETTINGS][2] = ["< Subtitles >", "subtitles"];
menu[SETTINGS][3] = ["< Text speed >", "text_speed"];
menu[SETTINGS][4] = "Back";

index = 0;  //menu index position
sub_menu = 0; //current sub menu

menu_x_pos = room_width * .5;		//x postion for menu
menu_y_pos = room_height * .4;		//y postion for menu
click_area_w = 35;					//width of the area we can click to change values

function button(_y, _wl, _wr, _h) constructor {
	y = _y;			//selection position y
	wl = _wl;		//click area width left
	wr = _wr;		//click area width right
	h = _h;			//click area height
}

//init a button struct for each menu entry
var _h = 40;
for (var a = 0; a < TOTAL; ++a) {
	for (var b = 0; b < array_length(menu[a]); ++b) {
	    button_arr[a][b] = new button(0, room_width/2, room_width/2, _h);
	}
   
}










