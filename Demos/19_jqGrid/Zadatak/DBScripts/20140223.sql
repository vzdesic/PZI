CREATE DATABASE Imenik
GO

USE [Imenik]
GO

CREATE TABLE dbo.Persons(
	[Name] varchar(250) NULL,
	[Surname] varchar(250) NULL,
	[PostCode] varchar(250) NULL,
	[City] varchar(250) NULL,
	[Phone] varchar(250) NULL
)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vzdesic
-- Create date: 20140223
-- Description:	Spremanje imenika
-- =============================================
CREATE PROCEDURE [dbo].[SavePersons] 
(
	@lista varchar(MAX),
	@retVal varchar(100) out
)
AS
BEGIN	
	SET NOCOUNT ON;
	
	SET @retVal = 'OK'
    DECLARE @trancount int, @rowc int;
    SET @trancount = @@trancount;
    
    BEGIN TRY
        IF @trancount = 0
            BEGIN TRANSACTION
        ELSE
            SAVE TRANSACTION SavePersons;

        -- TODO BEGIN spremanje u bazu
		SELECT @lista
		-- ... doraditi ...
		-- TODO END

		SELECT @rowc = @@ROWCOUNT;
		
        IF @trancount = 0   
            COMMIT;
    END TRY
    BEGIN CATCH
        DECLARE @error int, @message varchar(4000), @xstate int;
        SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
        IF @xstate = -1
            ROLLBACK;
        IF @xstate = 1 and @trancount = 0
            ROLLBACK
        if @xstate = 1 and @trancount > 0
            ROLLBACK TRANSACTION SavePersons;

        RAISERROR ('Saving persons: %d: %s', 16, 1, @error, @message) ;
        
     	-- vratim poruku o grešci i slièno.
		SET @retVal = @message
    END CATCH   
		
	-- vraim broj primjenjenih redaka
	RETURN @rowc
END
