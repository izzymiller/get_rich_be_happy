view: accounts {
  sql_table_name: `acme_d74db22fd0eb894f518f9a11210d179.accounts` ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
