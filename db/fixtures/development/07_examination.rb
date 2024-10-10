Examination.seed(:id, [
  { id: 1, user_id: 1, test_id: 1, attempt_date: Time.current, created_at: Time.current },
  { id: 2, user_id: 1, test_id: 2, attempt_date: Time.current - 1.year, created_at: Time.current },
  { id: 3, user_id: 2, test_id: 1, attempt_date: Time.current - 2.months, created_at: Time.current },
  { id: 4, user_id: 2, test_id: 2, attempt_date: Time.current - 6.months, created_at: Time.current }
])