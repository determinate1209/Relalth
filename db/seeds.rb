# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


customers = Customer.create!(
  [
    {email: 'aaa@test.com', last_name: '木部', first_name: '一徹', user_name: 'kibechan', password: 'aaaaaa'},
    {email: 'sola@test.com', last_name: '東垣', first_name: '空', user_name: 'salapiyo', password: 'salapiyopiyo'},
    {email: 'bbb@test.com', last_name: '健康', first_name: '太郎', user_name: '匿名希望b', password: 'bbbbbb'},
    {email: 'ccc@test.com', last_name: '平成', first_name: '健太郎', user_name: '匿名希望c', password: 'cccccc'},
    {email: 'ddd@test.com', last_name: ' 昭和', first_name: '小太郎', user_name: '匿名希望d', password: 'dddddd'},
    {email: 'eee@test.com', last_name: '令和', first_name: '進次郎', user_name: '匿名希望e', password: 'eeeeee'},
    {email: 'fff@test.com', last_name: '大正', first_name: '正大', user_name: '匿名希望f', password: 'ffffff'},
    {email: 'ggg@test.com', last_name: '明治', first_name: '維新', user_name: '匿名希望g', password: 'gggggg'},
    {email: 'hhh@test.com', last_name: '江戸', first_name: 'エドガー', user_name: '匿名希望h', password: 'hhhhhh'},
  ]
)

menus = Menu.create!(
  [
    {name: '脚の痛みに効果的なストレッチ', description: '辛い脚の痛みを改善するストレッチメニューです。', site_name: 0, plan_name: 0, customer_id: customers[1].id},
    {name: '脚の疲労に効果的なストレッチ', description: '脚の疲労を改善するストレッチメニューです。', site_name: 0, plan_name: 1, customer_id: customers[1].id},
    {name: '膝の痛みに効果的なストレッチ',description: '辛い膝の痛みを改善するストレッチメニューです。', site_name: 1, plan_name: 0,customer_id: customers[1].id },
    {name: '膝の疲労感をなくすストレッチ',description: '膝の疲労感を改善するストレッチメニューです。', site_name: 1,plan_name: 1,customer_id: customers[1].id},
    {name: '腰の痛みを改善するストレッチ',description: '腰の痛みを改善するストレッチメニューです。', site_name: 2,plan_name: 0,customer_id: customers[1].id},
    {name: '腰の疲労感を改善するストレッチ',description: '腰の疲労感を改善するためのストレッチメニューです。', site_name: 2,plan_name: 1,customer_id: customers[1].id},
    {name: '肩の痛みに効果的なストレッチ',description: '四十肩の疑いがある人におすすめのストレッチメニューです。', site_name: 3,plan_name: 0,customer_id: customers[1].id},
    {name: '肩こりを改善するためのストレッチ',description: '辛い肩こりを改善するためのストレッチメニューです。', site_name: 3,plan_name: 1,customer_id: customers[1].id},
    {name: '全身の痛みに効果的なストレッチ',description: '全身の痛みを改善するのに効果的なストレッチメニューです。', site_name: 4,plan_name: 0,customer_id: customers[1].id},
    {name: '全身の疲労感を改善するのに効果的なストレッチ',description: '全身疲れている人におすすめなストレッチメニューです。', site_name: 4,plan_name: 1,customer_id: customers[1].id},
  ]  
)

