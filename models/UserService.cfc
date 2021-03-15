/**
* I manage contacts
*/
component accessors="true" singleton{
	
	/**
	* Contacts DB
	*/
    // property name="contacts";
    /**
    * The last ID tracker
    */
    // property name="lastID";
   
    /**
     * Constructor
     */
	// UserService function init(){

	// 	record= queryExecute("SELECT * FROM student", {datasource= "restdb"});
	// 	variables.contacts= serializeJSON(record);
	// 	writeDump(variables.contacts);
	// 	return variables.contacts;
	// }
	
	/**
	* Get all contacts
	*/
	struct function getAll(required id){
		// record= serializeJSON(variables.contacts) ;
		// return record;
		// return "hello";
		if(id eq 0){
			record= queryExecute("SELECT * FROM student", {datasource= "restdb", returntype="struct", columnkey="idstudent"});
			var myStruct = StructNew();
			myStruct.Columns = ListToArray( record.ColumnList );
			myStruct.QueryArray = ArrayNew( 1 );
			for (myStruct.RowIndex = 1 ; myStruct.RowIndex LTE record.RecordCount ; myStruct.RowIndex = (myStruct.RowIndex + 1)){
				myStruct.Row = StructNew();
				for (myStruct.ColumnIndex = 1 ; myStruct.ColumnIndex LTE ArrayLen( myStruct.Columns ) ; myStruct.ColumnIndex = (myStruct.ColumnIndex + 1)){
					myStruct.ColumnName = myStruct.Columns[ myStruct.ColumnIndex ];
					myStruct.Row[ myStruct.ColumnName ] = record[ myStruct.ColumnName ][ myStruct.RowIndex ];
					}
				ArrayAppend( myStruct.QueryArray, myStruct.Row );
			}
			// writeDump(arrayToStruct(myStruct.QueryArray));
			returnStruct= structNew();
			cfloop(array=#myStruct.QueryArray#, index="item"){
				returnStruct[item.idstudent]=item;
			}
		}
		else{
			record= queryExecute("SELECT * FROM student WHERE idstudent=?",[id], {datasource= "restdb", returntype="struct", columnkey="idstudent"});
			var returnStruct = StructNew();
			returnStruct.firstname=record.firstname;
			returnStruct.lastname=record.lastname;
			returnStruct.email=record.email;
			returnStruct.dob=record.dob;
			returnStruct.password=record.password;
			returnStruct.gender=record.gender;
			returnStruct.language=record.language;
			returnStruct.course=record.course;
		}
		// writeDump(returnStruct);
		return returnStruct;
		
	}

	/**
	* save and return all contacts
	* @contactID The id to save/update
	* @data The data record
	*/
	any function save( required id, required data ){
		// insert, move lastID
		// writeDump(arguments.data);
		if(id eq 0){
		queryExecute("insert into `student` (
                    `firstname`,
                   `lastname`,
                   `email`,
                   `phone`,
                   `dob`,
                   `password`,
                   `gender`,
                   `language`,
                   `course`
                ) values (?,?,?,?,?,?,?,?,?)",[
					arguments.data.firstname,
					arguments.data.lastname,
					arguments.data.email,
					arguments.data.phone,
					arguments.data.dob,
					arguments.data.password,
					arguments.data.gender,
					arguments.data.language,
					arguments.data.course
				]);
		}
		else{
			queryExecute("UPDATE `student`
			SET `firstname`=?,
                   `lastname`=?,
                   `email`=?,
                   `phone`=?,
                   `dob`=?,
                   `password`=?,
                   `gender`=?,
                   `language`=?,
                   `course`=?
				   WHERE idstudent=? ",[arguments.data.firstname,
					arguments.data.lastname,
					arguments.data.email,
					arguments.data.phone,
					arguments.data.dob,
					arguments.data.password,
					arguments.data.gender,
					arguments.data.language,
					arguments.data.course,
					id]);
		}
		// if( arguments.id == 0 ){
		// 	arguments.id = variables.lastID;
		// 	arguments.data.id 	= variables.lastID;
		// 	variables.lastID++;
		// } 

		// // Store data
		// variables.contacts[ arguments.contactID ] = arguments.data;
		
		// return variables.contacts;
	}

	/**
	* Remove a contact
	* @contactID The incoming ID
	*/
	void function remove( required ID ){
		 queryExecute("DELETE FROM student WHERE idstudent=?",[ID]);
		// writeDump(ID);
		// abort;
	}

}