# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# coding: utf-8

#facultyテーブルに学部をセット

  Faculty.first_or_create([
      {id: 1, name: '人文学部'},
      {id: 2, name: '外国語学部'},
      {id: 3, name: '経済学部'},
      {id: 4, name: '経営学部'},
      {id: 5, name: '法学部'},
      {id: 6, name: '総合政策学部'},
      {id: 7, name: '理工学部'},
      {id: 8, name: '国際教養学部'},
      {id: 9, name: '短期大学部'}
    ])

#departmentテーブルに学科をセット

  Department.create(name: 'キリスト教学科', faculty_id: 1)
  Department.create(name: '人類文化学科', faculty_id: 1)
  Department.create(name: '心理人間学科', faculty_id: 1)
  Department.create(name: '日本文化学科', faculty_id: 1)
  Department.create(name: '英米学科', faculty_id: 2)
  Department.create(name: 'スペイン・ラテンアメリカ学科', faculty_id: 2)
  Department.create(name: 'フランス学科', faculty_id: 2)
  Department.create(name: 'ドイツ学科', faculty_id: 2)
  Department.create(name: 'アジア学科', faculty_id: 2)
  Department.create(name: '経済学科', faculty_id: 3)
  Department.create(name: '経営学科', faculty_id: 4)
  Department.create(name: '法律学科', faculty_id: 5)
  Department.create(name: '総合政策学科', faculty_id: 6)
  Department.create(name: 'システム数理学科', faculty_id: 7)
  Department.create(name: 'ソフトウェア工学科', faculty_id: 7)
  Department.create(name: '機械電子制御工学科', faculty_id: 7)
  Department.create(name: '国際教養学科', faculty_id: 8)
  Department.create(name: '英語科', faculty_id: 9)