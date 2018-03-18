-- INSERT INTO tb_oldhouse (id,house_no,person_id,p0_name,location,area,sign_state,move_seq,remark) SELECT id,buildingNo,personId,OriginalTenant,areaId,S,state,seqId,remark FROM tb_oldhouse0;
-- 初始化tb_newHouse
update tb_newhouse t set t.isSelected = 0,t.person_id='',t.p0_name = '',t.select_seq = 0,t.select_time = '';
-- 初始化tb_person
update tb_person p set p.choose_state = 0 , p.nh_id = '', p.choose1_result='',p.choose2_result='';
-- 初始化tb_1stChoose
UPDATE tb_choose1 c set c.isSelected = 0 , c.person_id = '', c.p0_name = '', c.select_seq = 0, c.select_time = '';



-- select max(t.select_seq+0) as 'select_seq' from rt_newhouse t;

-- update tb_oldhouse t1 set t1.move_state = 0 where move_seq = "" or move_seq is null;
-- update tb_oldhouse t1 set t1.move_state = 1 where t1.move_seq != "" and t1.move_seq is not null;
-- update tb_oldhouse t1 set t1.move_seq = 0 where t1.move_seq is null or t1.move_seq = "";
-- 
-- UPDATE tb_person set move_state = 0, remark = '';