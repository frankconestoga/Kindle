-- chigozienweke_bookstore Database Creation Script
-- Run this script in SQL Server Management Studio or Visual Studio Server Explorer
-- to create the required tables and populate them with data
-- Database name: chigozienweke_bookstore.mdf

-- Create Genre table
CREATE TABLE [dbo].[Genre] (
    [GenreID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [GenreName] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(255) NULL
);

-- Create Books table
CREATE TABLE [dbo].[Books] (
    [BookID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Title] NVARCHAR(100) NOT NULL,
    [Author] NVARCHAR(100) NOT NULL,
    [Genre] NVARCHAR(50) NOT NULL,
    [ShortDescription] NVARCHAR(200) NULL,
    [LongDescription] NVARCHAR(1000) NULL,
    [Price] DECIMAL(10, 2) NOT NULL,
    [ISBN] NVARCHAR(20) NULL,
    [ImageFile] NVARCHAR(100) NULL,
    [PublicationYear] INT NULL
);

-- Insert Genres (7 genres)
INSERT INTO [Genre] ([GenreName], [Description]) VALUES
('Fiction', 'Literary works of imagination, including novels and short stories'),
('Mystery', 'Stories involving crime, detection, and suspense'),
('Science Fiction', 'Speculative fiction dealing with futuristic concepts'),
('Romance', 'Stories focused on romantic love and relationships'),
('Fantasy', 'Fiction featuring magical or supernatural elements'),
('Biography', 'Non-fiction accounts of real people''s lives'),
('Self-Help', 'Books designed to help readers improve their lives');

-- Insert Books for Fiction (5 books)
INSERT INTO [Books] ([Title], [Author], [Genre], [ShortDescription], [LongDescription], [Price], [ISBN], [ImageFile], [PublicationYear]) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 'A tale of wealth and tragedy in 1920s America', 'Set in the Jazz Age, this novel follows narrator Nick Carraway as he becomes entangled in the mysterious world of his wealthy neighbor Jay Gatsby and his obsession with the beautiful Daisy Buchanan.', 14.99, '978-0743273565', 'great-gatsby.jpg', 1925),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 'A powerful story of racial injustice in the Deep South', 'Through the eyes of young Scout Finch, this Pulitzer Prize-winning novel explores themes of racial inequality, moral growth, and the loss of innocence in Depression-era Alabama.', 16.99, '978-0061120084', 'mockingbird.jpg', 1960),
('1984', 'George Orwell', 'Fiction', 'A dystopian masterpiece about totalitarian control', 'In a world of perpetual war and omnipresent surveillance, Winston Smith dares to think forbidden thoughts and pursue a forbidden love in this chilling vision of the future.', 13.99, '978-0451524935', '1984.jpg', 1949),
('Pride and Prejudice', 'Jane Austen', 'Fiction', 'A witty tale of love and social standing', 'Elizabeth Bennet navigates the rigid social hierarchy of Regency-era England while sparring with the proud Mr. Darcy in this beloved romantic comedy of manners.', 12.99, '978-0141439518', 'pride-prejudice.jpg', 1813),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 'A classic coming-of-age story', 'Holden Caulfield narrates his experiences in New York City after being expelled from prep school, offering a poignant exploration of teenage alienation and identity.', 15.99, '978-0316769488', 'catcher-rye.jpg', 1951);

-- Insert Books for Mystery (5 books)
INSERT INTO [Books] ([Title], [Author], [Genre], [ShortDescription], [LongDescription], [Price], [ISBN], [ImageFile], [PublicationYear]) VALUES
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Mystery', 'A gripping thriller with unforgettable characters', 'Journalist Mikael Blomkvist and hacker Lisbeth Salander team up to investigate a decades-old disappearance, uncovering dark family secrets along the way.', 17.99, '978-0307454546', 'dragon-tattoo.jpg', 2005),
('Gone Girl', 'Gillian Flynn', 'Mystery', 'A twisted tale of marriage and deception', 'When Amy Dunne disappears on her fifth wedding anniversary, suspicion falls on her husband Nick in this psychological thriller full of unexpected twists.', 16.99, '978-0307588371', 'gone-girl.jpg', 2012),
('The Da Vinci Code', 'Dan Brown', 'Mystery', 'A fast-paced thriller mixing art, religion, and conspiracy', 'Symbologist Robert Langdon races to solve a murder inside the Louvre, uncovering clues hidden in Leonardo da Vinci''s famous works.', 15.99, '978-0307474278', 'davinci-code.jpg', 2003),
('And Then There Were None', 'Agatha Christie', 'Mystery', 'Ten strangers, one island, no escape', 'Ten people are lured to a remote island and begin to die one by one according to a nursery rhyme in this masterpiece of suspense.', 14.99, '978-0062073488', 'none-left.jpg', 1939),
('The Silence of the Lambs', 'Thomas Harris', 'Mystery', 'A psychological thriller featuring Hannibal Lecter', 'FBI trainee Clarice Starling must seek the help of imprisoned cannibal Hannibal Lecter to catch another serial killer in this chilling bestseller.', 16.99, '978-0312924584', 'silence-lambs.jpg', 1988);

