Create schema Users

Create table Users.Role(
RoleId int identity (1,1)  primary key NOT NULL,
Name nvarchar(200) Not null
)

Create table Users.UserByRole(
UserByRoleId int identity (1,1)  primary key NOT NULL,
UserId int not null references [CodeMono].[User] (UserId),
RoleId int not null references Users.Role (RoleId)
)