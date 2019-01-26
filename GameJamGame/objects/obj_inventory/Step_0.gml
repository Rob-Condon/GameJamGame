/// @description Insert description here
// You can write your code in this editor

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size + x_buffer) * scale;
var cell_ybuff = (cell_size + y_buffer) * scale;

var i_mousex = mousex - 16 - slots_x;
var i_mousey = mousey - 16 - slots_y;

var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;

if ( nx >= 0 and nx < inv_slots_width and ny >= 0 and ny < inv_slots_height) {
	
	m_slotx = nx;
	m_sloty = ny;
};

//Set selected slot to mouse pos

selected_slot = min(inv_slots-1, m_slotx + (m_sloty * inv_slots_width));


//i pick up

var inv_grid = ds_inventory;
var ss_item = inv_grid[# 0, selected_slot];

if (pickup_slot != -1) {
	if (mouse_check_button_pressed(mb_left)){
		if(ss_item == item.none) {
		inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
		
		inv_grid[# 0, pickup_slot] = item.none;
		pickup_slot = -1;
		} else {
		inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
		
		inv_grid[# 0, pickup_slot] = ss_item;
		
		pickup_slot = -1;
	}
}
}

else if (ss_item != item.none) {
	if (mouse_check_button_pressed(mb_right)){
	
	pickup_slot = selected_slot;
	}
}

//if(keyboard_check_pressed(vk_space)) {
//	if (filled_slot < 8) {
//	ds_inventory[# 0, filled_slot] = obj_npc.MusicHeld;
//	filled_slot += 1;
//	} else {exit};
//}

