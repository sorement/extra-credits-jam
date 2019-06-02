/// @description Movement

// Check which keys are pressed
// Left Keys ( Left Arrow and A )
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
// Right Keys ( Right Arrow and D )
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
// Up Keys ( Up Arrow and W )
key_up = keyboard_check(vk_up) or keyboard_check(ord("W"));
// Down Keys ( Down Arrow and S )
key_down = keyboard_check(vk_down) or keyboard_check(ord("S"));

// Keyboard Movement Calculation
// Calculate the direction of the movement for X ( 1 = Right , 0 = Still , -1 = Left )
var moveX = key_right - key_left;
// Calculate the direction of the movement for Y ( 1 = Down , 0 = Still , -1 = Up )
var moveY = key_down - key_up;

// Speed of Player
// Calculate the ingame movement with the set walking speed ( for X )
xsp = moveX * walksp;
// Calculate the ingame movement with the set walking speed ( for Y )
ysp = moveY * walksp;

// In-Game Movement with Collision Check
// Predict if a rock will be in the way of the player ( X )
if (place_meeting(x+xsp,y,o_rock)) {
	while (!place_meeting(x+sign(xsp),y,o_rock)) {
		x = x + sign(xsp);
	}
	xsp = 0;
}
// Predict if a tree will be in the way of the player ( X )
if (place_meeting(x+xsp,y,o_tree)) {
	while (!place_meeting(x+sign(xsp),y,o_tree)) {
		x = x + sign(xsp);
	}
	xsp = 0;
}
// In-Game X Movement
x = x + xsp;
// Predict if a rock will be in the way of the player ( Y )
if (place_meeting(x,y+ysp,o_rock)) {
	while (!place_meeting(x,y+sign(ysp),o_rock)) {
		y = y + sign(ysp);
	}
	ysp = 0;
}
// Predict if a tree will be in the way of the player ( Y )
if (place_meeting(x,y+ysp,o_tree)) {
	while (!place_meeting(x,y+sign(ysp),o_tree)) {
		y = y + sign(ysp);
	}
	ysp = 0;
}
// In-Game Y Movement
y = y + ysp;

// Animation
// - No Movement
if ((xsp == 0) and (ysp == 0)) {
	sprite_index = s_idle;
	image_speed = 0;
	image_index = 0;
}
// - X Movement
if ((!(xsp == 0))) {
	sprite_index = s_right;
	image_speed = 1;
	if (xsp == 1) {
		image_xscale = 1;
	}
	if (xsp == -1) {
		image_xscale = -1;
	}
}
// - Y Movement
if ((!(ysp == 0)) and (xsp == 0)) {
	if (ysp == 1) {
		sprite_index = s_front;
		image_speed = 1;
	} 
	if (ysp == -1) {
		sprite_index = s_front;		// Change to s_back (DOes not exist as of coding)
		image_speed = 1;
	}
}