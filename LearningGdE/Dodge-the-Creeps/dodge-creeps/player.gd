extends Area2D

# export allows us set this variable in the Inspector
@export var playerSpeed = 400 # pixels/sec
var screen_size               # size of the screen, duh!

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
"""
For the player, we want to:
	1. Check for input
	2. Move in the given direction
	3. Play the appropriate animation
In Gd, using input actoins is generally recommended. The actions are
- move_right, move_left, move_up, move_down, 
Check Project -> Project Settings -> Input Map and add each action.

`$` is syntactic sugar for the `get_node()` method.
"""
func _process(delta: float) -> void:
	# initialize a zero 2D velocity vector. Treat as unit vector?
	var velocity = Vector2.ZERO
	# interrupt-style input state machine
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	# be careful with screen coordinates
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1

	# now update the properties of the Player object.
	# Here, we update the animation.
	# the `$` just refers to a local parameter
	if velocity.length() > 0:
		# normalizing ensures isotropic motion.
		# if not, speed may be faster along diagonals. Prove this!
		velocity = playerSpeed * velocity.normalized()
		# get_node("AinmatedSprite2D").play()
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	# to ensure ti doesn't fall out of bounds
	position = position.clamp(Vector2.ZERO, screen_size)
	
