FactoryBot.define do
  factory :contact do
    id { 1 }
    title { 'TestTitle' }
    content { 'Hey, this is a test.' }
    user_student_id { 1 }
    release { true }
  end
end
