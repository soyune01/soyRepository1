view: call_delivery {
  sql_table_name: `looker_demo.call_delivery` ;;

  dimension: addr_dong {
    type: string
    sql: substr(${TABLE}.addr_dong,1,2) ;;
  }

  dimension: addr_sido {
    type: string
    sql: substr(${TABLE}.addr_sido,1,2) ;;
  }

  dimension: addr_sigungu {
    type: string
    sql: ${TABLE}.addr_sigungu ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      date,
      month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: day_orderby {
    type: number
    sql: CASE WHEN  ${TABLE}.day = '월' THEN 1
              WHEN  ${TABLE}.day = '화' THEN 2
              WHEN  ${TABLE}.day = '수' THEN 3
              WHEN  ${TABLE}.day = '목' THEN 4
              WHEN  ${TABLE}.day = '금' THEN 5
              WHEN  ${TABLE}.day = '토' THEN 6
              WHEN  ${TABLE}.day = '일' THEN 7
          ELSE 99 END ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
    order_by_field: day_orderby
  }

  dimension: industry_item {
    type: string
    sql: case when ${TABLE}.industry_item = '음식점-중국음식' then '중국음식'
              when ${TABLE}.industry_item = '음식점-족발/보쌈전문' then '족발/보쌈'
              else ${TABLE}.industry_item end;;
  }

  dimension: time_tier {
    type: string
    sql: ${TABLE}.time_tier ;;
  }

  dimension: call_cnt {
    type: number
    sql: ${TABLE}.call_cnt ;;
  }

  measure: call_cnt_sum {
    type: sum
    sql: ${TABLE}.call_cnt ;;
    drill_fields: [details*]
  }

  measure: call_cnt_avg {
    type: average
    sql: ${TABLE}.call_cnt ;;
    drill_fields: [details*]
  }

  measure: call_sum_chicken {
    type:sum
    sql: CASE WHEN  ${TABLE}.industry_item = '치킨' THEN ${TABLE}.call_cnt ELSE 0 END ;;
    drill_fields: [details*]
  }
  measure: call_sum_pizza {
    type: sum
    sql: CASE WHEN  ${TABLE}.industry_item = '피자' THEN ${TABLE}.call_cnt ELSE 0 END ;;
    drill_fields: [details*]
  }
  measure: call_sum_china {
    type: sum
    sql: CASE WHEN  ${TABLE}.industry_item = '음식점-중국음식' THEN ${TABLE}.call_cnt ELSE 0 END ;;
    drill_fields: [details*]
  }
  measure: call_sum_pork {
    type: sum
    sql: CASE WHEN  ${TABLE}.industry_item = '음식점-족발/보쌈전문' THEN ${TABLE}.call_cnt ELSE 0 END ;;
    drill_fields: [details*]
  }

  measure: count {
    type: count
    drill_fields: []
  }

  ##### field sets #####
  set: details {
    fields: [date_date, time_tier, addr_sido, addr_sigungu, addr_dong, industry_item, call_cnt_sum, call_cnt_avg ]
  }
}
