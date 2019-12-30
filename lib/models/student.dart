class Student{

int _id;
String _name;
String _password;
String _age;
String _academic;
String _arabic;
String _english;
String _math;
String _second;
Student();

int get id => _id;
String get password => _password;
String get name => _name;
String get age => _age;
String get academic => _academic;
String get arabic =>_arabic;
String get english =>_english;
String get math => _math;
String get second => _second;
set name(String name){
  this._name = name;
}
set password(String password){

  this._password = password;
}
set age(String age) {this._age = age;}
set academic(String aca) {this._academic = aca; }
set arabic(String ar){this._arabic =ar;}
set english(String en){this._english=en;}
set math(String math){this._math = math;}


Map<String,dynamic> toMap(){
  var map = Map<String, dynamic>();
  if(id != null){
    map['id'] =_id;
  }
  map['name'] = _name;
  map['password'] = _password;
return map;
}

Student.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._name = map['name'];
		this._password = map['password'];
	}

}