-- Insert Books for Science Fiction (5 books)
INSERT INTO [Books] ([Title], [Author], [Genre], [ShortDescription], [LongDescription], [Price], [ISBN], [ImageFile], [PublicationYear]) VALUES
('Dune', 'Frank Herbert', 'Science Fiction', 'An epic tale of politics, religion, and ecology', 'On the desert planet Arrakis, young Paul Atreides must navigate political intrigue and embrace his destiny as the leader of a fierce people.', 18.99, '978-0441172719', 'dune.jpg', 1965),
('The Martian', 'Andy Weir', 'Science Fiction', 'A gripping survival story on Mars', 'Astronaut Mark Watney must use his ingenuity to survive alone on Mars after being presumed dead and left behind by his crew.', 15.99, '978-0553418026', 'martian.jpg', 2011),
('Ender''s Game', 'Orson Scott Card', 'Science Fiction', 'A young genius battles for humanity''s survival', 'Child prodigy Ender Wiggin is recruited to a military academy in space to prepare for an alien invasion in this Hugo and Nebula Award winner.', 14.99, '978-0812550702', 'enders-game.jpg', 1985),
('Foundation', 'Isaac Asimov', 'Science Fiction', 'The epic saga of a galactic empire''s fall', 'Mathematician Hari Seldon predicts the fall of the Galactic Empire and creates a Foundation to preserve human knowledge through the coming dark age.', 16.99, '978-0553293357', 'foundation.jpg', 1951),
('Neuromancer', 'William Gibson', 'Science Fiction', 'The novel that launched cyberpunk', 'Case, a washed-up computer hacker, is hired for one last job that takes him into the dangerous world of artificial intelligence and corporate espionage.', 15.99, '978-0441569595', 'neuromancer.jpg', 1984);

-- Insert Books for Romance (5 books)
INSERT INTO [Books] ([Title], [Author], [Genre], [ShortDescription], [LongDescription], [Price], [ISBN], [ImageFile], [PublicationYear]) VALUES
('Outlander', 'Diana Gabaldon', 'Romance', 'A sweeping tale of love across time', 'Claire Randall, a World War II nurse, is mysteriously transported back to 18th-century Scotland where she meets the dashing Highland warrior Jamie Fraser.', 17.99, '978-0440212560', 'outlander.jpg', 1991),
('The Notebook', 'Nicholas Sparks', 'Romance', 'A timeless love story', 'An elderly man reads from a notebook to a woman with Alzheimer''s, recounting the passionate love story of Noah and Allie from their youth.', 14.99, '978-0446605236', 'notebook.jpg', 1996),
('Me Before You', 'Jojo Moyes', 'Romance', 'A love story that will break your heart', 'Louisa Clark becomes a caregiver for Will Traynor, a formerly active man now paralyzed, and their relationship transforms both of their lives.', 15.99, '978-0143124542', 'me-before-you.jpg', 2012),
('The Time Traveler''s Wife', 'Audrey Niffenegger', 'Romance', 'Love transcends the boundaries of time', 'Henry DeTamble suffers from a genetic disorder that causes him to travel through time unpredictably, challenging his relationship with Clare.', 16.99, '978-0156029438', 'time-travelers-wife.jpg', 2003),
('Jane Eyre', 'Charlotte Bronte', 'Romance', 'A classic tale of love and independence', 'Orphaned and mistreated, Jane Eyre becomes a governess at Thornfield Hall where she falls for the mysterious Mr. Rochester while fighting for her independence.', 13.99, '978-0141441146', 'jane-eyre.jpg', 1847);

