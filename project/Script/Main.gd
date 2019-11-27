extends Node

#Default error code if something fails
var error = 0

func _ready():
	#Print to Godot output
	print("Game Over!")
	
	#Print to stdout
	printraw("Game Over!")
	
	#Print to stderr
	printerr("ERROR CODE: " + String(error))
	
	#Print a warning to the Godot Debugger
	push_warning("WARNING: This is a warning message")
	
	#Print an error to the Godot Debugger
	push_error("ERROR_CODE: " + String(error))