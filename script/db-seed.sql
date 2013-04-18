use test;

insert into banker (name,accountMoney,debitMoney) values
('Jack',20000,333);

INSERT INTO businessman(name,description) VALUES
('Bob','farmer'),
('Alice','Computer Manufacteur'),
('Hellen','Mobile Phone');

INSERT INTO Transaction(transactionType,fromId,fromIdType,toId,toIdType,reason,amount,duration,rate,specialRate,startTime,endTime,status,approveMessageUnread,successMessageUnread) VALUES
(1,1,1,1,2,'guess',5001,1,55,1000,null,null,1,1,1),
(1,2,1,1,2,'guess',5001,11,55,1000,null,null,1,1,1),
(1,3,1,1,2,'guess',5001,11,55,1000,null,null,1,1,1);
