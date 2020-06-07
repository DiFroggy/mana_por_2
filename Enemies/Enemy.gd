extends RigidBody2D

#Constants
const STATE_ALIVE = 0
const STATE_DEAD = 1
const WALKING_LEFT = false
const WALKING_RIGHT = true

#Variables
export(float) var default_walk_speed = 400.0
var walk_speed
var direction = 1

var Player = preload("res://Player/Player.gd")

#State Machine
var state = STATE_ALIVE

onready var sprite = get_node("AnimatedSprite")
onready var rc_left = $RayCastLeft
onready var rc_right = $RayCastRight

# Called when the node enters the scene tree for the first time.
func _ready():
	walk_speed = default_walk_speed

func _integrate_forces(s):
	var lv = s.get_linear_velocity()
	
	var wall_side = 0.0
	
	for i in range(s.get_contact_count()):
		var cc = s.get_contact_collider_object(i)
		var dp = s.get_contact_local_normal(i)
		
		if cc:
			if cc is Player and not cc.disabled:
				# hace cosas con el jugador
				print_debug("The player touched me")
				break
		
		if dp.x > 0.9:
			wall_side = 1.0
		elif dp.x < -0.9:
			wall_side = -1.0
	
	if wall_side != 0 and wall_side != direction:
		direction = -direction
		sprite.flip_h = !sprite.flip_h
	if direction < 0 and not rc_left.is_colliding() and rc_right.is_colliding():
		direction = -direction
		sprite.flip_h = !sprite.flip_h
	elif direction > 0 and not rc_right.is_colliding() and rc_left.is_colliding():
		direction = -direction
		sprite.flip_h = !sprite.flip_h
	
	lv.x = direction * walk_speed
	
	s.set_linear_velocity(lv)
