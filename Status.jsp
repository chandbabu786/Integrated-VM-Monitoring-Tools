<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Virtualization is Fun</title>
  		<link href="css/bootstrap.min.css" rel="stylesheet" >
		<!--custom style for this template-->
		<link href="css/style.css" rel="stylesheet" >
				<script src="js/jquery-3.3.1.js"></script>
				<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
				$(document).ready(function(){
						$("#btnshutdown").click(function(event){
							var machine_name = $('#poweroffname').val().trim();
							if(machine_name.length==0)
							{
								$('#message').html("Enter the Name of machine to be Powered off");
								return;
							}
							$.ajax({
								url:"poweroff.jsp",
								type:"Post",
								data:{name:machine_name},
								success:function(data){
									$('#comment').html(data);
									$('#poweroffname').val("");
								},
								error:function(){
									$('#message').html("An error occured in request");
								}
							});
						});
						
						$("#btnpoweron").click(function(event){
							var machine_name = $('#poweronname').val().trim();
							if(machine_name.length==0)
							{
								$('#message').html("Enter the Name of machine to be Powered on");
								return;
							}
							$.ajax({
								url:"poweron.jsp",
								type:"Post",
								data:{name:machine_name},
								success:function(data){
									$('#comment').html(data);
									$('#poweronname').val("");
								},
								error:function(){
									$('#message').html("An error occured in request");
								}
							});
						});
				});

		 
		</script>
 </head>
 

 <body>
  <nav class = "navbar navbar-expand-sm bg-primary navbar-dark">
			<div class= "container">
				<div class="navbar-header">
					<a class = "navbar-brand" href="#">Welcome To VMs Status Dashboard</a>
				</div>
			</div>
		</nav>
		
	<div class="container">
		<div class="formsection">
						<%@ page import="java.io.*" %>
						
						<%
							
							try
							{
								File file = new File("C:\\getvm.text");
								BufferedReader br = new BufferedReader(new FileReader(file));
        
								String st;
								while((st=br.readLine())!=null)
								{
									out.println(st+"<br>");
								}
								br.close();
							}
							catch(IOException ex)
							{
									out.println("Error "+ex);
							}
						
						%>
						
					<b>	<p>----------------------------------------------------------------------------------<p></b>
						<h2>Let's Operate VMs </h2>
					<b>	<p>----------------------------------------------------------------------------------<p></b>
					<div class="form-group">
					<label>Name of Machine to be ShutDown:</label>
					<input id="poweroffname" type="text" placeholder="Enter name" maxlength=10 class="form-control"  id="poweroffname" required><br>
					<input type="button" id="btnshutdown" value="ShutDown" class="btn btn-primary" >
				</div>
				 
				<div class="form-group">
					<label>Name of Machine to be Powered-on:</label>
					<input id="poweronname" type="text" placeholder="Enter name" maxlength=10 class="form-control" id="poweronname" required><br>
					<input type="button" id="btnpoweron" value="Power-on" class="btn btn-primary">
				</div>
				 
				<div class="form-group">
					<label>Result:</label><br>
					<textarea id="comment" name="comment" maxlength=100 rows=10 cols=15 class="form-control"></textarea><br>
					 
				</div>
			 
						
	</div>
		
  </div>
 </body>
</html>