B1

column State format a20
column Location format a20
column Human_Type_Name format a20

SELECT local_area.State_Name AS State, District_name AS Location, Human_Type_Name AS Human_Species
FROM small_local_area
JOIN local_area ON small_local_area.L_AreaID = local_area.L_AreaID
JOIN Human_Type ON small_local_area.Human_TypeID = Human_Type.Human_TypeID;

B2

column Location format a20
column Human_Species format a20
column Ages format a20

SELECT District_name AS Location, Human_Type.Human_Type_Name AS Human_Species, time_period.PeriodName AS Ages
FROM small_local_area
JOIN Human_Type ON small_local_area.Human_TypeID = Human_Type.Human_TypeID
JOIN Time_Period ON Human_Type.TimeID = Time_Period.TimeID
ORDER BY time_period.PeriodName;

B3

column State format a20
column Ages format a20
column Amount_Technology_Used format 9999

SELECT local_area.State_Name AS State, time_period.PeriodName AS Ages, COUNT(DISTINCT used_technology.UsedTechnologyID) AS Amount_Technology_Used
FROM small_local_area
JOIN local_area ON small_local_area.L_AreaID = local_area.L_AreaID
JOIN Human_Type ON small_local_area.Human_TypeID = Human_Type.Human_TypeID
JOIN time_period ON Human_Type.TimeID = time_period.TimeID
JOIN used_technology ON human_type.Human_TypeID = used_technology.Human_UsedID
GROUP BY local_area.State_Name, time_period.PeriodName
HAVING COUNT(used_technology.UsedTechnologyID)>0;

B4

column Technology_Name format a20
column Ages format a20
column Number_of_state format 9999

SELECT Technology_Name, Ages, Number_of_state
FROM (SELECT COUNT(DISTINCT L_AreaID) AS Number_of_state, technology.Tools AS Technology_Name, time_period.PeriodName AS Ages
FROM small_local_area
JOIN Human_Type ON small_local_area.Human_TypeID = Human_Type.Human_TypeID
JOIN time_period ON Human_Type.TimeID = time_period.TimeID
JOIN used_technology ON human_type.Human_TypeID = used_technology.Human_UsedID
JOIN technology ON technology.TechnologyID = used_technology.UsedTechnologyID
GROUP BY technology.Tools, time_period.PeriodName)
ORDER BY Ages;
