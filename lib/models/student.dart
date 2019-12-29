class Student{

int _id;
String _name;
String _password;
String _per;
Student();

int get id => _id;
String get password => _password;
String get name => _name;

set name(String name){
  this._name = name;
}
set password(String password){

  this._password = password;
}

Map<String,dynamic> toMap(){
  var map = Map<String, dynamic>();
  if(id != null){
    map['id'] =_id;
  }
  map['name'] = _name;
  map['password'] = _password;

}

Student.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._name = map['name'];
		this._password = map['password'];
	}

}