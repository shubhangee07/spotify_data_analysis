select artist ,track, album,duration_min ,title,stream from cleaned_dataset where stream=(select max(stream) from cleaned_dataset);/*max streamed song*/
 select artist,sum(stream) as total_stream from cleaned_dataset group by artist order by sum(stream) desc limit 10 ;/*top10 artists with max streams*/
select artist,avg(stream) as avg_stream from cleaned_dataset group by artist order by avg(stream) desc limit 10 ;/*top10 artists arranged on avg stream*/
select artist,stream,track as most_played from cleaned_dataset
 where artist=(select artist from cleaned_dataset group by artist order by sum(stream) desc limit 1 ) order by stream desc limit 5 ;/*top 5 songs of max streamed artist*/
select min(stream) from cleaned_dataset;
select * from cleaned_dataset order by stream desc limit 10;/*10 max played songs*/
select * from cleaned_dataset order by stream asc limit 10;/*10 min played songs*/
select track,official_video,stream from cleaned_dataset  order by stream desc limit 10;/*among top 10 songs only one doesnt have official video*/
select count(*) from (select * from cleaned_dataset order by stream desc limit 10)as top10 where official_video="true";/*no of most played songs having official video)*/
select count(*) from (select * from cleaned_dataset order by stream asc limit 10)as top10 where official_video="true";/*no of least played songs having official video)*/
select track from cleaned_dataset where stream>(select avg(stream) from cleaned_dataset) ;/*avg stream=455935814 ,tracks having songs streamed more then avg stream*/
select  count(track)as artist_count from cleaned_dataset where stream>(select avg(stream) from cleaned_dataset) ;/*135=tracks with streams greater then avg*/
select official_video,count(*) as tracks,sum(stream) as total_stream,avg(stream) as avg_streams from cleaned_dataset group by official_video;
select official_video,count(*) as tracks,sum(likes) as total_likes,avg(likes) as avg_likes from cleaned_dataset group by official_video;
select track,artist,likes,comments,stream,duration_min from cleaned_dataset order by likes desc limit 20;/*top 20 songs arranged on likes*/
select count(artist) ,artist from ( select artist from cleaned_dataset order by stream desc limit 50)as top_50 
group by artist order by count(artist) desc;/*count of  songs various artists have in top 50*/
select avg(likes),artist from cleaned_dataset group by artist order by avg(likes) desc limit 10;/*top 10 arists arranged on avg likes*/
select * from (select avg(likes),artist from cleaned_dataset group by artist order by avg(likes) desc limit 10)as avg_likes inner join
(select avg(stream),artist from cleaned_dataset group by artist order by avg(stream) desc limit 10) as avg_stream
on avg_likes.artist=avg_stream.artist;/*artists having both max stream and max likes in top 10 */
select avg(energy) from (select energy from cleaned_dataset order by stream desc limit 50)as top_streamed; 
select avg(energy) from (select energy from cleaned_dataset order by stream asc limit 50)as least_streamed;
select avg(Danceability) from (select danceability from cleaned_dataset order by likes desc limit 50)as top_streamed;
select avg(Danceability) from (select Danceability from cleaned_dataset order by likes asc limit 50)as least_streamed;
select avg(Duration_min) from (select Duration_min from cleaned_dataset order by likes desc limit 50)as top_streamed;
select avg(Duration_min) from (select Duration_min from cleaned_dataset order by likes asc limit 50)as least_streamed;


