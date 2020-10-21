USE master
GO

--Create Database Invigulus
IF DB_ID('Invigulus') IS NOT NULL
	DROP DATABASE  Invigulus
GO

CREATE DATABASE Invigulus
GO

USE Invigulus
GO

--Create table ExamAdmin

IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('ExamAdmin'))
BEGIN;
    DROP TABLE [ExamAdmin];
END;
GO

CREATE TABLE [ExamAdmin] (
    [ExamAdminID] INT CONSTRAINT ExamAdmin_PK PRIMARY KEY IDENTITY (100,1) NOT NULL,
    [Name] VARCHAR(50) NOT NULL,
    [Email] VARCHAR(50) UNIQUE NOT NULL
);
GO

--Insert Records into ExamAdmin

INSERT INTO ExamAdmin([Name],[Email]) VALUES('Lois Hansen','ipsum.Donec.sollicitudin@dolorquamelementum.co.uk');
INSERT INTO ExamAdmin([Name],[Email]) VALUES('Kirsten Austin','orci@quisdiam.ca');
INSERT INTO ExamAdmin([Name],[Email]) VALUES('Justine Duran','mi.eleifend.egestas@arcuimperdietullamcorper.net');
INSERT INTO ExamAdmin([Name],[Email]) VALUES('Jordan Jensen','dictum.ultricies.ligula@magnaa.ca');
INSERT INTO ExamAdmin([Name],[Email]) VALUES('Quon Rowe','metus.urna.convallis@tellus.com');
INSERT INTO ExamAdmin([Name],[Email]) VALUES('Ayanna Lott','tellus.Aenean@a.org');
INSERT INTO ExamAdmin([Name],[Email]) VALUES('Chiquita Duncan','magna@consequatenimdiam.edu');
INSERT INTO ExamAdmin([Name],[Email]) VALUES('Tamara Burt','Vivamus.nisi.Mauris@eu.com');
INSERT INTO ExamAdmin([Name],[Email]) VALUES('Melodie Grant','enim.Mauris@ornareFuscemollis.co.uk');
INSERT INTO ExamAdmin([Name],[Email]) VALUES('Porter Sanford','non.feugiat@loremipsum.edu');



-- Create table Exam
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Exam'))
BEGIN;
    DROP TABLE [Exam];
END;
GO

CREATE TABLE [Exam] (
    [ExamID] INTEGER CONSTRAINT Exam_PK PRIMARY KEY IDENTITY (10000,1) NOT NULL,
    [ExamAdminID] INTEGER CONSTRAINT Exam_FK_ExamAdminID FOREIGN KEY REFERENCES [ExamAdmin](ExamAdminID) NOT NULL,
    [ExamName] VARCHAR(50) NOT NULL,
    [ExamDuration] TIME NOT NULL,
    [MaxAttemps] INTEGER NOT NULL,
	CHECK ([MaxAttemps]>0)
);
GO

--Insert records into Exam

INSERT INTO Exam([ExamAdminID],[ExamName],[ExamDuration],[MaxAttemps]) VALUES(105,'MATH101','2:00:00',3);
INSERT INTO Exam([ExamAdminID],[ExamName],[ExamDuration],[MaxAttemps]) VALUES(108,'COMPUTER SCIENCE 103','1:00:00',1);
INSERT INTO Exam([ExamAdminID],[ExamName],[ExamDuration],[MaxAttemps]) VALUES(101,'WEB DEVELOPMENT 210','1:30:00',9);
INSERT INTO Exam([ExamAdminID],[ExamName],[ExamDuration],[MaxAttemps]) VALUES(103,'OOSD212','3:00:00',7);
INSERT INTO Exam([ExamAdminID],[ExamName],[ExamDuration],[MaxAttemps]) VALUES(106,'JAVASCRIPT101','1:30:00',10);
INSERT INTO Exam([ExamAdminID],[ExamName],[ExamDuration],[MaxAttemps]) VALUES(106,'CHINESE','2:30:00',10);


