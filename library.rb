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
          puts "#{mother_answer}に関する質問です。"

        end
