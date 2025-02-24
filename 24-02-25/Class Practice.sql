create DATABASE cs;
use cs;
cretae table empx(
    eid VARCHAR(20),
    CONSTRAINT empx_pk PRIMARY KEY(eid),
    designation VARCHAR(20) constraint empx_des check 
)
