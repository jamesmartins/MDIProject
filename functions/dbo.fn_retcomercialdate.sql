use [producao_teste]

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fn_retcomercialdate]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fn_retcomercialdate]
GO

create		function	fn_retcomercialdate (@date datetime) 
returns datetime  as
begin
	declare	@day	int, 
			@month	int,	
			@year	int,
			@smalldate datetime
	

	set		@day		=	day(@date)
	set		@month		=	month(@date)
	set		@year		=	year(@date)
	select	@smalldate	=	convert(datetime,convert(char(2),@day) + '/' + convert(char(2),@month) + '/' + convert(char(4),@year),103)  
	
  return	@smalldate
end 

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

