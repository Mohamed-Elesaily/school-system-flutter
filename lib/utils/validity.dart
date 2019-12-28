class Check{
String _name,_password,_priority;
List<Map<String,String>> _login =[
{
  "name":"admin",
  "password":"1234",
  "priority":"0"   //admin
}
];
Check();
Check.addStudent(this._name,this._password,this._priority){
  _login.add({
    "name":"$_name",
    "password":"$_password",
    "priority":"$_priority"   //admin
  });
}

Check.addTeacher(this._name,this._password,this._priority){
  _login.add({
    "name":"$_name",
    "password":"$_password",
    "priority":"$_priority"   //admin
  });
}

bool check(String name,String password){

    for(int i = 0;i<_login.length;i++){
        if(name == _login[i]["name"]){
            if(password == _login[i]["password"]){
                return true;
            }          
        }

    }
  return false;
}

}