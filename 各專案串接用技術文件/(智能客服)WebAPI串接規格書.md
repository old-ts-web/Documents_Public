# (智能客服)WebAPI規格書

# 一、版本異動說明：

| 版號  | 說明                                                         | 異動人員 |
| ----- | ------------------------------------------------------------ | -------- |
| V1.0  | 提供初版技術文件                                             | 志豪     |
| V2.0  | 1.  新增『帳號升級API』、『匯款帳戶驗證API』、『取得實體獎項列表API』、<BR>『取得身分驗證資訊API』、『取得匯款帳戶驗證資訊API』、『領獎申請API』、<BR>『取得最近一次實體領獎申請之聯絡資訊API』、『LineNotify訊息發送API』<BR>2. 修改『身分驗證API』、『匯款帳戶驗證API』之圖檔相關規格<BR>3. 檢視相關API補充相關說明與錯誤訊息<BR>4. 調整CheckCode的加密方式由SHA512改成SHA512<BR>5. 針對POST方式且有帶CheckCode的增加廠商ID『PlatformId』參數傳入 | 志豪     |
| V2.1  | 修改CheckCode描述                                            | 志豪     |
| V2.3  | 將『錯誤代碼表』移至『文件規格說明』中                       | 志豪     |
| V2.4  | 1. 調整『取得縣市資訊API』之API網址<br />2. 調整『取得鄉鎮區資訊API』之API網址<br />3. 調整『身分驗證API』需要參數之說明<br />4. 調整『帳號升級API』需要參數之說明與傳入參數新增『IsNative - 是否為本國人』<br />5. 調整『判斷身分證或護照號碼是否已使用或本人擁有的API』回傳值之說明<br />6. 調整『取得身分驗證資訊API』之API網址與回傳值之說明<br />7. 調整『取得最近一次實體領獎申請之聯絡資訊API』之API網址<br />8. 調整『取得匯款帳戶驗證資訊』之API網址與說明<br />9. 調整#『LINE Notify訊息發送 API』之說明 | 志豪     |
| V3.0  | 調整 Request Header 中 Gt {玩家的SessionToken} (e.g. Gt pw2u0acfniiife2e023vfj2j) 傳入的規格 | 志豪     |
| V3.1  | 調整 Request Header 中 Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j) 傳入的規格 | 志豪     |
| V3.2  | 調整『取得國碼API』之回傳參數 - 新增回傳 『提示文字』        | 志豪     |
| V3.3  | 1. 修正『透過發送簡訊更改密碼API』中的範例<br />2. 新增『判斷帳號是否使用過API』<br />3. 修改『欄位格式檢查API』新增回傳參數『ExtendReason(不符合格式的延伸理由)』 | 志豪     |
| V3.4  | 1. 修改『判斷帳號是否使用過API』傳入參數                     | 志豪     |
| V3.5  | 1. 修改『透過電子信箱方式更改密碼API』新增傳入前端使用者是否使用行動裝置(IsMobile) | 志豪     |
| V3.6  | 1. 修改『四、取得會員資料API』新增回傳遮蔽後的身分證字號(IdNumber)<br />2. 修改『十二、身分驗證API』新增傳入參數IdNumber(身分證字號 OR 護照號碼) | 志豪     |
| V3.7  | 1. 修改『二十二、判斷帳號是否被使用過API』修改傳入的帳號改為必填與修改其備註<br />2. 修改『十二、身分驗證API』修改傳入參數IdNumber(身分證字號 OR 護照號碼)為非必填與證件背面圖檔改成必填<br />3. 修改『四、取得會員資料API』刪除回傳參數『IsGetIdNumber』(因為已經有回傳遮蔽後的身分證字號) | 志豪     |
| V3.8  | 1.所有參數IdNo(身分證字號 OR 護照號碼)重新命名為IdNumber<br />2.修改『四、取得會員資料API』IdNumber說明<br/>3. 修改『十三、判斷身分證或護照號碼是否已使用或本人擁有的API』新增回傳參數UserNo<br />4.修改『十四、帳號升級API』新增傳入參數UserNo | 嘉男     |
| V3.9  | 1.修改『十六、取得實體獎項列表API』新增回傳參數DrawDeadLine  | 峻鴻     |
| V3.10 | 1. 修改『十二、身分驗證API』新增成功後回傳的資料規格<br />2. 修改『十七、取得身分驗證資訊API』新增回傳的資料規格 | 志豪     |
| V3.11 | 1.修改『十六、取得實體獎項列表API』刪除原有的回傳參數ExchangePrizeName、ExchangePrizeAmount<br />2.修改『十六、取得實體獎項列表API』新增回傳參數ExchangePrizeData | 峻鴻     |
| V3.12 | 1. 修改『十七、取得身分驗證資訊API』修改回傳的資料的範例，若屬於個資相關均會遮蔽 | 志豪     |
| V3.13 | 1. 新增錯誤代碼 9000(自定義失敗)                             | 志豪     |
| V3.14 | 1. 修改『二十一、LINE Notify訊息發送API』修改成功回傳格式範例 | 峻鴻     |
| V3.15 | 1. 修改『十七、取得身分驗證資訊API』新增回傳『生日』資訊及若沒申請過就預帶會員資料既有的資訊 | 志豪     |
| V3.16 | 1. 修改『十九、取得最近一次實體領獎申請之聯絡資訊API』新增回傳『寄送地址縣市ID』及『寄送地址鄉鎮區ID』 | 志豪     |
| V3.17 | 1.修改『十六、取得實體獎項列表API』新增回傳參數IsReceivable  | 峻鴻     |
| V4.0  | 1. 新增『二十三、判定領獎是否進行身分驗證API』               | 志豪     |
| V4.1  | 1. 修改『二十、領獎申請API』新增傳入參數『ExchangePrizeNo(指定要轉換的獎項編號)』與 『ClientIp(用戶端 IP 位置)』並修改參數『PrizeWinnerNos』的說明 | 志豪     |
| V4.2  | 1.修改『十六、取得實體獎項列表API』新增回傳參數『PrizeNo(獎項編號)』、『PrizeUnitName(獎項單位名稱)』，新增Status回傳值範例"已轉換成 XX獎項 XX 個"<br>2.修改『十六、取得實體獎項列表API』新增Status回傳值範例"已轉換成 {獎項名稱} {獎項數量} {獎項單位}"<br>3.修改『十六、取得實體獎項列表API』回傳參數『ExchangePrizeData(轉換獎項資料)』新增『PrizeNo(獎項編號)』 | 峻鴻     |
| V4.3  | 修改『十四、帳號升級API』傳入參數與相關說明                  | 嘉男     |
| V4.4  | 1. 修改『二十三、判定領獎是否進行身分驗證API』Request Header補上傳入Authorization<br />2. 修改『十八、取得匯款帳戶驗證資訊API』調整回傳資訊<br />3. 修改『十五、匯款帳戶驗證API』調整傳入參數資訊與新增回傳資訊 | 志豪     |
| V4.5  | 1. 修改『十二、身分驗證API』針對查詢密碼時傳入遊戲代碼(GameId)參數 | 志豪     |
| V4.6  | 1. 修改『二十二、判斷帳號是否被使用過API』Request Header 新增傳入Authorization與修改回傳值的說明<br />2. 修改『十四、會員升級API』若為介接會員或訪客時新增回傳聯名帳號(AliasAccount) | 志豪     |
| V4.7  | 1. 修改『十四、帳號升級API』修改傳入參數 IsAbord 與  VerifyUserNo的說明，若沒有使用到也要傳值 | 志豪     |
| V4.8  | 1. 修改傳入參數有旗標類的統一用小寫傳入                      | 志豪     |
| V4.9  | 1. 文件規格說明新增需要參數規格新增傳入值的型態的備註<br />2. 修改『十四、帳號升級API』針對生日的說明補充傳入值的範例<br />3. 修改『欄位格式檢查 API』新增生日的檢核 | 志豪     |
| V4.10 | 1.修改『十六、取得實體獎項列表API』新增回傳參數MultiNoGainCount | 峻鴻     |
| V4.11 | 1. 修改『四、取得會員資料API』新增回傳參數『IsAbord』(是否為海外人士)<br />2. 修改『十四、帳號升級API』修改傳入參數『NAME』的描述 | 志豪     |
| V4.12 | 1. 修改『十七、取得身分驗證資訊API』與『十八、取得匯款帳戶驗證資訊API』中的 HTTP Method 資訊<br />2. 修改『十二、身分驗證API』與『十五、匯款帳戶驗證API』中的傳入參數值的說明 | 志豪     |
| V4.13 | 1. 修改『二十一、LINE Notify訊息發送API』中的 UsageID說明    | 峻鴻     |
| V4.14 | 1. 修改『十二、身分驗證API』因海外人士有調整縣市ID與鄉鎮區ID是不需要傳入的故修正相關參數說明 | 志豪     |
| V4.15 | 1. 新增『二十四、取得文案API』                               | 峻鴻     |
| V4.16 | 1. 新增『二十五、取得客製化CSS樣式內容API』                  | 志豪     |
| V4.17 | 1. 修改『二十五、取得客製化CSS樣式內容API』新增傳入 EService(管道) | 志豪     |
| V4.18 | 1. 修改『十五、匯款帳戶驗證API』修正是否必填之資訊<br />2. 修改『十六、取得實體獎項列表APII』調整PrizeWinnerNo型態 | 志豪     |
| V4.19 | 1. 修改『十七、取得身分驗證資訊API』針對姓名與信箱提供呈現用"有遮蔽"與第一次建單用的""未遮蔽""資料 | 志豪     |
| V4.20 | 1. 修改『十六、取得實體獎項列表API』可轉換的獎項資料清單內新增是否為現金類獎品與是否為電子票券旗標資訊 | 志豪     |
| V4.21 | 1. 修正各API回傳的Code參數值為數字型態                       | 志豪     |
| V4.22 | 1. 修改『十六、取得實體獎項列表API』可轉換的獎項資料清單內新增是否為『實體獎』旗標資訊 | 志豪     |
| V4.23 | 1. 修改『十二、身分驗證API』修改身分驗證參數的說明           | 志豪     |
| V4.24 | 1. 修改『十七、取得身分驗證資訊API』與『十八、取得匯款帳戶驗證資訊API』改成不撈取單據無效的申請單資料且重新填寫不用帶上一次填寫的資訊 | 志豪     |
| V4.25 | 1. 修改『十七、取得身分驗證資訊API』與『十八、取得匯款帳戶驗證資訊API』移除聯絡電話參數資訊 | 志豪     |

