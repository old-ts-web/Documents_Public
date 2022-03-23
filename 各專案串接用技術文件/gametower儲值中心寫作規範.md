# gametower儲值中心寫作規範

## CodeReview檢核內容

1. 程式內用錯誤集合(rgstrErrorMessage)將各個檢查與流程分開，當錯誤為0才進行處理

   ```
   // 沒發生錯誤才繼續處理
   if (rgstrErrorMessage.Count == 0)
   {
   	// 檢查 or 流程
   }
   ```

2. 接收第三方金流商的參數是否有經過驗證碼檢查，沒有的話一定要經過「查詢訂單Api」

   ```c#
   string	q_strSignature		= "接收的驗證碼" ;
   string	strSignatureTemp	= "計算出的驗證碼" ;
   if(!q_strSignature.Equals(strSignatureTemp,StringComparison.OrdinalIgnoreCase))
   {
   	strResultCode			= "000106" ;
       rgstrErrorMessage.Add("Signature不符，計算得出Signature=" + strSignatureTemp) ;
   }
   ```

3. 第三方金流商有「查詢訂單Api」，一律以「查詢訂單Api」為準

   ```c#
   string	strQueryUrl = "查詢訂單Api位置"
   string  strJson 	= "查詢參數"
   if (csExecuteURL.ExecuteJson(strQueryUrl,strJson,false,30000))
   {
       // 傳入回傳交易狀態碼取得請款結果
   	csTransReturnItem.SetSettleResult(csRelation, strTransReturnCode, strTransReturnMessage) ;
   }
   ```

4. 若是第三方金流商的Api安全性不夠，提出建議不要串接

5. 檢查重複交易改成呼叫 CheckRejectTransaction()

   ```C#
   // 檢查要拒絕的交易(e.g.PLATFORM_TRANS_NO是否有重複,有pending交易..etc)
   if (!csBankCenter.CheckRejectTransaction(csTradeDBA, nCenterIndexNo))
   {
       // 失敗處理
   }
   ```

6. 交易回報確認呼叫 csRelation.ExecuteTradeConfirm()

   ```C#
   // -----
   //	交易回報確認：透過共用程式告知廠商請款結果
   // -----
   if(rgstrErrorMessage.Count == 0 && bSettleSucceeded)
   {
      csRelation.ExecuteTradeConfirm(nIndexNo,ref csStringBuilderLog,ref rgstrErrorMessage);
   }
   ```

7. 金流回傳交易狀態碼的成功與失敗定義在設定檔案內，需請系統管理員設定

   ```json
   {
     "OVERSEAS_GOOGLE_PLAY_SUCCESS_CODE": "0",
     "OVERSEAS_GOOGLE_PLAY_FAIL_CODE": ""
   }
   ```

8. 回傳交易狀態碼成功與否判斷需套用GT_TransReturnItem

   ```C#
   GT_TransReturnItem	csTransReturnItem	= new GT_TransReturnItem();
   // 傳入回傳交易狀態碼取得請款結果
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

9. 更新為請款成功，一律需使用csTransReturnItem.ePayTypeSettleResult判斷

   ```C#
   // 請款結果為成功才能將狀態改為請款已完成
   if (csTransReturnItem.ePayTypeSettleResult == PAY_TYPE_SETTLE_RESULT.SUCCEEDED)
   {
   	strResultCode						= "000000" ;
   	csDCC["PROCESS_WORK"].objData		= (int) PROCESS_WORK.SETTLE ;
   	csDCC["PROCESS_STATUS"].objData		= (int) PROCESS_STATUS.SUCCEEDED ;
   }
   ```

