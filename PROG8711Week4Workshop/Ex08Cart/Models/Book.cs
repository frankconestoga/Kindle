using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Book
{
    public string BookID { get; set; }
    public string Title { get; set; }
    public string Author { get; set; }
    public string Genre { get; set; }
    public string ShortDescription { get; set; }
    public string LongDescription { get; set; }
    public decimal Price { get; set; }
    public string ISBN { get; set; }
    public string ImageFile { get; set; }
    public int PublicationYear { get; set; }
}
