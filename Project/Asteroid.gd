extends RigidBody3D
class_name Asteroid
var randScale = Vector3(1,1,1)
var randSpeed = 20.0

func _ready():
	randScale = Vector3(randf_range(0.5, 2.5),randf_range(0.5, 2.5),randf_range(0.5, 2.5))
	scale = randScale
	randSpeed = randf_range(20.0, 40.0)
	apply_impulse(Vector3(0,0,randSpeed))
	

func  _physics_process(delta):
	scale = randScale
