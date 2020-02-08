connection: "atb"

# include all the views
include: "/views/**/*.view"
include: "*.lkml"

datagroup: atb_hackathon_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: atb_hackathon_default_datagroup

explore: products {}

explore: banking {
  view_name: transactions

  join: accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${accounts.id} = ${transactions.this_account}  ;;
  }

  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${products.name} = ${accounts.label} ;;
  }
}