# 二、文件規格說明：

## i. 各環境Domain：

​	測試環境：cs-api-twtest.towergame.com

​	正式環境：cs-api.gametower.com.tw

## 	ii. 傳遞參數方式規格：

| Request Header |                                       |
| -------------- | ------------------------------------- |
| HTTP Method    | POST                                  |
| Content Type   | 內容類型<BR>e.g. Application/json...etc |
| {參數名稱}     | {參數值}                              |

| Request Header |          |
| -------------- | -------- |
| HTTP Method    | GET      |
| {參數名稱}     | {參數值} |

## 	iii. 需要參數規格：

| 參數名稱  | 型別     | 長度 | 是否必填 | 預設值   | 說明                                                         |
| --------- | -------- | ---- | -------- | -------- | ------------------------------------------------------------ |
| {參數1}   | String   | 40   | 是       |          | {相關說明}                                                   |
| {參數2}   | Int      |      | 否       | {預設值} | {相關說明}                                                   |
| {參數3}   | DateTime |      | 否       | {預設值} | {相關說明}                                                   |
| {參數4}   | Float    |      | 否       | {預設值} | {相關說明}                                                   |
| CheckCode | String   | -    | 是       |          | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

※以上表格內針對不同的型別所帶的值，請按照 Json 的規格傳入(e.g. boolean→全小寫  true OR false, DateTime→"yyyy-MM-ddTHH:mm:ss" OR "yyyy-MM-dd")

CheckCode範例程式如下：

```c#
public static string GetCheckCode(NameValueCollection _csDataColl,string _strPrivateKey)
{
     StringBuilder strValue      = new StringBuilder() ;
    
     // 依照 Key 排序，將所有 Value 相加 (排除 CheckCode 參數)
     foreach(string strKey in _csDataColl.AllKeys.OrderBy(o => o))
     {
     	if (!strKey.Equals("CheckCode",StringComparison.OrdinalIgnoreCase))
              strValue.Append(_csDataColl[strKey]) ;
     }
    
     // 最後加入私Key
     strValue.Append(_strPrivateKey) ;
    
	 return FormsAuthentication.HashPasswordForStoringInConfigFile(strValue.ToString(),"SHA512") ;
}
```
## 	iv. 回傳參數規格：

| 參數名稱 | 說明                                         |
| -------- | -------------------------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗                |
| Message  | 回傳訊息                                     |
| Data     | 回傳資料(成功的話且有要回饋資訊的才會有內容) |

## 	vi. 錯誤代碼表：
| 代碼 | 說明                                                |
| ---- | --------------------------------------------------- |
| 0    | 成功                                                |
| 1001 | 缺少必要參數                                        |
| 1002 | 參數值錯誤或格式不正確                              |
| 1003 | 請求傳送的格式或內容有誤                            |
| 1004 | 在一定時間內訪問次數已達上限                        |
| 1005 | 無對應資料                                          |
| 1006 | 資料已存在                                          |
| 1007 | 綁定屬性失敗                                        |
| 2001 | 不允許的上傳檔案類型                                |
| 2003 | 此環境不允許操作                                    |
| 2004 | 沒有上傳檔案                                        |
| 3001 | 登入失敗                                            |
| 9000 | 自定義失敗<br />對應的Message內容為客製化的訊息內容 |
| 9001 | WebAPI 服務不存在                                   |
| 9002 | 系統異常                                            |
| 9003 | 系統維護中                                          |
| 9004 | 未知的錯誤                                          |
| 9005 | 驗證失敗                                            |
| 9006 | 伺服器連線失敗                                      |
| 9007 | 連線逾時                                            |
| 9008 | 權限不足                                            |
| 9100 | 連線逾時(9100)                                      |
| 9101 | 連線逾時(9101)                                      |
| 9104 | 連線逾時(9104)                                      |

# 三、欄位格式檢查 API

說明：

用來檢查玩家的回答內容格式是否正確

API網址：

https://{對應環境Domain}/field-check/{type}/{value}

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

需要參數：

| 參數名稱 | 型別   | 長度 | 是否必填 | 預設值 | 說明         |
| -------- | ------ | ---- | -------- | ------ | ------------ |
| type     | string | -    | 是       | 無     | 型態         |
| value    | string | -    | 是       | 無     | 需驗證之內容 |

Type欄位Code表：

| Type                 | 欄位名稱         | 驗證內容                                                 | Value範例                                |
| -------------------- | ---------------- | -------------------------------------------------------- | ---------------------------------------- |
| Email                | 電子信箱         | 是否為電子信箱格式                                       | 123@gmail.com                            |
| Account              | 帳號             | 是否符合帳號規格                                         | test123                                  |
| PhoneNumberByCountry | 手機門號(含國碼) | 根據國碼去驗證手機規格是否正確                           | {國碼}-{行動電話}<BR>e.g. 886-0977111456 |
| PhoneNumberByTw      | 台灣手機門號     | 驗證是否09開頭且為10碼                                   | 0977111456                               |
| PhoneNumber          | 手機門號         | 僅驗證字串除了數字以外沒有其它特別符號                   | 0912123456                               |
| IdNumber             | 國內身分證字號   | 驗證本國人身分證字號第一碼是否為英文且總共為10碼         | A123456789                               |
| Date                 | 日期             | 切割年月日去驗證是否資料正確                             | yyyyMMdd<BR>e.g. 19110101                |
| Int                  | 數值             | 是否為數值格式                                           | 12345                                    |
| Birthday             | 生日             | 切割年月日去驗證是否資料正確<br />並驗證生日資訊是否合理 | yyyyMMdd<BR>e.g. 19110101                |

```
https://{對應環境Domain}/field-check/Account/abc123123
```

回傳格式：
| 參數名稱 | 說明                                                         |
| -------- | ------------------------------------------------------------ |
| Code     | 處理結果，成功為0，其餘為失敗                                |
| Message  | 回傳訊息                                                     |
| Data     | "IsFormatCorrect": 格式是否正確 (True OR False)<br />"ExtendReason":不符合格式的延伸理由 (因特殊的規格判斷之不合規格的補充說明，e.g. 「帳號」不可超過 16 個字元、「帳號」請勿使用非英文及數字之外的字元... etc) |


成功範例

