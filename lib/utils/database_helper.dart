import 'package:school/models/annoucment.dart';
import 'package:school/models/student.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';




class DatabaseHelper {

	static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _database;                // Singleton Database

	String noteTable = 'note_table';
	String colId = 'id';
	String colTitle = 'title';
	String colDescription = 'description';
  
  
  String colIdstudent = 'ids';
  String studentTable = 'student_table';
	String colname = 'name';
	String colpassword = 'password';
  String colage ='age';
  String colaca = 'academic';
  String colar = 'arabic';
  String colen = 'english';
  String colmath = 'math';
  String colsecond = 'second';
   String colsubject = 'subject';
     String colactivity = 'activity';
  // String colper = 'per';

	DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

	factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
		}
		return _databaseHelper;
	}

	Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
	}

	Future<Database> initializeDatabase() async {
		// Get the directory path for both Android and iOS to store database.
		Directory directory = await getApplicationDocumentsDirectory();
		String path = directory.path + 'school.db';

		// Open/create the database at a given path
		var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
		return notesDatabase;
	}

	void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
				'$colDescription TEXT)',
        );
    
		await db.execute('CREATE TABLE $studentTable($colIdstudent INTEGER PRIMARY KEY AUTOINCREMENT, $colname TEXT, '
				'$colpassword TEXT, $colage TEXT, $colaca TEXT, $colar TEXT, $colen TEXT, $colmath TEXT, $colsecond TEXT, $colsubject TEXT,$colactivity TEXT )',
        );    
	}

	// Fetch Operation: Get all note objects from database
	Future<List<Map<String, dynamic>>> getNoteMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
		var result = await db.query(noteTable);
		return result;
	}

	// Insert Operation: Insert a Note object to database
	Future<int> insertNote(Annoucment note) async {
		Database db = await this.database;
		var result = await db.insert(noteTable, note.toMap());
		return result;
	}

	// Update Operation: Update a Note object and save it to database
	Future<int> updateNote(Annoucment note) async {
		var db = await this.database;
		var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
		return result;
	}

	// Delete Operation: Delete a Note object from database
	Future<int> deleteNote(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
		return result;
	}

	// Get number of Note objects in database
	Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

	// Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
	Future<List<Annoucment>> getNoteList() async {

		var noteMapList = await getNoteMapList(); // Get 'Map List' from database
		int count = noteMapList.length;         // Count the number of map entries in db table

		List<Annoucment> noteList = List<Annoucment>();
		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			noteList.add(Annoucment.fromMapObject(noteMapList[i]));
		}

		return noteList;
	}










          //______________STUDENT CRUD__________________//


	Future<List<Map<String, dynamic>>> getStudentMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
		var result = await db.query(studentTable);
		return result;
	}
  	// Insert Operation: Insert a Note object to database
	Future<int> insertStudent(Student student) async {
		Database db = await this.database;
		var result = await db.insert(studentTable, student.toMap());
		return result;
	}

	// Update Operation: Update a Note object and save it to database
	Future<int> updateStudent(Student student) async {
		var db = await this.database;
		var result = await db.update(studentTable, student.toMap(), where: '$colIdstudent = ?', whereArgs: [student.id]);
		return result;
	}
  	Future<int> getCountStudent() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $studentTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}
  Future<List<Student>> getStudentList() async {

		var noteMapList = await getStudentMapList(); // Get 'Map List' from database
		int count = noteMapList.length;         // Count the number of map entries in db table

		List<Student> noteList = List<Student>();
		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			noteList.add(Student.fromMapObject(noteMapList[i]));
		}
 
		return noteList;
	}
  

}







