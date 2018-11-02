<!--
    Date        Programmer      Description
    4/16/2018   Cindy Holley    Create original website
    11/1/2018   Cindy Holley    Create cyclecontact.aspx page and connect to CycleOut database
    11/2/2018   Cindy Holley    Update navigation links, create contact thank you page

-->


<%@ Page Language="C#"  %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;

            // Read the connection string from Web.config

            string connectionString =
                ConfigurationManager.ConnectionStrings["CycleOut"].ConnectionString;

            // Initialize connection
            conn = new SqlConnection(connectionString);

            // Create command 
            comm = new SqlCommand("EXEC InsertVisitors @firstNameTextBox, @lastNameTextBox, @emailTextBox, " +
                "@addressTextBox, @cityTextBox, @stateTextBox, @zipTextBox, @commentsTextBox", conn);

            comm.Parameters.Add("@firstNameTextBox", System.Data.SqlDbType.VarChar, 50);
            comm.Parameters["@firstNameTextBox"].Value = firstName.Text;

            comm.Parameters.Add("@lastNameTextBox", System.Data.SqlDbType.VarChar, 50);
            comm.Parameters["@lastNameTextBox"].Value = lastName.Text;

            comm.Parameters.Add("@emailTextBox", System.Data.SqlDbType.VarChar, 50);
            comm.Parameters["@emailTextBox"].Value = email.Text;

            comm.Parameters.Add("@addressTextBox", System.Data.SqlDbType.VarChar, 50);
            comm.Parameters["@addressTextBox"].Value = address.Text;

            comm.Parameters.Add("@cityTextBox", System.Data.SqlDbType.VarChar, 50);
            comm.Parameters["@cityTextBox"].Value = city.Text;

            comm.Parameters.Add("@stateTextBox", System.Data.SqlDbType.VarChar, 50);
            comm.Parameters["@stateTextBox"].Value = state.Text;

            comm.Parameters.Add("@zipTextBox", System.Data.SqlDbType.VarChar, 10);
            comm.Parameters["@zipTextBox"].Value = zip.Text;

            comm.Parameters.Add("@commentsTextBox", System.Data.SqlDbType.VarChar, 500);
            comm.Parameters["@commentsTextBox"].Value = comments.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();

                // Execute the command
                comm.ExecuteNonQuery();

                // Reload page if the query executed successfully
                Response.Redirect("thankyou.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();
            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }//end if
    }//end submitButton_Click
</script>


<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head runat="server">
	<meta charset="utf-8"/>
	<title>Cycle Out Cancer Contact Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1"/> 
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script src="_js/jquery.min.js"></script>
	<script src="_js/jquery-ui.min.js"></script>	
	<link href="_js/jquery-ui.min.css" rel="stylesheet"/>
	
    <!--<script src="js/validation_contact.js"></script>-->
	
    <link rel="stylesheet" href="css/cyclestyles.css"/>	
</head>

<body>
	<div class="container">

		<!-- top section -->
		<div class="jumbotron">
		
			<div class="header" id="top">
				<img src="images/cycleparade.jpg" alt="Cycle Riders" width="527" height="312"/>
				
				<h1>Cycle Out Cancer</h1>      
				<h2>We Ride So Others May Live</h2> 
			</div> <!-- end class header -->
			
			<div class="nav">
			  <ul>
				<li><a href="index.html" class="btn btn-block" role="button">Home</a></li>
				
				<li><a href="cycleevents.html" class="btn btn-block" role="button">Events</a></li>
				
				<li><a href="cyclefaq.html" class="btn btn-block" role="button">Cancer FAQs</a></li>
				
				<li><a href="cyclegames.html" class="btn btn-block" role="button">Games</a></li>	

				<li><a href="cyclecontact.aspx" class="btn btn-block active" role="button">Contact Us</a></li>
			  </ul>	
			</div> <!-- end class nav -->				
		</div> <!--end jumbotron-->
		
		<!-- main section -->
		<div class="well">
			<h2>Contact us</h2>
			<div>
				<form id="contactus" runat="server">
					<div> <!-- first name -->
						<label for="firstName" class="label">First Name: </label>
                        <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Required Field" ControlToValidate="firstName"></asp:RequiredFieldValidator>
					</div>
					
					<div> <!-- last name -->
						<label for="lastName" class="label">Last Name: </label>
                        <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="Required Field" ControlToValidate="lastName"></asp:RequiredFieldValidator>
					</div>
				
					<div> <!-- email address -->
						<label for="email" class="label">E-mail Address: </label>
                        <asp:TextBox ID="email" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="Required Field" ControlToValidate="email"></asp:RequiredFieldValidator>
					</div>

					<div> <!-- address -->
						<label for="address" class="label">Address: </label>
                        <asp:TextBox ID="address" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="Required Field" ControlToValidate="address"></asp:RequiredFieldValidator>
					</div>
					
					<div> <!-- city -->
						<label for="city" class="label">City: </label>
                        <asp:TextBox ID="city" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ErrorMessage="Required Field" ControlToValidate="city"></asp:RequiredFieldValidator>
    				</div>
					
					<div> <!-- state -->
						<label for="state" class="label">State/Province: </label>
                        <asp:TextBox ID="state" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ErrorMessage="Required Field" ControlToValidate="state"></asp:RequiredFieldValidator>
					</div>
					
					<div> <!-- zip -->
						<label for="zip" class="label">Postal Code: </label>
                        <asp:TextBox ID="zip" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ErrorMessage="Required Field" ControlToValidate="zip"></asp:RequiredFieldValidator>
					</div>  
									
					<div> <!-- comments -->
						<label for="comments" class="label">Comments: </label>
                        <asp:TextBox ID="comments" runat="server"></asp:TextBox>
					</div>
				
					<div> <!-- submit button -->
                        <asp:Button ID="submitButton" runat="server" Text="Submit" onclick="submitButton_Click" />
                        <br />
                        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>
					</div>
				</form>
			</div> <!-- end contact us -->
		</div> <!-- end well -->
		
		<!-- footer section -->
		<div class="footer">						
			<div class="copyright">
				<p>© 2018 Cycle Out Cancer <a href="cyclecontact.aspx"><span class="glyphicon glyphicon-envelope"></span></a></p>
			</div> <!-- end copyright -->
			
			<div class="topbutton" > <!-- button to go to top of header-->
				<a href="#top" class="btn btn-xs">Top of Page</a> 			
			</div> <!-- end topbutton -->
						
		</div> <!-- end class footer -->
	</div> <!-- end container -->   
</body>
</html>
