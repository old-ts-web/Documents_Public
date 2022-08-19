# gametower儲值中心寫作規範

## CodeReview檢核內容

1. Settle請款基本流程參考(交易結果回傳值參考 [gametower儲值中心規格書.md](http://public-git.towergame.com/OLD_TS_WEB/Documents_Public/src/branch/master/%e5%90%84%e5%b0%88%e6%a1%88%e4%b8%b2%e6%8e%a5%e7%94%a8%e6%8a%80%e8%a1%93%e6%96%87%e4%bb%b6/gametower%e5%84%b2%e5%80%bc%e4%b8%ad%e5%bf%83%e8%a6%8f%e6%a0%bc%e6%9b%b8.md#user-content-%E4%B8%89-%E4%BA%A4%E6%98%93%E7%B5%90%E6%9E%9C) 規範)

   ```c#
   1.取得參數與紀錄
   2.「驗證碼檢查」
   3.取得儲值中心訂單紀錄
   4.判斷儲值中心訂單狀態，是否已是成功狀態
   5.呼叫「查詢訂單Api」取得交易狀態碼
   6.計算價值、通路費
   7.更新訂單
   8.呼叫交易回報確認：透過共用程式告知廠商請款結果
   9.根據online,offline狀態進行post轉址or輸出交易結果回傳值 
   ```

2. 程式內用錯誤集合(rgstrErrorMessage)將各個檢查與流程分開，當錯誤為0才進行處理

   ```
   // 沒發生錯誤才繼續處理
   if (rgstrErrorMessage.Count == 0)
   {
   	// 檢查 or 流程
   }
   ```

3. 接收第三方金流商的參數是否有經過「驗證碼檢查」

   ```c#
   string	q_strSignature		= "接收的驗證碼" ;
   string	strSignatureTemp	= "計算出的驗證碼" ;
   if(!q_strSignature.Equals(strSignatureTemp,StringComparison.OrdinalIgnoreCase))
   {
   	strResultCode			= "000106" ;
       rgstrErrorMessage.Add("Signature不符，計算得出Signature=" + strSignatureTemp) ;
   }
   ```

4. 第三方金流商有「查詢訂單Api」，交易狀態碼一律以「查詢訂單Api」為準

   ```c#
   string	strQueryUrl = "查詢訂單Api位置"
   string  strJson 	= "查詢參數"
   if (csExecuteURL.ExecuteJson(strQueryUrl,strJson,false,30000))
   {
       // 傳入回傳交易狀態碼取得請款結果
   	csTransReturnItem.SetSettleResult(csRelation, strTransReturnCode, strTransReturnMessage) ;
   }
   ```

5. 若是第三方金流商的Api安全性不夠，提出建議不要串接

   ```c#
   安全性考量參考以下
   1.是否直接將key帶到網址(or Post)上，並且沒有對參數做運算 (甚至沒有Key)
     // 安全性不夠範例1:Settle.aspx?id=A00001&Result=Success&Key=EFWF@#@FFFF
     // 安全性不夠範例2:Settle.aspx?id=A00001&Result=Success
     // 有驗證碼範例:Settle.aspx?id=A00001&Result=Success&CheckCode=ABCDEFGHIJKLMNABCDEFGHIJKLMN==
   2.沒有提供「查詢訂單Api」可以進行驗證
   3.若有「查詢訂單Api」可以驗證，那參數沒有key也沒關係，但是不能直接拿參數的Result來用
   4.若是沒有「驗證碼檢查」與「查詢訂單Api」，看是否有其他補強措施，例如一定是從廠商Server端呼叫並鎖定IP
   ```

6. 檢查重複交易改成呼叫 CheckRejectTransaction()

   ```C#
   // 檢查要拒絕的交易(e.g.PLATFORM_TRANS_NO是否有重複,有pending交易..etc)
   if (!csBankCenter.CheckRejectTransaction(csTradeDBA, nCenterIndexNo))
   {
       // 失敗處理
   }
   ```

7. 交易回報確認呼叫 csRelation.ExecuteTradeConfirm()

   ```C#
   // -----
   //	交易回報確認：透過共用程式告知廠商請款結果
   // -----
   if(rgstrErrorMessage.Count == 0 && bSettleSucceeded)
   {
      csRelation.ExecuteTradeConfirm(nIndexNo,ref csStringBuilderLog,ref rgstrErrorMessage);
   }
   ```

8. 金流回傳交易狀態碼的成功與失敗定義在設定檔案內，需請系統管理員設定

   ```json
   {
     "OVERSEAS_GOOGLE_PLAY_SUCCESS_CODE": "0",
     "OVERSEAS_GOOGLE_PLAY_FAIL_CODE": ""
   }
   ```

9. 回傳交易狀態碼成功與否判斷需套用GT_TransReturnItem

   ```C#
   GT_TransReturnItem	csTransReturnItem	= new GT_TransReturnItem();
   // 傳入回傳交易狀態碼取得請款結果 需特別注意strTransReturnCode的來源是否有經過驗證(驗證碼or查詢訂單Api)
   csTransReturnItem.SetSettleResult(csRelation, strTransReturnCode, strTransReturnMessage) ;
   // 根據請款結果進行不同處理
   switch(csTransReturnItem.ePayTypeSettleResult)
   {
       case PAY_TYPE_SETTLE_RESULT.SUCCEEDED :
           break ;
       case PAY_TYPE_SETTLE_RESULT.FAILED :
           break ;
       default
           break ;
   }
   ```

10. 更新為請款成功，一律需使用csTransReturnItem.ePayTypeSettleResult判斷

    ```c#
    // 請款結果為成功才能將狀態改為請款已完成
    if (csTransReturnItem.ePayTypeSettleResult == PAY_TYPE_SETTLE_RESULT.SUCCEEDED)
    {
    	strResultCode						= "000000" ;
       	csDCC["PROCESS_WORK"].objData		= (int) PROCESS_WORK.SETTLE ;
       	csDCC["PROCESS_STATUS"].objData		= (int) PROCESS_STATUS.SUCCEEDED ;
    }
    ```

11. 重複收到請款成功資料，不會有重複給點問題

    ```c#
    bool bGetSettleType = false ; // [旗標] 此交易可能會被重覆確認，應該使用此變數做判斷是否已判斷請款狀態
       
    // 撈取訂單狀態判斷是否已確認過
    if
    (
       	(r_nProcessWork == (int) PROCESS_WORK.SETTLE && r_nProcessStatus == (int) PROCESS_STATUS.SUCCEEDED) ||
       	(r_nProcessWork == (int) PROCESS_WORK.SUCCESSFUL_TRADE_CONFIRM)
    )
    {
        bGetSettleType = true ;
    }
       
    // 若bGetSettleType=true，就不會再次更新訂單，直接回傳已知結果
    ```

12. 代理合作模式的金流串接 (例如 TH_MRW_BankCenter)，金流商和代理商後台時區有可能有差異，需確認正式環境金流商回傳的請款時間，有無需要做時區轉換

    ```c#
    // 正式環境回傳的請款日期是 GMT +8，專案希望轉 GMT +7
    if (a_csWS.eEnvironment == GT_ENVIRONMENT.FORMAL)
    {
    		dtSettle							= dtSettle.AddHours(-1) ;
    }
    ```


