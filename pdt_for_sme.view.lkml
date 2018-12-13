view: pdt_for_sme {
    derived_table: {
      explore_source: actor {
        column: actor_id {}
        column: first_name {}
      }
    }
    dimension: actor_id {
      type: number
    }
    dimension: first_name {}
  }
