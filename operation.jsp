<!DOCTYPE html>
<html lang="en">
 <head>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Let's Connect to our server</title>
  		<link href="css/bootstrap.min.css" rel="stylesheet" >
		<link href="css/style.css" rel="stylesheet" >
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.min.js"></script>
		
 </head>

 <body>
    <nav class = "navbar navbar-expand-sm bg-primary navbar-dark">
			<div class= "container">
				<div class="navbar-header">
					<h1><a class = "navbar-brand" href="#">Managing Portal of ESXi Server</a></h1>
				</div>
			
	</nav>
		
	<div class="container">
		<div class="formsection">
	<h2 class="text-center">Let's Explore with VMs</h2>
			<form name="myForm" >
			<div class="form-group">
				 <label>Let's Check the  VMs Status:</label><br> 
					<a href="Status.jsp">Get VMs</a>
				</div>
				<div class="form-group">
					<label>Name of Machine to be ShutDown:</label>
					<input id="poweroffname" type="text" placeholder="Enter name" maxlength=20 class="form-control"  id="poweroffname" required><br>
					<input type="button" id="btnshutdown" value="ShutDown" class="btn btn-primary">
				</div>
				<div class="form-group">
					<label>Name of Machine to be Powered-on:</label>
					<input id="poweronname" type="text" placeholder="Enter name" maxlength=20 class="form-control" id="poweronname" required><br>
					<input type="button" id="btnpoweron" value="Power-on" class="btn btn-primary">
				</div>
				<div class="form-group">
					<label>Result:</label><br>
					<textarea id="comment" name="comment" maxlength=500 rows=15 cols=25 class="form-control"></textarea><br>
					<input type="button" id="btnstatus" value="Get Status of Machines" class="btn btn-primary">
				</div>
			 
			</form>
		</div>
	</div>
   
 </body>
</html>