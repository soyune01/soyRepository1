connection: "kb_lookerdemo"

# include all the views
include: "/views/**/*.view"

datagroup: kb_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kb_project_default_datagroup


explore: call_delivery {
  label: "seoul delivery call"
  join: seoul_weather {
    fields: [seoul_weather.temperature_tier, seoul_weather.rainfall_range]
    type: left_outer
    sql_on: ${call_delivery.addr_sido} = ${seoul_weather.addr_sido}
            AND ${call_delivery.addr_sigungu} = ${seoul_weather.addr_sigungu}
            AND ${call_delivery.addr_dong} = ${seoul_weather.addr_dong}
            AND ${call_delivery.date_date} = ${seoul_weather.date_date}
            AND ${call_delivery.time_tier} = ${seoul_weather.time_tier}
            ;;
    relationship: many_to_one
  }
}

explore: seoul_weather {
  label: "seoul wheather"
}

explore: nginx_access {}
