class lcl_test_1 definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      test_task_creation for testing raising cx_static_check.
endclass.


class lcl_test_1 implementation.

  method test_task_creation.
    "TODO
    cl_aunit_assert=>fail( 'Implement your first test here' ).
  endmethod.

endclass.
