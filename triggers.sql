delimiter $$
create trigger trReginsfees
before insert on registration
for each row 
begin 
declare fee int;
select fees into  fee from course  where courseCode = NEW.courseCode;
set NEW.TOOTAL_fees = fee;
set NEW.fee_paid=0;
end$$
drop trigger trReginsfees;
delimiter;

insert into course values('Bscit1','Bachelor of science in IT',4,300000);
select *from course;
insert into learners values(1101,'Axelle',' Gouin Orianne',23,'F',0101010101,'Bscit1','Ivorian');

insert into registration(regDate,courseCode,studentID)
values('2026-02-02','Bscit1',1101);

delete from registration where studentId=  1101;
select* from registration;

insert into payments(paymentDate,Amount,regCode)
values('2026-04-16',150000,1101);

select* from payments;

alter table registration 
add column tootal_fees int;


delimeter$$
create trigger trInspayUpdateFees
before insert on payments for each row 
begin 
declare fee_p int;
select Amount into fee_p from payments where regCode=New.regCode;
update registration set tootal_fees=Tootal_fees-fee_p where regcode=New.regcode
update registration set fee_paid=fee_paid+
fee_p where regcode=New.regcode
end;
$$

show triggers;

