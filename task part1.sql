CREATE DATABASE part1
--actor--
CREATE TABLE actor(
act_id int primary key,
act_fname char(20),
act_lname char(20),
act_gender char(1)
);

--director--
CREATE TABLE director(
dir_id int primary key,
dir_fname char(20),
dir_lname char(20)
);

--movie--
CREATE TABLE movie(
mov_id int primary key,
mov_title char(50),
mov_year int,
mov_time int,
mov_lang char(50),
mov_dt_rel date,
mov_rel_country char(5)
);

--movie_cast--
CREATE TABLE movie_cast(
act_id int ,
mov_id int,
role char(30),
constraint compoiste_act_id_mov_id primary key(act_id , mov_id),
constraint fk_act_id foreign key(act_id) references actor(act_id),
constraint fk_mov_id foreign key(mov_id) references movie(mov_id)
);
--movie_direction--
CREATE TABLE movie_direction(
dir_id int,
mov_id int,
constraint composite_dir_id_mov_id primary key(dir_id,mov_id),
constraint fk_dir_id foreign key(dir_id) references director(dir_id),
constraint fk_movdir_id foreign key(mov_id) references movie(mov_id),
);

CREATE TABLE genres(
gen_id int primary key,
gen_title char(20)
);

CREATE TABLE movie_genres(
mov_id int,
gen_id int,
constraint composite_mov_id_gen_id primary key(mov_id , gen_id),
constraint fk_mov_gen_id foreign key(mov_id) references movie(mov_id),
constraint fk_gen_id foreign key(gen_id) references genres(gen_id)
);

CREATE TABLE reviewer(
rev_id int primary key,
rev_name char(20)
);

CREATE TABLE rating(
mov_id int ,
rev_id int,
rev_stars int,
num_o_ratings int,
constraint composite_mov_id_rev_id primary key(mov_id,rev_id),
constraint fk_mov_rev_id foreign key(mov_id) references movie(mov_id),
constraint fk_rev_id foreign key(rev_id) references reviewer(rev_id),
);