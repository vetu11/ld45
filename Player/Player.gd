extends KinematicBody2D

enum Directions {UP, DOWN, LEFT, RIGHT}

export(float) var velocity = 100


var Vectors = [Vector2(0, -1), Vector2(0, 1), Vector2(-1, 0), Vector2(1, 0)]
var last_velocity: Vector2

func _process(delta):
	
	var new_velocity := last_velocity
	var input_vector := Vector2()
	
	if Input.is_action_pressed("up"):
		input_vector += Vectors[Directions.UP]
		
	if Input.is_action_pressed("down"):
		input_vector += Vectors[Directions.DOWN]
	
	if Input.is_action_pressed("left"):
		input_vector += Vectors[Directions.LEFT]
	
	if Input.is_action_pressed("right"):
		input_vector += Vectors[Directions.RIGHT]
		
	new_velocity += input_vector.normalized() * velocity * delta
	
	last_velocity = move_and_slide(new_velocity)
