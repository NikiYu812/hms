
-- tb_oldHouse

-- 已签协议未搬家
select t1.* from tb_oldhouse t1 where (move_seq = "" or move_seq is null) and sign_state = 1; 
-- 查询搬家顺序号最大项
select max(t1.move_seq+0) from tb_oldhouse t1;
-- 已签协议
select t1.* from tb_oldhouse t1 where sign_state = 1 order by id+0;

select person_id,p0_name,count(person_id) from tb_oldhouse group by person_id having count(person_id)>1;

select oh.*,p.* from tb_oldhouse oh, tb_person p where (oh.person_id = p.id) and p.p0_name = '李明';
select p.* from tb_person p where p.p0_name = '李明';
select * from rt_housingInfo where originalTenant = '李明';
update tb_oldhouse oh set oh.person_id='2402' where oh.id=358;

select oh.*,p.* from tb_oldHouse oh,tb_person p  where oh.person_id = p.id order by oh.sign_state desc , oh.move_state desc , oh.id+0;

select oh.*,p.* from tb_oldHouse oh,tb_person p where oh.person_id = p.id and p.p0_name = '杜建红';

select nh.*,p.* from tb_newHouse nh,tb_person p  where nh.person_id = p.id order by nh.select_seq+0;