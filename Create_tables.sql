   /*1.建立classroom表，科室表*/
   create table classroom
	
         (building		varchar(15),
	 
          room_number		varchar(7),
	 
          capacity		numeric(4,0),
	 
          primary key (building, room_number)
	);


  
   /*2.建立department
表，系表*/
   create table department
	
         (dept_name		varchar(20), 
	 
          building		varchar(15), 
	 
          budget  numeric(12,2) check (budget > 0),
	 
          primary key (dept_name)
	);


  
   /*3.建立course表，课程表*/
   create table course
	
         (course_id		varchar(8), 
	 
          title			varchar(50), 
	 
          dept_name		varchar(20),
	
          credits		numeric(2,0) check (credits > 0),
	
          primary key (course_id)
	);



    /*4.建立instructor
表，教师表*/
    create table instructor
	
         (ID	varchar(5), 
	 
          name			varchar(20) not null, 
	 
          dept_name		varchar(20), 
	 
          salary		numeric(8,2) check (salary > 29000),
	 
          primary key (ID)
	);


   
  /*5.建立section
表，课程段表*/
   /*记录每门课的授课情况或分段情况*/
    create table section
	
         (course_id		varchar(8), 
         
          sec_id		varchar(8),
	 
          semester varchar(6)
 check (semester in ('Fall', 'Winter', 'Spring', 'Summer')), 

       	  year			numeric(4,0) check (year > 1701 and year < 2100), 
	
          building		varchar(15),
	 
          room_number		varchar(7),
	 
          time_slot_id		varchar(4),
	 
          primary key (course_id, sec_id, semester, year)
	);


    /*6.建立teaches

表，教师授课表*/
 
   create table teaches
	
          (ID			varchar(5), 
	 
           course_id		varchar(8),
	 
           sec_id		varchar(8), 
	 
           semester		varchar(6),
	
           year			numeric(4,0),
	
           primary key (ID, course_id, sec_id, semester, year)
	);



  
   /*7.建立student
表，学生表*/
   create table student
	
         (ID			varchar(5), 
	 
          name			varchar(20) not null, 
	 
          dept_name		varchar(20), 
	 
          tot_cred		numeric(3,0) check (tot_cred >= 0),
	 
          primary key (ID)
	);



   
   /*8.建立takes
表，学生选课表*/
   create table takes
	
         (ID			varchar(5), 
	 
          course_id		varchar(8),
	 
          sec_id		varchar(8), 
	 
          semester		varchar(6),
	 
          year			numeric(4,0),
	 
          grade		        varchar(2),
	 
          primary key (ID, course_id, sec_id, semester, year)
	);



   /*9.建立advisor
表，指导者表*/

 
   create table advisor
	
          (s_ID			varchar(5),
	 
           i_ID			varchar(5),
	 
          primary key (s_ID)
	);




 /*10.建立time_slot
表，记录课程的开始和结束时间等*/
  create table time_slot
	
           (time_slot_id		varchar(4),
	 
            day			varchar(1),
	 
            start_hr		numeric(2) check (start_hr >= 0 and start_hr < 24),
	 
            start_min		numeric(2) check (start_min >= 0 and start_min < 60),
	 
            end_hr			numeric(2) check (end_hr >= 0 and end_hr < 24),
	 
            end_min		numeric(2) check (end_min >= 0 and end_min < 60),
	 
            primary key (time_slot_id, day, start_hr, start_min)
	);



  /*11.建立 prereq表，先修课程表*/
   create table prereq
	
           (course_id		varchar(8), 
	 
            prereq_id		varchar(8),
	 
            primary key (course_id, prereq_id)
	);

