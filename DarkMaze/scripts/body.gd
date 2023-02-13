extends KinematicBody2D

class_name Body

var velocity : Vector2
var direction : Vector2
var speed : int

func _init(speed_ := 0):
	velocity = Vector2()
	direction = Vector2()
	speed = speed_

func check_animation():
	if velocity:
		$AnimatedSprite.play("Walking")
	else:
		$AnimatedSprite.play("Iddle")

func _physics_process(_delta):
	check_animation()
