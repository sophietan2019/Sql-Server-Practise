USE Technician
GO

DROP PROCEDURE IF EXISTS CustomerServiceReport
GO

CREATE PROCEDURE CustomerServiceReport
AS
BEGIN;

DECLARE @CustomerTotal NUMERIC (10,2)=0
DECLARE @FinalTotal NUMERIC (10,2)=0

DECLARE X CURSOR FOR 
                     SELECT DISTINCT C.CUST_NUM,C.CUST_FIRST,C.CUST_LAST,C.CUST_ADDRESS,C.CUST_CITY,C.CUST_STATE
                     FROM DBO.CUSTOMERT C 
					 INNER JOIN DBO.SERVICE_CALL S 
					 ON C.CUST_NUM=S.CUST_NUM

DECLARE @CusID int
DECLARE @CusFirstName VARCHAR(50)
DECLARE @CusLastName VARCHAR(50)
DECLARE @CusAddress VARCHAR(255)
DECLARE @CusCity VARCHAR(50)
DECLARE @CusState VARCHAR(50)

OPEN X
FETCH NEXT FROM X INTO @CusID,@CusFirstName,@CusLastName,@CusAddress,@CusCity,@CusState 
WHILE @@FETCH_STATUS=0
      BEGIN;
	  PRINT @CusFirstName+' '+@CusLastName
	  PRINT @CusAddress
	  PRINT @CusCity+', '+@CusState 
	  PRINT CHAR(9)+CHAR(9)+'Call#'+ CHAR(9)+'Date'+CHAR(9)+CHAR(9)+'Technician'+CHAR(9)+CHAR(9)+CHAR(9)+'Total'

	       DECLARE Y CURSOR FOR 
		                    SELECT S.CALL_NUM,S.DATE,T.TECH_FIRST,T.TECH_LAST,SUM(P.PRICE*PD.QTY) AS TOTAL
							FROM DBO.SERVICE_CALL S
							INNER JOIN DBO.TECHNICIAN T ON S.TECH_NUM=T.TECH_NUM
							INNER JOIN DBO.SERVICE_PARTS_DETAIL PD ON S.CALL_NUM=PD.CALL_NUM
							INNER JOIN DBO.PARTST P ON PD.PART_NUM=P.PART_NUM
							WHERE S.CUST_NUM=@CusID
							GROUP BY S.CALL_NUM,S.DATE,T.TECH_FIRST,T.TECH_LAST
	      DECLARE @CallID INT
	      DECLARE @CallDate DATE
	      DECLARE @TechFirstName VARCHAR(50)
	      DECLARE @TechLastName VARCHAR(50)
	      DECLARE @Total NUMERIC (10,2)

	      OPEN Y
	      FETCH NEXT FROM Y INTO @CallID,@CallDate,@TechFirstName,@TechLastName,@Total 
		  WHILE @@FETCH_STATUS=0
		        BEGIN;
				
				PRINT CHAR(9)+CHAR(9)+CONVERT(VARCHAR,@CallID)+CHAR(9)+CONVERT(VARCHAR,@CallDate)+CHAR(9)+@TechFirstName+' '+@TechLastName
				+CHAR(9)+CHAR(9)+CHAR(9)+'$'+CONVERT(VARCHAR,@Total)
				SET @CustomerTotal+=@Total
				SET @FinalTotal+=@Total
				FETCH NEXT FROM Y INTO @CallID,@CallDate,@TechFirstName,@TechLastName,@Total 
				END;
		  CLOSE Y
		  DEALLOCATE Y
		  PRINT CHAR(9)+CHAR(9)+CHAR(9)+'Sum    $'+CONVERT(VARCHAR,@CustomerTotal)
		  SET @CustomerTotal=0
		  PRINT ' '
          FETCH NEXT FROM X INTO @CusID,@CusFirstName,@CusLastName,@CusAddress,@CusCity,@CusState 
       END;
CLOSE X
DEALLOCATE X
PRINT 'Final Total>>> $' + CONVERT(VARCHAR,@FinalTotal)
END;


