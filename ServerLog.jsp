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
					<a class = "navbar-brand" href="#">Let's Connect to our server</a>
				</div>
			</div>
		</nav>
		
	<div class="container">
		<div class="formsection">
						<%@ page import="java.io.*" %>
					 
						
						<%
							String ip = request.getParameter("sname");
							String username = request.getParameter("uname");
							String pwd = request.getParameter("psw");
	
							try
								{
									String strPath = "C:\\Users\\Chand\\Desktop\\IBM-Cloud\\connection.ps1";
									File strfile = new File(strPath);
									boolean filecreated = true;
									if(strfile.exists())
									{
										strfile.delete();
										strfile.createNewFile();
										filecreated = true;
									}
									if(filecreated)
									{
										PrintWriter pw = new PrintWriter(strfile);
										pw.println("Connect-ViServer -Server "+ip+" -User " +username+" -Password "+ pwd);
										pw.println("timeout 1");
										pw.println("get-vm > C:\\Users\\Chand\\Desktop\\IBM-Cloud\\getvm.text");
										pw.close();
										String command = "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe   \"C:\\Users\\Chand\\Desktop\\IBM-Cloud\\connection.ps1\"";
										Process powershellprocess = Runtime.getRuntime().exec(command);
										powershellprocess.getOutputStream().close();
										String line;
										out.println("Connected Server is:");
										BufferedReader stdout = new BufferedReader(new InputStreamReader(powershellprocess.getInputStream()));
										while ((line = stdout.readLine()) != null)
											{
														out.println(line);
											}
										stdout.close();
										out.println("Done");
						%>
										<h1>Let's Play with EXSi Server.</h1>
										<a href = "operation.jsp">Go To Monitor  Page</a> 
						<%				
									}else
									{
										out.println("Connection can not be Created");
									}
								}
							catch(IOException ex)
								{
									out.println("Connection can not be created" + ex);     
								}
						%>
	</div>
  
 </body>
</html>