class ThesesController < ApplicationController
  
  def new
    @thesis = Thesis.new
    #アップロード失敗のnoticeの受け取り
    #@error_message = params[:notice]
  end

  #アップロードされた卒論を、app/assets/doc配下に保存
  def upload
    @thesis = Thesis.new(thesis_params)

    #アップロードファイルを取得
    file = params[:thesis][:data]
    #ファイルの名前を取得
    filename = file.original_filename
    #許可する拡張子を定義、現在はワードとpdfを許可
    perms = ['.docx', '.pdf']
    #アップロードファイルの拡張子判定
    if !perms.include?(File.extname(filename).downcase)
      flash[:alert] = 'アップロードできるのはワードかPDFファイルです。'
      redirect_to(action: :new)
    elsif file.size > 10.megabyte
      flash[:alert] = 'ファイルサイズは10MBまでです。'
      redirect_to(action: :new)
    else
      #保存する時の処理を書く
        if @thesis.save
          File.open("app/assets/doc/#{filename}", "wb") { |f| f.write(file.read) }
          flash[:alert] = "#{filename}をアップロードしました。"
          render :template => "mypages/index"
        else
          flash[:alert] = 'アップロードに失敗しました。もう一度やり直してください。'
          redirect_to(action: :new)
        end
    end
  end

  private
  def thesis_params
    params.require(:thesis).permit(:title, :key_words, :description)
  end


  #以下はdbにアップロードを試みた際のコード 消さないで...(のちに検証します)
  # #アップロードボタンが押された時の処理
  # def create
  #   # File.open(params[:thesis][:data].original_filename, 'wb') do |of|
  #   # of.write(params[:thesis][:data].read)
  #   # end

  #   @thesis = Thesis.new
  #   # binding.pry
  #   if @thesis.save(params.require(:thesis).permit(:data))
  #     flash[:alert] = '保存に成功しました'
  #   else
  #     flash[:alert] = '保存に失敗しました'
  #   end


    # if Thesis.update(thesis_data = params.require(:thesis).permit(:data))
    #   flash[:alert] = '保存に成功しました'
    # # else
    # #   flash[:alert] = '保存に失敗しました'
    # end
    
  # end

end
