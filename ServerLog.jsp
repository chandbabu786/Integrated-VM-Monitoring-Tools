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
									String strPath = "C:\\connection.ps1";
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
										pw.println("get-vm > C:\\getvm.text");
										pw.println("timeout 1");
										pw.println("Get-VMHost > C:\\hosts.text");
										pw.println("timeout 1");
										pw.println("Get-VM|fl > C:\\descVM.text");
										
										pw.close();
										String command = "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe   \"C:\\connection.ps1\"";
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
										//out.println("Done");
										
									
						%>
						 
						 <style>
						 /* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}
button:hover {
  opacity: 0.8;
}
</style>
				<br>
				  <h3> Let's Monitor ESXi Server</h3>
				  <br>
				<b>   <p>To see the VMs hosted into the Server and operate them press the button.</p></b>
				  <form action="Status.jsp">
				  <button type ="submit" value="click"> Get VM</button> </form>
				  
				  <br>
				<b>  <p>To know the details of Virtual Machines press the button.</p></b>
				   <form action="descVM.jsp">
				  <button type ="submit" value="click">Detailed VM</button> </form>
				  
				  <br>
				 <b> <p> To check how many Hosts are connected press the button.</p></b>
				   <form action="Hosts.jsp">
				  <button type ="submit" value="click">Check Hosts</button> </form>
				  
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
  </div>
 </body>
</html>