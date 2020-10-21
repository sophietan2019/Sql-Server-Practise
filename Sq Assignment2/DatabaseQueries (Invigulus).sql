--Write SELECT queries from all tables

SELECT * FROM ExamAdmin;

SELECT * FROM  Exam;

SELECT * FROM  ExamSession;

SELECT * FROM  Examinee;

SELECT * FROM  Location;

SELECT * FROM  VideoRecord;

SELECT * FROM ExamTaken;

--select all the exam admin and the exams they set
select upper(EA.Name) as 'Exam Admin Name',EA.Email,EX.ExamName,
Datediff(mi,convert(datetime,'00:00:00',108), convert(datetime,EX.ExamDuration,108)) as ExamMinutes
from ExamAdmin EA
left join Exam EX on EA.ExamAdminID=EX.ExamAdminID
order by ExamMinutes desc


--search for information of all examinees who took the  "Web Development 210" 

select EM.ExamineeID,EM.Name,EM.Email,EX.ExamName,ET.ExamScore,ET.SubmitTime
from ExamTaken ET
join Examinee EM on ET.ExamineeID=EM.ExamineeID
join ExamSession ES on ET.ExamSessionID=ES.ExamSessionID
join Exam EX on EX.ExamID=ES.ExamID
where ES.ExamID=10002 



--select examinees who took the "Web Development 210" exam more than once

select count(*) as 'Total Attemps',EM.Name,EX.ExamName
from ExamTaken ET
join Examinee EM on ET.ExamineeID=EM.ExamineeID
join ExamSession ES on ET.ExamSessionID=ES.ExamSessionID
join Exam EX on EX.ExamID=ES.ExamID
where ES.ExamID=10002 
group by EM.Name,EX.ExamName
having count(*)>=2


--select all the examinees whose examscores are higher than 90

select *
from Examinee EM
where EM.ExamineeID in (select ExamineeID from ExamTaken  where ExamScore>=90) 


