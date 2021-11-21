/// @description Insert description here
//get input
var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _select = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);

var _move = _down - _up
if _move != 0 {
	//move index
	index += _move;
	
	//clamp value
	var _size = array_length_2d(menu, sub_menu);
	if index < 0 index = _size - 1;				//at start, so loop to menu end
	else if index >= _size index = 0;			//at end, so loop to menu start
}

if _select {
	switch(sub_menu){
		case 0: //main menu
			switch(index) {
				case 0:
					//start
					room_goto_next();
				break;
				case 1:
					//options
					sub_menu = 1;
					index = 0;
				break;
				case 2:
					//exit
					game_end();
				break;
			}
		break;
		case 1: //options 
			switch(index) {
				case 0:
					//Graphics

				break;
				case 1:
					//Sound
				break;
				case 2:
					//Controls
				break;
				case 3:
					//Back
					sub_menu = 0;
					index = 1;
				break;
			}
		break;
	}
}