MenuItem.create!(
  [
    {menu_id: menus[0].id, stretch_number: 1, description: 'このストレッチでは、バスタオルを主に使用する場面があります。体が硬ければ硬いほど大きいタオルを用意することをおすすめします。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch20.jpg"), filename:"stretch20.jpg"), },
    {menu_id: menus[0].id, stretch_number: 2, description: 'まずは第二の心臓と言われるふくらはぎを痛気持ちい強度で揉み、ふくらはぎを柔らかくし血流をよくします。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch8.jpg"), filename:"stretch8.jpg"), },
    {menu_id: menus[0].id, stretch_number: 3, description: 'ふくらはぎが柔らかくなったら壁を押しながらアキレス腱を20秒ゆっくりと伸ばしましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch9.jpg"), filename:"stretch9.jpg"), },
    {menu_id: menus[0].id, stretch_number: 4, description: '次はもも裏のストレッチです。画像のようにバスタオルを脚の裏にセットしてそのまま伸ばしたい脚を上げていきます。無理はせずに痛気持ちいところで10秒X3回行いましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch10.jpg"), filename:"stretch10.jpg"), },
    {menu_id: menus[0].id, stretch_number: 5, description: '次はもも前のストレッチです。腰が反らないように注意をしながら10秒X3回、行っていきましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch11.jpg"), filename:"stretch11.jpg"), },
    {menu_id: menus[0].id, stretch_number: 6, description: '最後は臀部のストレッチです。画像のような姿勢をとって臀部が伸びていることを確認しながら１０秒X3回、行っていきます。伸びないという方は踵の角度調節を！反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch12.jpg"), filename:"stretch12.jpg"), },
    
    {menu_id: menus[1].id, stretch_number: 1, description: 'まずは、画像のように足の指の間に手の指を入れ、その状態で1分間足首を大きく回します。反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch13.jpg"), filename:"stretch13.jpg"), },  
    {menu_id: menus[1].id, stretch_number: 2, description: '次にふくらはぎを画像のようにマッサージします。柔らかくなるまでやりましょう。反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch8.jpg"), filename:"stretch8.jpg"), },  
    {menu_id: menus[1].id, stretch_number: 3, description: '画像のように、アキレス腱を伸ばしましょう。15秒X3回反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch9.jpg"), filename:"stretch9.jpg"), },  
    {menu_id: menus[1].id, stretch_number: 4, description: '画像のように正座をして、後ろに体重を乗せましょう。脛が伸びるのですが硬い人は、足首や足の甲が伸びます。15秒X3回', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch19.jpg"), filename:"stretch19.jpg"), },
    {menu_id: menus[1].id, stretch_number: 5, description: '次に画像のように、股関節を回していきます。ゆっくり呼吸をしながら、１分間回していきましょう。反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch14.jpg"), filename:"stretch14.jpg"), },
    {menu_id: menus[1].id, stretch_number: 6, description: '股関節を回したら画像のように、ももの前を伸ばしていきます。腰が反らないように注意しながら15秒X3回。反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch11.jpg"), filename:"stretch11.jpg"), }, 
    {menu_id: menus[1].id, stretch_number: 7, description: '画像のように、足首を掴んで、膝を伸ばしていきます。もも裏が伸びているなと思ったらそのまま15秒キープします。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch16.jpg"), filename:"stretch16.jpg"), }, 
    {menu_id: menus[1].id, stretch_number: 8, description: '最後に、画像のように内ももの筋肉を伸ばしていきます。反対も同じように', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch15.jpg"), filename:"stretch15.jpg"), }, 
    
    {menu_id: menus[2].id, stretch_number: 1, description: 'このストレッチでは、バスタオルを主に使用する場面があります。体が硬ければ硬いほど大きいタオルを用意することをおすすめします。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch20.jpg"), filename:"stretch20.jpg"), }, 
    {menu_id: menus[2].id, stretch_number: 2, description: 'まずは第二の心臓と言われるふくらはぎを痛気持ちい強度で揉み、ふくらはぎを柔らかくし血流をよくします。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch8.jpg"), filename:"stretch8.jpg"), },  
    {menu_id: menus[2].id, stretch_number: 3, description: 'ふくらはぎが柔らかくなったら壁を押しながらアキレス腱を20秒ゆっくりと伸ばしましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch9.jpg"), filename:"stretch9.jpg"), }, 
    {menu_id: menus[2].id, stretch_number: 4, description: '次はもも裏のストレッチです。画像のようにバスタオルを脚の裏にセットしてそのまま伸ばしたい脚を上げていきます。無理はせずに痛気持ちいところで10秒X3回行いましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch10.jpg"), filename:"stretch10.jpg"), }, 
    {menu_id: menus[2].id, stretch_number: 5, description: '次はもも前のストレッチです。腰が反らないように注意をしながら20秒X3回、行っていきましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch11.jpg"), filename:"stretch11.jpg"), }, 
    {menu_id: menus[2].id, stretch_number: 6, description:  '最後は臀部のストレッチです。画像のような姿勢をとって臀部が伸びていることを確認しながら１０秒X3回、行っていきます。伸びないという方は踵の角度調節を！反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch12.jpg"), filename:"stretch12.jpg"), }, 
    
    {menu_id: menus[3].id, stretch_number: 1, description: 'このストレッチでは、バスタオルを主に使用する場面があります。体が硬ければ硬いほど大きいタオルを用意することをおすすめします。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch20.jpg"), filename:"stretch20.jpg"), }, 
    {menu_id: menus[3].id, stretch_number: 2, description: 'まずは第二の心臓と言われるふくらはぎを痛気持ちい強度で揉み、ふくらはぎを柔らかくし血流をよくします。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch8.jpg"), filename:"stretch8.jpg"), },  
    {menu_id: menus[3].id, stretch_number: 3, description: 'ふくらはぎが柔らかくなったら壁を押しながらアキレス腱を20秒ゆっくりと伸ばしましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch9.jpg"), filename:"stretch9.jpg"), }, 
    {menu_id: menus[3].id, stretch_number: 4, description: '次はもも裏のストレッチです。画像のようにバスタオルを脚の裏にセットしてそのまま伸ばしたい脚を上げていきます。無理はせずに痛気持ちいところで10秒X3回行いましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch10.jpg"), filename:"stretch10.jpg"), }, 
    {menu_id: menus[3].id, stretch_number: 5, description: '次はもも前のストレッチです。腰が反らないように注意をしながら20秒X3回、行っていきましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch11.jpg"), filename:"stretch11.jpg"), }, 
    {menu_id: menus[3].id, stretch_number: 6, description:  '最後は臀部のストレッチです。画像のような姿勢をとって臀部が伸びていることを確認しながら１０秒X3回、行っていきます。伸びないという方は踵の角度調節を！反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch12.jpg"), filename:"stretch12.jpg"), }, 
    
    {menu_id: menus[4].id, stretch_number: 1, description: '画像のように、足首を掴んで、膝を伸ばしていきます。もも裏が伸びているなと思ったらそのまま15秒キープします。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch16.jpg"), filename:"stretch16.jpg"), }, 
    {menu_id: menus[4].id, stretch_number: 2, description: '次に画像のように、股関節を回していきます。ゆっくり呼吸をしながら、１分間回していきましょう。反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch14.jpg"), filename:"stretch14.jpg"), }, 
    {menu_id: menus[4].id, stretch_number: 3, description: '股関節を回したら画像のように、ももの前を伸ばしていきます。腰が反らないように注意しながら15秒X3回。反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch11.jpg"), filename:"stretch11.jpg"), }, 
    {menu_id: menus[4].id, stretch_number: 4, description: '次は、臀部のストレッチです。画像のような姿勢をとって臀部が伸びていることを確認しながら１０秒X3回、行っていきます。伸びないという方は踵の角度調節を！反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch12.jpg"), filename:"stretch12.jpg"), }, 
    {menu_id: menus[4].id, stretch_number: 5, description: '最後に、画像のように腰を丸めていきましょう。15秒X3回', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch17.jpg"), filename:"stretch17.jpg"), }, 
    
    {menu_id: menus[5].id, stretch_number: 1, description: '画像のように、足首を掴んで、膝を伸ばしていきます。もも裏が伸びているなと思ったらそのまま15秒キープします。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch16.jpg"), filename:"stretch16.jpg"), }, 
    {menu_id: menus[5].id, stretch_number: 2, description: '次に画像のように、股関節を回していきます。ゆっくり呼吸をしながら、１分間回していきましょう。反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch14.jpg"), filename:"stretch14.jpg"), }, 
    {menu_id: menus[5].id, stretch_number: 3, description: '股関節を回したら画像のように、ももの前を伸ばしていきます。腰が反らないように注意しながら15秒X3回。反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch11.jpg"), filename:"stretch11.jpg"), }, 
    {menu_id: menus[5].id, stretch_number: 4, description: '次は、臀部のストレッチです。画像のような姿勢をとって臀部が伸びていることを確認しながら１０秒X3回、行っていきます。伸びないという方は踵の角度調節を！反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch12.jpg"), filename:"stretch12.jpg"), }, 
    {menu_id: menus[5].id, stretch_number: 5, description: '最後に、画像のように腰を捻っていきます。15秒X3回。反対側も同じように', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch18.jpg"), filename:"stretch18.jpg"), }, 
    
    {menu_id: menus[6].id, stretch_number: 1, description: '画像のように、肘を曲げ肩に手を乗せ、肘で円を描くように回していきます。この時痛みがない範囲で大きく動かしましょう。2分回します。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch1.jpg"), filename:"stretch1.jpg"), }, 
    {menu_id: menus[6].id, stretch_number: 2, description: '次に画像のように、首をすくめるイメージで肩を上げて、脱力して元に戻すというのを20回繰り返します。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch2.jpg"), filename:"stretch2.jpg"), }, 
    {menu_id: menus[6].id, stretch_number: 3, description: '次は画像のように頭を横に倒し首を伸ばしていきます。気持ちが良いところで20秒キープし、反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch3.jpg"), filename:"stretch3.jpg"), }, 
    {menu_id: menus[6].id, stretch_number: 4, description: '次は、腕を前に出して親指は上のまま水平方向に腕を動かし、画像の姿勢になりましょう。１５秒X5回やります。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch4.jpg"), filename:"stretch4.jpg"), }, 
    {menu_id: menus[6].id, stretch_number: 5, description: '最後は、画像のように無理のないように後ろに手を回して、反対の手で肘を前の方向に引きましょう', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch5.jpg"), filename:"stretch5.jpg"), }, 
    
    {menu_id: menus[7].id, stretch_number: 1, description: '最初に、画像のように二の腕を伸ばしていきます。20秒X3回', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch6.jpg"), filename:"stretch6.jpg"), }, 
    {menu_id: menus[7].id, stretch_number: 2, description: '画像のように、肘を壁に当て胸の筋肉を伸ばしていきましょう。20秒X3回　反対も同じように', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch7.jpg"), filename:"stretch7.jpg"), }, 
    {menu_id: menus[7].id, stretch_number: 3, description: '次に画像のように、肘を曲げ肩に手を乗せ、肘で円を描くように回していきます。この時痛みがない範囲で大きく動かしましょう。2分回します。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch1.jpg"), filename:"stretch1.jpg"), }, 
    {menu_id: menus[7].id, stretch_number: 4, description: '次に画像のように、首をすくめるイメージで肩を上げて、脱力して元に戻すというのを20回繰り返します。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch2.jpg"), filename:"stretch2.jpg"), }, 
    {menu_id: menus[7].id, stretch_number: 5, description: '次は画像のように頭を横に倒し首を伸ばしていきます。気持ちが良いところで20秒キープします、反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch3.jpg"), filename:"stretch3.jpg"), }, 
 
    {menu_id: menus[8].id, stretch_number: 1, description: 'このストレッチでは、バスタオルを主に使用する場面があります。体が硬ければ硬いほど大きいタオルを用意することをおすすめします。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch20.jpg"), filename:"stretch20.jpg"), },
    {menu_id: menus[8].id, stretch_number: 2, description: 'まずは第二の心臓と言われるふくらはぎを痛気持ちい強度で揉み、ふくらはぎを柔らかくし血流をよくします。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch8.jpg"), filename:"stretch8.jpg"), },
    {menu_id: menus[8].id, stretch_number: 3, description: 'ふくらはぎが柔らかくなったら壁を押しながらアキレス腱を20秒ゆっくりと伸ばしましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch9.jpg"), filename:"stretch9.jpg"), },
    {menu_id: menus[8].id, stretch_number: 4, description: '次はもも裏のストレッチです。画像のようにバスタオルを脚の裏にセットしてそのまま伸ばしたい脚を上げていきます。無理はせずに痛気持ちいところで10秒X3回行いましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch10.jpg"), filename:"stretch10.jpg"), },
    {menu_id: menus[8].id, stretch_number: 5, description: '次はもも前のストレッチです。腰が反らないように注意をしながら10秒X3回、行っていきましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch11.jpg"), filename:"stretch11.jpg"), },
    {menu_id: menus[8].id, stretch_number: 6, description: '次は臀部のストレッチです。画像のような姿勢をとって臀部が伸びていることを確認しながら１０秒X3回、行っていきます。伸びないという方は踵の角度調節を！反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch12.jpg"), filename:"stretch12.jpg"), },
    {menu_id: menus[8].id, stretch_number: 7, description: '次は、画像のように腰を捻っていきます。15秒X3回。反対側も同じように', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch18.jpg"), filename:"stretch18.jpg"), }, 
    {menu_id: menus[8].id, stretch_number: 8, description: '最初に、画像のように二の腕を伸ばしていきます。20秒X3回', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch6.jpg"), filename:"stretch6.jpg"), }, 
    {menu_id: menus[8].id, stretch_number: 9, description: '画像のように、肘を壁に当て胸の筋肉を伸ばしていきましょう。20秒X3回　反対も同じように', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch7.jpg"), filename:"stretch7.jpg"), }, 
    {menu_id: menus[8].id, stretch_number: 10, description: '次に画像のように、肘を曲げ肩に手を乗せ、肘で円を描くように回していきます。この時痛みがない範囲で大きく動かしましょう。2分回します。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch1.jpg"), filename:"stretch1.jpg"), }, 
    {menu_id: menus[8].id, stretch_number: 11, description: '次に画像のように、首をすくめるイメージで肩を上げて、脱力して元に戻すというのを20回繰り返します。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch2.jpg"), filename:"stretch2.jpg"), }, 
    {menu_id: menus[8].id, stretch_number: 12, description: '次は画像のように頭を横に倒し首を伸ばしていきます。気持ちが良いところで20秒キープします、反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch3.jpg"), filename:"stretch3.jpg"), }, 
    
    {menu_id: menus[9].id, stretch_number: 1, description: 'このストレッチでは、バスタオルを主に使用する場面があります。体が硬ければ硬いほど大きいタオルを用意することをおすすめします。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch20.jpg"), filename:"stretch20.jpg"), },
    {menu_id: menus[9].id, stretch_number: 2, description: 'まずは第二の心臓と言われるふくらはぎを痛気持ちい強度で揉み、ふくらはぎを柔らかくし血流をよくします。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch8.jpg"), filename:"stretch8.jpg"), },
    {menu_id: menus[9].id, stretch_number: 3, description: 'ふくらはぎが柔らかくなったら壁を押しながらアキレス腱を20秒ゆっくりと伸ばしましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch9.jpg"), filename:"stretch9.jpg"), },
    {menu_id: menus[9].id, stretch_number: 4, description: '次はもも裏のストレッチです。画像のようにバスタオルを脚の裏にセットしてそのまま伸ばしたい脚を上げていきます。無理はせずに痛気持ちいところで10秒X3回行いましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch10.jpg"), filename:"stretch10.jpg"), },
    {menu_id: menus[9].id, stretch_number: 5, description: '次はもも前のストレッチです。腰が反らないように注意をしながら10秒X3回、行っていきましょう。反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch11.jpg"), filename:"stretch11.jpg"), },
    {menu_id: menus[9].id, stretch_number: 6, description: '次は臀部のストレッチです。画像のような姿勢をとって臀部が伸びていることを確認しながら１０秒X3回、行っていきます。伸びないという方は踵の角度調節を！反対も同じようにやっていきましょう。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch12.jpg"), filename:"stretch12.jpg"), },
    {menu_id: menus[9].id, stretch_number: 7, description: '次は、画像のように腰を捻っていきます。15秒X3回。反対側も同じように', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch18.jpg"), filename:"stretch18.jpg"), }, 
    {menu_id: menus[9].id, stretch_number: 8, description: '最初に、画像のように二の腕を伸ばしていきます。20秒X3回', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch6.jpg"), filename:"stretch6.jpg"), }, 
    {menu_id: menus[9].id, stretch_number: 9, description: '画像のように、肘を壁に当て胸の筋肉を伸ばしていきましょう。20秒X3回　反対も同じように', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch7.jpg"), filename:"stretch7.jpg"), }, 
    {menu_id: menus[9].id, stretch_number: 10, description: '次に画像のように、肘を曲げ肩に手を乗せ、肘で円を描くように回していきます。この時痛みがない範囲で大きく動かしましょう。2分回します。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch1.jpg"), filename:"stretch1.jpg"), }, 
    {menu_id: menus[9].id, stretch_number: 11, description: '次に画像のように、首をすくめるイメージで肩を上げて、脱力して元に戻すというのを20回繰り返します。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch2.jpg"), filename:"stretch2.jpg"), }, 
    {menu_id: menus[9].id, stretch_number: 12, description: '次は画像のように頭を横に倒し首を伸ばしていきます。気持ちが良いところで20秒キープします、反対も同じように！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/stretch3.jpg"), filename:"stretch3.jpg"), }, 
  
  ]
)