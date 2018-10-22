view: pdt_customer_facts {
  derived_table: {
    sql:

        SELECT
          customer.address_id  AS "customer.address_id",
          COUNT(DISTINCT customer.customer_id ) AS "customer.count"
        FROM public.payment  AS payment
        LEFT JOIN public.customer  AS customer ON payment.customer_id = customer.customer_id

        WHERE
          (customer.customer_id  = 1)
        GROUP BY 1
        ORDER BY 1
        LIMIT 500 ;;
  }
  dimension: address_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.address_id ;;
  }
  dimension_group: first_order {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.first_order ;;
  }
  dimension: lifetime_sale {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.lifetime_sale ;;
  }

#   dimension:  {}
}
