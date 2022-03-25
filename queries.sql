B1

B2

B3
SELECT small_local_area.District_name, time_period.PeriodName, 

SELECT *
FROM small_local_area
join local_area on small_local_area.L_AreaID = local_area.L_AreaID
join Human_Type on small_local_area.Human_TypeID = Human_Type.Human_TypeID
join time_period on Human_Type.TimeID = time_period.TimeID
join used_technology on human_type.Human_TypeID = used_technology.Human_TypeID
join technology on technology.TechnologyID = used_technology.TechnologyID;

B4