-- Insert Books for Fantasy (5 books)
INSERT INTO [Books] ([Title], [Author], [Genre], [ShortDescription], [LongDescription], [Price], [ISBN], [ImageFile], [PublicationYear]) VALUES
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 'The beginning of a magical journey', 'Young Harry Potter discovers he''s a wizard and begins his education at Hogwarts School of Witchcraft and Wizardry in this beloved fantasy classic.', 19.99, '978-0590353427', 'harry-potter.jpg', 1997),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 'A classic tale of adventure and treasure', 'Bilbo Baggins is swept into an epic quest to reclaim the dwarf kingdom of Erebor from the fearsome dragon Smaug.', 14.99, '978-0547928227', 'hobbit.jpg', 1937),
('A Game of Thrones', 'George R.R. Martin', 'Fantasy', 'Epic fantasy with political intrigue', 'Noble families vie for control of the Iron Throne while an ancient evil awakens in the north in this sprawling fantasy epic.', 18.99, '978-0553593716', 'game-thrones.jpg', 1996),
('The Name of the Wind', 'Patrick Rothfuss', 'Fantasy', 'A young man''s journey to become a legend', 'Kvothe, a legendary figure now living in obscurity, tells the story of his remarkable life to a chronicler over three days.', 16.99, '978-0756404741', 'name-wind.jpg', 2007),
('The Chronicles of Narnia', 'C.S. Lewis', 'Fantasy', 'A magical world beyond the wardrobe', 'Four siblings discover a magical land called Narnia and become involved in a battle between good and evil alongside the great lion Aslan.', 24.99, '978-0066238500', 'narnia.jpg', 1950);

-- Insert Books for Biography (4 books)
INSERT INTO [Books] ([Title], [Author], [Genre], [ShortDescription], [LongDescription], [Price], [ISBN], [ImageFile], [PublicationYear]) VALUES
('Steve Jobs', 'Walter Isaacson', 'Biography', 'The definitive biography of Apple''s founder', 'Based on more than forty interviews with Steve Jobs, this biography offers an exclusive look at the intense personality and creative drive behind Apple''s success.', 19.99, '978-1451648539', 'steve-jobs.jpg', 2011),
('Becoming', 'Michelle Obama', 'Biography', 'A memoir from the former First Lady', 'Michelle Obama shares her journey from the South Side of Chicago to the White House, reflecting on her experiences and the values that have shaped her.', 18.99, '978-1524763138', 'becoming.jpg', 2018),
('The Diary of a Young Girl', 'Anne Frank', 'Biography', 'A Holocaust survivor''s powerful testimony', 'Anne Frank''s diary, written while hiding from the Nazis during World War II, is a moving testament to the human spirit.', 14.99, '978-0553296983', 'anne-frank.jpg', 1947),
('Long Walk to Freedom', 'Nelson Mandela', 'Biography', 'The autobiography of a freedom fighter', 'Nelson Mandela chronicles his early life, coming of age, and 27 years in prison before becoming South Africa''s first Black president.', 17.99, '978-0316548182', 'mandela.jpg', 1994);

-- Insert Books for Self-Help (4 books)
INSERT INTO [Books] ([Title], [Author], [Genre], [ShortDescription], [LongDescription], [Price], [ISBN], [ImageFile], [PublicationYear]) VALUES
('The 7 Habits of Highly Effective People', 'Stephen R. Covey', 'Self-Help', 'Timeless principles for personal effectiveness', 'This influential book presents a holistic approach to solving personal and professional problems through principle-centered living.', 16.99, '978-1982137274', '7-habits.jpg', 1989),
('Atomic Habits', 'James Clear', 'Self-Help', 'Transform your life through small changes', 'A practical guide to breaking bad habits and building good ones through small, incremental changes that compound over time.', 18.99, '978-0735211292', 'atomic-habits.jpg', 2018),
('How to Win Friends and Influence People', 'Dale Carnegie', 'Self-Help', 'The classic guide to better relationships', 'Timeless advice on how to communicate effectively, make friends, and influence people in both personal and professional life.', 15.99, '978-0671027032', 'win-friends.jpg', 1936),
('Think and Grow Rich', 'Napoleon Hill', 'Self-Help', 'The classic guide to financial success', 'Based on interviews with successful individuals, this book outlines thirteen principles for achieving wealth and success.', 14.99, '978-1585424337', 'think-rich.jpg', 1937);
