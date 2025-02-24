-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/9Gv2OR
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- NOTE! QuickDBD doesn't allow adding UNIQUE contrsaint for columns that are primary key columns.
--  After downloading QuickDBD schema,additional UNIQUE constraints were added for tables 
-- "customer","cafe" ,"employee","item","ingredient","item","ingredient_manager".

CREATE TABLE "orders" (
    "order_id" BIGINT   NOT NULL,
    "item_id" BIGINT   NOT NULL,
    "customer_id" BIGINT   NOT NULL,
    "cafe_id" BIGINT   NOT NULL,
    "payment_id" BIGINT   NOT NULL,
    "delivery" BOOL   NOT NULL,
    "delivery_address_id" BIGINT   NOT NULL,
    "created_at" TIMESTAMP   NOT NULL,
    "item_quantity" INT   NOT NULL,
    "customer_modifications" VARCHAR(200)   NOT NULL,
    "delivery_notes" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_orders" PRIMARY KEY (
        "order_id","item_id"
     )
);

CREATE TABLE "payment" (
    "payment_id" BIGINT   NOT NULL,
    "customer_id" BIGINT   NOT NULL,
    "emp_id" BIGINT   NOT NULL,
    "payment_date" TIMESTAMP   NOT NULL,
    "amount" DECIMAL(6,2)   NOT NULL,
    "payment_type" VARCHAR(15)   NOT NULL,
    CONSTRAINT "pk_payment" PRIMARY KEY (
        "payment_id"
     )
);
drop TABLE "customer"
CREATE TABLE "customer" (
    "customer_id" BIGINT   NOT NULL,
    "address_id" BIGINT   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "phone_number" VARCHAR(15)   NOT NULL,
    "email" VARCHAR(40)   NOT NULL,
    "active" BOOL   NOT NULL,
    "last_update" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_customer" PRIMARY KEY (
        "customer_id","last_update"
     ),
        CONSTRAINT "uc_customer_id" UNIQUE (
        "customer_id" 
));

CREATE TABLE "address" (
    "address_id" BIGINT   NOT NULL,
    "address_first_line" VARCHAR(50)   NOT NULL,
    "address_second_line" VARCHAR(50)   NULL,
    "city" VARCHAR(30)   NOT NULL,
    "postal_code" VARCHAR(10)   NOT NULL,
    "country" VARCHAR(30)   NOT NULL,
    "last_update" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_address" PRIMARY KEY (
        "address_id"
     )
);

CREATE TABLE "cafe" (
    "cafe_id" BIGINT   NOT NULL,
    "address_id" BIGINT   NOT NULL,
    "manager_emp_id" BIGINT   NOT NULL,
    "phone_number" VARCHAR(13)   NOT NULL,
    "last_update" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_cafe" PRIMARY KEY (
        "cafe_id","last_update"
     ),

         CONSTRAINT "uc_cafe_id" UNIQUE (
        "cafe_id"
    )
);
drop table employee
CREATE TABLE "employee" (
    "emp_id" BIGINT   NOT NULL,
    "cafe_id" BIGINT   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "position" VARCHAR(50)   NOT NULL,
    "hourly_rate" INT   NOT NULL,
    "address_id" BIGINT   NOT NULL,
    "active" BOOL   NOT NULL,
    "phone_number" VARCHAR(13)   NOT NULL,
    "email" VARCHAR(40)   NOT NULL,
    "username" VARCHAR(30)   NOT NULL,
    "password" VARCHAR(30)   NOT NULL,
    "last_update" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_id","last_update"
     ),
   CONSTRAINT "uc_emp_id" UNIQUE (
        "emp_id"
    )
);

CREATE TABLE "item" (
    "last_update" TIMESTAMP   NOT NULL,
    "item_id" BIGINT   NOT NULL,
    "recipe_id" BIGINT   NOT NULL,
    "item_name" VARCHAR(50)   NOT NULL,
    "item_size" VARCHAR(50)   NOT NULL,
    "item_price" DECIMAL(5,2)   NOT NULL,
    CONSTRAINT "pk_item" PRIMARY KEY (
        "last_update","item_id"
     ),
    CONSTRAINT "uc_item_recipe_id" UNIQUE (
        "recipe_id"
    ),
        CONSTRAINT "uc_item_item_id" UNIQUE (
        "item_id"
     )
)
CREATE TABLE "recipe" (
    "recipe_id" BIGINT   NOT NULL,
    "ing_id" BIGINT   NOT NULL,
    "qty" INT   NOT NULL,
    "last_update" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_recipe" PRIMARY KEY (
        "recipe_id","ing_id","last_update"
     )
);