--Create table ExamSession
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('ExamSession'))
BEGIN;
    DROP TABLE [ExamSession];
END;
GO

CREATE TABLE [ExamSession] (
    [ExamSessionID] VARCHAR(50) CONSTRAINT ExamSession_PK PRIMARY KEY NOT NULL,
    [ExamAdminID] INTEGER CONSTRAINT ExamSession_FK_ExamAdmin FOREIGN KEY REFERENCES [ExamAdmin](ExamAdminID) NOT NULL,
    [ExamID] INTEGER CONSTRAINT ExamSession_FK_ExamID FOREIGN KEY REFERENCES [Exam](ExamID) NOT NULL,
    [SessionStrTime] SMALLDATETIME NOT NULL)
    
GO

--Insert Records into ExamSession

INSERT INTO ExamSession([ExamSessionID],[ExamAdminID],[ExamID],[SessionStrTime]) VALUES('QWC21IIA1CU',109,10005,'2020-01-01 8:00:00');
INSERT INTO ExamSession([ExamSessionID],[ExamAdminID],[ExamID],[SessionStrTime]) VALUES('OLP55QER1LU',107,10005,'2020-02-01 10:00:00');
INSERT INTO ExamSession([ExamSessionID],[ExamAdminID],[ExamID],[SessionStrTime]) VALUES('JSC11BNX4JJ',103,10002,'2020-03-01 14:00:00');
INSERT INTO ExamSession([ExamSessionID],[ExamAdminID],[ExamID],[SessionStrTime]) VALUES('EMB89PPQ1UH',109,10002,'2020-04-01 15:00:00');
INSERT INTO ExamSession([ExamSessionID],[ExamAdminID],[ExamID],[SessionStrTime]) VALUES('JKC48MNB3AH',103,10002,'2020-05-01 16:00:00');

--Create table Examinee
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Examinee'))
BEGIN;
    DROP TABLE [Examinee];
END;
GO

CREATE TABLE [Examinee] (
    [ExamineeID] UNIQUEIDENTIFIER CONSTRAINT Examinee_PK PRIMARY KEY NOT NULL,
    [Name] VARCHAR(50) NOT NULL,
    [PhoneNumber] VARCHAR(50) NOT NULL,
    [Country] VARCHAR(50) NOT NULL,
    [State] VARCHAR(50) NULL,
    [City] VARCHAR(50) NULL,
    [Street] VARCHAR(255) NULL,
    [PostCode] VARCHAR(10) NULL,
    [Email] VARCHAR(50) UNIQUE NOT NULL
);
GO

