component {

	function configure() {
		// Set Full Rewrites
		setFullRewrites( true );

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 *
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 *
		 */

		// A nice healthcheck route example
		route( "/healthcheck", function( event, rc, prc ) {
			return "Ok!";
		} );
		route( "/hello", function( event, rc, prc ) {
			return "hello world!";
		} );
		
		route("/api/user/:id").toHandler("student.index");
		route("/api/save/:id").toHandler("student.save");
		route("/api/delete/:id").toHandler("student.remove");

		get( "/api/echo", "Echo.index" );

		// API Authentication Routes
		post( "/api/login", "Auth.login" );
		post( "/api/logout", "Auth.logout" );
		post( "/api/register", "Auth.register" );

		// API Secured Routes
		get( "/api/whoami", "Echo.whoami" );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
