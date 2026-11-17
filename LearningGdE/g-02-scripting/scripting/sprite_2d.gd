extends Sprite2D

var speed = 400 # px per sec
var angular_speed = PI # pxrad per sec

func _init():
	print("Hellow orld!")

func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1
	rotation += direction * angular_speed * delta
	#var velocity = Vector2.UP.rotated(rotation) * speed
	#position += direction * velocity * delta


func _on_button_pressed() -> void:
	pass # Replace with function body.
