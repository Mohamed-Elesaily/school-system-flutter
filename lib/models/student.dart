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
String _subject;
String _activity;
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
String get subject => _subject;
String get activity => _activity;

set name(String name){
  this._name = name;
}
set password(String password){

  this._password = password;
}
set subject(String subject){
  this._subject = subject;
}
set activity(String activity){
  this._activity = activity;
}

set age(String age) {this._age = age;}
set academic(String aca) {this._academic = aca; }

set arabic(String ar){this._arabic =ar;}
set english(String en){this._english=en;}
set math(String math){this._math = math;}
set second(String second){this._second = second;}

Map<String,dynamic> toMap(){
  var map = Map<String, dynamic>();
  if(id != null){
    map['id'] =_id;
  }
  map['name'] = _name;
  map['password'] = _password;
  map['age'] = _age;
  map['academic'] = _academic;

  map['arabic'] = this._arabic;
  map['english'] = this._english;
  map['math'] = this._math;
  map['second'] = this._second;
  map['subject'] = this._subject;
  map['activity'] = this._activity;
return map;
}

Student.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._name = map['name'];
		this._password = map['password'];
    this._academic = map['academic'];
    this._age = map['age'];

    this._arabic = map['arabic'];
    this._english = map['english'];
    this._math = map['math'];
    this._second = map['second'];
    this._activity = map['activity'];
    this._subject = map['subject'];
	}

}