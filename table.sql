DROP TABLE Time_Period;
DROP TABLE Technology;
DROP TABLE Local_Area;
DROP TABLE Human_Type;
DROP TABLE Small_Local_Area;
DROP TABLE Used_Technology;
DROP TABLE StoneAge;
DROP TABLE MetalAge;

CREATE TABLE Time_Period(
	TimeID VARCHAR(255) PRIMARY KEY NOT NULL,
	PeriodName VARCHAR(255),
	YearStart NUMBER(38),
	YearEnd NUMBER(38),
	Duration NUMBER(38)
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

CREATE TABLE Human_Type(
	Human_TypeID VARCHAR(255) PRIMARY KEY NOT NULL,
	Human_Type_Name VARCHAR(255),
	TimeID VARCHAR(255),
	CONSTRAINT FK_Time FOREIGN KEY (TimeID)
	REFERENCES Time_Period(TimeID)
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

CREATE TABLE Used_Technology(
	UsedTechnologyID VARCHAR(255),
	Human_UsedID VARCHAR(255),
	CONSTRAINT PK_Used_Technology PRIMARY KEY (UsedTechnologyID,Human_UsedID),
	CONSTRAINT FK_UsedTechnology FOREIGN KEY (UsedTechnologyID)
	REFERENCES Technology(TechnologyID),
	CONSTRAINT FK_Human_Used FOREIGN KEY (Human_UsedID)
	REFERENCES Human_Type(Human_TypeID)
);

CREATE TABLE StoneAge(
	Cat_StoneID VARCHAR(255),
	Description VARCHAR(255),
	PRIMARY KEY (Cat_StoneID),
	CONSTRAINT FK_Cat_Stone FOREIGN KEY (Cat_StoneID)
	REFERENCES Time_Period(TimeID)
);

CREATE TABLE MetalAge(
	Cat_MetalID VARCHAR(255),
	Description VARCHAR(255),
	PRIMARY KEY (Cat_MetalID),
	CONSTRAINT FK_Cat_Metal FOREIGN KEY (Cat_MetalID)
	REFERENCES Time_Period(TimeID)
);