```json
{"Code":0,"Message":"成功","Data":{"IsFormatCorrect":True,"Reason":null}}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 四、取得會員資料API

說明：

用來取得登入會員的資料(若回傳的VIP為99，則直接轉真人客服服務)

也可以用來判別會員是否有登入，若未登入則回傳的Data會是空值

API網址：

https://{對應環境Domain}/get-user-data

傳遞參數方式：

| Request Header |                                                              |
| -------------- | ------------------------------------------------------------ |
| HTTP Method    | POST                                                         |
| Content Type   | Application/json                                             |
| Authorization  | Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j) |

需要參數：

| 參數名稱   | 型別   | 長度 | 是否必填 | 預設值 | 說明                                                         |
| ---------- | ------ | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId | string | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| GameId     | string | 10   | 是       | 無     | 遊戲代碼                                                     |
| CheckCode  | String | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

遊戲代碼規格對照表：

| 遊戲名稱  | 遊戲代碼 |
| --------- | -------- |
| gametower | GT       |
| 明星3缺1  | STAR31   |
| 滿貫大亨  | TMD      |
| 金好運    | PANTHER  |

```json
{"PlatformId":"INTUMIT","GameId":"STAR31","CheckCode":"57D207BA951A72F942EC737B13EA133CF8C53F2C4E10EBFDFA953A0404426964A722A60AF476046DC25FB48381364162633330C5BAAA226110E09D10F4CF2813"}
```

回傳格式：
| 參數名稱 | 說明                                                         |
| -------- | ------------------------------------------------------------ |
| Code     | 處理結果，成功為0，其餘為失敗                                |
| Message  | 回傳訊息                                                     |
| Data     | 回傳資料<br />※各資訊回傳值會因遊戲而異，若該遊戲無此資訊則都會回null(e.g. 金好運沒有AccountType，則會收到 "AccountType" : null) |



| 回傳值              | 說明                 | 型態    | 範例       |
| ------------------- | -------------------- | ------- | ---------- |
| Vip                 | VIP等級              | int     | 1          |
| Account             | 會員帳號             | string  | Test12     |
| ArkID               | ArkID                | string  | 123456     |
| NickName            | 遊戲暱稱             | string  | 內湖金城武 |
| AccountType         | GT會員類型           | int     | 1          |
| IsIdVerify          | 是否完成身分驗證     | boolean | True       |
| IsBankAccountVerify | 是否完成銀行帳戶驗證 | boolean | False      |
| IdNumber            | 遮蔽後的身分證字號   | string  | A123***789 |
| IsAbord             | 是否為外國人         | boolean | False      |

成功範例

有登入：

```json
{"Code":0,"Message":"成功","Data":{"Vip":5,"Account":"abc123123","NickName":"玩家暱稱","AccountType":1,"IsIdVerify":True,"IsBankAccountVerify":False,"IdNumber":"A123***789","IsAbord":False}}
```
未登入：
```json
{"Code":0,"Message":"成功","Data":null}
```

帳號類型(AccountType)對照表：

| 帳號類型       | 值   |
| -------------- | ---- |
| 標準會員       | 1    |
| 快速會員       | 2    |
| 介接、訪客會員 | 12   |
| 標準聯名會員   | 21   |
| 快速聯名會員   | 22   |

失敗範例

```json
{"Code":-1,"Message":"未帶入必要參數。","Data":null}
```

錯誤代碼表規格：

| 代碼 | 說明                       |
| ---- | -------------------------- |
| 0    | 成功。                     |
| -1   | 未帶入必要參數。           |
| -999 | 伺服器忙碌中，請稍後再試。 |

# 五、取得國碼API

說明：

當玩家要輸入需含國碼的手機門號時，先呼此API取得國碼選項讓玩家選擇，再輸入門號，當參數需要門號時，要把國碼跟門號組合帶入

API網址：

https://{對應環境Domain}/get-phone-area-set-no-list

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

需要參數：

無

回傳格式：
| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值      | 說明                   | 型態   | 範例                   |
| ----------- | ---------------------- | ------ | ---------------------- |
| Item        | 提供前端選擇的項目名稱 | string | 台灣(886)              |
| Value       | 國碼                   | string | 886                    |
| ExampleText | 提示文字               | string | 台灣地區請輸入10碼號碼 |

成功範例

```json
{"Code":0,"Message":"成功","Data":[{"Item":"台灣(886)","Value":"886","ExampleText":"台灣地區請輸入10碼號碼"},{"Item":"香港(852)","Value":"852","ExampleText":"香港地區請輸入8碼號碼"},{"Item":"澳門(853)","Value":"853","ExampleText":"澳門地區請輸入8碼號碼"}]}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 六、透過電子信箱方式更改密碼API

說明：

透過發信讓玩家進行密碼更改

API網址：

https://{對應環境Domain}/email-change-password

傳遞參數方式：

| Request Header |                  |
| -------------- | ---------------- |
| HTTP Method    | POST             |
| Content Type   | Application/json |

需要參數：

| 參數名稱   | 型別    | 長度 | 是否必填 | 預設值 | 說明                                                         |
| ---------- | ------- | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId | string  | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| GameId     | string  | 10   | 是       | 無     | 遊戲代碼                                                     |
| Account    | string  | 16   | 是       | 無     | 帳號                                                         |
| Email      | string  | 100  | 是       | 無     | 玩家站務信箱內容                                             |
| IsMobile   | boolean |      | 否       | 無     | true OR false (請使用全小寫) <br />前端使用者是否使用行動裝置 |
| CheckCode  | String  | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

遊戲代碼規格對照表：

| 遊戲名稱  | 遊戲代碼 |
| --------- | -------- |
| gametower | GT       |
| 明星3缺1  | STAR31   |
| 滿貫大亨  | TMD      |

```json
{"PlatformId":"INTUMIT","GameId":"STAR31","Account":"abc123123","Email":"test@gmail.com","IsMobile":false,"CheckCode":"937E165BC0C60AA5EFA5C3CB61CDE6B363E08534440A37C996BA8716C572E38FD1031D4A31FB8F649FFFFA631979299B11C5B8D2C69D9DC75F433F0A24E44619"}
```

回傳格式：
| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

成功範例

```json
{"Code":0,"Message":"成功","Data":null}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```

錯誤代碼表規格：

| 代碼 | 說明                                    |
| ---- | --------------------------------------- |
| 0    | 成功。                                  |
| -1   | 格式錯誤。                              |
| -2   | 未帶必要參數。                          |
| -3   | 驗證失敗。(e.g. 非該玩家註冊信箱...etc) |
| -999 | 伺服器忙碌中，請稍後再試。              |

# 七、透過發送簡訊更改密碼API

說明：

透過發簡訊讓玩家進行密碼更改

API網址：

https://{對應環境Domain}/phone-change-password

傳遞參數方式：

| Request Header |                  |
| -------------- | ---------------- |
| HTTP Method    | POST             |
| Content Type   | Application/json |

需要參數：

| 參數名稱             | 型別   | 長度 | 是否必填 | 預設值 | 說明                                                         |
| -------------------- | ------ | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId           | string | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| GameId               | string | 10   | 是       | 無     | 遊戲代碼                                                     |
| Account              | string | 16   | 是       | 無     | 帳號                                                         |
| PhoneNumberByCountry | string | 20   | 是       | 無     | 玩家透過手機驗證的門號(含國碼)<BR>{國碼}-{行動電話}<BR>e.g. 886-0977111456 |
| CheckCode            | String | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

遊戲代碼規格對照表：

| 遊戲名稱  | 遊戲代碼 |
| --------- | -------- |
| gametower | GT       |
| 明星3缺1  | STAR31   |
| 滿貫大亨  | TMD      |

```json
{"PlatformId":"INTUMIT","GameId":"STAR31","Account":"abc123123","PhoneNumberByCountry":"886-0977111456","CheckCode":"A87C381F7C79AA3FA024580A904437EB4926137DBF912E4ACAD94424E572A563E8627057D162B6891C0BE77254A9B1B491622E62F809379AA34FD71448ABC821"}
```

回傳格式：
| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

成功範例

```json
{"Code":0,"Message":"成功","Data":null}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 八、取得身分證發證地點API

說明：

取得提供身分驗證時所需的發證地點選擇項目

API網址：

https://{對應環境Domain}/get-id-location-no-list

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

需要參數：

無

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值 | 說明                   | 型態   | 範例   |
| ------ | ---------------------- | ------ | ------ |
| Item   | 提供前端選擇的項目名稱 | string | 新北市 |
| Value  | 回傳給IGS的值          | string | 65000  |

成功範例

```json
{"Code":0,"Message":"成功","Data":[{"Item":"新北市","Value":"65000"},{"Item":"北市","Value":"63000"}]}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 九、取得身分證補換發類別API

說明：

取得提供身分驗證時所需的補換發類別選擇項目

API網址：

https://{對應環境Domain}/get-id-change-type-no-list

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

需要參數：

無

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值 | 說明                   | 型態   | 範例 |
| ------ | ---------------------- | ------ | ---- |
| Item   | 提供前端選擇的項目名稱 | string | 初發 |
| Value  | 回傳給IGS的值          | int    | 1    |

成功範例

```json
{"Code":0,"Message":"成功","Data":[{"Item":"初發","Value":1},{"Item":"補發","Value":2}]}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```

錯誤代碼表規格：

| 代碼 | 說明                       |
| ---- | -------------------------- |
| 0    | 成功。                     |
| -999 | 伺服器忙碌中，請稍後再試。 |

