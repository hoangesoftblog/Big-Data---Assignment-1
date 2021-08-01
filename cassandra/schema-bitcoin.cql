create table if not exists kafkapipeline.bitcoinprice (
    time TIMESTAMP,
    price FLOAT,
    PRIMARY KEY (time)
);

insert into kafkapipeline.bitcoinprice(time, price) values ('2021-08-01 03:57:06', 41005.0071);
