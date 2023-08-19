extends Node3D

@onready var asteroidClas = preload("res://Asteroid.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var point = get_tree().get_nodes_in_group("spawn").pick_random() as Node3D
	var asteroid = asteroidClas.instantiate()
	add_child(asteroid)
	asteroid.global_position = point.global_position
	
	
	
