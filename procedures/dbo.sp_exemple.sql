USE [PRODUCAO_teste]

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

if exists ( select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[sp_prodinsereophist]') 
			and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_exemple]

GO

/****************************************************************************************/
/* Casa Publicadora Brasilera - GTI-WPROD                                               */
/* procedure: sp_exemple  date: 25/11/2008                                  			*/
/* developer: James Martins                                                             */
/* Description: Insere Histórico da OP													*/
/****************************************************************************************/

create						procedure			   [dbo].sp_exemple
												   (@param		int)
																	
as
  begin

	set 					nocount					on

	declare					@message				varchar(255),
	 						@complement				varchar(255),
							
    
  
	return	0
	set 			nocount				off
end
  

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

