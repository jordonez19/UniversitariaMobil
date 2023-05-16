CREATE DATABASE DBUDC;

USE DBUDC;


CREATE TABLE Document (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Gender (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Program (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Teacher(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE NOT NULL,
    DocumentTypeId INT,
    Document VARCHAR(50),
    GenderId INT,
    Address VARCHAR(100),
    Mobile VARCHAR(50),
    Email VARCHAR(50)
);

CREATE TABLE Subject (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    Name VARCHAR(50),
    TeacherId INT,
    FOREIGN KEY (TeacherId) REFERENCES Teacher(id)
);

CREATE TABLE Student (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE NOT NULL,
    DocumentTypeId INT,
    Document VARCHAR(50),
    GenderId INT,
    Address VARCHAR(100),
    Mobile VARCHAR(50),
    Email VARCHAR(50),
    ProgramId INT,
    FOREIGN KEY (DocumentTypeId) REFERENCES Document(id),
    FOREIGN KEY (GenderId) REFERENCES Gender(id),
    FOREIGN KEY (ProgramId) REFERENCES Program(id)
);


CREATE TABLE Results (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    StudentId INT,
    SubjectId INT,
    Note1 DECIMAL(9, 1),
    Note2 DECIMAL(9, 1),
    Note3 DECIMAL(9, 1),
    FOREIGN KEY (StudentId) REFERENCES Student(id),
    FOREIGN KEY (SubjectId) REFERENCES Subject(id)
);


/* --------------------------------------------------------------------- */
/* program */
/* --------------------------------------------------------------------- */
CREATE PROCEDURE AddProgram(
    @p_ProgramId INT,
    @p_Name VARCHAR(50)
)
AS
BEGIN
    INSERT INTO Program (id, Name) VALUES (@p_ProgramId, @p_Name);
END;

/* ------------------------------------- */
CREATE PROCEDURE UpdateProgram(
    @p_ProgramId INT,
    @p_Name VARCHAR(50)
)
AS
BEGIN
    UPDATE Program SET Name = @p_Name WHERE id = @p_ProgramId;
END;

/* ------------------------------------- */
CREATE PROCEDURE DeleteProgram(
    @p_ProgramId INT
)
AS
BEGIN
    DELETE FROM Program WHERE id = @p_ProgramId;
END;

/* --------------------------------------------------------------------- */
/* gender */
/* --------------------------------------------------------------------- */
CREATE PROCEDURE AddGender(
    @p_GenderId INT,
    @p_Name VARCHAR(50)
)
AS
BEGIN
    INSERT INTO Gender (id, Name) VALUES (@p_GenderId, @p_Name);
END;

/* ------------------------------------- */
CREATE PROCEDURE UpdateGender(
    @p_GenderId INT,
    @p_Name VARCHAR(50)
)
AS
BEGIN
    UPDATE Gender SET Name = @p_Name WHERE id = @p_GenderId;
END;

/* ------------------------------------- */
CREATE PROCEDURE DeleteGender(
    @p_GenderId INT
)
AS
BEGIN
    DELETE FROM Gender WHERE id = @p_GenderId;
END;

/* --------------------------------------------------------------------- */
/* Document */
/* --------------------------------------------------------------------- */
CREATE PROCEDURE AddDocument(
    @p_DocumentId INT,
    @p_Name VARCHAR(50)
)
AS
BEGIN
    INSERT INTO Document (id, Name) VALUES (@p_DocumentId, @p_Name);
END;

/* ------------------------------------- */
CREATE PROCEDURE UpdateDocument(
    @p_DocumentId INT,
    @p_Name VARCHAR(50)
)
AS
BEGIN
    UPDATE Document SET Name = @p_Name WHERE id = @p_DocumentId;
END;

/* ------------------------------------- */
CREATE PROCEDURE DeleteDocument(
    @p_DocumentId INT
)
AS
BEGIN
    DELETE FROM Document WHERE id = @p_DocumentId;
END;

/* --------------------------------------------------------------------- */
SET IDENTITY_INSERT Program ON;

EXEC AddProgram 1, 'Ing de Software';

EXEC AddProgram 2, 'Ing de sistemas';

EXEC AddProgram 3, 'Ing industrial';


/* --------------------------------------------------------------------- */
/* Student */
/* --------------------------------------------------------------------- */

CREATE PROCEDURE AddStudent(
        @s_id   INT,
    @s_firstName  VARCHAR(50),
@s_LastName  VARCHAR(50),
@s_BirthDate  DATE,
@s_DocumentTypeId  INT,
@s_Document  VARCHAR(50),
@s_GenderId  INT,
@s_Address  VARCHAR(100),
@s_Mobile  VARCHAR(50),
@s_Email  VARCHAR(50),
@s_ProgramId INT
)
AS
BEGIN
  INSERT INTO Student (
id,
FirstName,
LastName,
BirthDate,
DocumentTypeId,
Document,
GenderId,
Address,
Mobile,
Email,
ProgramId
 ) VALUES (
    @s_id, 
    @s_firstName,
@s_LastName,
@s_BirthDate,
@s_DocumentTypeId,
@s_Document,
@s_GenderId,
@s_Address,
@s_Mobile,
@s_Email,
@s_ProgramId
    );
END;

SELECT * FROM Program



-- Estudiante 1
EXEC AddStudent 1, 'Juan', 'Pérez', '1999-03-15', 1, '1234567890', 1, 'Calle Principal #123', '1234567890', 'juan.perez@example.com', 101;

-- Estudiante 2
EXEC AddStudent 2, 'María', 'González', '2001-07-22', 2, '9876543210', 2, 'Avenida Central #456', '9876543210', 'maria.gonzalez@example.com', 102;

-- Estudiante 3
EXEC AddStudent 3, 'Carlos', 'Rodríguez', '2000-05-10', 1, '2468135790', 1, 'Calle Secundaria #789', '2468135790', 'carlos.rodriguez@example.com', 103;

-- Estudiante 4
EXEC AddStudent 4, 'Ana', 'Sánchez', '1998-11-28', 2, '1357924680', 2, 'Avenida Norte #987', '1357924680', 'ana.sanchez@example.com', 101;

-- Estudiante 5
EXEC AddStudent 5, 'Luis', 'Torres', '1997-09-05', 1, '8642097531', 1, 'Calle Oeste #654', '8642097531', 'luis.torres@example.com', 104;