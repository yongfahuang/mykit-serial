drop table if exists DB_MACHINE_SERIAL_NUMBER_PROVIDER;

create table DB_MACHINE_SERIAL_NUMBER_PROVIDER
(
   SERIAL_NUMBER  bigint not null,
   IP  varchar(64) default null,
   primary key (SERIAL_NUMBER),
   unique key UK_IP(IP)
);

drop procedure if exists initDbMachineSerialNumberProvider;

DELIMITER //  
create procedure initDbMachineSerialNumberProvider()  
begin 
	declare v int;  
	set v=0;
	set autocommit=false;
	
	LOOP_LABLE:loop  
	insert into DB_MACHINE_SERIAL_NUMBER_PROVIDER(SERIAL_NUMBER) values(v);
	set v=v+1;  
	if v >= 1024 then 
	leave LOOP_LABLE;  
	end if;  
	end loop;  
	
	commit;
	set autocommit=true;
end;  
//  
DELIMITER ;

call initDbMachineSerialNumberProvider;

