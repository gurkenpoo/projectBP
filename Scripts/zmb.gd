extends CharacterBody3D

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
var SPEED: float = 3

func _physics_process(_delta):

	var current_location = global_transform.origin #current enemy location
	await get_tree().process_frame
	var next_location = nav_agent.get_next_path_position() #next location the nav agent is directing towards
	var new_velocity = (next_location - current_location).normalized() * SPEED #calculate velocity between current and next location

	

	velocity = new_velocity

	move_and_slide()



func update_target_location(target_location):
	nav_agent.set_target_position(target_location)
	
	

