connection: "atb"

# include all the views
include: "/views/**/*.view"

datagroup: atb_hackathon_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: atb_hackathon_default_datagroup

explore: products {}

explore: banking {
  view_name: transactions

  join: accounts {
    relationship: many_to_one
    sql_on: ${accounts.id} = ${transactions.this_account}  ;;
  }
}
