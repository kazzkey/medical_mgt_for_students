require 'rails_helper'

RSpec.describe UserStudent, type: :model do
  it '入力欄が全て正しく入力されていれば、有効である' do
    user_student = UserStudent.new(
      id: 1,
      name: '田中たろう',
      student_id: 202020,
      school_id: 1,
      email: 'tanaka@example.com',
      password: 'password',
      birth_date: '2002-01-01',
      grade: '小学2年生',
      blood_type: 'O型',
    )
    expect(user_student).to be_valid
  end

  it '名前がない場合、無効である' do
    user_student = UserStudent.new(
      id: 1,
      name: nil,
      student_id: 202020,
      school_id: 1,
      email: 'tanaka@example.com',
      password: 'password',
      birth_date: '2002-01-01',
      grade: '小学2年生',
      blood_type: 'O型'
    )
    expect(user_student).to be_invalid
  end

  it '生徒IDがない場合、無効である' do
    user_student = UserStudent.new(
      id: 1,
      name: '田中たろう',
      student_id: nil,
      school_id: 1,
      email: 'tanaka@example.com',
      password: 'password',
      birth_date: '2002-01-01',
      grade: '小学2年生',
      blood_type: 'O型',
    )
    expect(user_student).to be_invalid
  end

  it '生徒IDがマイナス入力の場合、無効である' do
    user_student = UserStudent.new(
      id: 1,
      name: '田中たろう',
      student_id: -1,
      school_id: 1,
      email: 'tanaka@example.com',
      password: 'password',
      birth_date: '2002-01-01',
      grade: '小学2年生',
      blood_type: 'O型'
    )
    expect(user_student).to be_invalid
  end

  it '学校IDがない場合、無効である' do
    user_student = UserStudent.new(
      id: 1,
      name: '田中たろう',
      student_id: 202020,
      school_id: nil,
      email: 'tanaka@example.com',
      password: 'password',
      birth_date: '2002-01-01',
      grade: '小学2年生',
      blood_type: 'O型',
    )
    expect(user_student).to be_invalid
  end

  it '学校IDがマイナス入力の場合、無効である' do
    user_student = UserStudent.new(
      id: 1,
      name: '田中たろう',
      student_id: 202020,
      school_id: -1,
      email: 'tanaka@example.com',
      password: 'password',
      birth_date: '2002-01-01',
      grade: '小学2年生',
      blood_type: 'O型'
    )
    expect(user_student).to be_invalid
  end

  it 'メールアドレスがない場合、無効である' do
    user_student = UserStudent.new(
      id: 1,
      name: '田中たろう',
      student_id: 202020,
      school_id: 1,
      email: nil,
      password: 'password',
      birth_date: '2002-01-01',
      grade: '小学2年生',
      blood_type: 'O型'
    )
    expect(user_student).to be_invalid
  end

  it 'パスワードがない場合、無効である' do
    user_student = UserStudent.new(
      id: 1,
      name: '田中たろう',
      student_id: 202020,
      school_id: 1,
      email: 'tanaka@example.com',
      password: nil,
      birth_date: '2002-01-01',
      grade: '小学2年生',
      blood_type: 'O型'
    )
    expect(user_student).to be_invalid
  end
end
