   /*1.����classroom�����ұ�*/
   create table classroom
	
         (building		varchar(15),
	 
          room_number		varchar(7),
	 
          capacity		numeric(4,0),
	 
          primary key (building, room_number)
	);


  
   /*2.����department
��ϵ��*/
   create table department
	
         (dept_name		varchar(20), 
	 
          building		varchar(15), 
	 
          budget  numeric(12,2) check (budget > 0),
	 
          primary key (dept_name)
	);


  
   /*3.����course���γ̱�*/
   create table course
	
         (course_id		varchar(8), 
	 
          title			varchar(50), 
	 
          dept_name		varchar(20),
	
          credits		numeric(2,0) check (credits > 0),
	
          primary key (course_id)
	);



    /*4.����instructor
����ʦ��*/
    create table instructor
	
         (ID	varchar(5), 
	 
          name			varchar(20) not null, 
	 
          dept_name		varchar(20), 
	 
          salary		numeric(8,2) check (salary > 29000),
	 
          primary key (ID)
	);


   
  /*5.����section
���γ̶α�*/
   /*��¼ÿ�ſε��ڿ������ֶ����*/
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


    /*6.����teaches

����ʦ�ڿα�*/
 
   create table teaches
	
          (ID			varchar(5), 
	 
           course_id		varchar(8),
	 
           sec_id		varchar(8), 
	 
           semester		varchar(6),
	
           year			numeric(4,0),
	
           primary key (ID, course_id, sec_id, semester, year)
	);



  
   /*7.����student
��ѧ����*/
   create table student
	
         (ID			varchar(5), 
	 
          name			varchar(20) not null, 
	 
          dept_name		varchar(20), 
	 
          tot_cred		numeric(3,0) check (tot_cred >= 0),
	 
          primary key (ID)
	);



   
   /*8.����takes
��ѧ��ѡ�α�*/
   create table takes
	
         (ID			varchar(5), 
	 
          course_id		varchar(8),
	 
          sec_id		varchar(8), 
	 
          semester		varchar(6),
	 
          year			numeric(4,0),
	 
          grade		        varchar(2),
	 
          primary key (ID, course_id, sec_id, semester, year)
	);



   /*9.����advisor
��ָ���߱�*/

 
   create table advisor
	
          (s_ID			varchar(5),
	 
           i_ID			varchar(5),
	 
          primary key (s_ID)
	);




 /*10.����time_slot
����¼�γ̵Ŀ�ʼ�ͽ���ʱ���*/
  create table time_slot
	
           (time_slot_id		varchar(4),
	 
            day			varchar(1),
	 
            start_hr		numeric(2) check (start_hr >= 0 and start_hr < 24),
	 
            start_min		numeric(2) check (start_min >= 0 and start_min < 60),
	 
            end_hr			numeric(2) check (end_hr >= 0 and end_hr < 24),
	 
            end_min		numeric(2) check (end_min >= 0 and end_min < 60),
	 
            primary key (time_slot_id, day, start_hr, start_min)
	);



  /*11.���� prereq�����޿γ̱�*/
   create table prereq
	
           (course_id		varchar(8), 
	 
            prereq_id		varchar(8),
	 
            primary key (course_id, prereq_id)
	);

