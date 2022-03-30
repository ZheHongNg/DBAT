B1
SELECT local_area.State_Name AS State, District_name AS Location, Human_Type_Name AS Human_Species
FROM small_local_area
JOIN local_area ON small_local_area.L_AreaID = local_area.L_AreaID
JOIN Human_Type ON small_local_area.Human_TypeID = Human_Type.Human_TypeID;

B2
SELECT District_name AS Location, Human_Type.Human_Type_Name AS Human_Species, time_period.PeriodName AS Age
FROM small_local_area
JOIN Human_Type ON small_local_area.Human_TypeID = Human_Type.Human_TypeID
JOIN Time_Period ON Human_Type.TimeID = Time_Period.TimeID
ORDER BY time_period.PeriodName;

B3
SELECT local_area.State_Name AS State, COUNT(DISTINCT used_technology.UsedTechnologyID) AS Technology_Used, time_period.PeriodName AS Age
FROM small_local_area
join local_area on small_local_area.L_AreaID = local_area.L_AreaID
join Human_Type on small_local_area.Human_TypeID = Human_Type.Human_TypeID
join time_period on Human_Type.TimeID = time_period.TimeID
join used_technology on human_type.Human_TypeID = used_technology.Human_UsedID
GROUP BY local_area.State_Name, time_period.PeriodName
HAVING COUNT(used_technology.UsedTechnologyID)>0;

B4
SELECT B_summary.Tech_Name, B_summary.count_LocalArea
FROM (SELECT COUNT(DISTINCT local_area.L_AreaID) AS count_LocalArea, technology.Tools AS Tech_Name
FROM small_local_area
join Human_Type on small_local_area.Human_TypeID = Human_Type.Human_TypeID
join used_technology on human_type.Human_TypeID = used_technology.Human_UsedID
join technology on technology.TechnologyID = used_technology.UsedTechnologyID
GROUP BY technology.Tools) AS B_summary;

SELECT technology.Tools AS Tech_Name,
(SELECT COUNT(DISTINCT L_AreaID)
FROM small_local_area
WHERE small_local_area.Human_TypeID = used_technology.Human_UsedID) AS count_LocalArea,
(SELECT Time_Period.PeriodName 
FROM Time_Period, Human_Type
WHERE Human_Type.TimeID = Time_Period.TimeID) AS Age
FROM technology, used_technology
WHERE technology.TechnologyID = used_technology.UsedTechnologyID
GROUP BY technology.Tools;



