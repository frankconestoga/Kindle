• 1. Critical: Default.aspx is currently malformed and will fail to parse

  - btnBrowseProducts is missing closing markup (/> or </asp:Button>), so the page is invalid.
  - Reference: Default.aspx:34

  2. Medium: package restore dependency still likely to break clean build environments

  - Project references NuGet package paths under ..\packages\..., but the repo clone does not include a packages
    folder.
  - This is usually fine in Visual Studio with restore enabled, but can fail in clean/CI environments unless restore
    runs first.
  - References: ChigozieNweke_BookStore.csproj:64, ChigozieNweke_BookStore.csproj:194
  -
  -





  
  -
  -
  -  1. Critical: master page has server controls outside any runat="server" form

  - Site.Master has asp:Label and ContentPlaceHolder but no <form runat="server">.
  - This commonly causes runtime errors for controls in master.
  - References: Site.Master:15, Site.Master:41, Site.Master:49

  2. High: friendly URLs are enabled, but app still navigates to .aspx in multiple flows

  - Requirement says ensure clean URLs; several buttons/redirects still use *.aspx.
  - References: Default.aspx:36, Products.aspx:83, Products.aspx.cs:88, Cart.aspx:32, Cart.aspx.cs:79

  3. Medium: build-on-clone risk due missing packages/ folder with strict package imports

  - Project requires package files under ..\packages\... but repo doesn’t include that folder; clean build can fail
    unless restore runs in VS/NuGet first.
  - References: ChigozieNweke_BookStore.csproj:64, ChigozieNweke_BookStore.csproj:194

  4. Low: “Remember Me unchecked” path does not clear an existing persistent cookie

  - If user previously logged in with cookie, then logs in unchecked, stale cookie may still identify them later after
    session expires.
  - References: Login.aspx.cs:16, Login.aspx.cs:26, Site.Master.cs:17



Assignment 2
Continue working from Assignment 1 
Part 1: Master Pages & Theming

Open your BookStore app from the previous assignment.

Create a new Master Page named Site.Master.

Theming: Go to bootswatch.com, download a theme of your choice, and apply it to your Master Page. Your site should look completely different from the default Visual Studio look.

Refactoring: Convert your existing pages (Default.aspx, Products.aspx, Cart.aspx, Checkout.aspx) to Content Pages that use the new Site.Master.

Note: Ensure you remove the old <html>, <head>, and <body> tags from these pages so they fit correctly into the Master Page ContentPlaceHolder.

Part 2: Advanced State Management (Login)

Create a new web form called Login.aspx and add a link to it in your main Navigation Bar.

Design the Login page with:

Two text boxes: First Name and Last Name.

A "Remember Me" Checkbox.

A "Login" Button (Redirects to the Products page).

A "Cancel" Button (Redirects to the home page).

The Logic:

When the user clicks Login, check the status of the "Remember Me" checkbox.

If Checked: Store the user's name in a Persistent Cookie (set expiry to at least 1 week).

If Unchecked: Store the user's name in a Session variable.

Redirect the user to the Products page after login.

Part 3: The "Global" Welcome

Modify your Site.Master Navigation Bar to include a label/literal for a Welcome Message (e.g., "Hello, [Name]").

In the Master Page code-behind (Page_Load), write the logic to check for either the Session OR the Cookie.

If found: Display the user's name in the Navigation Bar.

If not found: Hide the welcome message (or display "Guest").

Hint: This ensures the user is recognized on every page of the site, not just the products page.

Part 4: Friendly URLs

Install the Microsoft.AspNet.FriendlyUrls NuGet package.

Enable Friendly URLs in your RouteConfig.cs and Global.asax.

Ensure your application runs using clean URLs (e.g., localhost/Products instead of localhost/Products.aspx).

Submission:

Zip up your solution folder.

Submit to the Assignment 2 submission folder.
Due on Feb 27, 2026 11:59 PM
Available on Feb 10, 2026 3:00 PM. Access restricted before availability starts.
Available until Mar 1, 2026 11:59 PM. Access restricted after availability ends.

Hide Rubrics
Rubric Name: Assignments Rubrics
Criteria	
Level 3
4 points
Level 2
2 points
Level 1
1 point
Criterion Score
Effort
Above Expectations:

Additional Efforts
Impressive layout/design
No errors 
Meets Expectations:

Effort applied to meet requirements
Pages load/run with little errors
Below Expectations:

Little effort applied
Will not load/run
Score of Effort,/ 4
Accuracy
Above Expectations:

Outstanding coding structure
Comments added to code
No issues 
Meets Expectations:

Instructions were followed
Few syntax issues
Results match expected output
Below Expectations:

Did not follow instructions
Syntax Errors
Output is not as expected
Score of Accuracy,/ 4
Timely Submission
Above Expectations:

Submission was on time
Meets Expectations:

Submission was on time
Below Expectations:

Submission was late
Score of Timely Submission,/ 4
Total
Score of Assignments Rubrics,/ 12
Overall Score
Level 3
8 points minimum
Level 2
4 points minimum
Level 1
0 points minimum
