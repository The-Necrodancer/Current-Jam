extends Node2D
class_name Wire

@export var spark : PackedScene
@export var SparkPath : Line2D

@export var auto_start : bool = false
@export var move_speed : float = 150 #the constant velocity of the node

var cur_spark = null

var cur_index = 0

var is_traveling = false

func _ready() -> void:
	if(auto_start):
		call_deferred("start") #make it on "level start" later when we implement that

func _physics_process(delta: float) -> void:
	if(is_traveling == false):
		return
	
	
	cur_spark.global_position += move_speed * delta * (SparkPath.get_point_position(cur_index + 1) - SparkPath.get_point_position(cur_index)).normalized() #get movement vector and normalize it for direction
	
	#change target point
	if (cur_spark.global_position - SparkPath.get_point_position(cur_index+1)).length() < move_speed * 0.02:
		cur_index += 1
		if(cur_index + 1 >= SparkPath.get_point_count()):
			end()
			return
		cur_spark.global_position = SparkPath.get_point_position(cur_index)

func start():
	cur_spark = spark.instantiate()
	self.call_deferred("add_child",cur_spark)
	
	cur_spark.global_position = SparkPath.get_point_position(0)
	cur_index = 0
	is_traveling = true

func end():
	cur_spark.queue_free()
	is_traveling = false
