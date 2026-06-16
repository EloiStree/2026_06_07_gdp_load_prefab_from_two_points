class_name SELoadRelocateNodeToStartEnd
extends Node3D
@export var what_to_relocate:Node3D

func relocate_node_from_start_end_points(start:Vector3,end:Vector3):
	if what_to_relocate==null:
		return
		
	what_to_relocate.global_position=Vector3.ZERO
	what_to_relocate.global_rotation=Vector3.ZERO
	start.z*=-1.0
	end.z*=-1.0
	var direction :Vector3 = end - start
	var direction_flat:Vector3 = Vector3(direction.x , 0 , direction.z)
	var angle :float = Vector3(1,0,0).signed_angle_to(direction_flat,Vector3.UP) #- deg_to_rad(90)
	#angle -=90.0
	what_to_relocate.rotate_y(-angle)
	start.z*=-1
	what_to_relocate.global_position = start
	
