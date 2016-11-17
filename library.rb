#========infomation==========

    def infomation
      #init=================
      mother_answer = 0

      #infomation===========
      puts "1から順番に尋ねてください。"
      puts ""
      puts "1>あいさつ"
      puts "2>身につけるもの"
      puts "3>食事"
      puts "4>環境"
      puts "5>知人"
      puts "6>趣味"
      puts "7>今の感情"
      puts "8>体調"
      puts "9>コミュニケーション"


      #input===========================*/
      puts "当てはまる数字を入力して下さい。"
      mother_answer = gets.to_i

      puts "入力された数字は #{mother_answer} ですか？"

      return mother_answer

    end


#========question==========

    def questionTree(mother_answer)
      #--------init----------
      i = 0
      mqid = 0

      mqeach = {1=>"mqid01.csv", 2=>"mqid02.csv",3=>"mqid03.csv",4=>"mqid04.csv",
                5=>"mqid05.csv", 6=>"mqid06.csv",7=>"mqid07.csv",8=>"mqid08.csv",
                9=>"mqid09.csv"}
      cqid = Array.new
      child_question = Array.new

      #------fininit-------

      puts "#{mother_answer}に関する質問です。"


      CSV.foreach(mqeach[mother_answer]) do | questionid |
        cqid[i] = questionid[0]
        child_question[i] = questionid[1]
        i += 1
      end

      puts cqid
      puts ""
      puts child_question

    end
