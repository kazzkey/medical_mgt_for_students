FactoryBot.define do
  factory :user_student, class: UserStudent do
    id { 1 }
    name { '山田花子' }
    student_id { 202020 }
    school_id { 1 }
    email { 'yamada@example.com' }
    password { 'password' }
    birth_date { '2002-01-01' }
    grade  { '小学2年生' }
    blood_type { 'O型' }
  end
end
