SELECT
    /* Selecting Person Fields */
    P.ID AS P_ID,
    P.FIRSTNAME AS P_FirstName,
    P.MIDDLENAME AS P_MiddleName,
    P.LASTNAME AS P_LastName,
    P.GENDERCODESETID AS P_Gender,
    P.EMPLOYER AS P_Employer,
    P.ISACTIVE AS P_IsActive,
    /* Selecting Address Fields */
    PA.PersonAddressID AS PA_PersonAddressID,
    PA.Street AS PA_Street,
    PA.LineTwo AS PA_LineTwo,
    PA.City AS PA_City,
    PA.PostalCode AS PA_PostalCode,
    PA.UNIT AS PA_UNIT,
    PAA.AddressPriorityOrder AS PA_AddressPriorityOrder,
    /* Selecting Phone Number Fields */
    PPNA.PhoneNumberID AS PN_PhoneNumberID,
    PPNA.PhoneNumberAsEntered AS PN_PhoneNumberAsEntered,
    PPNA.PhoneTypeCodeSetID AS PN_PhoneTypeCodeSetID,
    PPNA.IsPreferred AS PN_IsPreferred,
    PN.PhoneNumberEXT AS PN_EXT,
    PN.IsSMS AS PN_IsSMS,
    /* Selecting Email Address */
    PEAA.EmailAddressID AS PE_EmailAddressID,
    PEAA.IsPrimaryEmailAddress AS PE_IsPrimaryEmailAddress,
    PEAA.EmailAddressPriorityOrder AS PE_EmailAddressPriorityOrder,
    E.EmailAddress AS PE_EmailAddress,
    /* Selecting Student Relationship Fields */
    SCA.STUDENTCONTACTASSOCID AS PR_STUDENTCONTACTASSOCID,
    SCA.StudentDCID AS PR_StudentDCID,
    SCD.RelationshipTypeCodeSetID AS PR_RelationshipTypeCodeSetID,
    SCD.IsActive AS PR_IsActive,
    SCD.IsEmergency AS PR_IsEmergency,
    SCD.IsCustodial AS PR_IsCustodial,
    SCD.LivesWithFlg AS PR_LivesWithFlg,
    SCD.SchoolPickUpFlg AS PR_SchoolPickUpFlg,
    SCD.ReceivesMailFlg AS PR_ReceivesMailFlg
FROM
    /* Main Contacts Table */
    Person P 
        /* Connects Person with the main Student Relationship */
        INNER JOIN StudentContactAssoc SCA ON (SCA.personID = P.ID) 
        /* Connects main Student Relationship with the details*/
        INNER JOIN StudentContactDetail SCD ON (SCD.STUDENTCONTACTASSOCID = SCA.STUDENTCONTACTASSOCID) 
        /* Connects Person with main Email table */
        INNER JOIN PersonEmailAddressAssoc PEAA ON (PEAA.PersonID = P.ID) 
        /* Connects Main Email table with the details */
        INNER JOIN EmailAddress E ON (E.EmailAddressID = PEAA.EmailAddressID) 
        /* Connects Person with main Phone table*/
        INNER JOIN PersonPhoneNumberAssoc PPNA ON (PPNA.PersonID = P.ID) 
        /* Connects Main Phone table with the details */
        INNER JOIN PhoneNumber PN ON (PN.PhoneNumberID = PPNA.PhoneNumberID) 
        /* Connects Person with Main Address table */
        INNER JOIN PersonAddressAssoc PAA ON (PAA.PersonID = P.ID) 
        /* Connects Main Address table to the details */
        INNER JOIN PersonAddress PA ON (PA.PersonAddressID = PAA.PersonAddressID) 