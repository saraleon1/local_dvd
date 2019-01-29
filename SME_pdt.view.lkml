view: sme_pdt {
  derived_table: {
    sql:

    SELECT
  customer.active  AS "customer.active",
  customer.address_id  AS "customer.address_id",
  customer.store_id  AS "customer.store_id",
  COUNT(*) AS "customer.count"
FROM public.customer  AS customer

GROUP BY 1,2,3  ;;

sql_trigger_value: SELECT DATE_PART('hour', NOW());;
  }
  dimension: active {
    type: number
    sql: ${TABLE}.active ;;
  }

  dimension: address_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.address_id ;;
  }

  measure: count {
    type: count
  }

  }
