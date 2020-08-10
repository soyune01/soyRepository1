view: nginx_access {
  sql_table_name: `sy_fluentd.nginx_access`
    ;;

  dimension: agent {
    type: string
    sql: ${TABLE}.agent ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}.host ;;
  }

  dimension: http_x_forwarded_for {
    type: string
    sql: ${TABLE}.http_x_forwarded_for ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}.method ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
  }

  dimension: remote {
    type: string
    sql: ${TABLE}.remote ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}.user ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
