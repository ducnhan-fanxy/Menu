/// @description Insert description here
draw_set_halign(fa_center);
draw_set_font(fnt_menu);

//line spacing
var _gap = 40;

//draw items
var _size = array_length(menu[sub_menu])
for (var i = 0; i < _size; ++i) {
	//reset colors
	if i == index var _col = c_teal; else var _col = c_white;
	
	//is this a selectable menu item, or just plain test?
	if is_array(menu[sub_menu][i]){
		//store mene array
		var _menu_arr = menu[sub_menu][i];
		
		//get the map array
		var _map_arr = set[? _menu_arr[1]];
		
		//get the limit array, or choice array
		var _limits_arr = _map_arr[1];
		
		//do we show an integer or text?
		var _str1 = _menu_arr[0]
		if is_real(_limits_arr[0]){
			//integer to show
			var _str2 =   string(_map_arr[0]);
		} else {
			//string to show
			var _str2 = _limits_arr[_map_arr[0]];
		}
	} else {
		//draw string
		var _str1 = menu[sub_menu][i];
		var _str2 = "";
	}
	
    //set up y position and text width
	//get the struct for this menu entry
	var _stc = button_arr[sub_menu][i];
	_stc.y = menu_y_pos + _gap * i;
	
	//set different widths if we are on an array
	if _str2 == "" {
		_stc.wl = string_width(_str1)/2;
		_stc.wr = string_width(_str1)/2;
	} else {
		_stc.wl = string_width(_str1 + " ");
		_stc.wr = string_width(_str2 + " ");
	}
	
	//is mouse hovering over a menu entry
	var _hovering_over_text = false;
	//should mouse control the menu
	if mouse_y >= menu_y_pos and mouse_y <= menu_y_pos + _gap * _size {
		//check which menu entry we are over
		if mouse_y > _stc.y and mouse_y < _stc.y + _stc.h {
			//check x position
				if mouse_x > menu_x_pos - _stc.wl and mouse_x < menu_x_pos + _stc.wr {
					_col = c_teal;
					_hovering_over_text = true;
				}
		}

	}

	//is this the current index? if so highlight it
	if index == i _col = c_teal;
	
	//update the index with mouse position if this is the selected text
	if _col = c_teal {
		//update index
		index = i;
		//are we clicking this entry and over the text?
		if mouse_check_button_pressed(mb_left) and _hovering_over_text {
			//set menu select to true
			var _select =  true;
			var _hmove = 0;
			//if menu entry is an array, allow movement
			if is_array(menu[sub_menu][i]){
				//increment the array depending on where we clicked
				if mouse_x < menu_x_pos - _stc.wl + click_area_w _hmove = -1;
				else if mouse_x > menu_x_pos - click_area_w and mouse_x < menu_x_pos var _hmove = 1;
			}
			process_menu(_select, _hmove);
			
			//update the size as we could be in a new submenu
			_size = array_length(menu[sub_menu]);
		}
	}
	
	//draw the text 
	if _str2 == "" {
		//simple entry
		draw_set_halign(fa_center);
		draw_text_color(menu_x_pos, menu_y_pos + _gap * i, _str1 + " ", _col, _col, _col, _col, 1);
	}	else {
			//array entry
			draw_set_halign(fa_right);
			draw_text_color(menu_x_pos, menu_y_pos + _gap * i, _str1 + " ", _col, _col, _col, _col, 1);
			draw_set_halign(fa_left);
			draw_text_color(menu_x_pos, menu_y_pos + _gap * i, " " + _str2, _col, _col, _col, _col, 1)
	}
}