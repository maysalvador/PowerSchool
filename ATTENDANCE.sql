SELECT 
    S.student_number,
    S.LastFirst,
    S.GRADE_LEVEL,
    C.course_name,
    SCH.NAME,
    AC.DESCRIPTION,
    A.yearid
FROM
    ATTENDANCE A
    INNER JOIN STUDENTS S ON S.DCID = A.STUDENTID
    INNER JOIN SCHOOLS SCH ON SCH.SCHOOL_NUMBER = S.SCHOOLID
    INNER JOIN CC ON CC.DCID = A.CCID
    INNER JOIN COURSES C ON CC.COURSE_NUMBER = C.COURSE_NUMBER
    INNER JOIN ATTENDANCE_CODE AC ON AC.DCID = A.ATTENDANCE_CODEID
--WHERE TO_DATE(A.ATT_DATE,'MM/DD/YYYY') >= :START_DATE AND TO_DATE(A.ATT_DATE,'MM/DD/YYYY') <= :END_DATE



SELECT 
    S.student_number,
    S.LastFirst,
    S.GRADE_LEVEL,
    C.course_name,
    SCH.NAME,
    AC.DESCRIPTION,
    A.yearid,
    A.ATT_DATE
FROM
    ATTENDANCE A
    INNER JOIN STUDENTS S ON S.DCID = A.STUDENTID
    INNER JOIN SCHOOLS SCH ON SCH.SCHOOL_NUMBER = S.SCHOOLID
    INNER JOIN CC ON CC.DCID = A.CCID
    INNER JOIN COURSES C ON CC.COURSE_NUMBER = C.COURSE_NUMBER
    INNER JOIN ATTENDANCE_CODE AC ON AC.DCID = A.ATTENDANCE_CODEID
WHERE 
    A.ATT_DATE >= :SDATE AND
    A.ATT_DATE <= :EDATE