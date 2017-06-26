class Thesis < ActiveRecord::Base

  validates :title, presence: true
  validates :key_words, presence: true
  validates :description, presence: true

  #以下はdbにアップロードを試みた際のコード　消さないで...(のちに検証します)
  # #アップロードファイルの妥当性をfile_invalid?で検証
  # validate :file_invalid?

  # #書き込み専用のdataプロパティ、(uploadfileオブジェクト)を定義
  # def data=(data)
  #   self.ctype = data.content_type
  #   binding.pry
  #   self.file = data.read
  # end

  # #アップロードファイルの妥当性を検証するfile_invalid?メソッドの定義
  # private
  # def file_invalid?
  #   vfile = ['application/vnd.openxmlformats-officedocument.wordprocessingml.document']

  #   if !vfile.include?(self.ctype)
  #     errors.add('アップロードできるのはワードかPDFファイルです。')
  #   end

  #   if !self.file.length > 10.megabyte
  #     errors.add('ファイルサイズは10MBまでです。')
  #   end

  # end
end
