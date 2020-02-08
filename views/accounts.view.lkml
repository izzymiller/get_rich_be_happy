view: accounts {
  derived_table: {
    sql: WITH a as
(SELECT bank_id, label, id, 'OBC4265340182-59953' AS customer_id, 1950 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 0),
b as (SELECT bank_id, label, id, 'OBC4265340182-59953' AS customer_id, 21950 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 1),
c as (SELECT bank_id, label, id, 'OBC4564606446-94137' AS customer_id, 5950 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 2),
d as (SELECT bank_id, label, id, 'OBC5252536580-13517' AS customer_id, 5020 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 3),
e as (SELECT bank_id, label, id, 'OBC1689398642-34801' AS customer_id, 20 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 4),
f as (SELECT bank_id, label, id, 'OBC2274721983-74300' AS customer_id, 1800 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 5),
g as (SELECT bank_id, label, id, 'OBC1689398642-34801' AS customer_id, 19100 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 6),
h as (SELECT bank_id, label, id, 'OBC2274721983-74300' AS customer_id, 194560 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 7),
i as (SELECT bank_id, label, id, 'OBC4265340182-59953' AS customer_id, 5403 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 8),
j as (SELECT bank_id, label, id, 'OBC1689398642-34801' AS customer_id, -201 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 9),
k as (SELECT bank_id, label, id, 'OBC2297867402-15073' AS customer_id, 1938 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 10),
l as (SELECT bank_id, label, id, 'OBC4586065849-87920' AS customer_id, 34500 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 60),
m as (SELECT bank_id, label, id, 'OBC2193307040-90370' AS customer_id, 21900 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 55),
n as (SELECT 12 AS bank_id, 'Cisco Master Bank' AS label, 5 AS id, 'OBC4586065849-87920' AS customer_id, 3000 AS starting_balance FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.accounts` GROUP BY 1,2,3 ORDER BY id DESC LIMIT 1 OFFSET 15)
SELECT * from a
UNION ALL
SELECT * from b
UNION ALL
SELECT * from c
UNION ALL
SELECT * from d
UNION ALL
SELECT * from e
UNION ALL
SELECT * from f
UNION ALL
SELECT * from g
UNION ALL
SELECT * from h
UNION ALL
SELECT * from i
UNION ALL
SELECT * from j
UNION ALL
SELECT * from k
UNION ALL
SELECT * from l
UNION ALL
SELECT * from m ;;
persist_for: "9999 hours"
  }
  drill_fields: [id]

  dimension: id {
    description: "Account ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: bank_id {
    description: "Bank ID"
    type: string
    sql: ${TABLE}.bank_id ;;
  }

  dimension: label {
    label: "Name"
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: customer_id {
    type: string
    hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: starting_balance {
    type: number
    hidden: no
    sql: ${TABLE}.starting_balance ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
