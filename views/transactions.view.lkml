view: transactions {
  sql_table_name: transactions_dates ;;
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
    drill_fields: [this_account]
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
    html: 🎁<br /><small>{{linked_value}}</small> ;;
    sql: ${TABLE}.this_account ;;
    tags: ["atb-hackathon"]
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
    drill_fields: [id,completed_time,type,description,total_amount]
  }

  measure: total_amount {
    description: "Sum of transaction values"
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
    drill_fields: [id,completed_time,type,description,total_amount]
  }

  measure: total_in {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
    filters: {
      field: amount
      value: ">0"
    }
    drill_fields: [id,completed_time,type,description,total_amount]

  }


  measure: total_out {
    description: "Absolute value"
    type: sum
    sql: ABS(${amount}) ;;
    value_format_name: usd
    filters: {
      field: amount
      value: "<0"
    }
    drill_fields: [id,completed_time,type,description,total_amount]

  }

  measure: average_transaction {
    type: average
    sql: ${amount} ;;
    drill_fields: [id,completed_time,type,description,total_amount]
  }


}
