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
								File file = new File("C:\\descVM.text");
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
				 
			 
			 
						
	</div>
		
  </div>
 </body>
</html>