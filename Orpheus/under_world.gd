extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	call_deferred("dialog")

func dialog():
	Events.emit_signal("request_show_dialog","Hello?",preload("res://dialog/KeanuReevesCop.png"),true)
	await Events.dialog_finished
	Events.emit_signal("request_show_dialog","We got a call...Something about a missing child.",preload("res://dialog/man.png"),false)
	await Events.dialog_finished
	Events.emit_signal("request_show_dialog","A missing child?",preload("res://dialog/KeanuReevesCop.png"),true)
	await Events.dialog_finished
	Events.emit_signal("request_show_dialog","Yeah, the mother was bawling. She said the child likes to go to the park...",preload("res://dialog/man.png"),false)
	await Events.dialog_finished
	Events.emit_signal("request_show_dialog","Okay I'll head down to the park now",preload("res://dialog/KeanuReevesCop.png"),true)
	await Events.dialog_finished 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
