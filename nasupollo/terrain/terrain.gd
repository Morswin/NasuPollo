class_name Terrain
extends StaticBody3D


const VOXEL = preload("res://voxel/voxel.tscn")


func generate_terrain_voxels():
	var x: float = -5.0
	while x < 5.0:
		var y: float = 2.0
		while y > -2.0:
			var z: float = -0.5
			while z < 0.5:
				var _next_terrain_voxel: Voxel = VOXEL.instantiate()
				_next_terrain_voxel.voxel_index = Vector3(x + 0.125, y -0.125, z + 0.125)
				add_child(_next_terrain_voxel)
				z += 0.25
			y -= 0.25
		x += 0.25
