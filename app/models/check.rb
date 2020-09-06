class Check < ApplicationRecord
  belongs_to :user_student
  belongs_to :user_officer


  enum hearing: {よく聞こえている:0,
               聞こえている:1,
               少し聞こえずらい:2,
               医師に相談:3
            }

  enum urine: {健康:0,
               問題なし:1,
               少し疲れあり:2,
               疲れ有り:3
            }

  enum electro_cardiogram: {異常なし:0,
                            健康上異常なし:1,
                            運動を控える:2,
                            問題あり:3
                          }

  enum nutritional_status: {充分取れている:0,
                            取れている:1,
                            少し取れている:2,
                            取れていない:3
                          }
end
