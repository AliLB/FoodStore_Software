use foodDB
go
create table CLIENT (
   CID                  int                  identity(1,1),
   CNAME                varchar(50)          null,
   CPASS                varbinary(20)         null,
   EMAIL                varchar(100)         null,
   constraint PK_CLIENT primary key (CID)
)
go
create table CREDITCARD (
   CCNB                 int                  not null,
   CID                  int                  not null,
   CCTYPE               varchar(50)          not null,
   constraint PK_CREDITCARD primary key (CCNB)
)
go
create table MANAGER (
   MID                  int                  identity(1,1),
   MNAME                varchar(50)          null,
   MPASS                varbinary(20)         null,
   EMAIL                varchar(100)         null,
   isMaster             int                  not null,
   constraint PK_MANAGER primary key (MID)
)
go
create table ORDERS(
   OID                  int                  identity(1,1),
   CID                  int                  not null,
   DID                  int                  not null,
   OTOTALPRICE          float                null,
   constraint PK_ORDER primary key (OID)
)
go
create table ORDERITEMS (
   PID                  int                  not null,
   OID                  int                  not null,
   QUANTITY             int                  null,
   constraint PK_ORDERITEMS primary key (PID, OID)
)
go
create table PRODUCT (
   PID                  int                  identity(1,1),
   PTYPE                varchar(50)          null,
   PNAME                varchar(50)          null,
   PPRICE               float                null,
   PIMAGE               varchar(200)         null,
   constraint PK_PRODUCT primary key (PID)
)
go
create table DELIVERYINFO (
   Did					int					 identity(1,1),	
   location             varchar(100)         null,
   telephoneNb          int                  null,
   constraint PK_DELIVERYINFO primary key (DID)
)
go