--Insert Recoads into Examinee
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('80C676D1-7426-F43D-FDD3-320C1E0C49A2','Veronica Tanner','1-998-663-7657','Côte D''Ivoire (Ivory Coast)','LIP','Lipetsk','284-9237 Vestibulum. Street','176260','id.sapien@eget.com');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('484D930E-1C4B-B079-FD42-BA0CE6775D13','Caesar Nash','1-852-971-1851','Saint Lucia','PR','Arles','Ap #213-8523 At Rd.','S5K 7Y0','felis.Nulla.tempor@Duisvolutpat.com');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('6DC35A0E-3A90-FFA5-A477-4AD8174E827D','Constance Solomon','1-744-604-2782','Svalbard and Jan Mayen Islands','Bryansk Oblast','Trubchevsk','P.O. Box 598, 990 Non Rd.','94-731','mi@sapien.ca');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('C58E2818-5FD1-9E95-2920-84C81D6D9D4F','Elliott Salazar','1-653-845-8916','Sudan','Istanbul','Istanbul','8962 Dignissim. Street','21112','Nam@augue.co.uk');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('87F7090B-FB9A-2C52-E0B3-1994010F8E74','Tiger Good','1-673-237-3654','Djibouti','VLA','Vladimir','8548 A, Rd.','14980','nulla.at@eleifendegestasSed.com');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('59423D0E-AAEB-4CEF-5773-E6895F8DFE37','Martin Graham','1-992-165-5370','Korea, South','JT','Semarang','P.O. Box 178, 3607 Egestas Ave','22664','et@hendreritid.co.uk');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('4A990C71-E223-2485-3C3A-00253C84AE16','Allistair Greene','1-699-750-5046','Heard Island and Mcdonald Islands','İzm','Tire','P.O. Box 324, 5416 A, St.','10867','ligula.tortor@habitantmorbi.co.uk');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('90598998-890A-0DD9-2516-631895407FC5','Jeremy Kramer','1-829-582-1405','Tuvalu','Gye','Gwangju','P.O. Box 614, 3349 Neque Street','1766 FL','nec.tellus@eu.co.uk');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('8504AEFE-A80D-87D5-E41B-A1C7B6566D80','Eugenia Mathis','1-935-606-9576','Aruba','Comunitat Valenciana','Alacant','689-9772 Arcu Road','9160','eu.augue@porttitor.net');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('1D12BA44-C22A-C152-07B7-671054B449CD','Cole Frederick','1-981-560-8586','India','Vlaams-Brabant','Perk','2018 Curabitur Rd.','32943','eu.dolor.egestas@nullavulputatedui.com');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('F6A41629-2D43-8ADF-0C41-94FBFCEB8C0A','Leslie Parrish','1-480-548-5465','Venezuela','V','La Cruz','3094 Magna. Av.','87687','sed@Nam.co.uk');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('1AAEE0C9-DEDE-F9BA-DD47-767396C747CB','Dara Maynard','1-860-743-6980','Algeria','Ontario','Thorold','P.O. Box 959, 7538 Felis Ave','IN8 3NK','non.lacinia.at@egetlaoreet.com');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('138D479C-2B18-9161-CD09-4793104C994A','Jessamine Mclean','1-918-644-8741','Zambia','AB','Innisfail','Ap #576-358 Ultricies St.','1962','placerat.velit@enim.com');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('EA1A922D-1030-EFAC-CDFB-F3ADD4D1D70E','Gabriel Mueller','1-410-289-5683','Kuwait','Mississippi','Biloxi','1251 Mollis Ave','71060','at.velit@in.org');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('7EC6DFFB-D8CF-AEF0-441E-325A9F913447','Wade Merritt','1-335-609-1488','New Caledonia','L','Dublin','331-6076 Amet Avenue','93258','ac.feugiat.non@a.co.uk');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('C50952BD-4349-920C-3C15-E972253500F6','Nolan Stevens','1-706-529-2631','Pitcairn Islands','LOR','Iquitos','P.O. Box 406, 6943 Lobortis Street','WM53 2WC','elit.pellentesque.a@per.ca');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('2DD4B024-87F4-00F3-145B-1865EBFBA805','Howard Flores','1-155-265-8936','Italy','JI','Kediri','996-4686 Euismod Rd.','77148','faucibus@nectellus.net');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('E50B3B7D-150D-DF14-EF28-26DB2BC3D627','Stella Buchanan','1-706-844-6527','Kenya','Antioquia','Bello','7620 Feugiat. St.','12147','eu.turpis@penatibuset.edu');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('AAEC9D5B-741D-38EE-2A4E-39574C410F17','Ulysses Lowery','1-753-308-5824','Chad','Western Australia','Perth','Ap #840-3840 In, Rd.','38198','molestie.orci.tincidunt@nec.ca');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('85FAC5CA-AED0-FD2E-91B6-E7132AE196FA','Phyllis Allen','1-692-625-6029','Angola','MB','Brandon','543-2454 Libero. Rd.','448005','Ut@ut.org');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('643F21D9-7A09-9B36-0B0A-18006E535D52','Shellie Pope','1-897-472-0146','Iraq','SJ','San Vicente','7466 Dictum Ave','301774','mollis.Integer@turpisnec.com');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('76C464F8-FAC9-0A21-B104-9B89E4F9133A','Diana Stone','1-871-250-8972','Tunisia','CE','Itapipoca','5124 Purus. Avenue','05150','eu.ultrices@commodo.net');
INSERT INTO Examinee([ExamineeID],[Name],[PhoneNumber],[Country],[State],[City],[Street],[PostCode],[Email]) VALUES('9F7274AC-DA9E-FF88-B13D-8417D92A4BE8','Vaughan Decker','1-444-112-7176','Kuwait','RJ','Jodhpur','Ap #308-1899 A, Ave','863728','odio@venenatisvelfaucibus.ca');

