-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mHT3fh
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Create Campaign Table
-- -

CREATE TABLE "campaign" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" VARCHAR(100)   NOT NULL,
    "description" VARCHAR(40)   NOT NULL,
    "goal" NUMERIC   NOT NULL,
    "pledge" NUMERIC   NOT NULL,
    "outcome" VARCHAR(40)   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR(40)   NOT NULL,
    "currency" VARCHAR(40)   NOT NULL,
    "category" VARCHAR(40)   NOT NULL,
    "subcategory" VARCHAR(65)   NOT NULL,
    "Launch_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL
);

-- Create sub-category Table
-- -
CREATE TABLE "subcategory" (
    "subcategory" VARCHAR(65)   NOT NULL,
    "category_id" VARCHAR(40)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory"
        )
);

-- Create Category Table
-- -
CREATE TABLE "category" (
    "category" VARCHAR(35)   NOT NULL,
    "category_id" VARCHAR(40)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category"
    )
);

-- Creating contacts Tables
-- -
CREATE TABLE "contacts" (
    "contact_id" INT   NOT NULL,
    "first_name" VARCHAR(35)   NOT NULL,
    "last_name" VARCHAR(35)   NOT NULL,
    "email" VARCHAR(50)   NOT NULL
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
        )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category" FOREIGN KEY("category")
REFERENCES "category" ("category");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory" FOREIGN KEY("subcategory")
REFERENCES "subcategory" ("subcategory");

SELECT *
FROM campaign;

SELECT *
FROM category;

SELECT *
FROM contacts;

SELECT *
FROM subcategory;