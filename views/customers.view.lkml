view: customers {
  sql_table_name: `acme_d74db22fd0eb894f518f9a11210d179.customers` ;;
  drill_fields: [customer_id]

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: outreach {
    type: string
    html: 💬Send a Text ;;
    tags: ["phone"]
    sql: ${mobile_phone_number} ;;
  }

  dimension: bank_id {
    type: string
    sql: ${TABLE}.bank_id ;;
  }

  dimension: branch_id {
    type: number
    sql: ${TABLE}.branch_id ;;
  }

  dimension: credit_limit {
    hidden: yes
    sql: ${TABLE}.credit_limit ;;
  }

  dimension: credit_rating {
    hidden: yes
    sql: ${TABLE}.credit_rating ;;
  }

  dimension: customer_number {
    type: string
    sql: ${TABLE}.customer_number ;;
  }

  dimension_group: date_of_birth {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_of_birth ;;
  }

  dimension: dependants {
    type: number
    sql: ${TABLE}.dependants ;;
  }

  dimension_group: dob_of_dependants {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dob_of_dependants ;;
  }

  dimension: email {
    type: string
    sql: CONCATENATE('izzy@looker.com+",${legal_name}) ;;
  }

  dimension: employment_status {
    type: string
    sql: ${TABLE}.employment_status ;;
  }

  dimension: highest_education_attained {
    type: string
    sql: ${TABLE}.highest_education_attained ;;
  }

  dimension: kyc_status {
    type: yesno
    sql: ${TABLE}.kyc_status ;;
  }

  dimension: legal_name {
    type: string
    sql: ${TABLE}.legal_name ;;
  }

  dimension: mobile_phone_number {
    type: string
    sql: '+14152984687' ;;
  }

  dimension: name_suffix {
    type: string
    sql: ${TABLE}.name_suffix ;;
  }

  dimension: relationship_status {
    type: string
    sql: ${TABLE}.relationship_status ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_id, legal_name]
  }
}

view: customers__credit_rating {
  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
}

view: customers__credit_limit {
  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }
}
