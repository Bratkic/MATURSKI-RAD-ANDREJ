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
create proc Register
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


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure Godina_Izdanja_Insert
	@godina varchar(4)
	as
	set lock_timeout 3000;

	begin try
		if exists(select top 1 naziv from Godina_izdanja
		where naziv=@godina)
		return 1
		else
		insert into Godina_izdanja(naziv)
		values (@godina)
		return 0;
	end try

	begin catch
		return @@error
	end catch
	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	alter procedure Album_Insert
	@naziv varchar(30),
	@izdavac_id int,
	@godina_izdanja int
	as
	set lock_timeout 3000;
	begin try
	if exists(select top 1 naziv from Album
		where naziv=@naziv and izdavac_id=@izdavac_id and godina_izdanja_id=@godina_izdanja)
		return @izdavac_id
		else
		insert into Album(naziv,izdavac_id,godina_izdanja_id)
		values (@naziv,@izdavac_id,@godina_izdanja)
		return 0;
	end try
	
	begin catch
		return @@error
		
	end catch
	
	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure Izdavac_Insert
	@naziv varchar(30)
	as
	set lock_timeout 3000;

	begin try
		if exists(select top 1 naziv from Izdavac
		where naziv=@naziv)
		return 1
		else
		insert into Izdavac(naziv)
		values (@naziv)
		return 0;
	end try

	begin catch
		return @@error
	end catch
	
set ansi_nulls on
go
set quoted_identifier on
go

	alter procedure Slicica_Insert
	@ime varchar(30),
	@prezime varchar(30),
	@broj int,
	@album_id int,
	@slika nvarchar(max)
	as
	set lock_timeout 3000;
	
	begin try
		if exists(select top 1 ime,prezime,broj from Slicica where ime=@ime and prezime = @prezime and broj=@broj)
		return 1
		else
		insert into Slicica(ime,prezime,broj,album_id,slika)
		values (@ime,@prezime,@broj,@album_id,@slika)
		return 0
		end try
		
		begin catch
			return @@error
			
		end catch
		
set ansi_nulls on
go
set quoted_identifier on
go
create procedure Slicica_Korisnik_Insert

@korisnik_id int,
@slicica_id int
as
set lock_timeout 3000;

begin try
	insert into Slicica_Korisnik(korisnik_id,slicica_id)
	values (@korisnik_id,@slicica_id)
	return 0
	end try
	
	begin catch 
	return @@error
	end catch
	
	exec Godina_Izdanja_Insert @godina = '2017'
	exec Izdavac_Insert @naziv = 'Fifa 365'
	exec Album_Insert @naziv = 'Uefa Champions League', @izdavac_id = 1, @godina_izdanja = 2
	exec Slicica_Insert @ime = 'Lionel' , @prezime = 'Messi', @broj = 36, @slika = null, @album_id = 1
	exec Slicica_Korisnik_Insert @korisnik_id = 2, @slicica_id = 17 
	
	select username as naziv, Slicica.ime+' '+Slicica.prezime as igrac, broj, album.naziv, Izdavac.naziv, Godina_izdanja.naziv from Slicica_Korisnik join Korisnik on Korisnik.id = korisnik_id join Slicica on Slicica.id = slicica_id join Album on Album.id = album_id join Izdavac on Izdavac.id= izdavac_id  join Godina_izdanja on Godina_izdanja.id = godina_izdanja_id
	
	alter table Slicica
	add slika nvarchar(max)
	
	
Select Album.id as id, Album.naziv as Naziv, Godina_Izdanja.naziv as Godina_izdanja, Izdavac.naziv as Izdavac from Album join Izdavac on Album.izdavac_id = Izdavac.id join Godina_izdanja on Album.godina_izdanja_id=Godina_izdanja.id
Select naziv from Godina_izdanja

Select id,naziv from Izdavac

select Album.naziv from Album where Album.izdavac_id = 1 and 

Select distinct Album.godina_izdanja_id as id,Godina_Izdanja.naziv from Album join Godina_Izdanja on Album.Godina_Izdanja_id = Godina_Izdanja.id

