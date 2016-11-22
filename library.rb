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

      cqid = Array.new  #質問ID
      child_question = Array.new  #質問本文
      mq_each = Array.new   #マザー選択
      mq_each = {1=>"mqid01.csv", 2=>"mqid02.csv"}

      answer = "Y"  #回答
      last_answer_flg = 0 #フラグ
      answer_path = Array.new #回答パス
      answer_i = 0  #回答カウンタ変数1
      answer_j = 1  #回答カウンタ変数2

      CSV.foreach("#{mq_each[mother_answer]}") do | questionid |
        cqid[i] = questionid[0]
        child_question[i] = questionid[1]
        i += 1
      end

      #------fininit-------

      #-----main-----------
      puts "#{mother_answer}に関する質問です。"
      puts ""

      #----mainquestion----
      puts child_question[answer_j]
      puts "「はい」→Yキー"
      puts "「いいえ」→Nキー"
      puts "を入力してください"
      answer = gets.chop

      #-----質問パス--------
      answer_path[answer_i] = answer_i

      until last_answer_flg == 1 do

        if answer == "Y" then #回答がYならば
          answer_j = answer_j*2 #配列の添字のカウンタを変更
          puts child_question[answer_j] #質問文を表示
          answer_path[answer_i] = answer_j  #回答パスに追加
          answer_i += 1 #カウンタ変数をインクリメント
          last_answer_flg = 1

        elsif answer == "N"
          answer_j = answer_j*2+1 #配列の添字のカウンタを変更
          puts child_question[answer_j] #質問文を表示
          answer_path[answer_i] = answer_j  #回答パスに追加
          answer_i += 1 #カウンタ変数をインクリメント
          last_answer_flg = 1

      end

    end
  end
