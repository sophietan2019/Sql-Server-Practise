USE Technician
GO

DROP TABLE IF EXISTS LogFile 

CREATE TABLE LogFile
(UserName VARCHAR(50),PCLocation VARCHAR(100),LogTime DATETIME, LogWeekDay VARCHAR(10))
GO

DROP TRIGGER IF EXISTS WatchPartsPrice
GO

CREATE TRIGGER WatchPartsPrice
ON PARTST
AFTER UPDATE
AS
BEGIN;
DECLARE @PartsPriceOld NUMERIC (10,2)
DECLARE @PartsPriceNew NUMERIC (10,2)
DECLARE @UserName Varchar (50)
DECLARE @PcLocation VARCHAR(100)
DECLARE @Logtime DATETIME
DECLARE @LogWeekDay VARCHAR(10)
SELECT @PartsPriceOld=PRICE FROM deleted
SELECT @PartsPriceNew=PRICE FROM inserted	
SELECT @UserName=SUSER_SNAME()
SELECT @PcLocation=@@SERVERNAME
SELECT @Logtime=GETDATE()
SELECT @LogWeekDay=DATENAME(WEEKDAY,GETDATE())


IF @PartsPriceNew>@PartsPriceOld*1.2 OR @PartsPriceNew<@PartsPriceOld*0.8
	BEGIN;
	ROLLBACK
	RAISERROR ('>>>Can not Change Price More Than 20 Percent<<<',16,1)
	INSERT INTO LogFile
	VALUES(@UserName,@PcLocation,@Logtime,@LogWeekDay)
	END;
END;