# 十、取得縣市資訊API

說明：

取得提供填寫地址之縣市資訊顯示選擇項目

API網址：

https://{對應環境Domain}/get-address-city-id-list

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

需要參數：

無

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值 | 說明                   | 型態   | 範例   |
| ------ | ---------------------- | ------ | ------ |
| Item   | 提供前端選擇的項目名稱 | string | 台北市 |
| Value  | 回傳給IGS的值          | string | TWA    |

成功範例

```json
{"Code":0,"Message":"成功","Data":[{"Item":"台北市","Value":"TWA"},{"Item":"台中市","Value":"TWB"}]}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 十一、取得鄉鎮區資訊API

說明：

取得提供填寫地址之鄉鎮區資訊顯示選擇項目

API網址：

https://{對應環境Domain}/get-address-local-id-list/{CityId}

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

需要參數：

| 參數名稱 | 型別   | 長度 | 是否必填 | 預設值 | 說明               |
| -------- | ------ | ---- | -------- | ------ | ------------------ |
| CityId   | string | 10   | 是       | 無     | 縣市ID<br>e.g. TWA |

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值 | 說明                   | 型態   | 範例   |
| ------ | ---------------------- | ------ | ------ |
| Item   | 提供前端選擇的項目名稱 | string | 中山區 |
| Value  | 回傳給IGS的值          | string | TWA00  |

成功範例

```json
{"Code":0,"Message":"成功","Data":[{"Item":"中山區","Value":"TWA00"},{"Item":"中正區","Value":"TWA01"}]}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```

錯誤代碼表規格：

| 代碼 | 說明                       |
| ---- | -------------------------- |
| 0    | 成功。                     |
| -999 | 伺服器忙碌中，請稍後再試。 |

# 十二、身分驗證API

說明：

根據玩家帶入的資訊，進行⾝分驗證相關處理

API網址：

https://{對應環境Domain}/verify-identity

傳遞參數方式：

| Request Header |                                                              |
| -------------- | ------------------------------------------------------------ |
| HTTP Method    | POST                                                         |
| Content Type   | Application/json                                             |
| Authorization  | Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j)(若透過身分驗證查密碼時不需傳入) |

需要參數：

| 參數名稱        | 型別   | 長度 | 是否必填 | 預設值 | 說明                                                         |
| --------------- | ------ | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId      | string | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| Account         | string | 16   | 否       | 無     | 會員帳號 (透過身分驗證查密碼時才需要傳入)                    |
| IdNumber        | string | 20   | 否       | 無     | ⾝分證字號 OR 護照號碼 (透過身分驗證查密碼時或呼叫『四、取得會員資料API』有ArkID的會員第一次申請時才需要傳入)<br />※前端顯示請取自『十七、取得身分驗證資訊API』 |
| GameId          | string | 10   | 否       | 無     | 遊戲代碼 (透過身分驗證查密碼時才需要傳入)                    |
| PhoneNumber     | string | 20   | 是       | 無     | 聯絡電話<br />※若『十七、取得身分驗證資訊API』有資料的話請帶入 |
| Email           | string | 100  | 否       | 無     | 聯絡信箱<br />※若『十七、取得身分驗證資訊API』有資料的話請帶入 |
| Birthday        | string | 8    | 是       | 無     | 生日<br>格式：yyyyMMdd<br />※若『十七、取得身分驗證資訊API』有資料的話請帶入 |
| Name            | string | 100  | 是       | 無     | 姓名<br />※前端顯示請取自『十七、取得身分驗證資訊API』       |
| IdDate          | string | 8    | 否       | 無     | 發證日期<br>格式：yyyyMMdd                                   |
| IdLocation      | string | 5    | 否       | 無     | 發證地點(參考取得身分證發證地點API)                          |
| IdChangeType    | string | 1    | 否       | 無     | 補換發類別(參考取得身分證補換發類別API)                      |
| Address         | string | 100  | 是       | 無     | 戶籍地址 OR 聯絡地址<br />※若『十七、取得身分驗證資訊API』有資料的話請帶入 |
| CityId          | string | 10   | 否       | 無     | 縣市ID(參考取得縣市資訊API)<br />※本國人為必填且『十七、取得身分驗證資訊API』有資料的話請帶入 |
| LocalId         | string | 10   | 否       | 無     | 鄉鎮區ID(參考取得鄉鎮區資訊API)<br />※本國人為必填且『十七、取得身分驗證資訊API』有資料的話請帶入 |
| ContactTimeMemo | string | 50   | 否       | 無     | 聯絡時間備註                                                 |
| IdPicFront      | string | -    | 是       | 無     | 證件正面圖檔(限JPG或PNG) 前端請協助檢查10MB以下<BR>請提供該圖檔Base64格式內容 |
| IdPicBack       | string | -    | 是       | 無     | 證件反面圖檔(限JPG或PNG) 前端請協助檢查10MB以下<BR>請提供該圖檔Base64格式內容 |
| CheckCode       | String | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

| 遊戲名稱  | 遊戲代碼 |
| --------- | -------- |
| gametower | GT       |
| 明星3缺1  | STAR31   |
| 滿貫大亨  | TMD      |

```json
{"PlatformId":"INTUMIT","PhoneNumber":"0912123456","Birthday":"19990101","Name":"王小明","IdDate":"2000101","IdLocation":"63000","IdChangeType":1,"Address":"五工路130號","CityId":"TWA","LocalId":"TWA00","IdPicFront":"ijhihhiuhihihuigyguhoijoijo==","IdPicBack":"niuhihyuytfytftrdjuygryfgjygyfty==","CheckCode":"95D7655EAF9CD6EFEC1F69542B0682FECF7FC4D6C04F3A9DCC526A0A814106ED7E36B8A11A826BEB94EC46F3D517092609300AFC9A5A2A23C033E4C35D67FE5A"}
```

回傳格式：
| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值     | 說明     | 型態   | 範例 |
| ---------- | -------- | ------ | ---- |
| FormNo     | 單據編號 | int    |      |
| CreateDate | 建立日期 | string |      |

成功範例

```json
{"Code":0,"Message":"成功","Data":{"FormNo":123456,"CreateDate":"2021-01-01"}}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 十三、判斷身分證或護照號碼是否已使用或本人擁有的API

說明：

會員升級成標準會員或標準聯名會員時，若為本國人則需要輸入身分證字號，若為外國人則需要輸入護照號碼，

本API主要是判斷該輸入之身分證字號或護照號碼是否已被人使用及是否為該玩家所有的

API網址：

https://{對應環境Domain}/verify-identity-bind-account

傳遞參數方式：

| Request Header |                  |
| -------------- | ---------------- |
| HTTP Method    | POST             |
| Content Type   | Application/json |

需要參數：

| 參數名稱   | 型別   | 長度 | 是否必填 | 預設值 | 說明                                                         |
| ---------- | ------ | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId | string | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| IdNumber   | string | 20   | 是       | 無     | ⾝分證字號 OR 護照號碼                                       |
| Account    | string | 16   | 否       | 無     | 之前有註冊的帳號                                             |
| Password   | string | 14   | 否       | 無     | 之前有註冊的帳號之對應的密碼                                 |
| CheckCode  | String | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

```json
{"PlatformId":"INTUMIT","IdNumber":"A123456789","Account":"","Password":"","CheckCode":"84C20C3BD605BE7F86B6AF991933041F4C4E76865E590F0F516F77B03CE870B681CB7C0F5D8E03892163FA3AB4A025999714714024FF5BF7F1F07BE3D721DA9D"}
```

回傳格式：
| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值          | 說明                                                         | 型態    | 範例          |
| --------------- | ------------------------------------------------------------ | ------- | ------------- |
| IsUsed          | ⾝分證字號 OR 護照號碼是否已使用                             | boolean | True          |
| UsedAccount     | 被哪些帳號使用(使用","組合)                                  | string  | "AAA,BBB,CCC" |
| IsMoreLimit     | 是否已達註冊上限(當有傳入Account與Password時)<br />若達到註冊上限則要阻擋升級 | boolean | False         |
| IsIdNumberOwner | 是否為該身分證字號或護照號碼擁有者(當有傳入Account與Password時)<br />若不是擁有者則要阻擋升級 | boolean | True          |
| UserNo          | 驗證後的使用者編號(IsIdNumberOwner=true時有值)               | int     | 123           |

成功範例