CREATE TABLE "ingredient" (
    "last_update" TIMESTAMP   NOT NULL,
    "ing_id" BIGINT   NOT NULL,
    "ing_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_ingredient" PRIMARY KEY (
        "last_update","ing_id"
     )
         ,
        CONSTRAINT "uc_ingredient_ing_id" UNIQUE (
        "ing_id"
     )
);

CREATE TABLE "ingredient_manager" (
    "last_update" TIMESTAMP   NOT NULL,
    "ing_id" BIGINT   NOT NULL,
    "cafe_id" BIGINT   NOT NULL,
    "inv_description" VARCHAR(200)   NOT NULL,
    "ing_measure" VARCHAR(50)   NOT NULL,
    "ing_price" DECIMAL(5,2)   NOT NULL,
    CONSTRAINT "pk_ingredient_manager" PRIMARY KEY (
        "last_update","ing_id","cafe_id","inv_description"
     )
         ,
        CONSTRAINT "uc_ingredient_manager_ing_id" UNIQUE (
        "ing_id"
     )
);

CREATE TABLE "inventory_level" (
    "last_update" TIMESTAMP   NOT NULL,
    "ing_id" BIGINT   NOT NULL,
    "cafe_id" BIGINT   NOT NULL,
    "qty_in_stock" INT   NOT NULL,
    CONSTRAINT "pk_inventory_level" PRIMARY KEY (
        "last_update","ing_id","cafe_id"
     )
);

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_item_id" FOREIGN KEY("item_id")
REFERENCES "item" ("item_id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_customer_id" FOREIGN KEY("customer_id")
REFERENCES "customer" ("customer_id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_cafe_id" FOREIGN KEY("cafe_id")
REFERENCES "cafe" ("cafe_id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_payment_id" FOREIGN KEY("payment_id")
REFERENCES "payment" ("payment_id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_delivery_address_id" FOREIGN KEY("delivery_address_id")
REFERENCES "address" ("address_id");

ALTER TABLE "payment" ADD CONSTRAINT "fk_payment_customer_id" FOREIGN KEY("customer_id")
REFERENCES "customer" ("customer_id");

ALTER TABLE "payment" ADD CONSTRAINT "fk_payment_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employee" ("emp_id");

ALTER TABLE "customer" ADD CONSTRAINT "fk_customer_address_id" FOREIGN KEY("address_id")
REFERENCES "address" ("address_id");


ALTER TABLE "cafe" ADD CONSTRAINT "fk_cafe_address_id" FOREIGN KEY("address_id")
REFERENCES "address" ("address_id");

ALTER TABLE "cafe" ADD CONSTRAINT "fk_cafe_manager_emp_id" FOREIGN KEY("manager_emp_id")
REFERENCES "employee" ("emp_id");

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_cafe_id" FOREIGN KEY("cafe_id")
REFERENCES "cafe" ("cafe_id");

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_address_id" FOREIGN KEY("address_id")
REFERENCES "address" ("address_id");

ALTER TABLE "recipe" ADD CONSTRAINT "fk_recipe_recipe_id" FOREIGN KEY("recipe_id")
REFERENCES "item" ("recipe_id");

ALTER TABLE "recipe" ADD CONSTRAINT "fk_recipe_ing_id" FOREIGN KEY("ing_id")
REFERENCES "ingredient" ("ing_id");

ALTER TABLE "ingredient_manager" ADD CONSTRAINT "fk_ingredient_manager_cafe_id" FOREIGN KEY("cafe_id")
REFERENCES "cafe" ("cafe_id");

ALTER TABLE "inventory_level" ADD CONSTRAINT "fk_inventory_level_cafe_id" FOREIGN KEY("cafe_id")
REFERENCES "cafe" ("cafe_id");


ALTER TABLE "inventory_level" ADD CONSTRAINT "fk_inventory_level_ing_id" FOREIGN KEY("ing_id")
REFERENCES "ingredient_manager" ("ing_id");

ALTER TABLE "ingredient" ADD CONSTRAINT "fk_ingredient_ing_id" FOREIGN KEY("ing_id")
REFERENCES "ingredient_manager" ("ing_id");

