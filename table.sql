CREATE DATABASE DBATDB;

CREATE TABLE Time_Period(
	TimeID VARCHAR(255) PRIMARY KEY NOT NULL,
	PeriodName VARCHAR(255),
	YearStart int,
	YearEnd int
);

CREATE TABLE Technology(
	TechnologyID VARCHAR(255) PRIMARY KEY NOT NULL,
	Tools VARCHAR(255),
	Material VARCHAR(255),
);

CREATE TABLE Local_Area (
	L_AreaID VARCHAR(255) NOT NULL PRIMARY KEY,
	State_Name VARCHAR(255)
);

CREATE TABLE Small_Local_Area (
	S_L_AreaID VARCHAR(255) NOT NULL PRIMARY KEY,
	L_AreaID VARCHAR(255),
	Human_TypeID VARCHAR(255),
	District_Name VARCHAR(255),
	CONSTRAINT FK_human_live FOREIGN KEY (Human_TypeID)
	REFERENCES Human_Type (Human_TypeID),
	CONSTRAINT FK_L_Area FOREIGN KEY (L_AreaID)
	REFERENCES Local_Area(L_AreaID)
);

CREATE TABLE Human_Type(
	Human_TypeID VARCHAR(255) PRIMARY KEY NOT NULL,
	Human_Type_Name VARCHAR(255),
	TimeID VARCHAR(255),
	CONSTRAINT FK_Time FOREIGN KEY (TimeID)
	REFERENCES Time_Period(TimeID)
);

CREATE TABLE Used_Technology(
	UsedTechnologyID VARCHAR(255),
	Human_UsedID VARCHAR(255),
	CONSTRAINT PK_Used_Technology PRIMARY KEY (UsedTechnologyID,Human_UsedID),
	CONSTRAINT FK_UsedTechnology FOREIGN KEY (UsedTechnologyID)
	REFERENCES Technology(TechnologyID),
	CONSTRAINT FK_Human_Used FOREIGN KEY (Human_UsedID)
	REFERENCES Human_Type(Human_TypeID)
);

CREATE TABLE Weapon(
	Cat_weaponID VARCHAR(255),
	Functionality VARCHAR(255),
	PRIMARY KEY (Cat_weaponID),
	CONSTRAINT FK_cat_weapon FOREIGN KEY (Cat_weaponID)
	REFERENCES Technology(TechnologyID)
);

CREATE TABLE Tool(
	Cat_toolID VARCHAR(255),
	Functionality VARCHAR(255),
	PRIMARY KEY (Cat_toolID),
	CONSTRAINT FK_cat_tool FOREIGN KEY (Cat_toolID)
	REFERENCES Technology(TechnologyID)
);
