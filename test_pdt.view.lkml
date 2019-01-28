view: test_pdt {
    derived_table: {
      explore_source: payment {
        column: customer_id {
          field: payment.customer_id
        }
        column: first_order {
          field: payment.first_order
        }
        column: lifetime_sale {
          field: payment.lifetime_sale
        }
      }
    }
    dimension: customer_id {
      type: number
      primary_key: yes
      sql: ${TABLE}.customer_id ;;
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
  }