Select distinct Album.izdavac_id as id, Izdavac.naziv from Album join Izdavac on Album.izdavac_id = Izdavac.id where Album.godina_izdanja_id = 1

select Korisnik.username, Slicica.ime + ' ' + Slicica.prezime as igrac, Slicica.broj, Album.naziv as album, Godina_izdanja.naziv as godina_izdanja, Izdavac.naziv as izdavac from Slicica_Korisnik
join Korisnik on Slicica_Korisnik.korisnik_id=Korisnik.id join Slicica on Slicica_Korisnik.slicica_id = Slicica.id join Album on Slicica.album_id = Album.id join Godina_izdanja on Album.godina_izdanja_id = Godina_izdanja.id join Izdavac on Album.izdavac_id = Izdavac.id

select id from Korisnik where Korisnik.email = 'petar.muzurovic@gmail.com'

select MAX (id) from Slicica
use fudbalske_slicice;
Select Slicica.ime+' '+Slicica.prezime as naziv, Slicica.broj, Album.naziv, Godina_Izdanja.naziv, Izdavac.Naziv, Slicica.slika from Slicica_Korisnik join Slicica on Slicica_Korisnik.slicica_id=Slicica.id join Korisnik on Slicica_Korisnik.korisnik_id = Korisnik.id
join Album on Slicica.album_id = Album.id join Izdavac on Album.izdavac_id = Izdavac.id join Godina_Izdanja on Album.Godina_Izdanja_Id = Godina_izdanja.id where Korisnik.id = 1

Select distinct Album.id, Album.naziv +' '+ Godina_Izdanja.naziv +' '+ Izdavac.naziv as naziv_albuma from Album join Godina_Izdanja on Album.godina_izdanja_Id = Godina_Izdanja.id join Izdavac on Album.izdavac_id = Izdavac.id 


Select Korisnik.username as Korisnik, Slicica.Ime+ ' ' + Slicica.Prezime as igrac , Slicica.broj as broj, Slicica.slika from Slicica_Korisnik
join Slicica on Slicica_Korisnik.slicica_id=Slicica.id join Korisnik on Slicica_Korisnik.korisnik_id = Korisnik.id join Album on Slicica.album_id = Album.id join Izdavac on Album.izdavac_id = Izdavac.id join Godina_Izdanja on Album.Godina_Izdanja_Id = Godina_izdanja.id 
where Album.id = 1

Select distinct Slicica.id as id, Slicica.ime+' ' + Slicica.prezime as igrac from Slicica

Select Korisnik.username as Korisnik, Album.naziv + ' ' + Godina_Izdanja.naziv + ' ' + Izdavac.naziv as Album from Slicica_Korisnik
join Slicica on Slicica_Korisnik.slicica_id=Slicica.id join Korisnik on Slicica_Korisnik.korisnik_id = Korisnik.id join Album on Slicica.album_id = Album.id join Izdavac on Album.izdavac_id = Izdavac.id join Godina_Izdanja on Album.Godina_Izdanja_Id = Godina_izdanja.id 
where Slicica.id = 1

go
Alter proc Sve_Slike
@korisnik int
as
Select k.slicica_id,s.slika,s.ime,s.album_id from Slicica_Korisnik as k
Inner Join Slicica as s
on
k.slicica_id=s.id
where k.korisnik_id=@korisnik
go

execute Sve_Slike '2'

Select distinct Slicica.id as id, Slicica.ime+' ' + Slicica.prezime as igrac from Slicica




Select Korisnik.username as Korisnik, Album.naziv + ' ' + Godina_Izdanja.naziv + ' ' + Izdavac.naziv as Album from Slicica_Korisnik 
             join Slicica on Slicica_Korisnik.slicica_id=Slicica.id join Korisnik on Slicica_Korisnik.korisnik_id = Korisnik.id join Album on Slicica.album_id = Album.id join Izdavac on Album.izdavac_id = Izdavac.id join Godina_Izdanja on Album.Godina_Izdanja_Id = Godina_izdanja.id
             where Slicica.broj=32
             
             Select distinct Slicica.ime+' ' + Slicica.prezime as igrac, Slicica.broj as broj from Slicica