--Create table VideoRecord
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('VideoRecord'))
BEGIN;
    DROP TABLE [VideoRecord];
END;
GO

CREATE TABLE [VideoRecord] (
    [VideoRecordID] INTEGER CONSTRAINT VideoRecord_PK PRIMARY KEY NOT NULL,
    [CamOneURL] VARCHAR(255) NOT NULL,
    [CamTwoURL] VARCHAR(255) NOT NULL
);
GO

--Insert Records into VideoRecord

INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100000,'https://youtu.be/8ELpzmNeS4M','https://youtu.be/DubdqpkKsPA');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100005,'https://youtu.be/gReIifavBkU','https://youtu.be/BEU60kf2Nv8');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100001,'https://youtu.be/cqzSS9BkJqE','https://youtu.be/cqzSS9BkJqE');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100006,'https://youtu.be/a3aUFcezC4g','https://youtu.be/a3aUFcezC4g');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100002,'https://youtu.be/meQDES6xzKE','https://youtu.be/meQDES6xzKE');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100011,'https://youtu.be/ymU8htqPUoc','https://youtu.be/ymU8htqPUoc');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100003,'https://youtu.be/8gOZmQ-7rgA','https://youtu.be/8gOZmQ-7rgA');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100004,'https://youtu.be/2AzQPLSdtAY','https://youtu.be/2AzQPLSdtAY');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100007,'https://youtu.be/NqVsvP0GA6U','https://youtu.be/NqVsvP0GA6U');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100012,'https://youtu.be/MfqZwbNXOJ0','https://youtu.be/MfqZwbNXOJ0');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100008,'https://youtu.be/eBi9BnbCAh4','https://youtu.be/eBi9BnbCAh4');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100013,'https://youtu.be/06Fvc3Rsiho','https://youtu.be/06Fvc3Rsiho');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100010,'https://youtu.be/pt_rGNOHibo','https://youtu.be/pt_rGNOHibo');
INSERT INTO VideoRecord([VideoRecordID],[CamOneURL],[CamTwoURL]) VALUES(100009,'https://youtu.be/oBjDrxe8h6M','https://youtu.be/oBjDrxe8h6M');

--Create table Location
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Location'))
BEGIN;
    DROP TABLE [Location];
END;
GO

CREATE TABLE [Location] (
    [LocationID] VARCHAR(50) CONSTRAINT Location_PK PRIMARY KEY NOT NULL,
    [Latitude] VARCHAR(30) NOT NULL,
    [Longtitude] VARCHAR(30) NOT NULL
);
GO

--Insert Records into Location
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('GYO30JEB3OJ','27.64375','-127.18084');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('MFQ06BXQ8DO','-12.29763','-10.63334');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('YEE19YGS8EU','75.38718','-34.88898');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('VZA20MAQ2NA','2.78037','-14.58775');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('RFK68IRU9GM','-88.61947','21.85386');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('XPA31TQJ6XD','-60.93398','94.02281');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('RKA66CIR8XO','89.58283','89.61327');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('ETO95FHG9JD','19.99375','33.01561');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('AUA22MQK7NA','77.95083','19.63991');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('XGF14FHZ8OY','-50.50271','45.61609');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('WEJ53TXF5EG','84.67326','96.10485');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('OYA33LMJ3XO','36.02196','-130.50945');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('UUZ65SUU8SF','67.07763','-106.86966');
INSERT INTO Location([LocationID],[Latitude],[Longtitude]) VALUES('HPZ63VGA4AZ','-84.77038','75.10414');


