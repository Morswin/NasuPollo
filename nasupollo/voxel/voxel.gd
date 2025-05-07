class_name Voxel
extends Node3D


const VOXEL_TERRAIN = preload("res://voxel/voxel_terrain.tres")

var voxel_index: Vector3 = Vector3.ZERO

@onready var mesh = $voxel/Cube


func _ready():
	mesh.set_surface_override_material(0, VOXEL_TERRAIN)

func _process(_delta):
	position = Vector3(
		voxel_index.x,
		voxel_index.y,
		voxel_index.z + (sin(Time.get_ticks_msec() / 1000.0 + sqrt(voxel_index.x**2 + (voxel_index.y*2)**2)) / 8)
	)
