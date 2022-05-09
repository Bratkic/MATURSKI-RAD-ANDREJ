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

exec Register @username = 'bratke', @ime = 'Andrej', @prezime = 'Bratic', @email = 'andrej.bratic@gmail.com', @pass = '123'





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
	
	use fudbalske_slicice
	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure Album_Insert
	@naziv varchar(30),
	@izdavac_id int,
	@godina_izdanja int
	as
	set lock_timeout 3000;
	begin try
	if exists(select top 1 naziv from Album
		where naziv=@naziv and izdavac_id=@izdavac_id and godina_izdanja_id=@godina_izdanja)
		return 1
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
	@slika varbinary(max),
	@album_id int
	as
	set lock_timeout 3000;
	
	begin try
		if exists(select top 1 ime,prezime,broj from Slicica where ime=@ime and prezime = @prezime and broj=@broj)
		return 1
		else
		insert into Slicica(ime,prezime,broj,slika,album_id)
		values (@ime,@prezime,@broj,@slika,@album_id)
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
	
	exec Godina_Izdanja_Insert @godina = '2016'
	exec Izdavac_Insert @naziv = 'Konami'
	exec Album_Insert @naziv = 'Uefa Champions League', @izdavac_id = '1', @godina_izdanja = '1'
	exec Slicica_Insert @ime = 'Lionel' , @prezime = 'Messi', @broj = 36, @slika = null, @album_id = 1
	exec Slicica_Korisnik_Insert @korisnik_id = 1, @slicica_id = 1 
	
	select username as naziv, Slicica.ime+' '+Slicica.prezime as igrac, broj, album.naziv, Izdavac.naziv, Godina_izdanja.naziv from Slicica_Korisnik join Korisnik on Korisnik.id = korisnik_id join Slicica on Slicica.id = slicica_id join Album on Album.id = album_id join Izdavac on Izdavac.id= izdavac_id  join Godina_izdanja on Godina_izdanja.id = godina_izdanja_id
	
	alter table Slicica
	add slika nvarchar(max)