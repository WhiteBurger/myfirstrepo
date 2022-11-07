-- 1. ID가 11인 노선을 예매한 모든 승객의 ID(id), 이름(name), 
-- 좌석 번호(seat_number)를 좌석 번호의 오름차순 으로 조회
select `users`.`id`, `users`.`name`, `seat_number` from `tickets` 
inner join `users` on `tickets`.`id`=`users`.`id` AND `train`=11 order by `seat_number`;


-- 2. 각 사용자의 ID(id), 이름(name), 탑승 열차 수(trains_count), 총 거리(total_distance)를 
-- 총 거리의 내림 차순으로 상위 6명만 조회
select `users`.`id`, `users`.`name`, count(*) as `trains_count`, sum(`distance`) as 'total_distance' 
from `tickets` inner join `users` on `tickets`.`user`=`users`.`id` inner join `trains` on `tickets`.`train`=`trains`.`id` 
group by `users`.`id` order by `total_distance` desc limit 0, 6;

-- 3. 각 노선의 ID(id), 열차 종류(type), 출발역(src_stn), 도착역(dst_stn), 여행 시간(travel_time)을 
-- 여행 시 간의 내림차순으로 상위 6개만 조회
select `trains`.`id`, `types`.`name`, (select `name` from `stations` where `stations`.`id`=`trains`.`source`) as `src_stn`, (select `name` from `stations` where `stations`.`id`=`trains`.`destination`) as `dst_stn`, timediff(`arrival`, `departure`) as `travel_time`
from `trains` left join `types` on `trains`.`type`=`types`.`id` order by `travel_time` desc limit 0, 6;

-- 4. 각노선의열차종류(type),출발역(src_stn),도착역(dst_stn),출발시각(departure),도착시각(arrival), 
-- 운임(fare; 원 단위)을 출발 시각의 오름차순으로 모두 조회
select `types`.`name`, (select `name` from `stations` where `stations`.`id`=`trains`.`source`) as `src_stn`, (select `name` from `stations` where `stations`.`id`=`trains`.`destination`) as `dst_stn`, `departure`, `arrival`, round(.001*`types`.`fare_rate`*`trains`.`distance`,-2) as `fare`
from `trains` left join `types` on `trains`.`type`=`types`.`id` order by `departure` limit 0, 6;


-- 5. 각노선의ID(id),열차종류(type),출발역(src_stn),도착역(dst_stn),예매된좌석수(occupied),
-- 최대좌석 수(maximum)를 노선의 ID의 오름차순으로 모두 조회 (예매한 사용자가 없는 노선은 제외)
select `trains`.`id`, `types`.`name`, (select `name` from `stations` where `stations`.`id`=`trains`.`source`) as `src_stn`, (select `name` from `stations` where `stations`.`id`=`trains`.`destination`) as `dst_stn`, count(`tickets`.`seat_number`)as `occupied`,`max_seats` as `maximum`
from `trains` left join `types` on `trains`.`type`=`types`.`id` left join `tickets` on `trains`.`id`=`tickets`.`train`
group by `trains`.`id` order by `trains`.`id`;   --예매한 사용자가 없는 노선은 제외 안됨


-- 6. 각노선의ID(id),열차종류(type),출발역(src_stn),도착역(dst_stn),예매된좌석수(occupied),
-- 최대좌석 수(maximum)를 노선의 ID의 오름차순으로 모두 조회 (예매한 사용자가 없는 노선도 포함)
select `trains`.`id`, `types`.`name`, (select `name` from `stations` where `stations`.`id`=`trains`.`source`) as `src_stn`, (select `name` from `stations` where `stations`.`id`=`trains`.`destination`) as `dst_stn`, count(`tickets`.`seat_number`)as `occupied`,`max_seats` as `maximum`
from `trains` left join `types` on `trains`.`type`=`types`.`id` left join `tickets` on `trains`.`id`=`tickets`.`train`
group by `trains`.`id` order by `trains`.`id`; 
