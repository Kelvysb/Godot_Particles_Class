extends RigidBody3D
class_name Asteroid

# Called when the node enters the scene tree for the first time.
func _ready():
	var randScale = randf_range(0.5, 2.5)
	scale.x = randScale
	scale.y = randScale
	scale.z = randScale
	var randSpeed = randf_range(20.0, 40.0)
	apply_impulse(Vector3(0,0,randSpeed))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
