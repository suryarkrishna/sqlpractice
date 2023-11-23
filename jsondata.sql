---------------------------------------------------------------------------------
SELECT
    deptno,
    'sum' AS type,
    SUM(sal) salary
FROM
    emp
GROUP BY
    deptno
UNION
SELECT
    deptno,
    'avg' AS type,
    AVG(sal) salary
FROM
    emp
GROUP BY
    deptno;
------------------------------------------------------------------------------------

SELECT
    listagg(a,' =')
FROM
    (
        SELECT
            'kai' a
        FROM
            dual
        UNION
        SELECT
            'b am from'
        FROM
            dual
        UNION
        SELECT
            'bhahgaron'
        FROM
            dual
    );

------------------------
--creating packages in pl/sql;

CREATE OR REPLACE PACKAGE my_pac08 IS
    PROCEDURE my_proc08 (
        v_empno emp.empno%TYPE
    );

    FUNCTION my_func08 (
        v_empno emp.empno%TYPE
    ) RETURN VARCHAR2;

END my_pac08;
/

CREATE OR REPLACE PACKAGE BODY my_pac08 IS

    PROCEDURE my_proc08 (
        v_empno emp.empno%TYPE
    ) IS
        v_netsal   NUMBER;
    BEGIN
        SELECT
            sal + nvl(comm,0)
        INTO v_netsal
        FROM
            emp
        WHERE
            empno = v_empno;

        dbms_output.put_line('net salary is ' || v_netsal);
    END my_proc08;

    FUNCTION my_func08 (
        v_empno emp.empno%TYPE
    ) RETURN VARCHAR2 IS
        v_ename   emp.ename%TYPE;
    BEGIN
        SELECT
            ename
        INTO v_ename
        FROM
            emp
        WHERE
            empno = v_empno;

        RETURN v_ename;
    END my_func08;

END my_pac08;
/

EXEC my_pac08.my_proc08(7900);

SET SERVEROUTPUT ON;

SELECT
    my_pac08.my_func08(7788)
FROM
    dual;

CREATE OR REPLACE TRIGGER my_trig08 AFTER
    INSERT OR UPDATE OR DELETE ON dept23
    FOR EACH ROW
BEGIN
    IF inserting THEN
        dbms_output.put_line('inserting trigger');
    ELSIF updating THEN
        dbms_output.put_line('Updating trigger');
    ELSIF deleting THEN
        dbms_output.put_line('deleting trigger');
    ELSE
        NULL;
    END IF;
END;
/

GRANT
    CREATE ANY TRIGGER
TO sys;

SELECT
    user
FROM
    dual;

SELECT
    deptno,
    'sum',
    SUM(sal)
FROM
    emp
GROUP BY
    deptno
UNION
SELECT
    deptno,
    'avg',
    AVG(sal)
FROM
    emp
GROUP BY
    deptno;

--working with json data in oracle database
--1. create a table with primary key and a json column with is json check constraint

CREATE TABLE j_purchaseorder (
    id            VARCHAR2(32) NOT NULL PRIMARY KEY,
    date_loaded   TIMESTAMP(6) WITH TIME ZONE,
    po_document   VARCHAR2(32767)
        CONSTRAINT ensure_json08 CHECK ( po_document IS JSON )
);
    
--2. insert json data into json column 

INSERT INTO j_purchaseorder VALUES (
    sys_guid(),
    TO_DATE('30-DEC-2014'),
    '{"PONumber"             : 1600,
      "Reference"            : "ABULL-20140421",
      "Requestor"            : "Alexis Bull",
      "User"                 : "ABULL",
      "CostCenter"           : "A50",
      "ShippingInstructions" :
        {"name"    : "Alexis Bull",
         "Address" : {"street"  : "200 Sporting Green",
                      "city"    : "South San Francisco",
                      "state"   : "CA",
                      "zipCode" : 99236,
                      "country" : "United States of America"},
         "Phone"   : [{"type" : "Office", "number" : "909-555-7307"},
                      {"type" : "Mobile", "number" : "415-555-1234"}]},
      "Special Instructions" : null,
      "AllowPartialShipment" : true,
      "LineItems"            :
        [{"ItemNumber" : 1,
          "Part"       : {"Description" : "One Magic Christmas",
                          "UnitPrice"   : 19.95,
                          "UPCCode"     : 13131092899},
          "Quantity"   : 9.0},
         {"ItemNumber" : 2,
          "Part"       : {"Description" : "Lethal Weapon",
                          "UnitPrice"   : 19.95,
                          "UPCCode"     : 85391628927},
          "Quantity"   : 5.0}]}'
);

