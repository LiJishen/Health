drop table health;

create table health 
 (
 patient_nbr integer,
 race varchar(100),
 gender varchar(20),
 age varchar(50),
 time_in_hospital integer,
 num_lab_procedures integer,
 num_procedures integer,
 num_medications integer,
 number_outpatient integer,
 number_emergency integer,
 number_inpatient integer,
 number_diagnoses integer
 );

 ALTER TABLE health ADD CONSTRAINT health_PK PRIMARY KEY ( "patient_nbr" ) ;