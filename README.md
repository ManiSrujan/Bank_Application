# Bank_Application
The project contains all the necessary images and an sql file for creating the database tables.

For the images to work in Tomcat Server, follow these steps:
1) Navigate to your workspace.
2) Now, navigate to .metadata>.plugins>org.eclipse.wst.server.core>tmp0>wtpwebaapps
3) In this folder, you'll find the name with which you saved the project.
4) Copy all the images and paste them in this project folder.

For setting up the database, follow these steps:
1) Run the SQL Command Line.
2) Connect/Login to your account.
3) Now, copy the path of the proj.sql file.
4) In the SQL Command Line, type '@' followed by the sql file path.
5) Run the command.

NOTE: Before running the SQL File please make sure that you don't have tables in your database with the same names as in the SQL file since the SQL file contains drop commands which delete any data which might be important from the tables with the same names(BAL_TABLE, BANK_OP, TRANS). 
