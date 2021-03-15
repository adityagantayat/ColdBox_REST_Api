/**
 * I am a new handler
 */
component extends="coldbox.system.RestHandler"{
	property name="userService" inject="UserService";

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use

	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

	/**
	 * index
	 */
	//  student function init(){
	// 	 return this;
	//  }
	 

	function index( event, rc, prc ){
	
		return userService.getAll(#rc.id#) ;
	}

	/**
	 * view
	 */
	function view( event, rc, prc ){
		
		// userService.save(0,rc.data);
	}

	/**
	 * save
	 */
	function save( event, rc, prc ){
	
		data=structNew();
		data.firstname=#rc.firstname#;
		data.lastname=#rc.lastname#;
		data.email=#rc.email#;
		data.dob=#rc.dob#;
		data.phone=#rc.phone#;
		data.password=#rc.password#;
		data.gender=#rc.gender#;
		data.language=#rc.language#;
		data.course=#rc.course#;
		userService.save(#rc.id#,data);
	}

	/**
	 * remove
	 */
	function remove( event, rc, prc ){
		userService.remove(#rc.id#);
		
	}



}
