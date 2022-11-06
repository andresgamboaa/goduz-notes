class_name NotesList extends Component

#props: notes
func _init(p:Dictionary):
	super(p)

func view():
	return\
	scrollbox({preset="expand"},[
		hflow({preset="expand", list=props.notes.hash()},
			props.notes.map(func(note):return Note.new({data=note, on_selection_toggled=props.on_note_selection_toggled, key=note.id}))
		)
	])
