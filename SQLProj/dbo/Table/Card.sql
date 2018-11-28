-- Create a new table called '[Card]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Card]', 'U') IS NOT NULL
DROP TABLE [dbo].[Card]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Card]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Title] NVARCHAR(50) NOT NULL,
    [Text] NVARCHAR(100) NOT NULL
);
GO