create table appointments
( 
appointment_id int primary key, 
patient_id int ,
 department_id int ,
 appointment_date date not null, 
 constraint fk_patid foreign key (patient_id) references patients(patient_id), 
 constraint fk_departid foreign key (department_id) references departments(department_id) 
 );


alter table patients
add column gender varchar(10);

alter table doctors
modify phone varchar(50);

alter table patients
drop column gender;

insert into patients
values(103,'Axelle','Gouin', 'axellegouin5@gmail.com',52);

insert into patients
	  values (1 ,'opley','Nguessan','opleynguessan@gmail.com',45);
      
      
      
      select * from patients;
      
      select email, first_name from patients;
      
      
      select * from patients where age>18;
      
      create index idxlastname 
      on patients(last_name);
      
      show index from patients;
      
      create view adult_patients As 
      select first_name, last_name, age from patients where age>18;

