view: products {
  sql_table_name: `acme_d74db22fd0eb894f518f9a11210d179.products` ;;

  dimension: bank_id {
    type: string
    sql: ${TABLE}.bank_id ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: family {
    type: string
    sql: ${TABLE}.family ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: parent_product_code {
    type: string
    sql: ${TABLE}.parent_product_code ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
