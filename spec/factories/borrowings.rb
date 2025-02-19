FactoryBot.define do
  factory :borrowing do
    user { nil }
    book { nil }
    borrowed_at { "2025-02-19 18:35:19" }
    returned_at { "2025-02-19 18:35:19" }
    due_date { "2025-02-19 18:35:19" }
  end
end
