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
	Material VARCHAR(255)
);

CREATE TABLE Local_Area (
	L_AreaID VARCHAR(255) NOT NULL PRIMARY KEY,
	State_Name VARCHAR(255)
);

CREATE TABLE Small_Local_Area (
	S_L_AreaID VARCHAR(255) NOT NULL PRIMARY KEY,
	L_AreaID VARCHAR(255),
	District_Name VARCHAR(255),
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

CREATE TABLE Invented_In(
	InventedTimeID VARCHAR(255),
	InventedTechnologyID VARCHAR(255),
	CONSTRAINT PK_Invented_In PRIMARY KEY (InventedTimeID,InventedTechnologyID),
	CONSTRAINT FK_InventedTime FOREIGN KEY (InventedTimeID)
	REFERENCES Time_Period (TimeID),
	CONSTRAINT FK_InventedTechnology FOREIGN KEY (InventedTechnologyID)
	REFERENCES Technology(TechnologyID)
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

CREATE TABLE Area_Has_Time(
	A_TimeID VARCHAR(255),
	Area_HTID VARCHAR(255),
	CONSTRAINT PK_Area_Has_Time PRIMARY KEY (A_TimeID,Area_HTID),
	CONSTRAINT FK_A_Time FOREIGN KEY (A_TimeID)
	REFERENCES Time_Period (TimeID),
	CONSTRAINT FK_Area_HT FOREIGN KEY (Area_HTID)
	REFERENCES Small_Local_Area(S_L_AreaID)
);

CREATE TABLE Human_live(
	human_livingID VARCHAR(255),
	living_placeID VARCHAR(255),
	CONSTRAINT PK_Human_live PRIMARY KEY (human_livingID,living_placeID),
	CONSTRAINT FK_human_live FOREIGN KEY (human_livingID)
	REFERENCES Human_Type (Human_TypeID),
	CONSTRAINT FK_living_place FOREIGN KEY (living_placeID)
	REFERENCES Small_Local_Area(S_L_AreaID)
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
