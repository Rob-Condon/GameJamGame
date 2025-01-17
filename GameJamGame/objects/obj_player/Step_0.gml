/// @description Insert description here
// You can write your code in this editor

object_set_mask(self, spr_PlayerCharacter);
input_right = keyboard_check(ord("D"));
input_left = keyboard_check(ord("A"));
input_up = keyboard_check(ord("W"));
input_down = keyboard_check(ord("S"));
input_interact = keyboard_check_pressed(vk_space);
if(room != level5) {
	var inv_grid = obj_inventory.ds_inventory;
	//Interact
	if(input_interact) {
		if (active_textbox = false){
			var npc = collision_rectangle(x - radius, y - radius, x + radius, y + radius, obj_npc, false, false)
			if(npc != noone) {
				with(npc){
					if(talked_too = false){
						create_textbox(text);
						talked_too = true;
						other.TalkedToNPC += 1;
						if (obj_inventory.filled_slot < obj_inventory.inv_slots) {
							inv_grid[# 0, obj_inventory.filled_slot] = MusicHeld;
							inv_grid[# 1, obj_inventory.filled_slot] = SpriteHeld;
							obj_inventory.filled_slot += 1;
						}
					}
					else{
						with(npc){
						
							create_textbox(text,)
						}
					}
				
				}
			}
			active_textbox = true;
		}
		else{
			if(!instance_exists(obj_textbox)){
				active_textbox = false;
			}
		
		}
	}
}


//updating movement
if (global.Tab == true){
	move_x = 0;
	move_y = 0;
	draw_wall = true;
}
else{
	draw_wall = false;
	move_x = (input_right - input_left) * player_speed;
	move_y = (input_down - input_up) * player_speed;
}

//Collision Checks

//Vertical
if (move_y != 0){
	if(place_meeting(x, y + move_y, obj_wall)) {
		repeat (abs(move_y)) {
			if(!place_meeting(x, y + sign(move_y), obj_wall)) {
				y += sign(move_y);
			}
			else { break; }
		}
		move_y = 0;
	}
}

//Horizontal
if (move_x != 0) {
	if(place_meeting(x + move_x, y, obj_wall)) {
		repeat (abs(move_x)) {
			if(!place_meeting(x + sign(move_x), y, obj_wall)) {
				x += sign(move_x);
			}
			else { break; }
		}
		move_x = 0;
	}
}


if(room == level5) {
	if(move_y >= 0 or y < 1652 or move_x != 0) {
		move_x = 0;
		move_y = 0;
	}
	player_speed = 1;
	sprite_index = spr_PlayerBackwards;
}
x += move_x;
y += move_y;

if (global.song_complete = true) and (global.Tab = false) and (stop = false){
	create_textbox(text, false);
	stop = true;
}
	
if(move_x == 0 and move_y == 0) {
	image_speed = 0;
	image_index = 0;
} else {
	image_speed  = 1;	
}