```json
{"Code":0,"Message":"成功","Data":{"IsUsed":True,"UsedAccount":"AAA,BBB,CCC","IsMoreLimit":False,"IsIdNumberOwner":True,"UserNo":123}}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 十四、帳號升級API

說明：

根據玩家帶入的資訊，執⾏帳號升級
※每次升級完成請記得跟『四、取得會員資料API』取得最新的會員資訊

帳號類型(AccountType)對照表：

| 帳號類型       | 值   |
| -------------- | ---- |
| 標準會員       | 1    |
| 快速會員       | 2    |
| 介接、訪客會員 | 12   |
| 標準聯名會員   | 21   |
| 快速聯名會員   | 22   |

帳號升級流程(流程不可逆)：

1. 介接、訪客會員(12) → 快速聯名會員(22) → 標準聯名會員(21)
2. 快速會員(2) → 標準會員(1)

API網址：

https://{對應環境Domain}/upgrade-account

傳遞參數方式：

| Request Header |                                                              |
| -------------- | ------------------------------------------------------------ |
| HTTP Method    | POST                                                         |
| Content Type   | Application/json                                             |
| Authorization  | Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j) |

需要參數：

| 參數名稱     | 型別     | 長度 | 是否必填 | 預設值 | 說明                                                         |
| ------------ | -------- | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId   | string   | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| Account      | string   | 16   | 否       | 無     | 帳號(當下AccountType為12才需要傳入且為必填，AccountType可透過『取得會員資料API』取得) |
| Password     | string   | 14   | 否       | 無     | 密碼(當下AccountType為12才需要傳入且為必填，AccountType可透過『取得會員資料API』取得) |
| Email        | string   | 100  | 否       | 無     | 信箱(當下AccountType為12才需要傳入且為必填，AccountType可透過『取得會員資料API』取得) |
| IsAbord      | boolean  |      | 是       | 無     | 是否為外國人(當下AccountType為2或22才需要傳入且為必填，AccountType可透過『取得會員資料API』取得，其餘的AccountType請帶入false(有區分大小寫)) |
| IdNumber     | string   | 20   | 否       | 無     | ⾝分證字號 OR 護照號碼(當下AccountType為2或22才需要傳入且為必填，AccountType可透過『取得會員資料API』取得)<BR>(蒐集後需要呼叫十三、判斷身分證或護照號碼是否已使用或本人擁有的API，若是已有使用過需要詢問帳號密碼進行驗證取得VerifyUserNo) |
| VerifyUserNo | int      |      | 是       | 無     | 驗證過的UserNo，透過十三、判斷身分證或護照號碼是否已使用或本人擁有的API取得，若身分證未被使用過則帶0 |
| Name         | string   | 30   | 否       | 無     | 姓名(當下AccountType為2或22且身分證未被使用過才需要傳入且為必填，AccountType可透過『取得會員資料API』取得)<br />※前端請阻檔中文字最多15個字，英文最多30個字 |
| Sexual       | string   | 1    | 否       | 無     | 性別(M：男性，F：女性)(當下AccountType為2或22且身分證未被使用過才需要傳入且為必填，AccountType可透過『取得會員資料API』取得) |
| Birthday     | DateTime |      | 否       | 無     | 生日(當下AccountType為2或22且身分證未被使用過才需要傳入且為必填，AccountType可透過『取得會員資料API』取得)<br />傳入值 e.g. "1911-01-02T00:00:00" |
| CheckCode    | String   | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

```json
{"PlatformId":"INTUMIT","Account":"TEST12345","Password":"abc123123","Email":"abc12123@gmail.com","CheckCode":"F9951E9DF4CB396F4BC55390F4B277BF643BEA2966588E4F3543377076B81FDD43382874B4AF1EAB05DFD4C170F861B4694662C00CD3ED9AFBB073225AECFAAB"}
```

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值       | 說明                                                         | 型態   | 範例          |
| ------------ | ------------------------------------------------------------ | ------ | ------------- |
| AliasAccount | 聯名帳號<br />※當有傳入Account的時候才會回傳(當下AccountType為12時) | string | test123456@AP |

成功範例

```json
{"Code":0,"Message":"成功","Data":{"AliasAccount":"test123456@AP"}}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 十五、匯款帳戶驗證API

說明：

根據玩家帶入的資訊，執⾏匯款帳戶驗證

API網址：

https://{對應環境Domain}/verify-bank-account

傳遞參數方式：

| Request Header |                                                              |
| -------------- | ------------------------------------------------------------ |
| HTTP Method    | POST                                                         |
| Content Type   | Application/json                                             |
| Authorization  | Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j) |

需要參數：

| 參數名稱        | 型別   | 長度 | 是否必填 | 預設值 | 說明                                                         |
| --------------- | ------ | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId      | string | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| Type            | int    | -    | 是       | 無     | 類型<br />0：郵局<BR>1：銀行<br />※若『十八、取得匯款帳戶驗證資訊API』有資料的話請帶入 |
| PhoneNumber     | string | 20   | 是       | 無     | 聯絡電話<br />※若『十八、取得匯款帳戶驗證資訊API』有資料的話請帶入 |
| ContactTimeMemo | string | 50   | 否       | 無     | 可聯絡時間之備註                                             |
| AccountName     | string | -    | 是       | 無     | 戶名<br />※前端顯示請取自『十七、取得身分驗證資訊API』中的真實姓名 |
| BankName        | string | 25   | 否       | 無     | 銀行名稱或郵局代號<BR>若Type=0是郵局的話請固定傳入7000021<br />※若『十八、取得匯款帳戶驗證資訊API』有資料的話請帶入 |
| BankCode        | string | 3    | 否       | 無     | 銀⾏代碼(3碼)<br />若Type=1是銀行的話再傳入<br />※若『十八、取得匯款帳戶驗證資訊API』有資料的話請帶入 |
| BranchCode      | string | 4    | 否       | 無     | 銀行分行代號(4碼)<br />若Type=1是銀行的話再傳入<br />※若『十八、取得匯款帳戶驗證資訊API』有資料的話請帶入 |
| BranchNo        | string | 7    | 否       | 無     | 郵局局號<br />範例：0001234(共7碼)<br />若Type=0是郵局的話再傳入<br />※若『十八、取得匯款帳戶驗證資訊API』有資料的話請帶入 |
| BankAccountNo   | string | 56   | 否       | 無     | 銀⾏帳號 或 郵局帳號(請依照Type不同去呈現)<BR>銀行/通匯帳號：108xxxxxx836<BR>郵局帳號範例：05xxx13(共7碼)<br />※若『十八、取得匯款帳戶驗證資訊API』有資料的話請帶入 |
| BankPic         | string | -    | 是       | 無     | 圖檔(限JPG或PNG) 前端請協助檢查10MB以下<BR>請提供該圖檔Base64格式內容 |
| CheckCode       | String | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

```json
{"PlatformId":"INTUMIT","Type":1,"PhoneNumber":"0912123456","AccountName":"王小明","BankName":"台灣中小企銀","BankCode":"050","BankCode":"0122","BankAccountNo":"123456789888","BankPic":"image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAoHBwgHBgoIC==","CheckCode":"739887C0DCCCA21DE39DCD313AD717BAFB88981DC116D486676A9191926F47DBCF1E186F80E2F5A241E7FDB2CFDE8A94183E5601ED35CB22B375D9BB69947522"}
```

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值     | 說明     | 型態   | 範例 |
| ---------- | -------- | ------ | ---- |
| FormNo     | 單據編號 | int    |      |
| CreateDate | 建立日期 | string |      |

成功範例

```json
{"Code":0,"Message":"成功","Data":{"FormNo":123456,"CreateDate":"2021-01-01"}}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```

# 十六、取得實體獎項列表API

說明：

取得玩家的實體獎項獲獎資料

若狀態為『已領取』只撈近一個月

API網址：

https://{對應環境Domain}/get-real-prize-list

傳遞參數方式：

| Request Header |                                                              |
| -------------- | ------------------------------------------------------------ |
| HTTP Method    | POST                                                         |
| Content Type   | Application/json                                             |
| Authorization  | Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j) |

需要參數：

| 參數名稱   | 型別   | 長度 | 是否必填 | 預設值 | 說明                                                         |
| ---------- | ------ | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId | string | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| GameId     | string | -    | 是       | 無     | 遊戲別                                                       |
| CheckCode  | String | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

```json
{"PlatformId":"INTUMIT","GameId":"STAR31","CheckCode":"57D207BA951A72F942EC737B13EA133CF8C53F2C4E10EBFDFA953A0404426964A722A60AF476046DC25FB48381364162633330C5BAAA226110E09D10F4CF2813"}
```

遊戲代碼規格對照表：

