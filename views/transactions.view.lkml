view: transactions {
  sql_table_name: `acme_d74db22fd0eb894f518f9a11210d179.transactions` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
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
    sql: ${TABLE}.completed ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: other_account {
    type: string
    sql: ${TABLE}.other_account ;;
  }

  dimension_group: posted {
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
    sql: ${TABLE}.posted ;;
  }

  dimension: this_account {
    type: string
    sql: ${TABLE}.this_account ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: total_amount {
    description: "Sum of transaction values"
    type: sum
    sql: ${amount} ;;
    drill_fields: [id,completed_time,amount]
  }

  measure: average_transaction {
    type: average
    sql: ${amount} ;;
  }


}
