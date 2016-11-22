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
      last_ans_flg = 0
      last_answer_flg = Array.new #フラグ
      answer_path = Array.new #回答パス
      answer_i = 0  #回答カウンタ変数1
      answer_j = 0  #回答カウンタ変数2

      CSV.foreach("#{mq_each[mother_answer]}") do | questionid |
        child_question[i] = questionid[0]
        last_answer_flg[i] = questionid[1]
        i += 1
      end

      #下処理
      #for i in 0..10
      #  if last_answer_flg[i] == 0 then
      #    last_answer_flg[i] = nil
      #  end
      #end
      #------fininit-------

      #-----main-----------
      puts "#{mother_answer}に関する質問です。"
      puts ""
      puts child_question
      puts last_answer_flg


      #----mainquestion----

      until last_ans_flg == 1 do

        puts child_question[answer_j]
        puts "「はい」→yキー"
        puts "「いいえ」→nキー"
        puts "を入力してください"
        answer = gets.chop

        #デバッグ
        puts "answerは#{answer}"
        puts "answer_iは#{answer_i}"
        puts "answer_jは#{answer_j}"
        puts "answer_pathは#{answer_path}"
        puts "last_ans_flgは#{last_ans_flg}"
        puts ""

        if answer == "y" then #回答がYならば
          puts "Yesです"
          answer_path[answer_i] = answer_j  #回答パスに追加
          last_ans_flg = last_answer_flg[answer_j] #終了フラグ処理

          if answer_j == 0 then
            answer_j = 1  #最初の質問の処理
            answer_j = answer_j*2-1 #配列の添字のカウンタを変更
          else
            answer_j = answer_j*2+1 #配列の添字のカウンタを変更
          end
          answer_i += 1 #カウンタ変数をインクリメント
          last_ans_flg = last_answer_flg[answer_j] #終了フラグ処理

        elsif answer == "n"
          puts "Noです"
          answer_path[answer_i] = answer_j  #回答パスに追加
          last_ans_flg = last_answer_flg[answer_j] #終了フラグ処理

          if answer_j == 0 then
            answer_j = 1  #最初の質問の処理
            answer_j = answer_j*2 #配列の添字のカウンタを変更
          else
            answer_j = answer_j*2 #配列の添字のカウンタを変更
          end
          answer_i += 1 #カウンタ変数をインクリメント

      end
    end


    puts "終了です。"


  end
