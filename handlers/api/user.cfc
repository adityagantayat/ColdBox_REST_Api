/**
 * I am a new handler
 */
component extends="coldbox.system.RestHandler"{
	// ORMReload();
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
	/**
* My RESTFul Event Handler
*/

	
	// DI
	property name="UserService" inject="UserService";

	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}

	/**
	* List All Content
	*/
	any function index( event, rc, prc ){
		writeDump("Hello user") ;
}
	any function view( event, rc, prc ){
		prc.response.setData( userService.getAll() );
	}
	
	/**
	* Save A Contact
	*/
	any function save( event, rc, prc ){
		var requestBody = event.getHTTPContent( json=true );
		var sContacts 	= contactService.save( requestBody.id, requestBody );
		prc.response.setData( sContacts );
	}

	/**
	* Delete An Existing Contact
	*/
	any function remove( event, rc, prc ){
		var sContacts = contactService.remove( rc.contactID );
		prc.response.setData( sContacts );
	}
	


}
