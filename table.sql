CREATE DATABASE DBATDB;

CREATE TABLE Time_Period(
	TimeID VARCHAR(255) PRIMARY KEY NOT NULL,
	YearStart int,
	YearStart int
);

CREATE TABLE Invented_In(
    InventedTimeID VARCHAR(255),
    TechnologyID VARCHAR(255)
    CONSTRAINT FK_InventedTime FOREIGN KEY (Time)
    REFERENCES Time_Period (TimeID)
);


CREATE TABLE Technology(
	TechnologyID VARCHAR(255) PRIMARY KEY NOT NULL,
	Tools VARCHAR(255),
	Material VARCHAR(255)
);

CREATE TABLE Used_Technology(
    TechnologyID VARCHAR(255),
    Human_TypeID VARCHAR(255)
);

CREATE TABLE Human_Type(
	Human_TypeID VARCHAR(255) PRIMARY KEY NOT NULL,
	TimeID VARCHAR(255),
	Human_Type_Name VARCHAR(255),
	L_AreaID VARCHAR(255)
);

CREATE TABLE Local_Area (
    L_AreaID VARCHAR(255) NOT NULL PRIMARY KEY,
    State_Name VARCHAR(255)
);

CREATE TABLE Small_Local_Area (
    S_L_AreaID VARCHAR(255) NOT NULL PRIMARY KEY,
    L_AreaID VARCHAR(255),
    District_Name VARCHAR(255)
);

CREATE TABLE Area_On_Time(
    TimeID VARCHAR(255),
    L_AreaID VARCHAR(255)
);