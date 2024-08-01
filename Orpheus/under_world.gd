extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	Events.emit_signal("request_show_dialog","Hello",preload("res://dialog/man.png"),true)
	await Events.dialog_finished
	Events.emit_signal("request_show_dialog","I am a good guy",preload("res://dialog/man.png"),true)
	await Events.dialog_finished



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
