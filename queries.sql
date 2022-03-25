B1
SELECT local_area.State_Name AS State, District_name AS Location, Human_Type_Name AS Human_Species
FROM small_local_area
JOIN local_area ON small_local_area.L_AreaID = local_area.L_AreaID
JOIN Human_Type ON small_local_area.Human_TypeID = Human_Type.Human_TypeID;

B2

B3
SELECT small_local_area.District_name, time_period.PeriodName, 

SELECT DISTINCT local_area.State_Name AS State, COUNT(used_technology.UsedTechnologyID) AS Technology_Used, time_period.PeriodName AS Age
FROM small_local_area
join local_area on small_local_area.L_AreaID = local_area.L_AreaID
join Human_Type on small_local_area.Human_TypeID = Human_Type.Human_TypeID
join time_period on Human_Type.TimeID = time_period.TimeID
join used_technology on human_type.Human_TypeID = used_technology.Human_UsedID
GROUP BY State, Age
HAVING COUNT(used_technology.UsedTechnologyID)>0;

B4
