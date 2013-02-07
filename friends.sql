create table friends (
  id serial4 primary key,
  first varchar(50) not null,
  last varchar(50) not null,
  gender varchar(6) not null,
  image varchar(200),
  twitter varchar(30),
  github varchar(30)
);