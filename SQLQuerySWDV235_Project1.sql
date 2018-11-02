/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1601)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2016
    Target Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [CycleOut]
GO

/****** Object:  StoredProcedure [dbo].[InsertVisitors]    Script Date: 11/2/2018 12:10:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[InsertVisitors]
@firstName varchar(50)
,@lastName varchar(50) 
,@email varchar(50) 
,@address varchar(50) 
,@city varchar(50) 
,@state varchar(50)
,@zip varchar(10)
,@comments varchar(500)

as
INSERT INTO [CycleOut].[dbo].[visitors]
           ([firstName]
		   ,[lastName]
           ,[email]
		   ,[address]
		   ,[city]
		   ,[state]
		   ,[zip]
           ,[comments])
     VALUES
           (@firstName
			,@lastName 
			,@email  
			,@address  
			,@city 
			,@state 
			,@zip 
			,@comments)
GO

CREATE LOGIN [COapp] WITH PASSWORD='Pa$$w0rd', DEFAULT_DATABASE=[CycleOut]
go
use CycleOut
go
CREATE USER [COapp] FOR LOGIN [COapp] WITH DEFAULT_SCHEMA=[dbo]
GO
grant execute on InsertVisitors to COapp
go