| 遊戲名稱  | 遊戲代碼 |
| --------- | -------- |
| gametower | GT       |
| 明星3缺1  | STAR31   |
| 滿貫大亨  | TMD      |
| 金好運    | PANTHER  |

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值            | 說明                   | 型態    | 範例                                                         |
| ----------------- | ---------------------- | ------- | ------------------------------------------------------------ |
| PrizeWinnerNo     | 實體領獎編號           | string  | 123456789                                                    |
| PrizeNo           | 獎項編號               | int     | 12345                                                        |
| PrizeName         | 獎項名稱               | string  | 7-11禮券100元卡                                              |
| PrizeAmount       | 獲獎數量               | int     | 10                                                           |
| PrizeUnitName     | 獎項單位名稱           | string  | "枚", "個", "組", "包", "點", "件", "位", "顆", "元", "張", "文", "天"<br>※此為玩家領獎時會使用的資料<br/>e.g.領取 {獎項名稱} {獎項數量} {獎項單位名稱} |
| Description       | 獲獎描述               | string  | 參與『XXX活動』獲得                                          |
| GainDateTime      | 獲獎時間               | string  | yyyy/MM/dd HH:mm:ss<BR>e.g. 2021/01/01 13:00:00              |
| DrawDeadLine      | 領取到期時間           | string  | yyyy/MM/dd HH:mm:ss<BR>e.g. 2021/01/01 13:00:00              |
| Status            | 狀態                   | string  | 狀態有下列區分：<br />未領取<BR>已受理<BR>已受理-需補資料<BR>已受理-待補稅金<BR>已寄送<BR>已轉換成 XX獎項 XX 個 |
| IsCash            | 是否為現金類獎品       | boolean | True                                                         |
| IsSerial          | 是否為電子票券         | boolean | True                                                         |
| IsExchange        | 是否可以轉換其它獎項   | boolean | True                                                         |
| ExchangePrizeData | 可轉換的獎項資料       | Array   | [{"PrizeNo":"2",Name":"i幣","Amount":11000,"IsCash":false,"IsSerial":false,"IsRealPrize":false},{"PrizeNo":"10","Name":"鑽石","Amount":110,"IsCash":false,"IsSerial":false,"IsRealPrize":false}]<BR>※PrizeNo為獎項編號，Name為可轉換的獎項名稱，Amount為可轉換的獎項數量，IsCash為是否為現金獎，IsSerial為是否為電子票券，IsRealPrize為是否為實體獎項 |
| IsMultiNoGain     | 是否有同獎項也未領取的 | boolean | False<BR>※此為批次領獎會使用的判斷點                         |
| MultiNoGainCount  | 可批次領獎數量         | int     | 5<BR>※批次領獎顯示用，若IsMultiNoGain=True才需使用此欄位(數量包含當下選的這筆) |
| IsReceivable      | 是否可領取             | boolean | True<BR>※此為馬上領獎會使用的判斷點                          |
| Extend            | 延伸資訊               | string  | e.g. 電子票券兌換說明...etc                                  |

成功範例

```json
{"Code":0,"Message":"成功","Data":[{"PrizeWinnerNo":1111111111,"PrizeNo":10557,"PrizeName":"7-11禮券100元卡","PrizeAmount":10,"PrizeUnitName":"張","Description":null,"GainDateTime":"2021/01/01 13:00:00","DrawDeadLine":"2021/09/01 13:00:00","Status":"未領取","IsCash":False,"IsSerial":True,"IsExchange"：True,"ExchangePrizeData":[{"PrizeNo":23506,"Name":"紅鑽","Amount":100,"IsCash":false,"IsSerial":false,"IsRealPrize":false}],"IsMultiNoGain":True,"MultiNoGainCount":5,"IsReceivable":True,"Extend":"恭喜獲得活動贈獎序號[1234568888，請於2021-01-01 00:00:00前，前往7-11 ibon機台→好康紅利→ 兌換"},{"PrizeWinnerNo":222222222,"PrizeNo":10557,"PrizeName":"7-11禮券100元卡","PrizeAmount":5,"PrizeUnitName":"張","Description":null,"GainDateTime":"2021/01/01 15:00:00","DrawDeadLine":"2021/09/01 13:00:00","Status":"未領取","IsCash":False,"IsSerial":True,"IsExchange"：False,"ExchangePrizeData":[{"PrizeNo":23506,"Name":"紅鑽","Amount":100,"IsCash":false,"IsSerial":false,"IsRealPrize":false}],"IsMultiNoGain":True,"MultiNoGainCount":5,"IsReceivable":True,"Extend":"恭喜獲得活動贈獎序號[1234568888，請於2021-01-01 00:00:00前，前往7-11 ibon機台→好康紅利→ 兌換"},{"PrizeWinnerNo":3333333333,"PrizeNo":12345,"PrizeName":"iPad 9.7吋 32G","PrizeAmount":1,"PrizeUnitName":"個","Description":"參與『XXX活動』獲得","GainDateTime":"2021/05/01 20:00:00","DrawDeadLine":"2021/09/01 13:00:00","Status":"未領取","IsCash":False,"IsSerial":False,"IsExchange"：False,"ExchangePrizeData":[{"PrizeNo":2,"Name":"i幣","Amount":1500000,"IsCash":false,"IsSerial":false,"IsRealPrize":false},{"PrizeNo":10,"Name":"鑽石","Amount":15000,"IsCash":false,"IsSerial":false,"IsRealPrize":false}],"IsMultiNoGain":False,"MultiNoGainCount":1,"IsReceivable":False,"Extend":null},{"PrizeWinnerNo":4444444444,"PrizeNo":57888,"PrizeName":"Dyson V11 吸塵器","PrizeAmount":1,"PrizeUnitName":"個","Description":"參與『XXX活動』獲得","GainDateTime":"2021/05/01 20:00:00","DrawDeadLine":"2021/09/01 13:00:00","Status":"已領取","IsCash":False,"IsSerial":False,"IsExchange"：False,"ExchangePrizeName":null,"ExchangePrizeAmount":null,"IsMultiNoGain":False,"MultiNoGainCount":5,"IsReceivable":True,"Extend":null}]}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 十七、取得身分驗證資訊API

說明：

取得最新一筆玩家身分驗證的填單紀錄資訊(Data為空則代表從未申請過身分驗證)

(個資資訊均會遮蔽，將遮蔽資料完整傳到API不會因格式檢查問題跳錯)

API網址：

https://{對應環境Domain}/get-verify-identity-info

傳遞參數方式：

| Request Header |                                                              |
| -------------- | ------------------------------------------------------------ |
| HTTP Method    | GET                                                          |
| Content Type   | Application/json                                             |
| Authorization  | Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j) |

需要參數：

無

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值    | 說明                                    | 型態   | 範例                                                         |
| --------- | --------------------------------------- | ------ | ------------------------------------------------------------ |
| IdNumber  | 身分證字號 OR 護照號碼                  | string | A12************789                                           |
| ShowName  | 呈現用真實姓名                          | string | 王*明                                                        |
| Name      | 真實姓名                                | string | 王小明                                                       |
| CityId    | 戶籍地址縣市ID(參考取得縣市資訊API)     | string | TWA                                                          |
| LocalId   | 戶籍地址鄉鎮區ID(參考取得鄉鎮區資訊API) | string | TWA00                                                        |
| Address   | 戶籍地址                                | string | 五工***0號                                                   |
| ShowEmail | 呈現用信箱                              | string | tes**************************.tw                             |
| Email     | 信箱                                    | string | test@yahoo.com.tw                                            |
| Birthday  | 生日                                    | string | 格式：yyyyMMdd <br />20020101                                |
| Status    | 案件申請單狀態                          | int    | 10 - 身分驗證申請中<br />20 - 資料已確認<br />30 - 班長審核完畢<br />40 - 驗證完成<br /><br />備註：<br /><br />A. 空值為第一次申請，會提供會員既有的遮蔽資料，降低玩家再輸入一次的機會<br />B.當有Status且Status不是『40 - 驗證完成』則需阻擋不能重複申請 |

成功範例

```json
{"Code":0,"Message":"成功","Data":{"IdNumber":"A12****789","ShowName":"王*明","Name":"王小明","CityId":"TWA","LocalId":"TWA00","Address":"五工***0號","Email":"test@igs.com.tw","ShowEmail":"tes**********.tw","Status":10}}
```
```json
{"Code":0,"Message":"成功","Data":null}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 十八、取得匯款帳戶驗證資訊API

說明：

取得最新一筆玩家匯款帳戶驗證的填單紀錄資訊(Data為空則代表未申請過匯款帳戶驗證)

(帳戶帳號部分會遮蔽，將遮蔽資料完整傳到API不會因格式檢查問題跳錯)

API網址：

https://{對應環境Domain}/get-verify-bank-account-info

傳遞參數方式：

| Request Header |                                                              |
| -------------- | ------------------------------------------------------------ |
| HTTP Method    | GET                                                          |
| Content Type   | Application/json                                             |
| Authorization  | Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j) |

需要參數：

無

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值          | 說明                                       | 型別   | 範例                                                         |
| --------------- | ------------------------------------------ | ------ | ------------------------------------------------------------ |
| Type            | 類型<br />0：郵局<BR>1：銀行               | int    | 1                                                            |
| BankAccountName | 戶名                                       | string | 王*明                                                        |
| BankName        | 銀行名稱或郵局代號(請依照Type不同去呈現)   | string | 臺灣中小企業銀行                                             |
| BankCode        | 銀⾏代碼(請依照Type不同去呈現)             | string | 050<br />若Type=1是銀行的時候才會提供                        |
| BranchCode      | 銀行分行代號(請依照Type不同去呈現)         | string | 1234<br />若Type=1是銀行的時候才會提供                       |
| BranchNo        | 郵局局號(請依照Type不同去呈現)             | string | 0001234<br />若Type=0是郵局的時候才會提供                    |
| BankAccountNo   | 銀⾏帳號 或 郵局帳號(請依照Type不同去呈現) | string | 121**************323                                         |
| Status          | 案件申請單狀態                             | int    | 10 - 匯款帳戶建立中<br />20 - 資料已確認<br />30 - 班長審核完畢<br />40 - 驗證完成<br /><br />備註：<br /><br />A. 空值為第一次申請，會提供會員既有的遮蔽資料，降低玩家再輸入一次的機會<br />B.當有Status且Status不是『40 - 驗證完成』則需阻擋不能重複申請<br /> |

成功範例

```json
{"Code":0,"Message":"成功","Data":{"Type":1,"Name":"王*明","BankName":"臺灣中小企業銀行","BankCode":"050","BranchCode":"1234","BankAccountNo":"121******323","Status":10}}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 十九、取得最近一次實體領獎申請之聯絡資訊API

說明：

取得玩家最近一次實體領獎申請之聯絡資訊(Data為空則代表未做過實體獎的領取)

API網址：

https://{對應環境Domain}/get-prize-contact-info

傳遞參數方式：

| Request Header |                                                              |
| -------------- | ------------------------------------------------------------ |
| HTTP Method    | GET                                                          |
| Content Type   | Application/json                                             |
| Authorization  | Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j) |

需要參數：

無

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值      | 說明                                    | 型別   | 範例       |
| ----------- | --------------------------------------- | ------ | ---------- |
| PhoneNumber | 聯絡電話                                | string | 0912123456 |
| CityId      | 寄送地址縣市ID(參考取得縣市資訊API)     | string | TWA        |
| LocalId     | 寄送地址鄉鎮區ID(參考取得鄉鎮區資訊API) | string | TWA00      |
| Address     | 寄送地址                                | string | 五工***0號 |



成功範例

```json
{"Code":0,"Message":"成功","Data":{PhoneNumber":"0912123456","CityId":"TWA","LocalId":"TWA00","Address":"五工***0號"}}
```

```json
{"Code":0,"Message":"成功","Data":null}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 二十、領獎申請API

說明：

根據玩家帶入的資訊，執⾏領獎相關作業

API網址：

https://{對應環境Domain}/real-prize-apply

傳遞參數方式：

| Request Header |                                                              |
| -------------- | ------------------------------------------------------------ |
| HTTP Method    | POST                                                         |
| Content Type   | Application/json                                             |
| Authorization  | Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j) |

需要參數：

| 參數名稱        | 型別    | 長度 | 是否必填 | 預設值 | 說明                                                         |
| --------------- | ------- | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId      | string  | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| PrizeWinnerNos  | string  | -    | 是       | 無     | 實體領獎案件編號(多筆請用","分隔，此為批次領獎規格)<BR>(請參考『取得實體獎項列表API』中的 PrizeWinnerNo)<br /><br />※若 IsExchange = True 則各PrizeWinnerNo對應的PRIZE_NO需相同且前端需要提示相關案件都會同時轉換成ExchangePrizeNo對應的獎項 |
| IsExchange      | boolean | -    | 是       | 無     | 是否要轉換獎項 true OR false(請都轉成小寫)                   |
| ExchangePrizeNo | int     |      | 否       | 無     | 要轉換的獎項編號(來自於取得實體領獎列表API中的ExchangePrizeData內的PrizeNo)<br />請帶入前端玩家選擇的獎項編號(PrizeNo)<br />若IsExchange = True 則該欄位為必填 |
| PhoneNumber     | string  | 20   | 否       | 無     | 聯絡電話<BR>※若IsExchange=true則不用傳入                     |
| Address         | string  | 100  | 否       | 無     | 寄送地址<BR>※若IsExchange=true則不用傳入<BR>※若獎項為電子票券(請參考『取得實體獎項列表API』中的 IsSerial = True)的話則不用傳入 |
| CityId          | string  | 10   | 否       | 無     | 縣市ID(參考取得縣市資訊API)<BR>※若IsExchange=true則不用傳入<BR>※若獎項為電子票券的話則不用傳入 |
| LocalId         | string  | 10   | 否       | 無     | 鄉鎮區ID(參考取得鄉鎮區資訊API)<BR>※若IsExchange=True則不用傳入<BR>※若獎項為電子票券的話則不用傳入 |
| ClientIp        | string  | 15   | 是       | 無     | 用戶端 IP 位置                                               |
| CheckCode       | String  | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

```json
{"PlatformId":"INTUMIT","PrizeWinnerNo":"12345,678910","IsExchange":false,"ExchangePrizeNo":"10","PhoneNumber":"0912123456","Address":"五工路130號","CityId":"TWA","LocalId":"TWA00","ClientIp":"127.0.0.1","CheckCode":"E03F3056094C95FEDB91B0FF811495D5580D0EFAAD353C33126E380F61685E95787EF511D222AD20E73F36CB6762C6012D5BB88496580C603CC15F8F86D604C4"}
```

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

成功範例

```json
{"Code":0,"Message":"成功","Data":null}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 二十一、LINE Notify訊息發送API

說明：

發送警示訊息到Line群組

API網址：

https://{對應環境Domain}/line-notify

傳遞參數方式：

| Request Header |                  |
| -------------- | ---------------- |
| HTTP Method    | POST             |
| Content Type   | Application/json |

需要參數：

| 參數名稱   | 型別   | 長度 | 是否必填 | 預設值 | 說明                                                         |
| ---------- | ------ | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId | string | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| UsageID    | string | -    | 是       | 無     | 群組識別代碼，請帶入"INTUMIT_NOTIFY"                         |
| Message    | string | -    | 是       | 無     | 發送訊息內文                                                 |
| CheckCode  | String | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

```json
{"PlatformId":"INTUMIT","UsageID":"TEST","Message":"測試","CheckCode":"FBF5C3BB3C182D07214A272768004F159CA585484D8038551AFE26AF42A20641042B9B21FAFB709CCA38A4478E611888A44D64B7F6530C2887A9C9F9C5209C7D"}
```

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

成功範例

```json
{"Code":0,"Message":"成功","Data":null}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```

# 二十二、判斷帳號是否被使用過API

說明：

會員升級成快速聯名會員時，判斷輸入的會員是否被使用過與提供三組建議的帳號

API網址：

https://{對應環境Domain}/verify-account-exist

傳遞參數方式：

| Request Header |                                                              |
| -------------- | ------------------------------------------------------------ |
| HTTP Method    | POST                                                         |
| Content Type   | Application/json                                             |
| Authorization  | Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j) |

需要參數：

| 參數名稱   | 型別   | 長度 | 是否必填 | 預設值 | 說明                                                         |
| ---------- | ------ | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId | string | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| Account    | string | 16   | 是       | 無     | 帳號                                                         |
| CheckCode  | String | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

```json
{"PlatformId":"INTUMIT","Account":"yaya736","CheckCode":"33D6B21E3A9950B337EB022320A39A4980651CF4BB266842886FEF5FF196DB66EACC74FA8FC3E072F4A136983A187296D7D6D2C0247373CEDA7091E34DAB8BE1"}
```

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值     | 說明                                                         | 型態    | 範例 |
| ---------- | ------------------------------------------------------------ | ------- | ---- |
| IsUsed     | 帳號是否已被使用                                             | boolean | True |
| Recommend1 | 第一組建議帳號(若輸入的帳號長度已是規定的長度則不提供建議帳號) | string  |      |
| Recommend2 | 第二組建議帳號(若輸入的帳號長度已是規定的長度則不提供建議帳號) | string  |      |
| Recommend3 | 第三組建議帳號(若輸入的帳號長度已是規定的長度則不提供建議帳號) | string  |      |

成功範例

```json
{"Code":0,"Message":"成功","Data":{"IsUsed":True,"Recommend1":"yaya736588","Recommend2":"yaya736599","Recommend3":"yaya736500"}}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```



# 二十三、判定領獎是否進行身分驗證API

說明：

進行實體領獎時判定領取該獎項是否需要做身分驗證

API網址：

https://{對應環境Domain}/check-need-verify-identity

傳遞參數方式：

| Request Header |                                                              |
| -------------- | ------------------------------------------------------------ |
| HTTP Method    | POST                                                         |
| Content Type   | Application/json                                             |
| Authorization  | Custom Gt:{玩家的SessionToken} (e.g. Custom Gt:pw2u0acfniiife2e023vfj2j) |

需要參數：

| 參數名稱       | 型別   | 長度 | 是否必填 | 預設值 | 說明                                                         |
| -------------- | ------ | ---- | -------- | ------ | ------------------------------------------------------------ |
| PlatformId     | string | 30   | 是       | 無     | 廠商ID<br />智能客服請帶入 "INTUMIT"                         |
| PrizeWinnerNos | string | -    | 是       | 無     | 實體領獎案件編號(多筆請用","分隔，此為批次領獎規格)<BR>(請參考『取得實體獎項列表API』中的 PrizeWinnerNo) |
| CheckCode      | String | -    | 是       | 無     | CheckCode計算方式是將傳送的參數資料依照 Key 排序，<BR>將所有 Value 相加(排除 CheckCode 參數)，<BR>最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA512加密並轉成大寫而成。 |

```json
{"PlatformId":"INTUMIT","PrizeWinnerNos":"12345,67891","CheckCode":"455273D7F79F19A7152A600644B9938A00FB1AF9CDE6DE702F739CD4ECBF6FBC1C6446C7A3D63EF8F431D1DB933BA6F7A370DD4082F3C47B56183D6E070BCE4E"}
```

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值  | 說明               | 型態    | 範例 |
| ------- | ------------------ | ------- | ---- |
| IsCheck | 是否要進行身分驗證 | boolean | True |

成功範例

```json
{"Code":0,"Message":"成功","Data":{"IsCheck":True}}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```

# 二十四、取得文案 API

說明：

用來取得遊戲相關文案，回傳至前端顯示給玩家

API網址：

https://{對應環境Domain}/get-message/{gameId}

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

需要參數：

| 參數名稱 | 型別   | 長度 | 是否必填 | 預設值 | 說明     |
| -------- | ------ | ---- | -------- | ------ | -------- |
| gameId   | string | 10   | 是       | 無     | 遊戲代碼 |

遊戲代碼規格對照表：

| 遊戲名稱  | 遊戲代碼 |
| --------- | -------- |
| gametower | GT       |
| 明星3缺1  | STAR31   |
| 滿貫大亨  | TMD      |
| 金好運    | PANTHER  |

Id欄位對照表：

| Id                  | 對應文案項目     |
| ------------------- | ---------------- |
| LOGIN               | 獲獎登入         |
| NO_RECORD           | 領獎中心無紀錄   |
| CHANGE_AGREEMENT    | 領獎兌幣同意書   |
| RECEIPT_NOTICE      | 實體領獎注意事項 |
| BANK_ACCOUNT_NOTICE | 匯款帳戶注意事項 |

```
https://{對應環境Domain}/get-message/STAR31
```

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |


成功範例

```json
{"Code": 0,"Message": "成功","Data": [{"Id": "LOGIN","Message": "請登入獲獎帳號!"},{"Id": "NO_RECORD","Message": "請確認登入帳號是否有獲獎，或先登入遊戲確認是否有獲得實體獎項，如確認帳號無誤卻無獎項記錄，請使用右下「三」選擇「問題回報」反應或致電客服中心確認，謝謝。"},{"Id": "CHANGE_AGREEMENT","Message": "確認後，請登入遊戲中「領取專區」確認：<br>一、你瞭解你所使用的服務，一旦經過你按下同意後，即表示你已經放棄領取實體獎項，轉換為官方指定的獎項，本公司將無法轉讓給第三人 ( 包括同一人擁有多組帳號之情形 ) ，亦無法進行獎項回復或退費等動作。<br>二、凡涉有不法者，應由當事人自負法律責任。當本公司合理懷疑有不法情事發生時，你同意本公司主動或配合相關單位移送你的相關資料供檢警調機關調查處理。<br>三、本公司保留新增、修改本服務之全部或局部之權利，並於修改時於首頁 https://www.goodluck777.com/ 公告，且不另行個別通知，你同意不因此而要求任何補償或賠償，並且自該修訂條款於本網站公告之時起受其拘束。一旦你於公告後繼續使用本服務，即視為你已經同意該修訂條款。"},{"Id": "RECEIPT_NOTICE","Message": "01.實體獎項領獎方式：<br>•得獎者須先完成「會員身份驗證」，以確認您為領獎本人！<br>•若您領取的獎項為獎金獎，除了「會員身分驗證」外，還須建立您的「 匯款帳戶」資料，官方才能確實無誤的將獎金匯款給您。<br>•※ 請您先與開戶銀行確認，該帳戶為非許久未使用之「靜止帳戶」，以避免影響您領獎之權益。<br>•「會員身分驗證」與「匯款帳戶建立」只需申請一次，便可永久使用哦！<br>•若您有變更上述內容的需求，請重新填寫線上申請單，或致電客服中心 客服電話：(02) 2298-0837。<br>•得獎獎項請在領獎期限內至領獎中心領取，如超過期限未領取，將視為自願放棄獎項，恕不補發退還！<br>02.本公司獎項寄送：<br>所有獎項以實物為準，本公司保留更換等值獎項以及變更活動內容或終止活動的權利。獎品寄送以台灣地區為限定範圍；如得獎人為離島玩家（如：澎湖、金門、馬祖等地區），請於實體獎項線上建單時，在「實體獎項指定寄送地點」的欄位填寫台灣友人的地址。<br>03. 所得稅法規定說明：<br>•依所得稅法規定，中獎人如為中華民國境內居住之個人，競技競賽機會中獎獎金或給與按給付全額扣取10%，扣繳義務人每次應扣繳稅額不超過新臺幣二千元者，免予扣繳。<br>•如果中獎人如為非中華民國境內居住之個人，競技競賽機會中獎獎金或給與按給付全額一律要扣繳20% (中獎人在中華民國境內無住所，且於一課稅年度內在中華民國境內居留合計未滿183天之外僑，應依同法第73條第1項規定就源扣繳)。<br>•中獎人(若為中華民國境內居住之個人)全年度所得超過新臺幣一千元以上者，需納入中獎人當年年度所得，本公司將依各類所得扣繳率標準列單申報該管稽徵機關，並於次年度寄發所得稅扣繳憑單。"},{"Id": "BANK_ACCOUNT_NOTICE","Message": "1.線上填寫完畢，請確實提供銀行帳戶文件，如逾七日未完成，此單據將視為無效，您可透過下列方式補提供至客服中心，並註明您的獲獎帳號，客服中心將會協助處理。<br>傳真電話：(02) 2299-6996；E-mail：service@goodluck777.com。<br>2.若有任何問題，請致電客服中心，客服電話：(02) 2298-0837。"}]}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```

# 二十五、取得客製化CSS樣式內容API

說明：

取得根據GameId提供對應的前端樣式內容

API網址：

https://{對應環境Domain}/get-custom-css/{GameId}/{EService}

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

需要參數：

| 參數名稱 | 型別   | 長度 | 是否必填 | 預設值 | 說明                                                         |
| -------- | ------ | ---- | -------- | ------ | ------------------------------------------------------------ |
| GameId   | string | 10   | 是       | 無     | 遊戲代碼                                                     |
| EService | string |      | 是       | 無     | 管道ID<br />此為碩網協助建立的<br />e.g.<br />明星3缺1-遊戲平台網頁版: 帶入 star31web<br/>明星3缺1-遊戲平台APP版: 帶入 star31app<br/>明星3缺1-官網: 帶入 star31website |

遊戲代碼規格對照表：

| 遊戲名稱 | 遊戲代碼 |
| -------- | -------- |
| 明星3缺1 | STAR31   |
| 滿貫大亨 | TMD      |
| 金好運   | PANTHER  |

回傳格式：

| 參數名稱 | 說明                          |
| -------- | ----------------------------- |
| Code     | 處理結果，成功為0，其餘為失敗 |
| Message  | 回傳訊息                      |
| Data     | 回傳資料                      |

| 回傳值 | 說明    | 型態   | 範例 |
| ------ | ------- | ------ | ---- |
| Css    | Css內容 | string |      |

成功範例

```json
{"Code":0,"Message":"成功","Data":{"Css":"XXXX"}}
```

失敗範例

```json
{"Code":1001,"Message":"缺少必要參數","Data":null}
```

錯誤代碼表規格：

| 代碼 | 說明                       |
| ---- | -------------------------- |
| 0    | 成功。                     |
| -999 | 伺服器忙碌中，請稍後再試。 |