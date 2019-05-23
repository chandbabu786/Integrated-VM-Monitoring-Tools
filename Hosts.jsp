<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
					<a class = "navbar-brand" href="#">Welcome To Hosts Center</a>
				</div>
			</div>
		</nav>
		
	<div class="container">
		<div class="formsection">
						<%@ page import="java.io.*" %>
						
						<%
							
							try
							{
								File file = new File("C:\\hosts.text");
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