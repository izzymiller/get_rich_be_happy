view: transactions {
  sql_table_name: `acme_d74db22fd0eb894f518f9a11210d179.transactions` ;;
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

  measure: total_amount {
    description: "Sum of transaction values"
    type: sum
    sql: ${amount} ;;
    drill_fields: [id,completed_time,amount]
  }

  measure: total_in {
    type: sum
    sql: ${amount} ;;
    filters: {
      field: amount
      value: ">0"
    }
  }

  measure: total_out {
    description: "Absolute value"
    type: sum
    sql: ABS(${amount}) ;;
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