INSERT INTO j_purchaseorder VALUES (
    sys_guid(),
    TO_DATE('30-DEC-2014'),
    '{"PONumber"             : 672,
      "Reference"            : "SBELL-20141017",
      "Requestor"            : "Sarah Bell",
      "User"                 : "SBELL",
      "CostCenter"           : "A50",
      "ShippingInstructions" : {"name"    : "Sarah Bell",
                                "Address" : {"street"  : "200 Sporting Green",
                                             "city"    : "South San Francisco",
                                             "state"   : "CA",
                                             "zipCode" : 99236,
                                             "country" : "United States of America"},
                                "Phone"   : "983-555-6509"},
      "Special Instructions" : "Courier",
      "LineItems"            :
        [{"ItemNumber" : 1,
          "Part"       : {"Description" : "Making the Grade",
                          "UnitPrice"   : 20,
                          "UPCCode"     : 27616867759},
          "Quantity"   : 8.0},
         {"ItemNumber" : 2,
          "Part"       : {"Description" : "Nixon",
                          "UnitPrice"   : 19.95,
                          "UPCCode"     : 717951002396},
          "Quantity"   : 5},
         {"ItemNumber" : 3,
          "Part"       : {"Description" : "Eric Clapton: Best Of 1981-1999",
                          "UnitPrice"   : 19.95,
                          "UPCCode"     : 75993851120},
          "Quantity"   : 5.0}]}'
);

SELECT
    po.po_document
FROM
    j_purchaseorder po;

SELECT
    po.po_document.ponumber
FROM
    j_purchaseorder po;

COMMIT;

SELECT
    date_loaded
FROM
    j_purchaseorder;

SELECT
    *
FROM
    user_json_columns;

CREATE TABLE json_table (
    sno             NUMBER(2),
    order_details   VARCHAR2(100)
);

ALTER TABLE json_table ADD CONSTRAINT check_json CHECK ( order_details IS JSON );

ALTER TABLE json_table MODIFY
    order_details VARCHAR2(500);

INSERT INTO json_table VALUES (
    1,
    '{
    "order_date" : "16-11-2023",
    "cust_name" : "Surya Koda",
    "quantity" : 200,
    "amount" : 5000,
    "item_name" : "Brick",
    "price_per_unit" : 25
    }'
);

INSERT INTO json_table VALUES (
    3,
    '{
    "order_date" : "20-11-2023",
    "cust_name" : "Bijoy Singh",
    "quantity" : 300,
    "amount" : 7500,
    "item_name" : "Brick",
    "price_per_unit" : 25
    }'
);
---------------------------------------------------------
SELECT
    j.*
FROM
    json_table j;
------------------------------------------------
SELECT
    TO_CHAR(TO_DATE(j.order_details.order_date,'dd-mm-yyyy'),'dd/mm/yyyy')
FROM
    json_table j;
-----------------------------------------------------------------------
SELECT
    JSON_VALUE(po_document,'$.LineItems[0].Part.UnitPrice' RETURNING NUMBER(5,3) )
FROM
    j_purchaseorder p
WHERE
    JSON_VALUE(po_document,'$.PONumber' RETURNING NUMBER(10) ) = 1600;
---------------------------------------------------------
SELECT
    JSON_QUERY(po_document,'$.LineItems') lineitems
FROM
    j_purchaseorder p;
----------------------------------------
SELECT
    m.*
FROM
    j_purchaseorder j,
    JSON_TABLE ( po_document,'$'
            COLUMNS
                po_number NUMBER ( 10 ) PATH '$.PONumber',
                userid VARCHAR2 ( 10 ) PATH '$.User'
        )
    m;
------------------------------------------------------------------------------
declare 
 l_json    json_object_t;
 l_items   json_array_t;
 l_item    json_object_t;
 i_json clob :=
'{
	"userid": 2,
	"order_note": "that the quick brown...",
	"items": [{
			"OrderText": "OrdText",
			"PickupLoc": "PickLoc",
			"DropOffLoc": "DropOff"
		},
		{
			"OrderText": "OrdText",
			"PickupLoc": "PickLoc",
			"DropOffLoc": "DropOff"
		},
		{
			"OrderText": "OrdText",
			"PickupLoc": "PickLoc",
			"DropOffLoc": "DropOff"
		}
	]
}';
begin
 l_json  := json_object_t.parse(i_json);
 dbms_output.put_line('userid: '||l_json.get_string('userid'));
 dbms_output.put_line('order_note: '||l_json.get_string('order_note'));
  
 l_items   := l_json.get_array('items');
 for indx in 0 .. l_items.get_size - 1
 loop
  l_item := treat (l_items.get (indx) as json_object_t);
  dbms_output.put_line('OrderText: '||l_item.get_string('OrderText'));
  dbms_output.put_line('PickupLoc: '||l_item.get_string('PickupLoc'));
  dbms_output.put_line('DropOffLoc: '||l_item.get_string('DropOffLoc'));
 end loop;  
end;
/
---------------------------------------------------------------------
declare
 	jo JSON_OBJECT_T;
begin
 	jo := JSON_OBJECT_T.parse('{a:67}');
 	jo.On_error(1);
 	dbms_output.put_line(jo.get_Number('a'));
end;
/

-------------------------------------
declare
    jo json_object_t := json_object_t.parse('{"name" : "SURYA", "age" : 23, "gender" : "male"}');
    ja json_array_t;
    keys json_key_list;
    
begin
    ja := new json_array_t;
    keys := jo.get_Keys;
    for i in 1..keys.count
    loop
        ja.append(keys(i));
    end loop;
    dbms_output.put_line(ja.to_string);
end;
/

---------------------------------------------------------------------