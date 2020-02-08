connection: "atb"

# include all the views
include: "/views/**/*.view"

datagroup: atb_hackathon_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: atb_hackathon_default_datagroup

explore: accounts {}

explore: products {}

explore: transactions {}

explore: banking {
  view_name: transactions

  join: accounts {

  }
}
