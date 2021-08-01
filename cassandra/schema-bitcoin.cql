create table if not exists kafkapipeline.bitcoinprice (
    time TIMESTAMP,
    price FLOAT,
    PRIMARY KEY (time)
);

insert into kafkapipeline.bitcoinprice(time, price) values ('2021-08-01 03:57:06', 41005.0071);
insert into kafkapipeline.bitcoinprice(time, price) values (1627796563228, 41962.3032378287864258);
