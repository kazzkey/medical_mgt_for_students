FactoryBot.define do
  factory :user_officer, class: UserOfficer do
    id { 1 }
    name { 'てぃーちゃー山本' }
    type { '教師' }
    school_id { 1 }
    email { 'yamamoto@example.com' }
    password { 'password' }
  end
end
