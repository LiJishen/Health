drop table patient;

create table patient
 (
 patient_nbr integer,
 race varchar(100),
 gender varchar(20),
 age varchar(50),
 );

 ALTER TABLE patient ADD CONSTRAINT patient_PK PRIMARY KEY ( "patient_nbr" ) ;

drop table hospital_record

create table hospital_record(
 patient_nbr integer,
 time_in_hospital integer,
 num_lab_procedures integer,
 num_procedures integer,
)
ALTER TABLE hospital_record ADD CONSTRAINT hospital_record_PK PRIMARY KEY ( "patient_nbr" ) ;

drop table patient_records

create table patient_records
(
 patient_nbr integer,
 num_medications integer,
 number_outpatient integer,
 number_emergency integer,
 number_inpatient integer,
 number_diagnoses integer
)
ALTER TABLE patient_records ADD CONSTRAINT patient_records_PK PRIMARY KEY ( "patient_nbr" ) ;