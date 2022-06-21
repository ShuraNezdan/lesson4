-- ����������� ������������ � ������ �����
select namegenre, count(distinct executor) from genreexecutor g2
join genre g on g2.genre = g.id 
group by namegenre;


-- ����������� ������, �������� � ������� 2019-2020
select count(namesong) from track t
join album a on t.album = a.id
where a.releasedata between '1991-01-01' and '1992-01-01';


-- ������� ����������������� ������ �� ������� �������
select namealbum, avg(durationsong) from album a 
join track t on a.id = t.album
group by namealbum;


-- ��� �����������, ������� �� ��������� ������� � 2020 ����
select e2.executor  from executoralbum e
join album a on a.id = e.album
join executor e2 on e2.id = e.executor
where a.releasedata not between '1991-01-01' and '1991-12-01'


-- �������� ��������� � ������� ������������ ���������� �����������
select namecollections from collections c 
join trackcollection t on c.id = t.collection 
join track t2 on t2.id = t.track 
join album a on t2.album = a.id 
join executoralbum e on a.id = e.album 
join executor e2 on e.executor = e2.id 
where e2.executor = 'Motley Crue';


-- �������� ��������, � ������� ������������ ����������� ����� 1 �����
select namealbum n from album a 
join executoralbum e on a.id = e.album 
join executor e2 on e.executor = e2.id 
join genreexecutor g on e2.id = g.executor 
join genre g2 on g.genre = g2.id 
group by n
having count(g2.namegenre) > 1;


-- ������������ ������, ������� �� ������ � ��������
select * from track t 
left join trackcollection t2 on t.id = t2.track 
where t2.track is NULL;


-- �����������, ���������� ����� �������� ����
select e.executor, durationsong from executor e 
join executoralbum e2 on e.id = e2.executor 
join album a on e2.album = a.id 
join track t on a.id = t.album 
where durationsong <= (select min(durationsong) from track);


-- �������� �������� ���������� ���������� ����������� ������

select namealbum , count(t.id) from album a
join track t on a.id  = t.album 
group by namealbum
having count(t.id) <= ( select min(mc) from ( select count(t2.id) mc from album a2
join track t2 on a2.id  = t2.album 
group by namealbum) as a1);


