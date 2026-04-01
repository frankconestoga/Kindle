Assignment 3: Bookstore Administration and Data Management
Overview: In this assignment, you will continue working from Assignment 2. You will build a secure administration area that allows the store owner to view, add, edit, and delete Genres and Books (or whatever products you've choosen) directly from the web browser using ADO.NET and ASP.NET data controls.

Part 1: The Admin Page & Master/Detail Viewing

Open your YourName_BookStore solution from Assignment 2.

Create a new web form called Admin.aspx. Ensure it uses your Site.Master master page so the design aligns with the rest of your site.

Add a DropDownList control to display all the Genres from your Genre table.

Below it, add a DataList control to display the books associated with the selected genre.

Data Binding: Create two SqlDataSource controls to power these features:

Bind the DropDownList to a data source that selects all Genres. Ensure AutoPostBack is enabled.

Bind the DataList to a data source that selects from the Books table, using a ControlParameter linked to the DropDownList so it only shows books for the selected genre.

Example output: Selecting "Thrillers" in the drop-down should refresh the DataList to show "Jaws", "Jurassic Park", etc.

Part 2: Genre Maintenance (GridView)

On the same Admin.aspx page (or a new GenreAdmin.aspx if you prefer to split them up), add a GridView control.

Bind this GridView to a new SqlDataSource connected to the Genre table.

Configure the data source and GridView to allow Editing (UPDATE) and Deleting (DELETE) of genres.

Below this GridView, create a small form (using standard text boxes and a button) that takes input from the user to Add a New Genre. Write the necessary code or use a data control to insert this new genre into the database.

Part 3: Book Maintenance (Full CRUD)

Add another GridView control to manage the Books table.

Bind it to a SqlDataSource and enable Sorting and Pagination on the GridView.

Add a DetailsView (or FormView) control to the page.

Link the DetailsView/FormView to the GridView so that when a user selects a specific book from the grid, the full details appear in the DetailsView.

Configure the DetailsView/FormView to allow full CRUD operations (Create/Insert, Read/Select, Update, Delete) for the Books table.

SUBMISSION REQUIREMENTS
Database Submission Rules: You MUST submit your actual database files (.mdf and .ldf).

DO NOT submit .sql scripts to generate your database. If you only provide a script, your application cannot be run, and your assignment will not be graded.

The .mdf and .ldf files are located in your project's App_Data folder.

How to Zip Your Project Properly:

CLOSE VISUAL STUDIO COMPLETELY. If Visual Studio is running, your database files are "locked" by the SQL Server engine. If you try to zip the folder while it is locked, the database files will be 0KB or corrupted.

Once Visual Studio is closed, navigate to your project folder in Windows Explorer.

Zip the entire project folder (ensuring the .sln file and the App_Data folder containing the .mdf/.ldf files are inside).

Submit the .zip file to the Assignment 3 dropbox. (Alternatively, you may upload the .mdf and .ldf files separately to the dropbox alongside your zipped code).
