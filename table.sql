CREATE DATABASE DBATDB;

CREATE TABLE Time_Period(
	TimeID VARCHAR(255) PRIMARY KEY NOT NULL,
	YearStart int,
	YearEnd int
);

CREATE TABLE Technology(
	TechnologyID VARCHAR(255) PRIMARY KEY NOT NULL,
	Tools VARCHAR(255),
	Material VARCHAR(255)
);

CREATE TABLE Human_Type(
	Human_TypeID VARCHAR(255) PRIMARY KEY NOT NULL,
	Human_Type_Name VARCHAR(255),
	Human_AreaID VARCHAR(255),
	CONSTRAINT FK_Human_Area FOREIGN KEY (Human_AreaID)
	REFERENCES Small_Local_Area(S_L_AreaID)
);

CREATE TABLE Local_Area (
	L_AreaID VARCHAR(255) NOT NULL PRIMARY KEY,
	State_Name VARCHAR(255)
);

CREATE TABLE Small_Local_Area (
	S_L_AreaID VARCHAR(255) NOT NULL PRIMARY KEY,
	Main_AreaID VARCHAR(255),
	District_Name VARCHAR(255),
	CONSTRAINT FK_Main_Area FOREIGN KEY (Main_AreaID)
	REFERENCES Local_Area(L_AreaID)
);

CREATE TABLE Invented_In(
	InventedTimeID VARCHAR(255),
	InventedTechnologyID VARCHAR(255),
	CONSTRAINT FK_InventedTime FOREIGN KEY (InventedTimeID)
	REFERENCES Time_Period (TimeID),
	CONSTRAINT FK_InventedTechnology FOREIGN KEY (InventedTechnologyID)
	REFERENCES Technology(TechnologyID)
);

CREATE TABLE Used_Technology(
	UsedTechnologyID VARCHAR(255),
	Human_UsedID VARCHAR(255),
	CONSTRAINT FK_UsedTechnology FOREIGN KEY (UsedTechnologyID)
	REFERENCES Technology(TechnologyID),
	CONSTRAINT FK_Human_Used FOREIGN KEY (Human_UsedID)
	REFERENCES Human_Type(Human_TypeID)
);

CREATE TABLE Area_Has_Time(
	A_TimeID VARCHAR(255),
	Area_HTID VARCHAR(255),
	CONSTRAINT FK_A_Time FOREIGN KEY (A_TimeID)
	REFERENCES Time_Period (TimeID),
	CONSTRAINT FK_Area_HT FOREIGN KEY (Area_HTID)
	REFERENCES Small_Local_Area(S_L_AreaID)
);

CREATE TABLE Existed_In(
	Exist_TimeID VARCHAR(255),
	Human_ExistID VARCHAR(255),
	CONSTRAINT FK_ExistTime FOREIGN KEY (Exist_TimeID)
	REFERENCES Time_Period (TimeID),
	CONSTRAINT FK_Human_Exist FOREIGN KEY (Human_ExistID)
	REFERENCES Human_Type(Human_TypeID)
);
