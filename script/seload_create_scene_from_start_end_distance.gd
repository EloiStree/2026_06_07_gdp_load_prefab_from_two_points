class_name SELoadCreateSceneFromStartEndDistance
extends Node3D

@export var _scenes_to_create:SELoadGroupofSceneDistanceThresholdResource

func create_scene_from_start_end_points(start:Vector3,end:Vector3):
	if _scenes_to_create==null:
		return
	var direction :Vector3 =Vector3(end.x,0,end.z)  - Vector3(start.x,0,start.z) 
	var direction_flat:Vector3 = Vector3(direction.x , 0 , direction.z)
	var angle :float = Vector3(1,0,0).signed_angle_to(direction_flat,Vector3.UP) #- deg_to_rad(90)
	var distance_segment:float= direction.length()
	print("Angle: ",angle,"Distance: ",distance_segment)
	for scene in _scenes_to_create._scenes_group:
		if scene and scene.is_distance_in_range(distance_segment):
			scene.create_scene_at_global_position_with_angle(start,rad_to_deg(angle) , get_tree().current_scene)
