view: transactions {
  derived_table: {
    sql: WITH dates AS (

WITH parameters AS (
  SELECT 100 ids_count, DATE '2019-10-05' start_date, DATE '2020-02-08' finish_date
)
SELECT CAST(FLOOR(30*RAND()) AS INT64) as JID, zid, TIMESTAMP(DATE_FROM_UNIX_DATE(CAST(start + (finish - start) * RAND() AS INT64)))  random_date
FROM parameters,
UNNEST(GENERATE_ARRAY(1, ids_count)) zid,
UNNEST([STRUCT(UNIX_DATE(start_date) AS start, UNIX_DATE(finish_date) AS finish)])),
transactions AS
(SELECT *, CAST(FLOOR(30*RAND()) AS INT64) as JID FROM `atb-openfinance-hackathon.acme_d74db22fd0eb894f518f9a11210d179.transactions`)

SELECT transactions.*,dates.random_date from transactions
LEFT JOIN dates ON dates.JID = transactions.JID
 ;;
persist_for: "9999 hours"
  }
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    hidden: yes
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension_group: completed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.random_date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: other_account {
    type: string
    sql: ${TABLE}.other_account ;;
  }
  dimension: this_account {
    type: string
    sql: ${TABLE}.this_account ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: in_or_out {
    type: string
    case: {
      when: {
        label: "In"
        sql: ${amount} >= 0 ;;
      }
      when: {
        label: "Out"
        sql: ${amount} < 0 ;;
      }
    }
  }

  dimension: is_savings {
    type: yesno
    sql: (${type} LIKE '%saving%' OR ${type} LIKE '%invest%') AND ${in_or_out} = 'Out'   ;;
  }

  measure: count {
    type: count
  }

  measure: total_amount {
    description: "Sum of transaction values"
    type: sum
    sql: ${amount} ;;
    value_format_name: decimal_2
    drill_fields: [id,completed_time,amount]
  }

  measure: total_in {
    type: sum
    sql: ${amount} ;;
    value_format_name: decimal_2
    filters: {
      field: amount
      value: ">0"
    }
  }


  measure: total_out {
    description: "Absolute value"
    type: sum
    sql: ABS(${amount}) ;;
    value_format_name: decimal_2
    filters: {
      field: amount
      value: "<0"
    }
  }

  measure: average_transaction {
    type: average
    sql: ${amount} ;;
  }


}
