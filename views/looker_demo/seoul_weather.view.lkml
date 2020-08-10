view: seoul_weather {
  derived_table: {
    sql: SELECT date, sido
                , gungu
                , (case when REGEXP_CONTAINS(SUBSTR(dong, 1, 2), '[0-9]')
                             then concat(SUBSTR(dong, 1, 2) , '동')
                        else SUBSTR(dong, 1, 2)
                   end) as dong
                , hour, rainfall, temperature
          FROM `looker_demo.seoul_weather` ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      date, month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: time_tier { # name 변경
    type: string
    sql: ${TABLE}.hour ;;
  }

  dimension: addr_sido {
    type: string
    sql: ${TABLE}.sido ;;
  }

  dimension: addr_sigungu {
    type: string
    sql: ${TABLE}.gungu ;;
  }

  dimension: addr_dong {
    type: string
    sql: ${TABLE}.dong ;;
  }

  dimension: rainfall {
    type: number
    sql: ${TABLE}.rainfall ;;
    hidden: yes
  }

  dimension: temperature {
    type: number
    sql: ${TABLE}.temperature ;;
    hidden: yes
  }

  dimension: rainfall_range { # 강수량 범주
    case: {
      when: {
        sql: ${TABLE}.rainfall < 1.0 ;;
        label: "LESS THAN 1 mm"
      }
      when: {
        sql: ${TABLE}.rainfall >= 1.0 AND ${TABLE}.rainfall < 2.0 ;;
        label: "LESS THAN 2 mm"
      }
      when: {
        sql: ${TABLE}.rainfall >= 2.0 AND ${TABLE}.rainfall < 3.0 ;;
        label: "LESS THAN 3 mm"
      }
      when: {
        sql: ${TABLE}.rainfall >= 3.0 AND ${TABLE}.rainfall < 4.0 ;;
        label: "LESS THAN 4 mm"
      }
      when: {
        sql: ${TABLE}.rainfall >= 4.0 AND ${TABLE}.rainfall < 5.0 ;;
        label: "LESS THAN 5 mm"
      }
      when: {
        sql: ${TABLE}.rainfall >= 5.0 AND ${TABLE}.rainfall < 10.0 ;;
        label: "LESS THAN 10 mm"
      }
      when: {
        sql: ${TABLE}.rainfall >= 10.0 ;;
        label: "10 mm OR OVER"
      }
      else: "N/A"
    }
  }

  dimension: temperature_tier { # 기온 범주
    type: tier
    tiers: [-20, -10, 0, 10, 20, 30, 40]
    style:  integer
    sql: ${TABLE}.temperature ;;
  }

  #### MEASURE ####
  measure: temperature_avg{ # 기온 평균값 추가
    type: average
    sql: round(${TABLE}.temperature,1) ;;
    drill_fields: [details.*]
  }

  measure: rainfall_avg { # 강수량 평균값 추가
    type: average
    sql: round(${TABLE}.rainfall,1) ;;
    drill_fields: [details.*]
  }

  measure: count {
    type: count
    drill_fields: [details.*]
  }

  ##### field sets #####
  set: details {
    fields: [date_date, time_tier, addr_sido, addr_sigungu, addr_dong, rainfall, rainfall, temperature_avg, rainfall_avg ]
  }
}
