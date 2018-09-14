view: payment {
  sql_table_name: public.payment ;;

  dimension: payment_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: payment {
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
    sql: ${TABLE}.payment_date ;;
  }

  measure: count_payments_test{
    description: "Count of emails sent within 365 day of the user subscribing"
    type: count_distinct
    sql: ${customer_id} ;;
    filters: {
      field: rental_id
      value: "[1200,1300]"
    }
  }

  dimension: rental_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.rental_id ;;
  }

  dimension: staff_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.staff_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: first_order {
    type: date
    sql: MIN(${TABLE}.payment_date) ;;
  }

  measure: lifetime_sale {
    type: sum
    sql: ${TABLE}.amount ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      payment_id,
      rental.rental_id,
      staff.last_name,
      staff.username,
      staff.staff_id,
      staff.first_name,
      customer.first_name,
      customer.last_name,
      customer.customer_id
    ]
  }
}
