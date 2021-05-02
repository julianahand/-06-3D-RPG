extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Welcome to training camp newbie! (Press E to continue)"
	,"It may not look like much but it will get the job done."
	,"See these targets right here? These are the enimes that you will face once you step out of the safety of our camp."
	,"Shoot all of the targets before time runs out to defeat your enemy."
	,"Remember they could be anywhere."
	,"The challenge starts as soon as you press E."
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")


func _on_Area_body_entered(_body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(_body):
	Dialogue.hide_dialogue()
	
func finished():
	get_node("/root/Game/Target_container").show()
	Global.time = 120
	Global.update_time()
	get_node("/root/GameUI/Timer").start()
