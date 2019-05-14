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

 
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

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

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 45%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
 </head>

 <body>
        
      <center>  <h1> Welcome to the VM monitoring tools</h1> </center>
  <form  action ="#" class="modal-content animate" method="POST" >
    <div class="imgcontainer"> 
      <img src="F:\Virtualization\Eclips-project\Exsi-Api\WebContent\VMware.jpg" style="width:300px;height:150px;">
    </div>

    <div class="container">
        
      <label for="sname"><b>Server Name (IP Addr)</b></label>
      <input type="text" placeholder="Enter server IP address" name="sname" required>
        
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="uname" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>
        
      <button type="submit">Connect</button>
        
        
      </div>
 

    
  </form>
     
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
										out.println("Done");
						%>
										<h1>Let's Play with EXSi Server.</h1>
										 
										 
										<br>
										<br>
										<a href = "Status.jsp">See VMs</a> 
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