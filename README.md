# Tennis Analytics

Tennis Analytics is a desktop web application that lets users track errors made point by point by the tennis players, and then rendering a match report with count of errors and percentages. The application may be used as an anonymous guest or it also gives the option to register and save all matches analyzed to its own account. 
# Table of Contents
<ul>
  <li><a href="https://github.com/mariapopovafetisova/Tennis-Project/blob/master/README.md#information">Information</a></li>
  <li><a href="https://github.com/mariapopovafetisova/Tennis-Project/blob/master/README.md#requirements">Requirements</a></li>
  <li><a href="https://github.com/mariapopovafetisova/Tennis-Project/blob/master/README.md#download-and-installation-source-code">Download and Installation Source Code</a></li>
  <li><a href="https://github.com/mariapopovafetisova/Tennis-Project/blob/master/README.md#usage">Usage</a></li>

</ul>

# Information
<h4>This application tracks the following errors:  </h4>
  
  <ul><li>For your player: </li>
  <ul>
    <li>First Serve</li>
    <li>Second Serve</li>
    <li>Serve +1 (First stroke after serve, can be a winner or unforced error)</li>
    <li>Return +1 (First stroke after opponent's serve, can be a winner or unforced error)</li>
    <li>Winners</li>
    <li>Unforced Errors</li>
    <li>Net Errors</li>
  </ul>
</ul>
 <ul><li>For the opponent player: </li>
  <ul>
    <li>First Serve</li>
    <li>Second Serve</li>
    <li>Winners</li>
    <li>Unforced Errors</li>
    <li>Net Errors</li>
  </ul>
</ul>
<h4>This application will calculate: </h4>
<ul>
    <li>Errors count</li>
    <li>Errors percentages</li>

  </ul>
<h4>Scoring</h4>
 Scoring is based on college tennis scoring rules. Points are played with NO advantage. Up to six games. In case of tie in games(6-6), the scoring will automatically  convert to tie break points(0-7), with a difference of two points in case of tie in tiebreak points (6-6).</br>
 Sets are played to the best of three (2-0), (2-1).</br>
 To get the report, you will click the "Match Ended" button, which will only appear when one player wins 2 sets, not any other time during the match.</br> 
 In the case that the match is played up to 5 sets for any reason, you may continue recording errors as the application won't render the reports until you click the "Match Ended" button. 
<h4>Errors options display</h4>
 The errors are displayed as checkboxes. The application will ask for the player who will start serving the match. Depending on this choice, the application will render the specific errors for each player. For example, if Player 1 is serving, the application will display the Serve checkboxes and Serve+1 checkboxes, but not the Return+1 as the player is not returning. Same pattern would be for Player 2, who won't have the option to check for Serve errors. </br>
 The error options will be changing depending on the server. 
 

# Requirements 
<ul>
  <li>Device with a minimum screen width of 800px</li>
  <li>Microsoft Windows OS</li>
  <li>SQL Server Managment Studio</li>
  <li>Visual Studio: </li>
  <ul><li><h4>Nut get Packages</h4></li></ul>
    
    1.Microsoft.ApNet.Core
    2.Microsoft.AspNetCore.Authorization
    3.Microsoft.AspNetCore.Identity
    4.Microsoft.FrameworkCore
    5.System.Security.Claims
 </ul>
   
  
 
 
 # Download and Installation Source Code
  
  1. Download the project zip and extract it to a folder of your choice. 
  2. Open the SQL file called "script" with SQL Server Managment Studio.
  3. Edit the script with your own database name on [YourDatabaseName] and execute the query.
  
  
  ![sql](https://user-images.githubusercontent.com/102984337/165585108-6a205eea-c995-40ae-9521-86d8784ea8a6.png)


  4. After the database has been created, open the folder again where the project was downloaded, click on the folder "src code" and open the file "Tennis.sln" with Visual Studio.
  5. If not installed, install Nuget packages referred in the requirements. To install packages, click on "Tools" at the top bar, from the menu choose "NuGet Package Manager" and click on "Manage NuGet Packages for Solution. On the search bar, look for the packages names and install.
  
  ![nutgetpackages](https://user-images.githubusercontent.com/102984337/165585369-49b1a64f-ada0-481b-ab1e-9d296aa0a6e3.png)

  
  6. Navigate to the appsettings.json file at the end of the solution explorer. Edit the connection string to connect to your database and enter your server name where it indicates {YourServer} and your database name where it indicates {YourDataBaseName}.
 
 
 ![appsettings](https://user-images.githubusercontent.com/102984337/165585413-c9b5fcd2-f0d2-4233-b034-a2e4ec22f8b2.png)

 
 7. You may go back to your SQL Server and refresh your databases to ensure the Database was imported with the required tables.
  8. Click on the IIS Express button and start using the application. 
  
  
  ![issexpress](https://user-images.githubusercontent.com/102984337/165585442-d47b2958-a1f5-4ba6-ab08-758c7262dac3.png)

  
  # Usage
  
  <ul>
  <li>If you desire to use the application as a guest, skip to the next step. Otherwise, register on the application. Click on Login at the navigation bar and once you are in the Login page, click on Register.  </li>
  
  ![sign in ](https://user-images.githubusercontent.com/102984337/165585622-b03acc57-d0ec-4eb9-93fe-ebd2f38acce5.png)
  
  
  <li> Once you register you will be redirected to the Home page, where you can click the "Get Started" button.</li>
  <li>Enter the necessary match details and click on the button.</li>
  <li>On the next page, choose the player who is starts serving the match.</li>
  <li>You will be redirected to the Analyze page, where you will be able to record the errors for each point.</li>
  <ul>
    <li>Click on the necessary errors.</li>
    <li>On each side of the page are two blue buttons which will expand once you hover over them. They will be used to score each point for each player.
      Click on the button for the player who scored the point. </li>
    1.  Button on the left is used to record the points for the player on the left side of the page.</br>
    2.  Button on the right is used to record the points for the player on the right side of the page.</br>
    ![analyze](https://user-images.githubusercontent.com/102984337/165585795-4786e5de-9e56-4a60-b278-2777de68c655.png)
![analyze2](https://user-images.githubusercontent.com/102984337/165585809-2282a80e-4514-4897-9846-863495c828c0.png)

  </ul>
  <li>Once a player gets to 2 sets, the "Match Ended" button will appear. Click on it to get the match report.</li>
  
  ![matchended](https://user-images.githubusercontent.com/102984337/165585931-5a6c5d0f-a69e-4cfd-a717-b58ae21a94bf.png)

  <li>You can access your dashboard anytime you are logged in to access all the matches you recorded. </li>
  
![dashboard](https://user-images.githubusercontent.com/102984337/165585947-16722fc7-6c5c-40a9-8ecc-3e335000f7ff.png)
