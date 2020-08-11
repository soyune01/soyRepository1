view: seoul_population {
  derived_table: {
    sql: SELECT
            year AS year,
            substr(sido, 0, 2) as sido,
            gungu  AS gungu,
            substr(dongmyeon, 0, 2)  AS dongmyeon ,
            sum( korean_total ) as korean_total,
            sum(korean_male)     as korean_male,
            sum(korean_female)     as korean_female,
            sum( korean_0_to_4 ) as korean_0_to_4,
            sum( korean_5_to_9 ) as korean_5_to_9,
            sum( korean_10_to_14 ) as korean_10_to_14,
            sum( korean_15_to_19 ) as korean_15_to_19,
            sum( korean_20_to_24 ) as korean_20_to_24,
            sum( korean_25_to_29 ) as korean_25_to_29,
            sum( korean_30_to_34 ) as korean_30_to_34,
            sum( korean_35_to_39 ) as korean_35_to_39,
            sum( korean_40_to_44 ) as korean_40_to_44,
            sum( korean_45_to_49 ) as korean_45_to_49,
            sum( korean_50_to_54 ) as korean_50_to_54,
            sum( korean_55_to_59 ) as korean_55_to_59,
            sum( korean_60_to_64 ) as korean_60_to_64,
            sum( korean_65_to_69 ) as korean_65_to_69,
            sum( korean_70_to_74 ) as korean_70_to_74,
            sum( korean_75_to_79 ) as korean_75_to_79,
            sum( korean_80_to_84 ) as korean_80_to_84,
            sum( korean_85_to_89 ) as korean_85_to_89,
            sum( korean_90_to_94 ) as korean_90_to_94,
            sum( korean_95_to_99 ) as korean_95_to_99,
            sum( korean_more_99 ) as korean_more_99
          FROM `stf-development.looker_demo.seoul_population`
          WHERE year = '2018'
          group by  year, substr(sido, 0, 2), gungu, substr(dongmyeon, 0, 2) ;;
          #sql_trigger_value: SELECT EXTRACT(HOUR FROM CURRENT_TIMESTAMP());;
    }

  dimension: dongmyeon {
    type: string
    sql: ${TABLE}.dongmyeon ;;
  }

  dimension: gungu {
    type: string
    sql: ${TABLE}.gungu ;;
  }

  dimension: households_total {
    type: number
    sql: ${TABLE}.households_total ;;
  }

  dimension: korean_0_to_4 {
    type: number
    sql: ${TABLE}.korean_0_to_4 ;;
  }

  dimension: korean_10_to_14 {
    type: number
    sql: ${TABLE}.korean_10_to_14 ;;
  }

  dimension: korean_15_to_19 {
    type: number
    sql: ${TABLE}.korean_15_to_19 ;;
  }

  dimension: korean_20_to_24 {
    type: number
    sql: ${TABLE}.korean_20_to_24 ;;
  }

  dimension: korean_25_to_29 {
    type: number
    sql: ${TABLE}.korean_25_to_29 ;;
  }

  dimension: korean_30_to_34 {
    type: number
    sql: ${TABLE}.korean_30_to_34 ;;
  }

  dimension: korean_35_to_39 {
    type: number
    sql: ${TABLE}.korean_35_to_39 ;;
  }

  dimension: korean_40_to_44 {
    type: number
    sql: ${TABLE}.korean_40_to_44 ;;
  }

  dimension: korean_45_to_49 {
    type: number
    sql: ${TABLE}.korean_45_to_49 ;;
  }

  dimension: korean_50_to_54 {
    type: number
    sql: ${TABLE}.korean_50_to_54 ;;
  }

  dimension: korean_55_to_59 {
    type: number
    sql: ${TABLE}.korean_55_to_59 ;;
  }

  dimension: korean_5_to_9 {
    type: number
    sql: ${TABLE}.korean_5_to_9 ;;
  }

  dimension: korean_60_to_64 {
    type: number
    sql: ${TABLE}.korean_60_to_64 ;;
  }

  dimension: korean_65_to_69 {
    type: number
    sql: ${TABLE}.korean_65_to_69 ;;
  }

  dimension: korean_70_to_74 {
    type: number
    sql: ${TABLE}.korean_70_to_74 ;;
  }

  dimension: korean_75_to_79 {
    type: number
    sql: ${TABLE}.korean_75_to_79 ;;
  }

  dimension: korean_80_to_84 {
    type: number
    sql: ${TABLE}.korean_80_to_84 ;;
  }

  dimension: korean_85_to_89 {
    type: number
    sql: ${TABLE}.korean_85_to_89 ;;
  }

  dimension: korean_90_to_94 {
    type: number
    sql: ${TABLE}.korean_90_to_94 ;;
  }

  dimension: korean_95_to_99 {
    type: number
    sql: ${TABLE}.korean_95_to_99 ;;
  }

  dimension: korean_female {
    type: number
    sql: ${TABLE}.korean_female ;;
  }

  dimension: korean_male {
    type: number
    sql: ${TABLE}.korean_male ;;
  }

  dimension: korean_more_99 {
    type: number
    sql: ${TABLE}.korean_more_99 ;;
  }

  dimension: korean_total {
    type: number
    sql: ${TABLE}.korean_total ;;
  }

  dimension: more_64 {
    type: number
    sql: ${TABLE}.more_64 ;;
  }


  dimension: sido {
    type: string
    sql: ${TABLE}.sido ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }


  measure: korean_female_sum {
    type: sum
    sql: ${TABLE}.korean_female ;;
  }

  measure: korean_male_sum {
    type: sum
    sql: ${TABLE}.korean_male ;;
  }

  measure: korean_total_sum {
    type: sum
    sql: ${TABLE}.korean_total ;;
  }

  measure: korean_10s_sum {
    type: sum
    sql: ${TABLE}.korean_10_to_14+${TABLE}.korean_15_to_19 ;;
  }

  measure: korean_20s_sum {
    type: sum
    sql: ${TABLE}.korean_20_to_24+ ${TABLE}.korean_25_to_29 ;;
  }

  measure: korean_30s_sum {
    type: sum
    sql: ${TABLE}.korean_30_to_34 + ${TABLE}.korean_35_to_39 ;;
  }

  measure: korean_40s_sum {
    type: sum
    sql: ${TABLE}.korean_40_to_44 + ${TABLE}.korean_45_to_49;;
  }

  measure: korean_50s_sum {
    type: sum
    sql: ${TABLE}.korean_50_to_54 + ${TABLE}.korean_55_to_59 ;;
  }

  measure: korean_60s_sum {
    type: sum
    sql: ${TABLE}.korean_60_to_64 + ${TABLE}.korean_65_to_69 ;;
  }

}
