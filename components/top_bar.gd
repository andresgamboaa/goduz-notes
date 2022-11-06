class_name TopBar extends Component

func delete_selected_notes():
	call_method(props.on_delete_selected_notes, [])

func view():
	var count = props.notes.filter(func(note): return note.selected).size()
	return\
	hbox({preset="expand-h"}, [
		label({preset="title", text="Notes"}),
		margin({preset="expand-h"}),
		button({on_pressed=delete_selected_notes, text="Delete " +str(count) + (" note" if count==1 else " notes"), visible=count>0})
	])
