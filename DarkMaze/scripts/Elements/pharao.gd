extends Monster

class_name Pharao


func activate():
	_on_timer = true
	$AnimatedSprite.play("Walking")
	$AudioPharao.play()
	$Timer.start()


func _on_Timer_timeout():
	_on_timer = false
	_active = true
	if !$AudioPharao.playing:
		$AudioPharao.play()
