/*============================================= 
Description:      
ReadProcedurect2Recipient
Author: Francisco Duran    
Date: 12-13-16
Change History:      
=============================================*/
USE communityThrive2DB;
GO
CREATE PROCEDURE dbo.sp_selectct2Recipient
		@recipientID int
AS
BEGIN 
    SET NOCOUNT ON;

    DECLARE @v_error VARCHAR(255),
    @v_errorNo INT

    BEGIN TRY

        SELECT recipientID
			,firstName
			,lastName
			,recipientGender
		FROM ct2Recipient
		WHERE recipientID = @recipientID

    END TRY
    BEGIN CATCH

        SELECT @v_error = ERROR_MESSAGE()
        SELECT @v_errorNo = ERROR_NUMBER()

        RAISERROR('Database error occured %s',16,1,@v_error)
        RETURN -20000

    END CATCH
END