#========infomation==========

    def infomation
      #init=================
      mother_answer = 0

      #infomation===========
      puts "1から順番に尋ねてください。"
      puts ""
      puts "1>してほしいことがありますか？"
      puts "2>お話したいことがありますか？"
      puts ""
      puts "tips"
      puts "ゆっくり大きな声を心がけましょう"
      puts ""


      #input===========================*/
      puts "当てはまる数字を入力して下さい。"
      mother_answer = gets.to_i

      puts "確認>入力された数字は #{mother_answer} です。"
      puts ""
      return mother_answer

    end


#========question==========

    def questionTree(mother_answer)
      #--------init----------
      i = 0 #カウンタ変数

      #cqid = Array.new  #質問ID ##現在は使っていないがあとで使うかも
      child_question = Array.new  #質問本文
      mq_each = Array.new   #マザー選択
      mq_each = {1=>"mqid01.csv", 2=>"mqid02.csv"}

      answer = "Y"  #回答
      last_ans_flg = 0  #終了フラグ
      last_answer_flg = Array.new #フラグ
      answer_path = Array.new #回答パス
      answer_i = 0  #回答カウンタ変数1
      answer_id = 0  #回答カウンタ変数2
      finish_id = answer_id #終了時表示用変数

      CSV.foreach("#{mq_each[mother_answer]}") do | questionid |
        child_question[i] = questionid[0]
        last_answer_flg[i] = questionid[1]
        i += 1
      end

      #------fininit-------

      #-----main-----------
      puts "#{mother_answer}に関する質問です。"
      puts ""
      puts child_question
      puts last_answer_flg


      #----mainquestion----

      while true do

        #デバッグ
        puts "answerは#{answer}"
        puts "answer_iは#{answer_i}"
        puts "answer_idは#{answer_id}"
        puts "answer_pathは#{answer_path}"
        puts "last_ans_flgは#{last_ans_flg}"
        puts "finish_idは#{finish_id}"
        puts ""

        puts child_question[answer_id]
        puts "「はい」→yキー"
        puts "「いいえ」→nキー"
        puts "を入力してください"
        answer = gets.chop


        answer_path[answer_i] = answer_id  #回答 パスに追加
        finish_id = answer_id #finflgがたった後の処理のトワレ


        if last_ans_flg == 1 && answer == "y" then
          case answer_id
          when 5
            puts "天気予報を表示します。"
            weather()
        end
          puts answer_path
          puts "終了です"
            break
        end


        #デバッグ
        puts "answerは#{answer}"
        puts "-------------------------"

        if answer == "y" then #回答がYならば
          puts "Yesです"

          if answer_id == 0 then
            answer_id = 1  #最初の質問の処理
            answer_id = answer_id*2-1 #配列の添字のカウンタを変更
          else
            answer_id = answer_id*2+1 #配列の添字のカウンタを変更
          end
          answer_i += 1 #カウンタ変数をインクリメント

        elsif answer == "n"
          puts "Noです"

          if answer_id == 0 then
            answer_id = 1  #最初の質問の処理
            answer_id = answer_id*2 #配列の添字のカウンタを変更
          else
            answer_id = answer_id*2 #配列の添字のカウンタを変更
          end
          answer_i += 1 #カウンタ変数をインクリメント

      end   #ifのおわりend

      last_ans_flg = last_answer_flg[answer_id].to_i #終了フラグ処理

    end    #whileのおわりend

  end   #defのおわりend



  #========tempreture==========

  def weather

  url = URI.parse("http://api.openweathermap.org/data/2.5/find?lat=35.69&lon=139.69cnt=1&APPID=6848a959373737a87da404badc9b876a")
  json = Net::HTTP.get(url)
  cel = 273.15 #セルシウス度

  #kokokara natsumi
  result = JSON.parse(json)#JSONから配列へ
  list=result["list"]#jsonデータ配列を配列listへ
  date= list[0]#神戸市配列をハッシュにしてdateに
  temp=date["main"]#気温情報をtempへ
  naw=temp["temp"]#現在気温
  hi=temp["temp_max"]#最高気温
  low=temp["temp_min"]#最低気温
  stor=date["weather"]#現在の天気配列をstorへ
  weather=stor[0]#現在の天気配列storをweatherハッシュへ
  clouds=date["clouds"]#降水確率ハッシュをcloudsへ
  puts "降水確率は#{clop=clouds["all"]}%"#降水確率をclopへ
  puts "現在の気温は#{naw -= cel}"
  puts "最高気温は#{hi -= cel}"
  puts "最低気温は#{low -= cel}"
  puts wea=weather["main"]#現在天気をweaへ
  return wea
end
  #=========fintempreture=========
