create database fudbalske_slicice;


use fudbalske_slicice


create table Korisnik
(id int primary key identity(1,1), username varchar(30) not null, ime nvarchar(30), prezime nvarchar(30), email varchar(30), pass varchar(30))

create table Godina_izdanja
(id int primary key identity(1,1), naziv varchar(4))

create table Izdavac
(id int primary key identity(1,1), naziv varchar(30))

create table Album
(id int primary key identity(1,1), naziv varchar(30), izdavac_id int foreign key references Izdavac(id), godina_izdanja_id int foreign key references godina_izdanja (id))

create table Slicica
(id int primary key identity(1,1), ime varchar(30), prezime varchar(30), broj int, slika varbinary(max),  album_id int foreign key references Album (id))

create table Slicica_Korisnik
(id int primary key identity(1,1), korisnik_id int foreign key references Korisnik (id), slicica_id int foreign key references Slicica (id))


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter proc Register
@username varchar(30),
@ime nvarchar(30),
@prezime varchar(30),
@email varchar(30),
@pass nvarchar(30)
as
set lock_timeout 3000;
begin try	
	if exists(select top 1 email from Korisnik
	where email = @email)
	return 1
	else 
	insert into Korisnik(username,ime,prezime,email,pass)
	values (@username,@ime,@prezime,@email,@pass)
		return 0;
end try
begin catch
	return @@error
end catch

exec Register @username = 'bratke', @ime = 'Andrej', @prezime = 'Bratic', @email = 'andrej.bratic@gmail.com', @pass = '123'



use fudbalske_slicice

Create procedure Korisnik_Provera
@email varchar(30),
@pass varchar(30)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 email FROM Korisnik
	WHERE email = @email and pass=@pass)
	Begin
	RETURN 0
	end
	RETURN 1
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH