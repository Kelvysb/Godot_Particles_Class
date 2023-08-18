extends RigidBody3D
@export var Speed = 2.0
@export var Max_Speed = 30.0
@export var Friction = 1.0
@export var Max_Rotate = 20.0
@export var Rotate_Speed = 0.3
@onready var star_ship = $StarShip

func _ready():
	pass

func _process(delta):
	
	if(Input.is_action_just_pressed("fire")):
		Fire()
	
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = Vector3(input_dir.x, 0, input_dir.y).normalized()
	var velocity = linear_velocity
	if direction:
		velocity.x = direction.x * Speed
		velocity.z = direction.z * Speed		
		if(absf(linear_velocity.x) > Max_Speed):		
			velocity.x = 0
		if(absf(linear_velocity.z) > Max_Speed):		
			velocity.z = 0
		
		apply_impulse(velocity);
	else:
		linear_velocity.x = move_toward(velocity.x, 0, Friction)
		linear_velocity.z = move_toward(velocity.z, 0, Friction)
		
	if(linear_velocity.x < 0):
		star_ship.rotation.z = lerp_angle(star_ship.rotation.z, deg_to_rad(Max_Rotate) , Rotate_Speed)
	elif(linear_velocity.x > 0):
		star_ship.rotation.z = lerp_angle(star_ship.rotation.z, deg_to_rad(-Max_Rotate) , Rotate_Speed)
	else:
		star_ship.rotation.z = lerp_angle(star_ship.rotation.z, 0 , Rotate_Speed)
	
func Fire():
	pass
