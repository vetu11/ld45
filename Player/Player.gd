extends KinematicBody2D

enum Directions {UP, DOWN, LEFT, RIGHT}

export(float) var velocity = 100
export(float) var minVelocity = 30
export(float) var minDeltaVelocity = 0.5
export(bool) var activate_ground_controls = false
export(float) var ground_velocity = 300
export(float) var ground_jump = 600
export(float) var ground_gravity = 900
export(float) var bendFallVelocity = 1000
export(PackedScene) var PauseMenu = preload("res://Menus/PauseMenu.tscn")

var Vectors = [Vector2(0, -1), Vector2(0, 1), Vector2(-1, 0), Vector2(1, 0)]
var last_velocity: Vector2

func space_controls(delta):
	var new_velocity := last_velocity
	var input_vector := Vector2()
	
	if Input.is_action_pressed("up"):
		input_vector += Vectors[Directions.UP]
	if Input.is_action_pressed("down"):
		input_vector += Vectors[Directions.DOWN]
	if Input.is_action_pressed("left"):
		$Sprite.flip_h = true
		input_vector += Vectors[Directions.LEFT]
	if Input.is_action_pressed("right"):
		$Sprite.flip_h = false
		input_vector += Vectors[Directions.RIGHT]

	# Calculating new velocity
	new_velocity += input_vector.normalized() * velocity * delta
	
	# If the velocity tends to zero, just make it zero
	if (abs(new_velocity.x) < minVelocity) && (abs(last_velocity.x - new_velocity.x) < minDeltaVelocity):
		new_velocity.x = 0
	if (abs(new_velocity.y) < minVelocity) && (abs(last_velocity.y - new_velocity.y) < minDeltaVelocity):
		new_velocity.y = 0
	
	# Applying new velocity
	last_velocity = move_and_slide(new_velocity)

var validDoubleJump = false
func ground_controls(delta):
	var new_velocity := Vector2()
	new_velocity.y = last_velocity.y + ground_gravity * delta
	
	if Input.is_action_pressed("ground_right"):
		new_velocity += Vectors[Directions.RIGHT] * ground_velocity
		$Sprite.flip_h = false
		if is_on_floor(): $Sprite/AnimationPlayer.current_animation = "walk"
	elif Input.is_action_pressed("ground_left"):
		new_velocity += Vectors[Directions.LEFT] * ground_velocity
		$Sprite.flip_h = true
		if is_on_floor(): $Sprite/AnimationPlayer.current_animation = "walk"
	elif is_on_floor():
		$Sprite/AnimationPlayer.current_animation = "idle"
	
	if Input.is_action_just_pressed("ground_jump"):
		if is_on_floor():
			$Sprite/AnimationPlayer.current_animation = "jump"
			new_velocity.y = -ground_jump
			validDoubleJump = true
		elif validDoubleJump:
			$Sprite/AnimationPlayer.current_animation = "jump"
			new_velocity.y = -ground_jump
			validDoubleJump = false
	
#	if Input.is_action_pressed("ground_bend"):
#		$Sprite/AnimationPlayer.current_animation = "bend"
#		$Stand.disabled = true
#		$Bend.disabled = false
#		if !is_on_floor(): new_velocity.x = 0
#		new_velocity.y = bendFallVelocity
	
#	if Input.is_action_just_released("ground_bend"):
#		$Sprite/AnimationPlayer.play_backwards("bend")
#		$Bend.disabled = true
#		$Stand.disabled = false
	
	last_velocity = move_and_slide(new_velocity, Vectors[Directions.UP])

var IWasPaused = false
func resume():
	IWasPaused = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if !IWasPaused:
			IWasPaused = true
			get_tree().paused = true
			var PauseMenu_ = PauseMenu.instance()
			PauseMenu_.connect("resume", self, "resume")
			SceneSwitcher.current_scene.add_child(PauseMenu_)
		else: IWasPaused = false

	if activate_ground_controls:
		ground_controls(delta)
	else:
		space_controls(delta)

func _ready():
	$Sprite/AnimationPlayer.play("idle")
