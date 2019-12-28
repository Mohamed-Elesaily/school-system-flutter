class Annoucment{
  
	int _id;
	String _title;
	String _description;


	Annoucment(this._title,this._description);

	Annoucment.withId(this._id, this._title,[this._description]);

	int get id => _id;

	String get title => _title;

	String get description => _description;

	set title(String newTitle) {
		if (newTitle.length <= 255) {
			this._title = newTitle;
		}
	}

	set description(String newDescription) {
		if (newDescription.length <= 255) {
			this._description = newDescription;
		}
	}

	// Convert a Annoucment object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['title'] = _title;
		map['description'] = _description;
		return map;
	}

	// Extract a Annoucment object from a Map object
	Annoucment.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._title = map['title'];
		this._description = map['description'];
	}
}