--Create table ExamTaken
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('ExamTaken'))
BEGIN;
    DROP TABLE [ExamTaken];
END;
GO

CREATE TABLE [ExamTaken] (
    [ExamineeID] UNIQUEIDENTIFIER CONSTRAINT ExamTaken_FK_ExamineeID FOREIGN KEY REFERENCES [Examinee](ExamineeID) NOT NULL,
    [ExamSessionID] VARCHAR(50) CONSTRAINT ExamTaken_FK_ExamSessionID FOREIGN KEY REFERENCES [ExamSession](ExamSessionID) NOT NULL,
    [LocationID] VARCHAR(50) CONSTRAINT ExamTaken_FK_LocationID FOREIGN KEY REFERENCES [Location](LocationID) NOT NULL,
    [VideoRecordID] INTEGER CONSTRAINT ExamTaken_FK_VideoRecordID FOREIGN KEY REFERENCES [VideoRecord](VideoRecordID)  NOT NULL,
    [ExamScore] Float NULL,
	[SubmitTime] SMALLDATETIME NULL,
    CONSTRAINT ExamTaken_PK PRIMARY KEY  (
	ExamineeID,
	ExamSessionID),
);
GO

--Insert Records into ExamTaken
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('4A990C71-E223-2485-3C3A-00253C84AE16','EMB89PPQ1UH','GYO30JEB3OJ',100000,60,'2020-04-01 16:12:00');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('643F21D9-7A09-9B36-0B0A-18006E535D52','EMB89PPQ1UH','YEE19YGS8EU',100001,73,'2020-04-01 16:15:05');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('2DD4B024-87F4-00F3-145B-1865EBFBA805','EMB89PPQ1UH','RFK68IRU9GM',100002,93,'2020-04-01 16:20:01');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('87F7090B-FB9A-2C52-E0B3-1994010F8E74','EMB89PPQ1UH','RKA66CIR8XO',100003,72,'2020-04-01 15:59:00');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('E50B3B7D-150D-DF14-EF28-26DB2BC3D627','EMB89PPQ1UH','ETO95FHG9JD',100004,97,'2020-04-01 16:01:00');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('4A990C71-E223-2485-3C3A-00253C84AE16','JKC48MNB3AH','MFQ06BXQ8DO',100005,93,'2020-05-01 16:59:58');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('643F21D9-7A09-9B36-0B0A-18006E535D52','JKC48MNB3AH','VZA20MAQ2NA',100006,98,'2020-05-01 16:48:20');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('7EC6DFFB-D8CF-AEF0-441E-325A9F913447','JKC48MNB3AH','AUA22MQK7NA',100007,77,'2020-05-01 17:11:00');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('AAEC9D5B-741D-38EE-2A4E-39574C410F17','JKC48MNB3AH','WEJ53TXF5EG',100008,87,'2020-05-01 17:25:34');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('9F7274AC-DA9E-FF88-B13D-8417D92A4BE8','JKC48MNB3AH','UUZ65SUU8SF',100009,72,'2020-05-01 16:49:30');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('F6A41629-2D43-8ADF-0C41-94FBFCEB8C0A','JKC48MNB3AH','HPZ63VGA4AZ',100010,84,'2020-05-01 17:00:09');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('2DD4B024-87F4-00F3-145B-1865EBFBA805','QWC21IIA1CU','XPA31TQJ6XD',100011,83,'2020-01-01 10:00:00');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('7EC6DFFB-D8CF-AEF0-441E-325A9F913447','QWC21IIA1CU','XGF14FHZ8OY',100012,99,'2020-01-01 10:29:00');
INSERT INTO ExamTaken([ExamineeID],[ExamSessionID],[LocationID],[VideoRecordID],[ExamScore],[SubmitTime]) VALUES('1AAEE0C9-DEDE-F9BA-DD47-767396C747CB','QWC21IIA1CU','OYA33LMJ3XO',100013,88,'2020-01-01 10:25:38');


