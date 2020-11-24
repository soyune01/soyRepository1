view: temp_data {
  derived_table: {
    sql: SELECT date
             , day
             , time_tier
             , industry_item
             , sum(call_cnt) as call_cnt
        FROM `looker_demo.call_delivery`
        group by date, day, time_tier, industry_item;;
    sql_trigger_value: SELECT EXTRACT(HOUR FROM CURRENT_TIMESTAMP());;

  }

#  derived_table: {
#    explore_source: call_delivery {
#      column: date {
#      field: call_delivery.date
#      }
#      column: day {
#        field: call_delivery.day
#      }
#      column: time_tier {
#        field: call_delivery.time_tier
#      }
#      column: industry_item {
#        field: call_delivery.industry_item
#      }
#      column: call_cnt {
#        field: call_delivery.call_cnt
#      }
#    }
#    datagroup_trigger: comm_project_default_datagroup
#    indexes: ["date", "day", "time_tier"]
#  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: industry_item {
    type: string
    sql: ${TABLE}.industry_item ;;
  }

  dimension: call_cnt {
    type: number
    sql: ${TABLE}.call_cnt ;;
  }

  dimension: time_tier {
    type: string
    sql: ${TABLE}.time_tier ;;
  }

}

# view: temp_data {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
