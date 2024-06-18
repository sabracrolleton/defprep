create database defprep with encoding='UTF8';

\c defprep

create table sessions (
  id integer generated always as identity,
  sid text primary key
);

insert into sessions (sid) values ('abc123'),('xyz456');


  
