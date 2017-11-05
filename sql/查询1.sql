
-- tb_oldHouse

-- 已签协议未搬家
select t1.* from tb_oldhouse t1 where (move_seq = "" or move_seq is null) and sign_state = 1; 
-- 查询搬家顺序号最大项
select max(t1.move_seq+0) from tb_oldhouse t1;
-- 已签协议
select t1.* from tb_oldhouse t1 where sign_state = 1 order by id+0;

SELECT oh.person_id,oh.p0_name,count(oh.person_id) from tb_oldhouse oh where oh.sign_state = 0 GROUP BY oh.person_id;

select person_id,p0_name,count(person_id) from tb_oldhouse group by person_id having count(person_id)>1;

select oh.*,p.* from tb_oldhouse oh, tb_person p where (oh.person_id = p.id) and p.p0_name = '李明';
select p.* from tb_person p where p.p0_name = '李明';
select * from rt_housingInfo where originalTenant = '李明';
update tb_oldhouse oh set oh.person_id='2402' where oh.id=358;

select oh.*,p.* from tb_oldHouse oh,tb_person p  where oh.person_id = p.id order by oh.sign_state desc , oh.move_state desc , oh.id+0;

select oh.*,p.* from tb_oldHouse oh,tb_person p where oh.person_id = p.id and p.p0_name = '杜建红';

select nh.*,p.* from tb_newHouse nh left JOIN tb_person p  ON nh.person_id = p.id order by nh.select_seq+0 DESC;

UPDATE tb_person p set p.sign_state = (SELECT sign_state FROM tb_oldhouse where person_id = p.id);

-- 未签协议人员 
select * from tb_person p where p.sign_state = 0;
select oh.person_id,oh.p0_name,count(p0_name) from tb_oldHouse oh where oh.sign_state = 0 group by oh.person_id ;


select p.* from tb_person p order by p.choose2_result DESC,p.choose1_result desc,p.choose_state desc,p.sign_state desc,id+0;

select oh.*,p.* from tb_oldHouse oh,tb_person p  where oh.person_id = p.id and (oh.house_no= ? or p.p0_name = ? or p.p0_uid = ? or p.p1_idcNo = ?)