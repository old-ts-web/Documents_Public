# gametower WebAPI規格書

## 《更新歷程》

| 版本       | 更新日期   | 編輯者 | 更新內容說明                                                 |
| ---------- | ---------- | ------ | ------------------------------------------------------------ |
| **1.0**    | 2015/10/16  | 魏嘉男 | 新建立文件                    |
| (略)       |            |        |                                                              |
| **1.44.0** | 2021/01/04  | 林子傑 | 新增六十、儲值黑名單上限API   |
| **1.45.0** | 2021/03/02  | 謝昇富 | 1\.修改十、取得是否已進行過手機撥號或手機簡訊認證(新增會員帳號)<br>2\.修改九、遊戲中簡訊驗證API(ex.好友贈禮、天團匯款...etc) |(新增滿貫大亨_防盜手機驗證碼) |

## 1.說明

提供各單位串接gametower使用，目前**gametower例行維護時間為3,6,9,12月第四個周三
09:00\~12:00**，每次維護前一周會寄出維護通知，維護時間相關API皆無法使用，請串接單位注意。

Web站台各環境網址

**開發環境：www.gt.web**

**外測環境：www-twtest.towergame.com**

**正式環境：www.gametower.com.tw**

MA站台各環境網址

**開發環境：ma.gt.web**

**外測環境：ma-twtest.towergame.com**

**正式環境：ma.gametower.com.tw**

Member站台各環境網址

**開發環境：member.gt.web**

**外測環境：member-twtest.towergame.com**

**正式環境：member.gametower.com.tw**

ex站台各環境網址

**開發環境：ex.gt.web**

**外測環境：ex-twtest.towergame.com**

**正式環境：ex.gametower.com.tw**

notify站台各環境網址

**開發環境：notify-agent.gt.web**

**外測環境：notify-agent.gt.web**

**正式環境：notify-agent.gt.web**



## 2.範例

網址

開發：{API_網址路徑}

測試：{API_網址路徑}

正式：{API_網址路徑}

> 功能描述
>
> 用途是XXXXXXXXXXXXXXX



傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

OR

| Request Header |                       |
| ----- | --------------- |
| HTTP Method    | GET |



串接單位是否需要允許個資同意機制：**是** OR**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格     | 是否必填 | 描述 |
| -------- | -------- | -------- | ---- |
| {參數1}  | String   | 是       |      |
| {參數2}  | Int      | 否       |      |
| {參數3}  | DateTime | 否       |      |
| {參數4}  | Float    | 否       |      |



回傳參數說明：

| 參數     | 說明                          |
| -------- | ----------------------------- |
| state    | 處理結果，成功為0，其餘為失敗 |
| message  | 登入失敗的訊息                |
| memberno | 會員編號                      |



回傳格式：

成功範例

```json
{"RETURN_CODE":"0","RETURN_MESSAGE":"","INDEX_NO":"234"}
```

失敗範例

```json
{"RETURN_CODE":"-11","RETURN_MESSAGE":"伺服器忙碌中，請稍後再試。","INDEX_NO":""}
```



錯誤代碼表：

| 代碼   | 說明       |
| ------ | ---------- |
| 0      | 成功。     |
| {編號} | {相關說明} |
| {編號} | {相關說明} |
| {編號} | {相關說明} |
| {編號} | {相關說明} |

Or

**無**



## 3.註冊gametower快速會員API

注意：請使用Server端呼叫註冊，網頁端會有IP註冊上限，Server的IP須提供給網頁組加入註冊無上限設定。

若是要統計進到註冊頁連結需在玩家開啟遊戲註冊呼叫頁面(若有需要計數請跟網頁組申請ID)：<http://www.gt.web/common/ad.aspx?c=MEMBER_REGISTER&s=MEMBER_REGISTER_GT_20111219_1X1_001&t=HIT>

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)

註冊+計數網址：https://www.gt.web/Member/Register.aspx?mode=1&forreg=MEMBER_REGISTER_GT_20111219_1X1_001_R

單純註冊網址：<https://www.gt.web/Member/Register.aspx?mode=1>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

需要參數

| 參數                                | 值範例             | 說明                                                     |
| ----------------------------------- | ------------------ | -------------------------------------------------------- |
| f_strID                             | TB127              | 會員帳號，英數字 2~14碼                                  |
| f_strPasswordTemp                   | xxxxxx             | 密碼，6 ~ 14碼 不可使用中文，雙字元                      |
| f_strPasswordTempCheck              | xxxxxx             | 確認密碼(必須與密碼相同)                                 |
| f_bConsent                          | TRUE               | [期標]同意條款，固定true                                 |
| f_strRegisterEMail                  | KaneWei@igs.com.tw | Email，若不填請帶固定值 xxxGame@gametower.com.tw         |
| f_strIP                             | 123.123.123.123    | 用戶IP，若無帶此參數值，則帳號建立IP會是呼叫端Server的IP |
| f_strSdkDeviceID                    |                    | 裝置唯一識別碼                                           |
| f_strSdkAppStorageInstallationID    |                    | (App Storage)安裝識別碼                                  |
| f_strSdkDeviceStorageInstallationID |                    | (Device Storage)安裝識別碼                               |
| lang                                | EN,ZH_TW           | 是否顯示為英文                                           |
| f_strAreaCode                       | TW                 | 國別代碼                                                 |
| f_strGuid                           |                    | 若有串接 三十一、取得驗證碼 API，請帶入GUID識別碼        |

需設定上一頁網址

```
UrlReferrer = \"https://www.gt.web/Member/Register.aspx\" ;
```

成功時STATE為0

```xml
<?xml version="1.0" encoding="big5"?>
<ROOT>
<STATE>0</STATE>
<MEMBER_NO>1234567</MEMBER_NO >
<ACCOUNT>TB127</ACCOUNT >
</ROOT>
```

失敗時STATE為-1 或 -2，訊息在MESSAGE中

```xml
<?xml version="1.0" encoding="big5"?>
<ROOT>
<STATE>-1</STATE>
<MESSAGE><![CDATA[已達申請人數上限，請稍候再試。]]></MESSAGE>
</ROOT>

```

InGame檢查會員帳號範例(可從Client端呼叫檢查)：

網址：<https://www.gt.web/Member/include/x_RegisterCheck.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

需要參數

| 參數                                | 值範例             | 說明                                                     |
| ----------------------------------- | ------------------ | -------------------------------------------------------- |
| f_strID                             | TB127              | 會員帳號，英數字 2~14碼                                  |
| f_strPasswordTemp                   | xxxxxx             | 密碼，6 ~ 14碼 不可使用中文，雙字元                      |
| f_strPasswordTempCheck              | xxxxxx             | 確認密碼(必須與密碼相同)                                 |
| f_bConsent                          | TRUE               | [期標]同意條款，固定true                                 |
| f_strRegisterEMail                  | KaneWei@igs.com.tw | Email，若不填請帶固定值 xxxGame@gametower.com.tw         |
| f_strIP                             | 123.123.123.123    | 用戶IP，若無帶此參數值，則帳號建立IP會是呼叫端Server的IP |
| f_strSdkDeviceID                    |                    | 裝置唯一識別碼                                           |
| f_strSdkAppStorageInstallationID    |                    | (App Storage)安裝識別碼                                  |
| f_strSdkDeviceStorageInstallationID |                    | (Device Storage)安裝識別碼                               |
| lang                                | EN,ZH_TW           | 是否顯示為英文                                           |
| f_strAreaCode                       | TW                 | 國別代碼                                                 |
| f_strGuid                           |                    | 若有串接 三十一、取得驗證碼 API，請帶入GUID識別碼        |

需設定上一頁網址

```
UrlReferrer = \"https://www.gt.web/Member/Register.aspx\" ;
```

帳號可使用時不會帶MESSAGE tag

```xml
<?xml version="1.0" encoding="big5"?>
<ROOT>
<STATE>0</STATE>
<MEMBER_NO>1234567</MEMBER_NO >
<ACCOUNT>TB127</ACCOUNT >
</ROOT>
```

帳號不可使用時會帶MESSAGE tag，若帳號重覆建議帳號會帶在OPTIONS tag 底下

```xml
<?xml version="1.0" encoding="utf-8"?>
<ROOT>
	<INPUT>f_strID</INPUT>
	<OPTIONS>
		<ITEM>
			<NAME>TB2192288</NAME>
		</ITEM>
		<ITEM>
			<NAME>TB2196635</NAME>
		</ITEM>
		<ITEM>
			<NAME>TB2196339</NAME>
		</ITEM>
	</OPTIONS>
	<MESSAGE>「帳號」輸入之名稱 "TB219" 已經有人使用，請您修改後重試。</MESSAGE>
</ROOT>
```



## 4.驗證gametower會員帳號密碼API

注意：請使用Server端呼叫驗證，
Server的IP須提供給網頁組加入允許Server呼叫驗證清單。

驗證網址：<https://member.gt.web/Member/Login.aspx>

傳遞參數方式：
| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)

需要參數

| 參數          | 值範例      | 說明                           |
| ------------- | ----------- | ------------------------------ |
| f_strID       | TB127       | 會員帳號，英數字 2~14碼        |
| f_strPassword | Xxxxx9876   | 會員密碼                       |
| f_strUserIP   | 61.69.85.68 | 使用者IP，相關檢查使用此ip驗證 |
| f_nLoginMode  | SERVER      | 驗證模式，固定帶SERVER         |

回傳參數說明：

| 參數         | 說明                                      |
| ------------ | ----------------------------------------- |
| state        | 處理結果，成功為0，其餘為失敗             |
| message      | 登入失敗的訊息                            |
| lc           | LC字串，可用於登入gametower網站或其他用途 |
| memberno     | 會員編號                                  |
| id           | 會員帳號                                  |
| alaias       | 會員別名                                  |
| comefromno   | 會員來源編號                              |
| relationno   | 會員來源關係識別值                        |
| serialnumber | 會員身份識別值                            |

驗證成功：

```json
{"state" : 0 ,"lc" : "010B28596A5A28595959285F282828287C282828285E59582828595F5D285928D8","message" : "","memberno" : 759640 ,"id" : "TB127","alias" : "","comefromno" : 1 ,"relationno" : "","serialnumber" : "XXXXXXX"}
```

驗證失敗：

```json
{"state" : -1 ,"lc" : "","message" : "密碼錯誤（大小寫不同）或無此帳號，若有問題請洽客服人員。若您忘記帳號、密碼，請點選『忘記帳號密碼』進行查詢！","memberno" : 0 ,"id" : "","alias" : "","comefromno" : 0 ,"relationno" : "","serialnumber" : ""}
```



## 5.驗證與註冊facebook介接會員API

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

需要參數：

| 參數名稱                    | 規格   | 是否必填 | 描述                                                         |
| --------------------------- | ------ | -------- | ------------------------------------------------------------ |
| mode                        | int    | 是       | 模式 (APP模式固定帶1)                                        |
| app_id                      | string | 是       | app_id                                                       |
| uid                         | string | 是       | Facebook Uid                                                 |
| access_token                | string | 昰       | 授權碼 (請記得做 UrlEncode 不然傳遞時會掉參數)               |
| DeviceID                    | string | 否       | 裝置識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| AppStorageInstallationID    | string | 否       | 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| DeviceStorageInstallationID | string | 否       | 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| DeviceNo                    | long   | 否       | 裝置流水號，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| SdkDeviceType               | int    | 否       | Vigor 帶 0，其他帶 1，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |

驗證範例：

```
https://ma.gt.web/Webs/Facebook2/Member/receive_login.aspx?mode=1&app_id={app_id}&uid={Facebook
Uid}&access_token={ACCESS_TOKEN}
```

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



會員存在回傳lc字串，可用於登入gametower網站或其他用途

![](images\media\image2.png){width="5.7652777777777775in"
height="0.84375in"}

若是回傳-99 代表伺服器忙碌中

**備援登入(GET)**

需要參數：

| 參數名稱                    | 規格   | 是否必填 | 描述                                                         |
| --------------------------- | ------ | -------- | ------------------------------------------------------------ |
| mode                        | int    | 是       | 模式 (APP模式固定帶1)                                        |
| app_id                      | string | 是       | app_id                                                       |
| DeviceID                    | string | 是       | 裝置識別碼                                                   |
| AppStorageInstallationID    | string | 是       | 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼         |
| DeviceStorageInstallationID | string | 是       | 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼          |
| DeviceNo                    | long   | 是       | 裝置流水號                                                   |
| SdkDeviceType               | int    | 是       | Vigor 帶 0，其他帶 1                                         |
| LastAccount                 | string | 是       | 上次登入帳號<br>會去反查此帳號先前使用「一般登入」時，記錄對應的三組裝置識別碼，只要其中一個符合即可成功透過備援登入 |
| LastErrorCode               | string | 否       | 介接平台錯誤碼 (提供客服、監控人員及時了解有可能是甚麼錯)<br>例如：LINE 回傳「SERVER_ERROR」 |
| LastErrorDesc               | string | 否       | 介接平台錯誤訊息 (提供客服、監控人員及時了解有可能是甚麼錯)  |

回傳參數說明：

| 值      | 說明                                                   |
| ------- | ------------------------------------------------------ |
| -99     | 其他錯誤                                               |
| lc 字串 | 純文字格式的 lc 字串 <br>e.g. 24123C0C0C413D423D...etc |



回傳格式：

成功範例

```json
{24011B54544E531B534D4B504B4D1B4C4C4B1B1B675B534F4B544B1B541B4E6915}
```

失敗範例

```json
{-99}
```



流程圖：

![Facebook (App 登入
mode=1)](images\media\image3.png){width="7.478472222222222in"
height="7.469444444444444in"}

## 6.填寫隨你玩暱稱API

驗證網址(utf8呼叫)：http://ex.gt.web/Games/client/Apply/Utf8ToBig5.aspx?mode=2&lc={LC}

驗證網址(big5呼叫)：[http://ex.gt.web/Games/client/Apply/index.aspx?mode=2&lc={LC}](http://ex.gt.web/Games/client/Apply/index.aspx?mode=2&lc=%7bLC%7d)



傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

or

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

**注意：Get參數需帶LC字串驗證是哪個會員**



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數

| 參數          | 值範例  | 說明          |
| ------------- | ------- | ------------- |
| f_strNickname | 樹鳥123 | 暱稱          |
| f_nAvatraNo   | 3       | 星座編號 0~11 |

需設定上一頁網址
```
UrlReferrer = \"http://ex.gt.web\" ;
```



成功時STATE為0

```xml
<?xml version="1.0" encoding="big5"?>
<ROOT>
<STATE>0</STATE>
</ROOT>
```

失敗時STATE為-1，訊息在MESSAGE中

```xml
<?xml version="1.0" encoding="big5"?>
<ROOT>
<NICKNAMES>         有建議暱稱才會出現
<NICKNAME><![CDATA[樹鳥12201]]></NICKNAME>         有建議暱稱才會出現
<NICKNAME><![CDATA[樹鳥12202]]></NICKNAME>         有建議暱稱才會出現
<NICKNAME><![CDATA[樹鳥12203]]></NICKNAME>         有建議暱稱才會出現
</NICKNAMES>         有建議暱稱才會出現
<STATE>-1</STATE>
<MESSAGE><![CDATA[「暱稱」輸入之名稱 "樹鳥122" 已經有人使用，請由建議中選擇，或修改後重試。]]></MESSAGE>
</ROOT>

```



## 7.新增問題回報 API

驗證網址：<http://www.gt.web/common/receive/BugReport/BugReportFromGame.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**是**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)

需要參數：

| 參數         | 是否必填 | 值範例                                   | 說明                                                         |
| ------------ | -------- | ---------------------------------------- | ------------------------------------------------------------ |
| game         | V        | STAR31                                   | GameTower_Member.FAQ_Class 的遊戲別                          |
| class_no     | V        | 138                                      | 可使用『取得問題回報分類』API取得                            |
| member_no    | V        | 764466                                   | 會員編號(若不是串GT帳號的話請帶 0)                           |
| username     | V        | hsiehld                                  | 會員名稱或識別值(若不是串GT帳號該參數資訊為主要搜尋的KEY)    |
| email        | V        | sfhsieh@igs.com.tw                       | 電子信箱                                                     |
| phone        |          | 0987654321                               | 電話                                                         |
| message      | V        | 測試訊息                                 | 回報內容                                                     |
| uni_business | V        | 22                                       | 介接來源，沒有傳入時預設帶入 99<br>0 = gametower 未登入<br>1 = gametower<br>97 = 隨你玩 (VIP專屬購點申請) <br>98 = 隨你玩 (尊榮服務鈴) <br>99 = gametower 遊戲端<br>22 = 行動平台<br><br>其他定義可由GameTower_Member.dbo.MEMBER_CODE_ComeFrom資料表查詢 |
| os           |          |                                          | 作業系統                                                     |
| info         |          |                                          | 遊戲端對應LOG資訊                                            |
| viplevel     |          | 0                                        | VIP數字等級，若沒有帶該參數預設為0(越高客服的服務越好)，預設：0 |
| lang         |          | TW                                       | 多國語系規格，目前提供 TW、EN與CN，預設：TW                  |
| platform     | V        | 5                                        | 廠商編號，請參考儲值中心所建立的廠商編號 BANK_CENTER_Main.dbo.CONFIG_CODE_Platform.INDEX_NO 例如 5 為 APPPORTAL_PAYCENTER 行動平台 |
| check_code   | V        | A9CD853C70FE32B57FC24DB8C1D285F9751A9648 | CHECK_CODE計算方式是將傳送的參數資料依照 Key 排序，將所有 Value 相加(排除 CHECK_CODE 參數)，最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA1加密並轉成大寫而成。 |
| 圖片         |          |                                          | 須透過FormData file upload，圖片不能超過5mb                  |

check_code範例程式如下

```c#
public static string GetCheckCode(NameValueCollection _csDataColl,string _strPrivateKey)
{
     StringBuilder strValue      = new StringBuilder() ;

     // 依照 Key 排序，將所有 Value 相加 (排除 CHECK_CODE 參數)
     foreach(string strKey in _csDataColl.AllKeys.OrderBy(o => o))
     {
         if (!strKey.Equals("CHECK_CODE",StringComparison.OrdinalIgnoreCase))
              strValue.Append(_csDataColl[strKey]) ;
     }
     // 最後加入私Key
     strValue.Append(_strPrivateKey) ;

     return FormsAuthentication.HashPasswordForStoringInConfigFile(strValue.ToString(),"SHA1") ;
}

```

其他規格：

**每五分鐘只能發送一次，且訊息內容不能與上次回報相同**



成功時RESULT_CODE = 0：

```json
{"RESULT_CODE":"0","RESULT_MESSAGE":"","INDEX_NO":"234"}
```

失敗時RESULT_CODE \< 0

```json
{"RESULT_CODE":"-11","RESULT_MESSAGE":"伺服器忙碌中，請稍後再試。","INDEX_NO":""}
```



回報代碼如下：

0 = 成功

-1 = 上傳圖檔超過5mb限制大小

-2 = 沒有傳遞正確的遊戲參數

-3 = 會員編號錯誤

-4 = 上載的「圖檔」不是允許的檔案類型。

-5 = 上傳檔案失敗

-6 = 電話不得為空白 (因欄位改為非必填，不會回傳此代碼)

-7 = Email不得為空白

-8 = Email格式錯誤

-9 = 訊息不得為空白

-10 = 請勿重覆輸入一樣訊息

-11 = 資料新增時發生錯誤

-12 = 沒有傳遞正確的問題編號

-13 = 會員編號為 0 時，遊戲帳號不得為空白

-14 = 重複發送回報時間過於頻繁

-15 = 圖片上傳功能暫停使用

-16 = VIP等級的格式錯誤

-17 = 來源表單內容不符(CHECK_CODE 檢查不符)

-18 = 請勿選擇多個圖檔

-19 = 請勿選擇超過5個圖檔



## 8.取得問題回報

驗證網址：<http://www.gt.web/common/receive/BugReport/GetRecord.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**是**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數         | 值範例                                   | 說明                                                         |
| ------------ | ---------------------------------------- | ------------------------------------------------------------ |
| game         | STAR31                                   | GameTower_Member.FAQ_Class 的遊戲別                          |
| memberno     | 764466                                   | 會員編號                                                     |
| username     | hsiehld                                  | 會員名稱或識別值                                             |
| uni_business | 22                                       | 傳入 all來取得全部                                           |
| en           | 20                                       | 指定特定編號的紀錄                                           |
| l            | 20                                       | 每一頁的筆數，沒有傳入則不做分頁                             |
| p            | 1                                        | 第幾頁，沒有傳入則不做分頁                                   |
| status       |                                          | 指定回報紀錄的狀態                                           |
| lan          | TW                                       | 非必填，為要顯示的語系，關聯 GameTower_Member.dbo.CODE_Language.ID<br>(EX：TW、CN、EN，預設為TW) |
| platform     | 5                                        | 廠商編號，請參考儲值中心所建立的廠商編號 BANK_CENTER_Main.dbo.CONFIG_CODE_Platform.INDEX_NO 例如 5 為 APPPORTAL_PAYCENTER 行動平台 |
| check_code   | A9CD853C70FE32B57FC24DB8C1D285F9751A9648 | CHECK_CODE計算方式是將傳送的參數資料依照 Key 排序，將所有 Value 相加(排除 CHECK_CODE 參數)，最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA1加密並轉成大寫而成。 |


check_code範例程式如下

```c#
public static string GetCheckCode(NameValueCollection _csDataColl,string _strPrivateKey)
{
     StringBuilder strValue      = new StringBuilder() ;

     // 依照 Key 排序，將所有 Value 相加 (排除 CHECK_CODE 參數)
     foreach(string strKey in _csDataColl.AllKeys.OrderBy(o => o))
     {
         if (!strKey.Equals("CHECK_CODE",StringComparison.OrdinalIgnoreCase))
              strValue.Append(_csDataColl[strKey]) ;
     }
     // 最後加入私Key
     strValue.Append(_strPrivateKey) ;

     return FormsAuthentication.HashPasswordForStoringInConfigFile(strValue.ToString(),"SHA1") ;
}

```

回傳結果：

| 參數           | 說明                                                         |
| -------------- | ------------------------------------------------------------ |
| RETURN_CODE    | 等於 0 時為成功，負值為失敗                                  |
| RETURN_MESSAGE | 回傳結果訊息(若RETURN_CODE = 0 則回傳 "成功"，反之則回傳提供適合前端使用者觀看的錯誤訊息) |
| RESULT         | 若RETURN_CODE = 0 則提供各狀態筆數及資料，反之則回傳NULL     |

錯誤代碼表：

| 代碼 | 說明                                                    |
| ---- | ------------------------------------------------------- |
| 0    | 成功。                                                  |
| -1   | 無法連線至資料庫                                        |
| -2   | 遊戲 ID 錯誤                                            |
| -3   | 無此 gametower 會員                                     |
| -4   | username 錯誤                                           |
| -5   | 其他錯誤                                                |
| -6   | 會員資料驗證失敗，請重新使用本功能(CHECK_CODE 檢查不符) |

成功時回傳各狀態筆數及資料：

```json
{
	"RETURN_CODE": 0,
	"RETURN_MESSAGE": "成功",
	"RESULT": 
	{
		"TOTAL":"7",
		"UNPROCESSED":"3",
		"PROCESSING":"1",
		"PROCESSED":"2",
		"RETURNED":"1",
		"RECORDS":[
		{
			"INDEX_NO":"605",
			"CLASS_NAME":"5.遊戲設定相關問題",
			"PROCESS_STATUS":"未處理",
			"REPORT_MESSAGE":"伺服器：\r\n角色名稱：\r\n發生時間：\r\n問題描述：\r\n手機型號：",
			"REPLY_MESSAGE":"",
			"C_DATETIME":"2015/06/10 13:48:39",
			"CLASS_NO":"87",
			"PROCESS_STATUS_CODE":"2",
			"SCORE_OPTIONS":"",
			"PROCESS_DATETIME":""
		},
		{
			"INDEX_NO":"602",
			"CLASS_NAME":"5.遊戲設定相關問題",
			"PROCESS_STATUS":"已完成",
			"REPORT_MESSAGE":"伺服器：\r\n角色名稱：\r\n發生時間：\r\n問題描述：wqdqd\r\n手機型號：",
			"REPLY_MESSAGE":"QQ",
			"C_DATETIME":"2015/06/08 17:43:36",
			"CLASS_NO":"558",
			"PROCESS_STATUS_CODE":"8",
			"SCORE_OPTIONS":"",
			"PROCESS_DATETIME":"2015/06/10 10:55:34"
		}
 		]
	}
}
```

失敗時：

```json
{
	"RETURN_CODE": -1,
	"RETURN_MESSAGE": "資料庫連線失敗，請重新使用本功能 (-1)",
	"RESULT": null
}
```



## 9.遊戲中簡訊驗證API(ex.好友贈禮、天團匯款...etc)

說明：提供遊戲中發送驗證簡訊、回填驗證碼的功能。(ex.好友贈禮、天團匯款...etc)

驗證網址：

> <https://bank-agent.gt.web/common/receive/Games/Freeplay/Gold/FriendPrizeSMS.aspx>
>
> <https://bank-agent.gt.web/common/receive/phone/SendAndVerify.aspx>
> (預計於 2021/03/24 上線)

 傳遞參數方式：
| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數                | 必填 | 值範例     | 說明                                                         |
| ------------------- | ---- | ---------- | ------------------------------------------------------------ |
| f_nMode             | 是   | 1          | 處理模式，1 = 寄送驗證碼、2 = 回填驗證碼                     |
| f_strAccount        | 是   | hsiehld    | 會員帳號                                                     |
| f_nFormat           | 否   | 0          | 回傳格式，0 - XML（預設）、1 - JSON                          |
| f_nMemberNo         | 否   | 764466     | 會員編號 (驗證模式為好友贈禮、天團匯款時必填)                |
| f_strNickName       | 否   | 三重劉德華 | 遊戲暱稱 (驗證模式為好友贈禮、天團匯款時必填)                |
| f_nPhoneVerifyType  | 否   | 3          | 驗證模式<br>3 = 好友贈禮（預設）<br>4 = 天團匯款<br>5 = 滿貫大亨防盜手機驗證碼 |
| f_strVerifyPassword | 否   | 9527       | 驗證碼，處理模式為「回填驗證碼」時必填                       |



回傳結果：

| 參數           | 必填 | 值範例             | 說明                        |
| -------------- | ---- | ------------------ | --------------------------- |
| RETURN_CODE    | 是   | 0                  | 等於 0 時為成功，負值為失敗 |
| RETURN_MESSAGE | 是   | 驗證簡訊發送成功。 |                             |



回傳代碼表：

| RETURN_CODE | RETURN_MESSAGE                                               |
| ----------- | ------------------------------------------------------------ |
| 0           | 成功                                                         |
| -1          | 會員資料庫連線失敗                                           |
| -2          | 會員編號格式錯誤                                             |
| -3          | 帳號格式錯誤                                                 |
| -4          | 遊戲暱稱格式錯誤                                             |
| -5          | 驗證碼格式錯誤                                               |
| -6          | 會員尚未通過手機撥號認證或手機簡訊認證                       |
| -7          | 驗證簡訊發送失敗                                             |
| -8          | 申請{驗證模式名稱}資料已超過 30 分鐘，請重新申請             |
| -9          | 輸入的驗證碼有誤，請重新輸入                                 |
| -10         | 查無申請{驗證模式名稱}資料                                   |
| -11         | 請按確定輸入您收到的驗證碼，如您尚未收到「驗證碼簡訊」，請您耐心等侯簡訊通知。 |
| -12         | 取得電話號碼編號發生異常                                     |
| -13         | 未知的驗證模式                                               |
| -14         | 未選擇處理模式                                               |
| -99         | 更新資料發生錯誤，請稍後再試                                 |



寄送簡訊成功

```xml
<?xml version="1.0" encoding="utf-8"?>  
<ROOT>  
	<RETURN_CODE>0</RETURN_CODE>  
	<RETURN_MESSAGE>驗證簡訊發送成功。</RETURN_MESSAGE>  
</ROOT>
```

寄送簡訊內容：

1.  隨你玩 暱稱：Hsiehld002 於 2016-01-02 03:04 申請好友贈禮，驗證碼
    9527 即可開啟服務！

2.  驗證碼： 9527
    來自遊戲明星3缺1，驗證碼有效時間為30分鐘，請在時限內輸入

寄送簡訊失敗

```xml
<?xml version="1.0" encoding="utf-8"?>  
<ROOT>  
	<RETURN_CODE>-1</RETURN_CODE>  
	<RETURN_MESSAGE>未選擇處理模式。</RETURN_MESSAGE>  
</ROOT>
```

回填驗證碼成功

```xml
<?xml version="1.0" encoding="utf-8"?>  
<ROOT>  
	<RETURN_CODE>0</RETURN_CODE>  
	<RETURN_MESSAGE>驗證成功。</RETURN_MESSAGE>  
</ROOT>

```

回填驗證碼失敗

```xml
<?xml version="1.0" encoding="utf-8"?>  
<ROOT>  
	<RETURN_CODE>-9</RETURN_CODE>  
	<RETURN_MESSAGE>輸入的驗證碼有誤，請重新輸入。</RETURN_MESSAGE>  
</ROOT>

```



## 10.取得是否已進行過手機撥號或手機簡訊認證

驗證網址：<http://www.gt.web/common/receive/Member/GetMobileVerifyStatus.aspx>

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數         | 值範例  | 說明                      |
| ------------ | ------- | ------------------------- |
| q_nFormat    | 0       | 0 = XML（預設）、1 = JSON |
| q_nMemberNo  | 764466  | 會員編號 (*1)             |
| q_strAccount | hsiehld | 會員帳號 (*1)             |

**(\*1)：會員編號與會員帳號擇一，如果同時都有帶會以會員編號為主**



成功時 RETURN_CODE = 0：

```xml
<?xml version="1.0" encoding="utf-8"?>
<ROOT>
  <RETURN_CODE>0</RETURN_CODE>
  <RETURN_MESSAGE></RETURN_MESSAGE>
  <VERIFY_STATUS>true</VERIFY_STATUS>
</ROOT>

```

失敗時RETURN_CODE 為負值：

```xml
<?xml version="1.0" encoding="utf-8"?>
<ROOT>
  <RETURN_CODE>-1</RETURN_CODE>
  <RETURN_MESSAGE>會員編號錯誤。</RETURN_MESSAGE>
  <VERIFY_STATUS>false</VERIFY_STATUS>
</ROOT>

```



## 11.遊戲內序號兌換道具API

API位置：<https://www.gt.web/common/receive/Prize/SerialExchange.aspx>

驗證網址：<https://admin.gt.web/common/admin/Utility/TestExCardForAPI.aspx



傳遞參數方式：
| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數              | 值範例          | 說明                                                         |
| ----------------- | --------------- | ------------------------------------------------------------ |
| lc                |                 | 登入碼                                                       |
| f_strSerialNumber | A01C1PM7A8LE0CN | 15碼序號，序號由運營人員由後端工具- 兌換卡管理<br>發行產生，工具路徑如下：https://admin.gt.web/common/admin/ExCard/index.aspx |
|                   |                 |                                                              |
| f_nKind           | 1               | 序號種類，請傳入數字的1                                      |
| f_strIP           | XXX.XXX.XXX.XXX | 使用者IP(若沒帶入則系統自己取得Request資訊)                  |
| f_nGameNo         | 1               | 串接端遊戲編號( 1–隨你玩 3012–滿貫大亨)                      |



回傳值規格說明 (JSON 格式)：

```json
{
	"ReturnCode" :	處理結果代碼
	"SUCCESS" :	前端顯示成功的訊息		// e.g. 恭喜您～領取成功！
	"FAILED" :		前端顯示失敗的訊息
		"GAIN_PRIZE_LIST" :  獎項清單		// e.g.
									"GAIN_PRIZE_LIST" : [
										{
											"ITEM_INDEX",			遊戲端道具編號的INDEX_NO
											"AMOUNT",				獎項數量
											"NAME",				獎品名稱
											"EXTRA_INDEX"			延伸INDEX_NO			
										},
										{
											"ITEM_INDEX",			遊戲端道具編號的INDEX_NO
											"AMOUNT",				獎項數量
											"NAME",				獎品名稱
											"EXTRA_INDEX"			延伸INDEX_NO
										}]
}
```



ReturnCode 對應表：

0 - 成功

1 - 部分獎項領取失敗

2 - 兌獎失敗

-1 - 登入碼錯誤

-2 - 查無會員資料

-11 - 缺少必要參數值

-12 - 參數數量不符

-21 - 序號格式錯誤

-22 - 序號種類錯誤

-23 - 使用者IP格式錯誤

-31 - 呼叫代理程式逾時

-32 - 代理程式無回傳資料

-33 - 呼叫代理程式發生例外

-91 - 連線中斷



## 12.行動版找回密碼API

驗證網址：<https://www.gt.web/games/freeplay/member/gameaccount/InquiryPassword.aspx?mode=1>

傳遞參數方式：
| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數           | 值範例 | 說明     |
| -------------- | ------ | -------- |
| f_strGTAccount |        | 帳號     |
| f_strEmail     |        | 註冊信箱 |



回傳範例：

```json
{“CODE”:”0”,”MESSAGE”:” 成功。請前往您的電子信箱進行確認，謝謝。”}
```



| CODE | MESSAGE                                                      |
| ---- | ------------------------------------------------------------ |
| 0    | 成功。請前往您的電子信箱進行確認，謝謝。                     |
| -1   | 請勿在10分鐘內重複執行申請動作。                             |
| -2   | 「gametower帳號」欄位未輸入任何內容。                        |
| -3   | 您使用他網帳號登入使用本服務，請向該網辦理查詢事宜。         |
| -4   | 「站務用信箱」欄位未輸入任何內容。                           |
| -5   | 抱歉！您輸入的資料無法查證。                                 |
| -6   | "抱歉！您的帳號已被停權，原因是「xxxx」，若有問題請洽客服人員。" |
| -7   | "抱歉！您輸入的資料無法查證或者有誤，請確認您所輸入的資料是否正確" |
| -8   | "抱歉！您輸入的資料無法查證或者有誤，請確認您所輸入的資料是否正確" |
| -9   | 伺服器連線失敗，請稍後再試～(請洽網頁組)                     |
| -10  | 伺服器連線失敗，請稍後再試～(請洽網頁組)                     |
| -11  | "請先進行【遊戲帳號申請】，才可進行查詢密碼動作。"           |
| -12  | 資料處理忙碌中，請稍後再試。(請洽網頁組)                     |
| -13  | 資料處理忙碌中，請稍後再試。(請洽網頁組)                     |



## 13.提供查詢IP位置API

驗證網址：<http://ex.gt.web/Service/AreaCode/index.aspx>

註：針對大陸地區有進行線路優化，若已初步判斷玩家是大陸地區(e.g.使用語系為簡體中文)，可改用以下網址呼叫

大陸地區線路優化驗證網址：<http://ex.gt365.com/Service/AreaCode/index.aspx>

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

  

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數 | 值範例                          | 必要 | 說明                                                         |
| ---- | ------------------------------- | ---- | ------------------------------------------------------------ |
| F    | GETAREA,GET_IP<br>or<br>GETAREA | 是   | 服務ID，提供以下功能，多個請用,分隔，回傳順序按照此參數順序<br>GETAREA：取得IP地區(e.g.TW)<br>GET_IP：取得IP(e.g.1.2.3.4) |
| V    | 203.69.241.3                    |      | IP位置                                                       |
| V2   | TW                              |      | 指定地區可加快搜尋速度，例如在台灣只想知道是否為海內外就輸入TW |
| G    | 40044                           | 是   | 遊戲編號，若之後有問題方便追查來源遊戲(請洽網頁組提供)       |



回傳值：

1.F參數內有GETAREA有找到地區回傳 [ISO 3166-1 Alpha-2
code](http://igsweb/My_Page.aspxhttps:/en.wikipedia.org/wiki/List_of_ISO_3166_country_codes)。e.g.TW(台灣)、CN(大陸)，若是沒找到對應地區則回傳-(未被定義的地區)

2.F參數內有GET_IP則回傳呼叫端IP，提供給App取得Client
IP使用(可能因為網路環境無法在Client取得正確IP)。e.g. 1.2.3.4

舉例1：<http://ex.gt.web/Service/AreaCode/index.aspx?F=GETAREA,GET_IP&G=40044>
回傳值：

```
TW,1.2.3.4
```

舉例2：http://ex.gt.web/Service/AreaCode/index.aspx?F=GETAREA&G=40044
回傳值：

```
TW
```



## 14.提供查詢是否符合三個月內首消資格API

驗證網址：<http://system-agent.gt.web/Service/Member/index.aspx>

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數 | 值範例     | 必要 | 說明                                                         |
| ---- | ---------- | ---- | ------------------------------------------------------------ |
| F    | ISFIRSTBUY | 是   | 服務ID                                                       |
| V1   | 774737     | 是   | 會員編號                                                     |
| V2   | 30         | 是   | 天數                                                         |
| V3   | 2          | 是   | DepositOptionNo<br>參考GameTower_Member.dbo. STOREDVALUE_DepositOption |



回傳：

| CODE | MESSAGE    |
| ---- | ---------- |
| 0    | 無首消資格 |
| 1    | 有首消資格 |



範例：

```0
0
```

或

```1
1
```



## 15.提供建立啟動帳號序號API

驗證網址：[http://system-agent.gt.web/Service/Member/SerialNumber.aspx](http://system.agent.gt.web/Service/Member/SerialNumber.aspx)

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數 | 值範例        | 必要                                  | 說明                                                         |
| ---- | ------------- | ------------------------------------- | ------------------------------------------------------------ |
| F    | GET_SERIAL_NO | 是                                    | 服務ID<br>e.g：<br>GET_SERIAL_NO<br>(產生啟動碼) <br>GET_CYO_EDM_SERIAL_NO<br>(產生啟動碼含遊戲給獎) <br>GET_SERIAL_NO_EXIST<br>(取得已先產出序號) <br>GET_SERIAL_NO_EXIST_BY_MEMBER_NO<br>(取得某會員序號) <br>GET_LIKE_SERIAL_NO_EXIST_BY_MEMBER_NO<br>(檢查會員是否已獲得指定相似類別下的序號) <br>UPDATE_LIKE_SERIAL_NO_EXIST_BY_MEMBER_NO<br>(檢查會員是否已獲得指定相似類別下的序號) <br>UPDATE_SERIAL_NO_EXIST_BY_MEMBER_NO<br>(檢查會員是否已獲得單一類別下的序號) |
| V1   | 11            | 是                                    | 啟動碼Class<br>參考 GameTower_Member.dbo. ACTION_TestSerialNumberList.[ CLASS_NO] |
| V2   | XXXXX         | 若服務ID為GET_CYO_EDM_SERIAL_NO則必填 | 活動ID(研發端提供)                                           |
| V3   | 774737        | 若服務ID與會員資訊有關的話則必填      | 會員編號                                                     |



回傳值：

``` 
序號 或 錯誤資訊( err:XXXXX)
```



## 16.提供建立排行榜API

驗證網址：[http://system-agent.gt.web/Service/Rank/index.aspx](http://system.agent.gt.web/Service/Rank/index.aspx)

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數 | 值範例         | 必要                           | 說明                                                         |
| ---- | -------------- | ------------------------------ | ------------------------------------------------------------ |
| F    | RANK_AddNewSet | 是                             | 服務ID<br>e.g：<br>RANK_AddNewSet <br>RANK_AddNewScore       |
| V1   |                | 是                             | 參數1<br>若服務ID：RANK_AddNewSet 則 排行榜ID (GameTower_Web.dbo.RANK_Mainset.[ID]) <br>若服務ID：RANK_AddNewScore 則 主排行榜設定之識別碼(GameTower_Web.dbo.RANK_GUILD_Result.[ID]) <br>值的長度 >= 4 |
| V2   |                | 是                             | 參數2<br>若服務ID：RANK_AddNewSet 則 排行榜名稱 (GameTower_Web.dbo.RANK_Mainset.[SUBJECT]) <br>若服務ID：RANK_AddNewScore 則 排行榜History名稱(GameTower_Web.dbo. RANK_GUILD_History.[NAME]) |
| V3   |                | 若服務ID為RANK_AddNewSet則必填 | 參數3<br>若服務ID：RANK_AddNewSet 則 自訂標題 1 (GameTower_Web.dbo.RANK_Mainset.[CUSTOM_TITLE_1]) <br>若服務ID：RANK_AddNewScore 則 排行榜History說明(GameTower_Web.dbo. RANK_GUILD_History. [DESCRIPTION]) |
| V4   |                |                                | 參數4<br>若服務ID：RANK_AddNewSet 則 自訂標題 2 (GameTower_Web.dbo.RANK_Mainset.[CUSTOM_TITLE_2]) <br>若服務ID：RANK_AddNewScore 則 排行榜關連網址說明(GameTower_Web.dbo. RANK_GUILD_History.[LINK_TAG]) |
| V5   |                |                                | 參數5<br>若服務ID：RANK_AddNewSet 則 自訂標題 3 (GameTower_Web.dbo.RANK_Mainset.[CUSTOM_TITLE_3]) <br>若服務ID：RANK_AddNewScore 則 排行榜關連網址(GameTower_Web.dbo. RANK_GUILD_History.[LINK_URL]) |
| V6   |                |                                | 參數6<br>若服務ID：RANK_AddNewSet 則 自訂標題 4 (GameTower_Web.dbo.RANK_Mainset.[CUSTOM_TITLE_4]) <br>若服務ID：RANK_AddNewScore 則 排行榜關連視窗跳出旗標(GameTower_Web.dbo. RANK_GUILD_History.[LINK_POP_FLAG]) |
| V7   |                |                                | 參數7<br>若服務ID：RANK_AddNewSet 則 自訂標題 5 (GameTower_Web.dbo.RANK_Mainset.[CUSTOM_TITLE_5]) <br>若服務ID：RANK_AddNewScore 則 排行榜關連網址視窗參數(GameTower_Web.dbo. RANK_GUILD_History.[ LINK_ARGUMENTS]) |
| V8   |                |                                | 參數8<br>若服務ID：RANK_AddNewSet 則 排行榜註解 (GameTower_Web.dbo.RANK_Mainset.[DESCRIPTION]) <br>若服務ID：RANK_AddNewScore 則 名次欄位資料(GameTower_Web.dbo. RANK_GUILD_Result.[RANK_NUM]) |
| V9   |                | 若服務ID為RANK_AddNewSet則必填 | 參數9<br>若服務ID：RANK_AddNewSet 則 [歷史列表筆數] 列出排行期間數量(GameTower_Web.dbo.RANK_Mainset.[HISTORY_LIST_AMOUNT]) <br>值必須 >0 and <=100 |
| V10  |                |                                | 參數10<br>若服務ID：RANK_AddNewSet 則 到期日 (GameTower_Web.dbo.RANK_Mainset.[STOP_DATETIME]) |



**回傳值： **

```
代碼表CODE 或 錯誤資訊( err:XXXXX)
```

RANK_AddNewSet 代碼表：

| CODE | MESSAGE                                                   |
| ---- | --------------------------------------------------------- |
| 0    | 新增完成                                                  |
| -1   | 排行榜ID重複                                              |
| -6   | 歷史列表筆數錯誤(需>0且<=100)                             |
| -7   | 第一個資料自訂欄位長度不得小於1 (至少有一個字元當作TITLE) |
| -8   | 排行榜主題抬頭長度不得小於4 (降低重複率)                  |
| -9   | 排行榜主題的識別ID長度不得小於4 (降低識別ID重複率)        |
| -999 | 其他錯誤                                                  |

RANK_GUILD_AddNewScore 代碼表：

| CODE | MESSAGE                                 |
| ---- | --------------------------------------- |
| 0    | 新增完成                                |
| -1   | 找不到相關排行榜主題的ID                |
| -2   | 插入排行榜名稱類別失敗                  |
| -3   | 第一個欄位的資料不得為NULL              |
| -4   | 發佈旗標數值只能為 0(不發佈) 或 1(發佈) |
| -5   | 排行榜名稱的長度不得小於4               |
| -6   | 識別ID的長度不得小於4                   |
| -999 | 其他錯誤                                |



## 17.讀取特定區域的廣告清單API

驗證網址：<http://ex.gt.web/common/receive/AD/x_GetADList.aspx>

傳遞參數方式：
| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格   | 是否必填 | 描述                                                         |
| -------- | ------ | -------- | ------------------------------------------------------------ |
| AreaID   | String | 是       | 廣告區域ID GameTower_Web.dbo.AD_Area.ID                      |
| Width    | Int    | 否       | 寬度，預設值：468                                            |
| Height   | Int    | 否       | 高度，預設值：60                                             |
| Target   | String | 否       | 開始視窗方式，預設值：_blank                                 |
| Alt      | String | 否       | 圖片說明文字，預設值：AD_DESCRIPTION                         |
| Count    | Int    | 否       | 回傳筆數 預設值：1                                           |
| Model    | Int    | 否       | 模式<br> 0：低於Count數不補滿 <br> 1：低於Count數補滿 <br> 2：資料庫有幾筆撈幾筆<br>，預設值：1 |
| OutType  | String | 否       | 輸出格式 XML 、 JSON，預設值：XML                            |



XML回傳範例：

A. 成功

Response.Write XML 格式於畫面上

```xml
<?xml version="1.0" encoding="utf-8"?>
<Root 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="gt2.xsd">
    <AD>
        <URL>
            <![CDATA[http://www.gt.web/action/00_GT/20081230P/120x120.gif]]>
        </URL>
        <LINK_URL>
            <![CDATA[http://www.gt.web/]]>
        </LINK_URL>
        <IN_FRAME_LINK_URL>
            <![CDATA[http://www.gt.web/?inframe=1]]>
        </IN_FRAME_LINK_URL>
        <TYPE>
            <![CDATA[1]]>
        </TYPE>
        <ACTION_START_DATETIME>
            <![CDATA[2014/05/23]]>
        </ACTION_START_DATETIME>
        <ACTION_END_DATETIME>
            <![CDATA[2014/05/24]]>
        </ACTION_END_DATETIME>
    </AD>
</Root>
```

B. 錯誤-未帶入AreaID參數

```xml
<?xml version="1.0" encoding="utf-8"?>
<Root 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="gt2.xsd">
[AreaID]參數輸入錯誤!!
</Root>
```

C. 該區域後端廣告設定筆數為0

```xml
<?xml version="1.0" encoding="utf-8"?>
<Root 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="gt2.xsd">
   <AD>
        <URL>
            <![CDATA[http://ad.gt.web/Graphics/GAMETOWER.jpg]]>
        </URL>
        <LINK_URL>
            <![CDATA[]]>
        </LINK_URL>
        <IN_FRAME_LINK_URL>
            <![CDATA[]]>
        </IN_FRAME_LINK_URL>
        <TYPE>
            <![CDATA[0]]>
        </TYPE>
        <ACTION_START_DATETIME>
            <![CDATA[]]>
        </ACTION_START_DATETIME>
        <ACTION_END_DATETIME>
            <![CDATA[]]>
        </ACTION_END_DATETIME>
    </AD>
</Root>
```



JSON回傳範例：

A. 成功

Response.Write JSON 格式於畫面上

```json
{"AD":
	[{
		"NO":"591",
		"PICTURE_URL":"http://ad.gt.web/Action/01_Freeplay/20130729J/630x150.jpg",
		"LINK_URL":"http://ad.gt.web/",
		"TYPE":1,
		"ACTION_START_DATETIME":"2014/05/23",
		"ACTION_END_DATETIME":"2014/05/24"
	}]
}
```

B. 錯誤-未帶入AreaID參數

```json
[AreaID]參數輸入錯誤!!
```

C. 該區域後端廣告設定筆數為0

```json
{"AD":
	[{
		"NO":"0",
		"PICTURE_URL":"http://ad.gt.web/Graphics/GAMETOWER.jpg",
		"LINK_URL":"",
		"TYPE":,
		"ACTION_START_DATETIME":"",
		"ACTION_END_DATETIME":""
	}]
} 
```



## 18.簡易領奬 - 提供給外部單位建單API

驗證網址：[http://system-agent.gt.web/Prize/GainLiteRealPrize.aspx](http://system.agent.gt.web/Prize/GainLiteRealPrize.aspx)

簡易領獎
後端工具(開發機)：<https://admin.gt.web/common/admin/Member/SetLiteRealPrizeApply.aspx>

取得 lc
加密字串公用程式(開發機)：<https://admin.gt.web/common/admin/Utility/GetLoginCode.aspx>

領獎專區(開發機)：<https://www.gt.web/Prize/Action.aspx?mode=0>

傳遞參數方式：
| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**是**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱        | 規格   | 是否必填                                      | 描述                                                         |
| --------------- | ------ | --------------------------------------------- | ------------------------------------------------------------ |
| lc              | String | 是                                            | 登入碼                                                       |
| UseLastUserData | String | 是                                            | [旗標]延用最後一筆有效交易的個資？ true OR false             |
| NameC           | String | 如UseLastUserData為True的話則[否]，反之為[是] | 姓名                                                         |
| PhoneNumber     | String | 如UseLastUserData為True的話則[否]，反之為[是] | 電話                                                         |
| Address         | String | 如UseLastUserData為True的話則[否]，反之為[是] | 聯絡地址                                                     |
| EMail           | String | 否                                            | 電子郵件信箱                                                 |
| IP              | String | 是                                            | 客戶IP位址                                                   |
| Source          | Int    | 是                                            | 來源 MEMBER_LiteRealPrizeApply.SOURCE<br> (若為金好康零錢包呼叫, 請呼叫端傳入 1) |
| SourceOrderNo   | Int    | 是                                            | 來源單號 MEMBER_LiteRealPrizeApply.SOURCE_ORDER_NO<br> (若為金好康零錢包呼叫, 請呼叫端傳入 ShopItemsHistory.IndexNo) |
| SourceUserID    | String | 是                                            | 來源會員識別碼 MEMBER_LiteRealPrizeApply.SOURCE_USER_ID<br> (若為金好康零錢包呼叫, 請呼叫端傳入 "會員識別碼") |
| PrizeID         | String | 是                                            | 獎項識別代碼 GameTower_Member.dbo.PRIZE_PrizeData.ID<br> (若為金好康零錢包呼叫, 請呼叫端傳入 ItemData.ProviderItemCode) |
| ModuleNo        | Int    | 是                                            | 獲獎單元編號 GameTower_Member.dbo.PRIZE_Prizewinner.PRIZE_MODULE_CODE_NO<br> (若為金好康零錢包呼叫, 請呼叫端傳入 26) |
| ValidDays       | Int    | 是                                            | 有效天數 g.dtNow.AddDays(f_nValidDays) = GameTower_Member.dbo.PRIZE_Prizewinner.DRAW_DEADLINE<br> (若為金好康零錢包呼叫, 請呼叫端傳入 30) |
| Description     | String | 是                                            | 領獎中心獲獎描述 GameTower_Member.dbo.PRIZE_Prizewinner.DESCRIPTION<br> (若為金好康零錢包呼叫, 請呼叫端傳入 "金好康零錢包 積分兌換獲得【???? x 1】",其中 ???? 為呼叫端的獎項名稱) |



錯誤代碼表：

| 編號 | 描述                                                    |
| ---- | ------------------------------------------------------- |
| 0    | 成功                                                    |
| -1   | 登入碼錯誤                                              |
| -2   | 獲獎單元編號錯誤(ModuleNo)                              |
| -3   | 獎項識別代碼錯誤(PrizeID)                               |
| -4   | 缺少必要參數值                                          |
| -5   | 參數格式錯誤                                            |
| -6   | 延用最後一筆有效交易的個資參數錯誤，請輸入true OR flase |
| -7   | 無最後一筆有效交易的個資資料                            |
| -8   | Email格式不合法                                         |
| -9   | 連線中斷                                                |
| -10  | 撈取延用上一筆成功資料發生錯誤                          |
| -11  | 建立記錄發生錯誤                                        |
| -12  | 查無會員資料                                            |
| -99  | 其他錯誤                                                |

 

回傳範例：

```json
{
　"ReturnCode" : {處理結果代碼},　　// 0 : 成功
　"ReturnMessage" : "{處理結果訊息}",
　"Data" :
　{
　　"No" : XXX,
　　"Name" : "XXX",
　　"Phone" : "09XXXXXX",
　　"Address" : "XX市XX區XXXX",
　　"EMail" : "XXX@XXXXX.com"
　}
}
```



## 19.簡易領奬 - 列舉給獎清單API

驗證網址：[http://system-agent.gt.web/Prize/GetLiteRealPrizeList.aspx](http://system.agent.gt.web/Prize/GetLiteRealPrizeList.aspx)

傳遞參數方式：
| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

 

串接單位是否需要允許個資同意機制：**是**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格   | 是否必填 | 描述                                                         |
| -------- | ------ | -------- | ------------------------------------------------------------ |
| lc       | String | 是       | 登入碼                                                       |
| Source   | Int    | 是       | 來源 MEMBER_LiteRealPrizeApply.SOURCE<br> (若為金好康零錢包呼叫, 請呼叫端傳入 1) |



錯誤代碼表：

| 編號 | 描述           |
| ---- | -------------- |
| 0    | 成功           |
| -1   | 登入碼錯誤     |
| -2   | 查無會員資料   |
| -4   | 缺少必要參數值 |
| -5   | 參數格式錯誤   |
| -6   | 參數數量不符   |
| -9   | 連線中斷       |
| -99  | 其他錯誤       |

回傳範例：

```json
{
　"ReturnCode" : {處理結果代碼},　　// 0 : 成功
　"ReturnMessage" : "{處理結果訊息}",
　"Data" :
　{
　　"No" : XXX,
　　"Name" : "XXX",
　　"Phone" : "09XXXXXX",
　　"Address" :  "XX市XX區XXXX",
　　"EMail" : "XXX@XXXXX.com"
　},
  "Data" :
　{
　　"No" : XXX,
　　"Name" : "XXX",
　　"Phone" : "09XXXXXX",
　　"Address" :  "XX市XX區XXXX",
　　"EMail" : "XXX@XXXXX.com"
　},.....等等
}
```



20.公布轉蛋獎項

驗證網址：

<http://www.gt.web/common/receive/Prize/AnnounceGashaponPrize.aspx>

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格   | 是否必填 | 描述                                            |
| -------- | ------ | -------- | ----------------------------------------------- |
| wn       | String | 是       | 36 進位字串得獎編號(PRIZE_PrizeWinner.INDEX_NO) |
| format   | string | 是       | 回傳格式 QUERY_STRING(預設) / XML / JSON        |



輸出格式：

成功回傳：

QUERY_STRING 格式：

```
rt=1&pWinnerNo={轉蛋次數記錄編號}&prizeInfo={獎項資訊}&collection={收集獎資訊}
```



XML 格式：

```xml
<?xml version="1.0" encoding="utf-8"?>
	<ROOT>
		<RETURN_CODE>1</RETURN_CODE>
		<RECORD>
			<INDEX_NO>{轉蛋次數記錄編號}</INDEX_NO>
			<NAME>{獎項名稱}</NAME>
			<AMOUNT>{獲獎數量}</AMOUNT>
			<UNIT>{獎品單位}</UNIT>
			<DESCRIPTION>{活動簡述}</DESCRIPTION>
			<GAME_ITEM_NO>{遊戲道具編號}</GAME_ITEM_NO>
			<ICON_URL>{獎品圖片網址}</ICON_URL>
			<MODULE_NO>{機台編號}</MODULE_NO>
			<PRIZE_NO>{獎品編號}</PRIZE_NO>
				<SPECIAL_FLAG>{特殊獎項旗標}</SPECIAL_FLAG>
			<VIRTUAL_FLAG>{虛擬獎旗標}</VIRTUAL_FLAG>
			<SPECIAL_PRIZE_ICON_URL>{超級大獎圖示網址}</SPECIAL_PRIZE_ICON_URL>
		</RECORD>
		<COLLECTION_RECORD>
			<NAME>{收集獎獎項名稱}</NAME>
			<AMOUNT>{獲獎數量}</AMOUNT>
			<UNIT>{獎品單位}</UNIT>
			<GAME_ITEM_NO>{遊戲道具編號}</GAME_ITEM_NO>
			<ICON_URL>{獎品圖示網址}</ICON_URL>
			<MODULE_NO>{機台編號}</MODULE_NO>
			<PRIZE_NO>{獎品編號}</PRIZE_NO>
			<SPECIAL_PRIZE_ICON_URL>{超級大獎圖示網址}</SPECIAL_PRIZE_ICON_URL>
		</COLLECTION_RECORD>
	</ROOT>
```



JSON 格式：

```json
{
		"RETURN_CODE":1,
		"RECORD":[
			{
				"INDEX_NO":2654400,
				"NAME":"ｉ幣",
				"AMOUNT":100000,
				"UNIT":"枚",
				"DESCRIPTION":"【四喜蛋】轉蛋抽獎",
				"GAME_ITEM_NO":1,
				"ICON_URL":"",
				"MODULE_NO":1613,
				"PRIZE_NO":2,
				"SPECIAL_FLAG":0,
				"VIRTUAL_FLAG":1,
				"SPECIAL_PRIZE_ICON_URL":""
			},
			{
				"INDEX_NO":2654399,
				"NAME":"拐杖糖",
				"AMOUNT":1,
				"UNIT":"枚",
				"DESCRIPTION":"【四喜蛋】轉蛋抽獎",
				"GAME_ITEM_NO":6653,
				"ICON_URL":"",
				"MODULE_NO":1613,
				"PRIZE_NO":28372,
				"SPECIAL_FLAG":0,
				"VIRTUAL_FLAG":1,
				"SPECIAL_PRIZE_ICON_URL":""
			},
			{
				"INDEX_NO":2654397,
				"NAME":"禮物襪",
				"AMOUNT":1,
				"UNIT":"枚",
				"DESCRIPTION":"【四喜蛋】轉蛋抽獎",
				"GAME_ITEM_NO":6664,
				"ICON_URL":"",
				"MODULE_NO":1613,
				"PRIZE_NO":28383,
				"SPECIAL_FLAG":1,
				"VIRTUAL_FLAG":1,
				"SPECIAL_PRIZE_ICON_URL":""
			}
		],
		"COLLECTION_RECORD":[
			{
				"NAME":"耶誕樹",
				"AMOUNT":1,
				"UNIT":"枚",
				"GAME_ITEM_NO":6665,
				"ICON_URL":"",
				"MODULE_NO":0,
				"PRIZE_NO":28384,
				"SPECIAL_PRIZE_ICON_URL":""
			}
		]
	}
```



失敗回傳：

QUERY_STRING 格式：

```
rt=-99&msg={錯誤訊息}
```



XML 格式：

```xml
<?xml version="1.0" encoding="utf-8"?>
	<ROOT>
		<RETURN_CODE>-99</RETURN_CODE>
		<RETURN_MESSAGE>{錯誤訊息}</RETURN_MESSAGE>
	</ROOT>
```



JSON 格式：

```json
{"RETURN_CODE":-99,"RETURN_MESSAGE":"{錯誤訊息}"}
```



## 21.取得目前有效轉蛋機台獎品清單

驗證網址：

<http://www.gt.web/common/receive/Prize/GetGashaponPrizeList.aspx>

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格   | 是否必填 | 描述        |
| -------- | ------ | -------- | ----------- |
| id       | String | 是       | 機台群組 ID |

  

輸出格式：

成功回傳：

```xml
<?xml version="1.0" encoding="utf-8"?>
<ROOT>
<RETURN_CODE>0</RETURN_CODE>
<GASHAPON>
	<INDEX_NO>{機台編號}</INDEX_NO>
	<DESCRIPTION>{機台描述}</DESCRIPTION>
	<START_DATETIME>{開始時間}</START_DATETIME>
	<END_DATETIME>{開始時間}</END_DATETIME>
	<PRIZE>
		<ITEM>
			<NAME>{獎品名稱}</NAME>
			<AMOUNT>{獎品數量}</AMOUNT>
			<ICON_URL>{獎品圖片網址}</ICON_URL>
			<PRIZE_NO>{獎品編號}</PRIZE_NO>
			<SPECIAL_FLAG>{是否為特殊獎}</SPECIAL_FLAG>
			<PRICE>{獎品價值}</PRICE>
			<VIRTUAL_FLAG>{虛擬獎旗標}<VIRTUAL_FLAG>
			<UNIT>{單位}</UNIT>
			<GAME_ITEM_NO>{遊戲道具編號}</GAME_ITEM_NO>
		<SPECIAL_PRIZE_ICON_URL>{超級大獎圖示網址}</SPECIAL_PRIZE_ICON_URL>
		</ITEM>
	</PRIZE>
</GASHAPON>
</ROOT>
```



失敗回傳：

```xml
<?xml version="1.0" encoding="utf-8"?>
<ROOT>
	<RETURN_CODE>-99</RETURN_CODE>
	<RETURN_MESSAGE>{錯誤訊息}</RETURN_MESSAGE>
</ROOT>
```



## 22.取得未使用轉蛋次數

驗證網址：

<http://www.gt.web/common/receive/Prize/GetGashaponRecord.aspx>

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格   | 是否必填 | 描述                    |
| -------- | ------ | -------- | ----------------------- |
| lc       | String | 是       | lc 字串                 |
| id       | string | 是       | 機台群組 ID             |
| l        | int    | 否       | 列表比數，預設為 999999 |



輸出格式：

成功回傳：

```xml
<?xml version="1.0" encoding="utf-8"?>
<ROOT>
	<RETURN_CODE>0</RETURN_CODE>
	<RECORD>
		<INDEX_NO>{特殊處理後的轉蛋次數記錄編號}</INDEX_NO>
		<MODULE_NO>{機台編號}</MODULE_NO>
		<DESCRIPTION>{活動簡述}</DESCRIPTION>
		<ANNOUNCE_FLAG>{是否已使用}</ANNOUNCE_FLAG>
		<C_DATETIME>{獲獎時間}</C_DATETIME>
		<DRAW_DEADLINE>{有效時間}<DRAW_DEADLINE>
	</RECORD>
</ROOT>
```



失敗回傳：

```xml
<?xml version="1.0" encoding="utf-8"?>
<ROOT>
	<RETURN_CODE>-99</RETURN_CODE>
	<RETURN_MESSAGE>{錯誤訊息}</RETURN_MESSAGE>
</ROOT>
```



## 23.取得問題回報分類

驗證網址：

<http://www.gt.web/common/receive/BugReport/GetClassList.aspx>

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格   | 是否必填 | 描述                                                         |
| -------- | ------ | -------- | ------------------------------------------------------------ |
| game     | string | 是       | 遊戲代碼，關聯 GameTower_Member.FAQ_CLASS                    |
| lan      | string | 否       | 顯示的語系，關聯 GameTower_Member.dbo.CODE_Language.ID<br>(EX：TW、CN、EN，預設為TW) |



回傳資料：

| 參數名稱 | 規格   | 是否必填 | 描述                                                         |
| -------- | ------ | -------- | ------------------------------------------------------------ |
| CLASS_NO | int    | 是       | 該分類流水碼                                                 |
| NAME     | string | 是       | 分類名稱(會依照傳入的語系參數進行多國語系切換，若無該語系資訊或是沒有帶語系的傳入值接預設為中文(TW)) |
| CLASS_ID | string | 是       | 分類ID                                                       |
| LANGAGE  | string | 是       | 回傳的分類名稱所使用的語系，方便研發端判斷遊戲申請的問題回報分類有無設定多國語系 |

  

輸出格式：

成功回傳：

```json
[
  {
    "CLASS_NO": 688,
    "NAME": "1.會員申請認證相關問題",
    "CLASS_ID": "GREATQUEEN_1MEMBER"
    "LANGUAGE": "TW"

  },
  {
    "CLASS_NO": 689,
    "NAME": "2.儲值點數相關問題",
    "CLASS_ID": "GREATQUEEN_2BANK"
     "LANGUAGE": "TW"
  },
  {
    "CLASS_NO": 690,
    "NAME": "3.包月活動相關問題",
    "CLASS_ID": "GREATQUEEN_3MONTH"
     "LANGUAGE": "TW"
  },
  {
    "CLASS_NO": 691,
    "NAME": "4.活動領獎相關問題",
    "CLASS_ID": "GREATQUEEN_4PRIZE"
     "LANGUAGE": "TW"
  },
  {
    "CLASS_NO": 692,
    "NAME": "5.遊戲設定相關問題",
    "CLASS_ID": "GREATQUEEN_5GAMESET"
     "LANGUAGE": "TW"
  },
  {
    "CLASS_NO": 693,
    "NAME": "6.通訊安全鎖相關問題",
    "CLASS_ID": "GREATQUEEN_6SLOCK"
     "LANGUAGE": "TW"
  },
  {
    "CLASS_NO": 694,
    "NAME": "7.遊戲斷線相關問題",
    "CLASS_ID": "GREATQUEEN_7OFFLINE"
     "LANGUAGE": "TW"
  }
]
```

失敗回傳：

```json
-1
```



## 24.取得會員是否同意過個資保護政策

驗證網址：

<http://www.gt.web/common/receive/UserAgreement/GetUserAgreement.aspx>

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格 | 是否必填 | 描述                              |
| -------- | ---- | -------- | --------------------------------- |
| memberno | int  | 是       | 會員編號，非 gametower 會員填入 0 |

  

輸出格式：

成功且已同意過個資保護政策

```json
{"SHOW_USER_AGREEMENT":"False","USER_AGREEMENT_CONTENT":""}
```



成功但未個資保護政策

```json
{"SHOW_USER_AGREEMENT":"True","USER_AGREEMENT_CONTENT":"{個資保護政策內容}"}
```



失敗回傳：

```json
-1
```



## 25.抓取指定幣別匯率

驗證網址：

<http://bank.gt.web/common/receive/Service/GetCurrencyRate.aspx>

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

http://bank.gt.web/common/receive/service/GetCurrencyRate.aspx?id=幣別代碼A,幣別代碼B,\...,幣別代碼N&type=JSON或XML或URL或空值

| 參數名稱 | 規格   | 是否必填 | 描述                                 |
| -------- | ------ | -------- | ------------------------------------ |
| ID       | String | 是       | 欲查詢之幣別代碼(e.g USD、CNY...etc) |
| TYPE     | string | 否       | 回傳格式 url / xml/ json             |

 

回傳範例：

JSON：

```json
{"USD":31.25,"CNY":5.011}
```



XML：

```xml
<?xml version="1.0" encoding="utf-8"?>
　　　<root>
　　　　<item>
　　　　　<currency>USD</currency>
　　　　　<rate>31.25</rate>
　　　　</item>
　　　　<item>
　　　　　<currency>CNY</currency>
　　　　　<rate>5.011</rate>
　　　　</item>
　　　</root>
```



URL：

```
USD=31.25&CNY=5.011
```

　　　

## 26.由電話號碼判斷是否遊戲VIP會員API

使用時機：當玩家使用手機 or
市話撥打客服電話時，可以透過總機系統呼叫此API判斷玩家是否為遊戲VIP

網址：

<http://callcenter-agent.gt.web/Call.asmx>

傳遞參數方式：
| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱         | 規格   | 是否必填 | 描述             |
| ---------------- | ------ | -------- | ---------------- |
| _strCallerNumber | String | 是       | 發話端的電話號碼 |
| _strCalledNumber | string | 是       | 接收端的電話號碼 |



回傳資料：

| 參數名稱             | 規格    | 是否必填 | 描述          |
| -------------------- | ------- | -------- | ------------- |
| CheckVIPMethodResult | Boolean | 是       | 是否為遊戲VIP |

  

傳送範例：

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <CheckVIPMethod xmlns="http://tempuri.org/">
      <_strCallerNumber>0975177703</_strCallerNumber>
      <_strCalledNumber>229906162</_strCalledNumber>
    </CheckVIPMethod>
  </soap12:Body>
</soap12:Envelope>
```



回傳範例：

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope 
    xmlns:soap="http://www.w3.org/2003/05/soap-envelope" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <soap:Body>
        <CheckVIPMethodResponse 
            xmlns="http://tempuri.org/">
            <CheckVIPMethodResult>true</CheckVIPMethodResult>
        </CheckVIPMethodResponse>
    </soap:Body>
</soap:Envelope>
```



## 27.Win32版本Facebook登入API

使用時機：

提供 Win32 版本遊戲串接 Facebook 登入

網址：

[https://www.facebook.com/dialog/oauth?client_id={facebook_app_id}&response_type=token&redirect_uri=http%3a%2f%2fma.gt.web%2fWebs%2fFacebook2%2fMember%2fauth.aspx%3fcomefrom%3dGT%26mode%3d4%26app_id%3d{facebook_app_id}%26re%3d{url_encode(url_encode(研發端接收結果的網址))}](https://www.facebook.com/dialog/oauth?client_id=%7bfacebook_app_id%7d&response_type=token&redirect_uri=http%3a%2f%2fma.gt.web%2fWebs%2fFacebook2%2fMember%2fauth.aspx%3fcomefrom%3dGT%26mode%3d4%26app_id%3d%7bfacebook_app_id%7d%26re%3d%7burl_encode(url_encode(研發端接收結果的網址)))

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱                                       | 規格   | 是否必填 | 描述                                             |
| ---------------------------------------------- | ------ | -------- | ------------------------------------------------ |
| {facebook_app_id}                              | String | 是       | facebook 應用程式 id，開發、測試、正式環境皆不同 |
| {url_encode(url_encode(研發端接收結果的網址))} | String | 是       | 最後會後導向的網址，做兩次 url_encode            |

 

回傳資料：

| 參數名稱 | 規格   | 是否必填 | 描述    |
| -------- | ------ | -------- | ------- |
| lc       | string | 是       | lc 字串 |

 

傳送範例：

https://www.facebook.com/dialog/oauth?display=popup&client_id=884082364999788&response_type=token&redirect_uri=http%3a%2f%2fma.gt.web%2fWebs%2fFacebook2%2fMember%2fauth.aspx%3fcomefrom%3dGT%26mode%3d4%26app_id%3d884082364999788%26re%3dhttp%253A%252F%252Fwww.gt.web%252FGames%252FFreePlay%252FShortcut%252Findex.aspx

回傳範例：

成功會轉址到研發提供接收結果的網址

http://www.gt.web/Games/FreePlay/Shortcut/index.aspx?lc=09047E7B7F8A807A4A7B4A4A7B837C4A7B7C4A824A827A7B4A90827A7E8C7A7B72&ha=1&lobby=fb&app_id=884082364999788&signed_request=&ActionID=&forad=&token=&comefrom=&FirstLoginAction=&FromMA=1

失敗可依遊戲設定，再次轉址到 fb 驗證頁面，或是轉址到 gametower 官網

http://www.gametower.com.tw/



## 28.查詢指定 IP 是否在 IP 維護分類中

使用時機：

提供查詢指定 IP 是否在 IP 維護分類中，\
相關資料表為：\[GameTower_Member\].\[dbo\].\[RESTRAIN_IP_ClassRelationList_View\]

設定工具位址：<https://admin.gt.web/common/admin/RestrainIP/index.aspx>

網址：

[http://system-agent.gt.web/Service/IPClass/index.aspx](http://system.agent.gt.web/Service/IPClass/index.aspx)

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱   | 規格   | 是否必填 | 描述                        |
| ---------- | ------ | -------- | --------------------------- |
| q_strClass | String | 是       | IP 維護分類                 |
| q_strIP    |        | String   | 是                          |
| q_eFormat  | int    | 否       | 回應格式，0 – XML，1 – JSON |



回傳資料：

| 參數名稱             | 規格    | 是否必填 | 描述                                         |
| -------------------- | ------- | -------- | -------------------------------------------- |
| RETURN_CODE          | int     | 是       | 回應代碼，0 – 正確，其他 – 錯誤              |
| RETURN_MESSAGE       | string  | 是       | 回應訊息，發生錯誤時會有錯誤訊息             |
| IP_IN_RESTRAIN_CLASS | boolean | 是       | IP 是否在指定的類別中？true – 是，false – 否 |

  

回傳範例：

成功 -- XML

```xml
<?xml version="1.0" encoding="utf-8"?>  
<ROOT>  
	<RETURN_CODE>0</RETURN_CODE>  
	<RETURN_MESSAGE></RETURN_MESSAGE>  
	<IP_IN_RESTRAIN_CLASS>true</IP_IN_RESTRAIN_CLASS>  
</ROOT> 
```

成功 -- JSON

```json
{  
	"RETURN_CODE":0,  
	"RETURN_MESSAGE":"",  
	"IP_IN_RESTRAIN_CLASS":true  
} 
```

發生錯誤 - XML

```xml
<?xml version="1.0" encoding="utf-8"?>  
<ROOT>  
	<RETURN_CODE>-1</RETURN_CODE>  
	<RETURN_MESSAGE>未傳入 q_strClass 參數。</RETURN_MESSAGE>  
	<IP_IN_RESTRAIN_CLASS>false</IP_IN_RESTRAIN_CLASS>  
</ROOT>
```

發生錯誤 -- JSON

```json
{  
	"RETURN_CODE":-1,  
	"RETURN_MESSAGE":"æœªå‚³å…¥ q_strIP åƒæ•¸ã€‚",  
	"IP_IN_RESTRAIN_CLASS":false  
} 
```



## 29.查詢指定會員的會員資料 API

驗證網址：<http://www.gt.web/common/receive/Member/GetUserData.aspx>

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

開發機範例：http://www.gt.web/common/receive/Member/GetUserData.aspx?lc={LC}&data={data}

e.g：http://www.gt.web/common/receive/Member/GetUserData.aspx?lc=010E4C4CAF7C4C82827D814C4C4C4C854C7C7E4C4C4C4C7F7D7D7D4C4C4C82851D&data=MEMBER_TYPE,MEMBER_MOBILE_VERIFY_STATUS,VERIFY_PHONE_NUMBER,VERIFY_EXPIRE_DATE,ALIAS



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格   | 是否必填   | 描述                                                         |
| -------- | ------ | ---------- | ------------------------------------------------------------ |
| lc       | String | 否(二擇一) | LC字串                                                       |
| Account  | String | 否(二擇一) | 帳號 (限定內部允許呼叫IP才能使用)                            |
| data     | String | 是         | 要求的資料，用逗號分隔，目前有提供的如下，回傳欄位定義請參考Result object |

data可傳入欄位與對應Result object欄位

| 傳入欄位                    | 回傳欄位                                          |
| --------------------------- | ------------------------------------------------- |
| MEMBER_TYPE                 | MEMBER_TYPE<br>MEMBER_TYPE_NAME<br>MEMBER_UPGRADE |
| MEMBER_MOBILE_VERIFY_STATUS | MOBILE_VERIFY_STATUS<br>IS_MEMBER_EVER_VERIFIED   |
| VERIFY_PHONE_NUMBER         | VERIFY_PHONE_NUMBER                               |
| VERIFY_EXPIRE_DATE          | VERIFY_EXPIRE_DATE                                |
| ALIAS                       | ALIAS                                             |

回傳參數說明：

| 參數           | 規格          | 說明                                      |
| -------------- | ------------- | ----------------------------------------- |
| RETURN_CODE    | String        | 處理結果，成功為"0"，其餘為失敗           |
| RETURN_MESSAGE | String        | 回覆訊息 成功  or 錯誤說明                |
| RESULT         | Result object | 要求的資料回吐( RETURN_CODE = 0 才會回傳) |



Result object

| 欄位                    | 資料名稱               | 資料類型 | 備註                                    |
| ----------------------- | ---------------------- | -------- | --------------------------------------- |
| MEMBER_TYPE             | 會員身份               | String   |                                         |
| MEMBER_TYPE_NAME        | 會員身份中文名稱       | String   |                                         |
| MEMBER_UPGRADE          | 是否可以升級為標準會員 | boolean  |                                         |
| MOBILE_VERIFY_STATUS    | 是否為已認證會員       | boolean  |                                         |
| VERIFY_PHONE_NUMBER     | 會員認證電話號碼       | String   | 中間有 * 作為隱碼                       |
| VERIFY_EXPIRE_DATE      | 會員認證過期日期       | String   | 格式為 yyyy/MM/dd                       |
| IS_MEMBER_EVER_VERIFIED | 會員是否曾經認證過     | Boolean  | True = 曾經認證過<br>False = 從未認證過 |
| ALIAS                   | 帳號別名               | String   |                                         |



回傳格式：

成功範例  

```json
{
  "RETURN_CODE": "0",
  "RETURN_MESSAGE": "成功",
  "RESULT": {
   "MEMBER_TYPE": "STANDARD_MEMBER",
   "MEMBER_TYPE_NAME": "標準會員",
   "MEMBER_UPGRADE": false,
   "MOBILE_VERIFY_STATUS": true,
   "IS_MEMBER_EVER_VERIFIED": true,
   "ALIAS":"XXX"}
}

```

失敗範例

```json
{
  "RETURN_CODE": "-1",
  "RETURN_MESSAGE": "會員編號錯誤",
  "RESULT": null
}

```



錯誤代碼表：

| 代碼 | 說明                 |
| ---- | -------------------- |
| 0    | 成功。               |
| -2   | 會員資料庫連線失敗   |
| -11  | 請帶入必要參數       |
| -31  | 「會員帳號」讀取錯誤 |
| -32  | [lc] 參數解密失敗    |
| -34  | [data] 參數錯誤      |
| -61  | 驗證lc發生異常       |



## 30.寄送E-mail API

驗證網址：[http://system-agent.gt.web/Service/Email/send.aspx](http://system.agent.gt.web/Service/Email/send.aspx)
(此API有鎖允許IP，若要串接請新增允許IP)

傳遞參數方式：
| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱      | 規格   | 是否必填 | 描述                                                         |
| ------------- | ------ | -------- | ------------------------------------------------------------ |
| f_strSubject  | String | 是       | 信件標題                                                     |
| f_strSender   | String | 是       | 寄件者 e.g. FaFaFa Slotsservice@support.gametower.com.tw<br>※信箱必需使用『<』『>』包起來且信箱資訊是必要的 |
| f_strReceiver | String | 是       | 收件者 e.g. damonhou<damonhou@igs.com.tw> 或 damonhou@igs.com.tw<br>※ 若為多個則使用分號『;』分隔 |
| f_strContent  | String | 是       | 信件內容，可使用HTML編碼                                     |



回傳參數說明：

| 參數           | 說明                                      |
| -------------- | ----------------------------------------- |
| RETURN_CODE    | 處理結果，成功為0，其餘為失敗             |
| RETURN_MESSAGE | 回覆訊息 成功  or 錯誤說明                |
| RESULT         | 要求的資料回吐( RETURN_CODE = 0 才會回傳) |



回傳格式：

成功範例

```json
{
   "RETURN_CODE": 0,
   "RETURN_MESSAGE": "成功",
   "RESULT": {
     "TOTAL":"7",
     "SUCCESS":"3",
     "FAIL":"4",
     "FAIL_MESSAG_LIST":
     [
      {
        "MESSAGE":"XXXXX"
      },
      {
        "MESSAGE":"XXXXX"
      }
     ]
   }
}
```

失敗範例

```json
{
  "RETURN_CODE": -1,
  "RETURN_MESSAGE": "缺少必要參數值",
  "RESULT": null
}
```



## 31.取得驗證碼 API

驗證網址：<http://member.gt.web/common/receive/VerifyCode.aspx>

傳遞參數方式：
| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格 | 是否必填 | 描述                      |
| -------- | ---- | -------- | ------------------------- |
| width    | int  | 否       | 驗證碼圖片寬度(預設：200) |
| height   | int  | 否       | 驗證碼圖片高度(預設：64)  |

  

回傳參數說明：

| 參數           | 說明                                         |
| -------------- | -------------------------------------------- |
| RETURN_CODE    | 處理結果，成功為0，其餘為失敗                |
| RETURN_MESSAGE | 回覆訊息 成功  or 錯誤說明                   |
| RESULT         | 要求的資料回吐( RETURN_CODE = 0 才會回傳)    |
| GUID           | 識別碼                                       |
| PICTURE_BASE64 | 驗證碼的BASE64字串(圖片大小寬高預設為200*64) |



回傳格式：

成功範例  

```json
{"RETURN_CODE":0,"RETURN_MESSAGE":"成功","RESULT":{"GUID":"75e10cb5432d4ef897b178a73af0b83f","PICTURE_BASE64":"/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAiAGQDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDz3oMmnyxSQyGOWNo3HVXGCK6jRtPs9E0xfEGtxBy3/HlZvjMpH8ZHp/8Ar9K2vEXh8X3iS71bVJRaaRDGjSzk8vhfurXM9GkWpXOOstae1i8loI3jxgDpVpNW06aIrc2Krz0RR/OrXji20+y1KztdPtBAi2qsxxgtnOM+pwP1rlz04pqTZVupvfYtJvVDw3P2dm/5Zt2qXT/CM99qkNmbuKMS5/eYJwQCcY/Cu+0rTtOvfBel2F7HCDPAqggAMZMZJB9c5NcjpOm3vh/4iabYXDu0bO5jIPyuvltyKd1zOL8zPmbhzI5e/wBOn0+9ltpFJKOyhgPvAEjP6VUrrvEmr3On+JtRthHGyLNuTcvQFVP8yaueGNN0rXLibU7yJI7W0GZ95wrueefYDn8qmNnG7ZpJ2ZxsNheXEfmQWk8qZxuSMsM/UVDJG8UjRyIyOpwysMEH3FesHx/pcLi309VEYOAWBRT9AP596w/EEdj4lsYdXTbDcRz/AGa4ZOQxIyp/zzSu9+gk9bM4GirV9ZGymCeYsgPRh3rV8JW2nXOo3p1VN1nFYyyPjquCvzD3AziqsDdjAorV1HQ57a6/0QNeWki+ZBPEhIdD0z6HsR6iio549WWoyeqQa7qcviTV5J/K/dkeXDFjhI+wx296ua/qms6taQreR7Le3iAKqeCQOWNc+CV6EjjHFKzs4IdmbK7Tk9R6fSrhZWv0IkrnWePoJpPEuUidlMCYKqT2rlvs84ODDJn02mrt9r2oahOk002HWNY8oMZC9M+vWqy6hdqf+PmQ8Ywzbh+RpRSSsPojsdZmli+HGgyKxjmS4O0jggjfXS+GdTtvFdjbXF0gOo6e43MBg5IxuHsw6j1FeX/2xetaw2ssgmt4HZ44pV3KCevH5/TJqzp+sx6Xcm4sUnt5ChVikvUHt+nWno233dyOT3Uu2hJ4xmE3i/UmXBUShQR3woB/XNWfDEf9q6fqWgJIsdxdbZ4C7EBnTqp/Cstm0+5kaWRpomJJIzuLH1zjqaWG1ZLlJdOvk8xfnQ7trr/9eiMbR5WXLXVGrpvhPxHa6pZ3P9jswjmDbZmAQ4/vHPA967HxFa+G9N0lrK83acL91kK2q7zuXvj05xWMPGuvR2hjd9O+0BhiVzjjHTHQ59a5a/jvtRvJLq+vIpJjgFnk6DsPYUnGTViUteZmUx+YgElQTtz6V1Pge2tbiXWXvFka3SwZZVTgsjdcH1+WsFdMuP4/LjHGGZxg59CKkWWbS1mW2vwryxmKZI8/Mp6jOMU7OzG9TprD4gR6Ra/YtP0WBLVGYxh5WLYJJyff1oriaKmye4cqCiiiqGFFFFABRRRSAKKKKACiiigBSzFQpY7R0GeBSUUUAFFFFAH/2Q=="}}
}
```

失敗範例 

```json
{
  "RETURN_CODE": -1,
  "RETURN_MESSAGE": "缺少必要參數值",
  "RESULT": null
}
```



## 32.驗證驗證碼 API

驗證網址：<http://member.gt.web/common/receive/VerifyCode.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格   | 是否必填 | 描述             |
| -------- | ------ | -------- | ---------------- |
| guid     | string | 是       | 識別碼           |
| code     | string | 是       | 前端輸入的驗證碼 |

  

回傳參數說明：

| 參數           | 說明                                      |
| -------------- | ----------------------------------------- |
| RETURN_CODE    | 處理結果，成功為0，其餘為失敗             |
| RETURN_MESSAGE | 回覆訊息 成功  or 錯誤說明                |
| RESULT         | 要求的資料回吐( RETURN_CODE = 0 才會回傳) |



回傳格式：

成功範例

```json
{
  "RETURN_CODE": 0,
  "RETURN_MESSAGE": "成功",
  "RESULT": null
}
```

失敗範例

```json
{
  "RETURN_CODE": -1,
  "RETURN_MESSAGE": "缺少必要參數值",
  "RESULT": null
}
OR
{
    "RETURN_CODE": -2,
    "RETURN_MESSAGE": "驗證錯誤",
    "RESULT": null
}
```



## 33.簡訊發送 API

驗證網址big5：<https://admin.gt.web/common/receive/Phone/SendBulkSMS.aspx>

驗證網址utf-8：<https://admin.gt.web/common/receive/Phone/SendBulkSMS_UTF8.aspx>

1.若要發送國外簡訊應改使用 SendBulkSMS_UTF8.aspx

2.使用big5編碼程式請使用SendBulkSMS.aspx

傳遞參數方式：
| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱              | 規格   | 是否必填 | 描述                                                         |
| --------------------- | ------ | -------- | ------------------------------------------------------------ |
| f_nModuleNo           | string | 是       | 單元代碼，需透過 http://www.webcase.web 系統申請，並提供呼叫來源 IP |
| f_strInputPhoneNumber | string | 是       | 收訊端手機號碼，例如 0987654321 或 886987654321              |
| f_strSMSContent       | string | 是       | 簡訊內文，限70個字元以內(不區分中英文)                       |

  

回傳參數說明：

| 值   | 說明                          |
| ---- | ----------------------------- |
| 0    | 成功                          |
| 1    | 失敗                          |
| 2    | 限於 admin 站台叫用           |
| 3    | 表單無資料                    |
| 4    | 未指定單元 (f_nModuleNo 無值) |
| 5    | 不許可的呼叫端                |
| 6    | 手機門號錯誤                  |
| 7    | 電話號碼建檔發生異常          |
| 8    | 簡訊內容錯誤                  |
| 9    | 代理程式呼叫失敗              |
| 10   | 資料庫連線失敗                |



回傳格式：

| 規格 | 成功範例 | 失敗範例  |
| ---- | -------- | --------- |
|      | 0        | 0以外數值 |



發送後可透過以下工具查詢：

開發

<https://admin.gt.web/common/admin/Phone/SendBulkMessage.aspx>

測試

[https://admin-twtest.towergame.com/common/admin/Phone/SendBulkMessage.aspx](https://admin.twtest.towergame.com/common/admin/Phone/SendBulkMessage.aspx)

正式

<https://admin.gametower.com.tw/common/admin/Phone/SendBulkMessage.aspx>



## 34.問題回報滿意度查詢API

驗證網址：<https://www.gt.web/common/receive/BugReport/BugReportFeedback.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

 

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱      | 規格   | 是否必填 | 描述                                            |
| ------------- | ------ | -------- | ----------------------------------------------- |
| f_nMode       | string | 是       | 單元代碼，查詢皆為1                             |
| f_nIndexNo    | string | 是       | 查詢編號為該表INDEX_NO 支援多筆 ex. 123,456,789 |
| f_strLanguage | string | 否       | 語系 預設為TW (TW-繁體 EN-英文 CN-簡體)         |

  

回傳參數說明：

| 值   | 說明              |
| ---- | ----------------- |
| 0    | 成功              |
| -1   | 伺服器連線失敗    |
| -2   | f_nIndexNo 未帶值 |
| -3   | 例外錯誤          |



回傳格式：

成功範例

```json
{"RETURN_CODE":0,"RETURN_MESSAGE":"成功。","RESULT":"[{\"INDEX_NO\":\"256\",\"SCORE_OPTIONS\":\"\",\"SUGGESTION\":\"\",\"PROCESS_STATUS\":\"8\"}]"}
```

失敗範例

```json
{"RESULT_CODE":"-2", "RESULT_MESSAGE":"搜尋欄位未帶入。"}
```



35.問題回報滿意度新增API

驗證網址：<https://www.gt.web/common/receive/BugReport/BugReportFeedback.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱          | 規格   | 是否必填 | 描述                            |
| ----------------- | ------ | -------- | ------------------------------- |
| f_nMode           | string | 是       | 單元代碼，查詢皆為0             |
| f_nIndexNo        | string | 是       | 編號為該表INDEX_NO 要回寫的編號 |
| f_strScoreOptions | string | 昰       | 基本評價                        |
| f_strSuggestion   | string | 否       | 回饋意見                        |

  

回傳參數說明：

| 值   | 說明               |
| ---- | ------------------ |
| 0    | 成功               |
| -1   | 伺服器連線失敗     |
| -2   | 找不到問題回報記錄 |
| -3   | 已回應過問卷       |
| -4   | 基本評價未帶入     |
| -5   | 基本評價定義不存在 |
| -7   | UPDATE指令失敗     |
| -8   | 例外錯誤           |
| -9   | 例外錯誤           |



回傳格式：

成功範例

```json
{"RESULT_CODE":"0", "RESULT_MESSAGE":"成功。"}
```

 失敗範例

```json
{"RESULT_CODE":"-2", "RESULT_MESSAGE":"搜尋欄位未帶入。"}
```


## 36.LINENotify警示發送 API

> 詳見 五十二、五十三



## 37.取得LINENotify 的AccessToken

> 詳見 五十二、五十三



## 38.串接RWD『問題回報』頁面

串接網頁網址：

開發機：

<http://cs.gt.web/mobile/services/ingame/bugreport/index.aspx>
(新增問題回報)

<http://cs.gt.web/mobile/services/ingame/bugreport/record.aspx>
(取得回報紀錄)

測試機：

<http://cs-twtest.towergame.com/mobile/services/ingame/bugreport/index.aspx>
(新增問題回報)

<http://cs-twtest.towergame.com/mobile/services/ingame/bugreport/record.aspx>
(取得回報紀錄)

正式機：

<http://cs.gametower.com.tw/mobile/services/ingame/bugreport/index.aspx>
(新增問題回報)

<http://cs.gametower.com.tw/mobile/services/ingame/bugreport/record.aspx>
(取得回報紀錄)



傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

or

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**是**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱   | 規格    | 是否必填 | 描述                                                         |
| ---------- | ------- | -------- | ------------------------------------------------------------ |
| CID        | string  | 是       | 遊戲分類，請參考串接該遊戲的需求工單的問題回報CLASS_ID(EX:TMD、STAR31、FAFAFA_SLOTS...etc) |
| MNO        | string  | 是       | 會員編號，若非gametower會員則帶0                             |
| NICKNAME   | string  | 是       | 遊戲中暱稱，若MNO = 0的話，該值會成為查詢回報紀錄的KEY值，非gametower的遊戲可自行定義(EX:FAFAFA_{會員編號}) |
| VL         | int     | 是       | VIP等級                                                      |
| MEMO       | string  | 是       | 行動裝置的裝置資訊(OS版號、裝置別)、app版號...etc，方便客服找問題<br>若使用GET方式請將值做UrlEncode(產生CHECK_CODE時請使用Encode前的值去參與CHECK_CODE的產生) |
| LAN        | string  | 否       | 語系 EX:TW or EN or CN，網頁會針對帶入的語系進行顯示上的語系切換，至於問題回報類別要支援多語系的規格需開工單製作 |
| PLATFORM   | int     | 是       | 廠商編號，請參考儲值中心所建立的廠商編號 BANK_CENTER_Main.dbo.CONFIG_CODE_Platform.INDEX_NO 例如 5 為 APPPORTAL_PAYCENTER 行動平台 |
| CHECK_CODE | string  | 是       | CHECK_CODE計算方式是將傳送的參數資料依照 Key 排序，將所有 Value 相加(排除 CHECK_CODE 參數)，最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA1加密並轉成大寫而成。 |
| UPLOAD     | Boolean |          | 否                                                           |

check_code範例程式

```C#
public static string GetCheckCode(NameValueCollection _csDataColl,string _strPrivateKey)
{
     StringBuilder strValue      = new StringBuilder() ;

     // 依照 Key 排序，將所有 Value 相加 (排除 CHECK_CODE 參數)
     foreach(string strKey in _csDataColl.AllKeys.OrderBy(o => o))
     {
         if (!strKey.Equals("CHECK_CODE",StringComparison.OrdinalIgnoreCase))
              strValue.Append(_csDataColl[strKey]) ;
     }
     // 最後加入私Key
     strValue.Append(_strPrivateKey) ;

     return FormsAuthentication.HashPasswordForStoringInConfigFile(strValue.ToString(),"SHA1") ;
}
```



頁面顯示：

![問題回報頁面](images\media\image4.jpeg){width="4.84375in"
height="2.4611111111111112in"}



## 39.玩家是否可購買GooglePlay管道API

驗證網址：<http://www.gt.web/common/receive/Member/CheckIsBuyToModule.aspx>

(目前僅運用在GooglePlay，判斷是否要關閉GooplePlay儲值管道，有使用的遊戲：滿貫大亨、明星三缺一)

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

  

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱    | 規格   | 是否必填 | 描述                                                         |
| ----------- | ------ | -------- | ------------------------------------------------------------ |
| lc          | string | 是       | LC字串，可用於登入gametower網站或其他用途                    |
| q_strAppID  | string | 是       | 應用程式ID(EX: com.igs.TMD)                                  |
| q_nGameNo   | int    | 昰       | 遊戲編號(EX:滿貫大亨→3012) 參考 GameTower_Member.dbo.GAME_GameProduct.INDEX_NO |
| q_nModuleNo | int    | 昰       | 儲值管道編號(EX:GooglePlay→109) 參考 GameTower_Member.dbo.STOREDVALUE_CODE_Module.INDEX_NO<br>此參數是為了方便未來擴充使用，所以目前僅支援109 |



回傳參數說明：

| 值                        | 說明                                                         |
| ------------------------- | ------------------------------------------------------------ |
| RETURN_CODE               | 0-成功  其他為錯誤                                           |
| RETURN_MESSAGE            | 成功  or 錯誤說明                                            |
| RESULT                    | 其他欄位為要求的資料回吐 ( RETURN_CODE = 0 才會回傳，否則為null) |
| IS_BUY_THIRD_PARTY        | 是否可購買第三方儲值管道?!                                   |
| IS_OVER_GOOGLE_PLAY_LIMIT | 是否超過(>=)GooglePlay儲值上限?! 該上限由網頁組於後端系統參數設定定義各遊戲的儲值上限 |
| MONTH_TRANS_VALUE         | 目前玩家於GooglePlay月消費已達多少?!                         |
| SET_LIMIT_VALUE           | 設定的月儲值上限為何?! 0為無上限                             |



回傳格式：

成功範例

```json
{
 "RETURN_CODE": 0,
 "RETURN_MESSAGE": "成功",
 "RESULT": {
	"IS_BUY_THIRD_PARTY": true,
	"IS_OVER_GOOGLE_PLAY_LIMIT": true
	"MONTH_TRANS_VALUE": 1999,			
	"SET_LIMIT_VALUE": 25000
 }
}
```

失敗範例

```json
{
	"RETURN_CODE": -2,
	"RETURN_MESSAGE": "會員資料庫連線失敗",
	"RESULT": null
}
```



## 40.取得儲值品項API

驗證網址：<https://www.gt.web/common/receive/Product/GetProducts.aspx>

傳遞參數方式：

| Request Header |                                          |
| -------------- | ---------------------------------------- |
| HTTP Method    | GET**(q_strPrizeIDs可支援POST方式傳入)** |

 

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



取得品項網址範例：https://www.gt.web/common/receive/Product/GetProducts.aspx?q_nGameServerGroupNo=10&q_nPlatformNo=1&q_nTransOptionNo=21&q_strIP={傳入使用者IP
ex.61.219.10.247}&q_nVIPLevel={傳入VIP等級
ex.3}&q_strAppID=com.igs.big2&q_nMemberNo={傳入會員編號 ex.717248}



**※可透過模擬工具(<https://www.gt.web/common/admin/Utility/ChoiceProduct/GetProducts.aspx>)去獲得要帶的參數為何?!**

![](images\media\image5.png){width="7.478472222222222in"
height="5.547916666666667in"}

![](images\media\image6.png){width="7.478472222222222in"
height="5.052083333333333in"}

需要參數：

| 參數名稱             | 規格   | 是否必填 | 描述                                                         |
| -------------------- | ------ | -------- | ------------------------------------------------------------ |
| q_nGameServerGroupNo | int    | 是       | 遊戲群組編號，參考 [GameTower_Member].[dbo].[GAME_ServerGroup].INDEX_NO，通常為遊戲編號後再加一位數字0(EX:滿貫大亨的GAME_NO=0，群組編號就會是30120) |
| q_nPlatformNo        | int    | 是       | 平台代瑪，參考[GameTower_Member].[dbo].[CODE_UserPlatform].INDEX_NO |
| q_nTransOptionNo     | int    | 昰       | 交易選項，參考[GameTower_Member].[dbo].[CODE_TransOption] .INDEX_NO(滿貫大亨是購買滿貫大亨遊戲道具所以是69) |
| q_strIP              | string | 昰       | IP位置                                                       |
| q_nVIPLevel          | int    | 昰       | 會員等級                                                     |
| q_strAppID           | string | 昰       | 應用程式ID(EX: com.igs.TMD)                                  |
| q_strPrizeIDs        | string | 昰       | (因考量長度太長使用GET方式傳入可能會被截斷，該參數支援POST方式傳入)<br>購買的遊戲道具的獎項ID，多筆可以用逗號分隔(EX:紅鑽→FREEPLAY_141205_001)，參考[GameTower_Member].[dbo].[PRIZE_PrizeData].ID |
| q_nMemberNo          | int    | 昰       | 會員編號                                                     |



回傳：

成功範例

```xml
<XML>
 <GameServerGroupNo>30120</GameServerGroupNo>
 <PlatformNo>1</PlatformNo>
 <TransOptionNo>69</TransOptionNo>
 <VIPLevel>3</VIPLevel>
 <GroupID><![CDATA[ ]]></GroupID>
 <PrizeIDs><![CDATA[ FREEPLAY_141205_001 ]]></PrizeIDs>
 <AppID><![CDATA[ com.igs.TMD ]]></AppID>
 <Product>
   <CurrencyID>
     <![CDATA[ TWD ]]>
   </CurrencyID>
   <Amount>30</Amount>
   <Point>30</Point>
   <ShortName>
     <![CDATA[ 30紅鑽 ]]>
   </ShortName>
   <NAME>
    <![CDATA[
        <h1 class="name">30紅鑽</h1><span class="price">NT$30</span>
]]>
   </NAME>
   <PRODUCT_SHOW_GROUP_ID>
      <![CDATA[ ]]>
   </PRODUCT_SHOW_GROUP_ID>
   <PRODUCT_SHOW_GROUP_NAME>
      <![CDATA[ ]]>
   </PRODUCT_SHOW_GROUP_NAME>
   <ICON_URL>
     <![CDATA[
/Graphics/Games/Mobile/Bank/item/icoin_RedDiamond.png
]]>
   </ICON_URL>
   <PRIZE_ID>
      <![CDATA[ FREEPLAY_141205_001 ]]>
   </PRIZE_ID>
 </Product>
</XML>
```

失敗範例

```xml
<XML>
 <GameServerGroupNo>0</GameServerGroupNo>
 <PlatformNo>0</PlatformNo>
 <TransOptionNo>0</TransOptionNo>
 <VIPLevel>0</VIPLevel>
 <GroupID>
   <![CDATA[ ]]>
 </GroupID>
 <PrizeIDs>
  <![CDATA[ ]]>
 </PrizeIDs>
 <AppID>
  <![CDATA[ ]]>
 </AppID>
</XML>
```



## 41.發送E-MAIL API

驗證網址：<http://www.gt.web/common/receive/Member/CheckIsBuyToModule.aspx>

**(若要使用需知會網頁組加入允許IP)**

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱      | 規格   | 是否必填 | 描述                                                         |
| ------------- | ------ | -------- | ------------------------------------------------------------ |
| f_strSubject  | string | 是       | 信件標題                                                     |
| f_strSender   | string | 是       | 寄件者 (e.g. FaFaFa Slots<service@support.gametower.com.tw>) |
| f_strReceiver | string | 昰       | 收件者 (e.g. damonhou<damonhou@igs.com.tw> 或 damonhou@igs.com.tw)，多組信箱請用『;』區隔 |
| f_strContent  | string | 昰       | 信件內容(支援HTML)                                           |

 

回傳參數說明：

| 值               | 說明                                                         |
| ---------------- | ------------------------------------------------------------ |
| RETURN_CODE      | 0-成功  其他為錯誤                                           |
| RETURN_MESSAGE   | 成功  or 錯誤說明                                            |
| RESULT           | 其他欄位為要求的資料回吐 ( RETURN_CODE = 0 才會回傳，否則為null) |
| TOTAL            | 要發出多少則                                                 |
| SUCCESS          | 成功寄出多少則                                               |
| FAIL             | 失敗的有幾則                                                 |
| FAIL_MESSAG_LIST | 失敗的哪幾則的失敗原因清單                                   |



回傳格式：

成功範例

```json
{
  	"RETURN_CODE": 0,
	"RETURN_MESSAGE": "成功",
	"RESULT": {
		"TOTAL":"7",
		"SUCCESS":"3",
		"FAIL":"4",
		"FAIL_MESSAG_LIST":[
			{"MESSAGE":"XXXXX"},
			{"MESSAGE":"XXXXX"}
 		]
	}
}
```

失敗範例

```json
{
	"RETURN_CODE": -1,
	"RETURN_MESSAGE": "缺少必要參數值",
	"RESULT": null
}
```



## 42.LINE登入APP模式串接

驗證網址：<http://www.gt.web/Webs/LINE/Member/receive_login.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

or

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



一般登入需要參數：

| 參數名稱                    | 規格   | 是否必填 | 描述                                                         |
| --------------------------- | ------ | -------- | ------------------------------------------------------------ |
| mode                        | int    | 是       | 模式 (APP模式固定帶1)                                        |
| gametype                    | string | 是       | 遊戲別 (e.g. TMD)                                            |
| access_token                | string | 昰       | 授權碼 (請記得做 UrlEncode 不然傳遞時會掉參數)               |
| DeviceID                    | string | 否       | 裝置識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| AppStorageInstallationID    | string | 否       | 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| DeviceStorageInstallationID | string | 否       | 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| DeviceNo                    | long   | 否       | 裝置流水號，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| SdkDeviceType               | int    | 否       | Vigor 帶 0，其他帶 1，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |



回傳參數說明：

| 值      | 說明                 |
| ------- | -------------------- |
| -99     | 其他錯誤             |
| lc 字串 | 純文字格式的 lc 字串 |



回傳格式：

成功範例

```json
{  	
    24011B54544E531B534D4B504B4D1B4C4C4B1B1B675B534F4B544B1B541B4E6915
}
```

失敗範例

```json
{
	-99
}
```



備援登入需要參數：

| 參數名稱                    | 規格   | 是否必填 | 描述                                                         |
| --------------------------- | ------ | -------- | ------------------------------------------------------------ |
| mode                        | int    | 是       | 模式 (APP模式固定帶1)                                        |
| gametype                    | string | 是       | 遊戲別 (e.g. TMD)                                            |
| DeviceID                    | string | 是       | 裝置識別碼                                                   |
| AppStorageInstallationID    | string | 是       | 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼         |
| DeviceStorageInstallationID | string | 是       | 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼          |
| DeviceNo                    | long   | 是       | 裝置流水號                                                   |
| SdkDeviceType               | int    | 是       | Vigor 帶 0，其他帶 1                                         |
| LastAccount                 | string | 是       | 上次登入帳號<br>會去反查此帳號先前使用「一般登入」時，記錄對應的三組裝置識別碼，只要其中一個符合即可成功透過備援登入 |
| LastErrorCode               | string | 否       | 介接平台錯誤碼 (提供客服、監控人員及時了解有可能是甚麼錯)<br>例如：LINE 回傳「SERVER_ERROR」 |
| LastErrorDesc               | string | 否       | 介接平台錯誤訊息 (提供客服、監控人員及時了解有可能是甚麼錯)  |



回傳參數說明：

| 值      | 說明                 |
| ------- | -------------------- |
| -99     | 其他錯誤             |
| lc 字串 | 純文字格式的 lc 字串 |



回傳格式：

成功範例

```json
{  	
    24011B54544E531B534D4B504B4D1B4C4C4B1B1B675B534F4B544B1B541B4E6915
}
```

失敗範例

```json
{
	-99
}
```



流程圖：

![LINE Login (APP
登入)](images\media\image7.png){width="7.478472222222222in"
height="8.38263888888889in"}

## 43.APP模式註冊LINE介接帳號

驗證網址：<http://www.gt.web/Webs/LINE/Member/InGameRegister.aspx>

(注意：此API所需的其他參數都會從「四十二、」的API的Session取，所以須先呼叫「四十二、」的API並得到回傳值「0」才可呼叫此註冊API)

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

 

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格 | 是否必填 | 描述                  |
| -------- | ---- | -------- | --------------------- |
| mode     | int  | 是       | 模式 (APP模式固定帶1) |

 

回傳參數說明：

| 值    | 說明                 |
| ----- | -------------------- |
| STATE | 0 表示成功           |
| LC    | 純文字格式的 lc 字串 |



回傳格式：

成功範例

```xml
<?xml version="1.0" encoding="utf-8"?>
 <ROOT>
	<STATE>0</STATE>
	<LC>
          24123C0C0C413D423D...etc
       </LC>
</ROOT>
```

失敗範例

```xml
失敗無回傳
```



## 44.GT Guest登入串接 or 取得WebDeviceID

網址：<https://ma.gt.web/Webs/MobilePlatform/Member/GT_receive_login.aspx>

遊戲端參考流程：[Guest
Login機制.uml.png](http://confluence:8090/pages/viewpage.action?pageId=26314014)



注意事項：

1.WebAppStorageInstallationID、WebDeviceStorageInstallationID、WebDeviceID取得其中一組即可取回原先記錄的3組ID

2.若三組ID皆不存在代表為新裝置，請研發實作使用UUID產生WebAppStorageInstallationID、WebDeviceStorageInstallationID，並將之存在相對應的儲存空間後，再呼叫API

3.收到API回傳值後，先將WebAppStorageInstallationID、WebDeviceStorageInstallationID、WebDeviceID存放在相對應的儲存空間後再執行下一個動作

4.Android請將WebAppStorageInstallationID、WebDeviceID存放在應用程式儲存空間
(App Storage)，WebDeviceStorageInstallationID存放在KeyStore區域

5.iOS請將WebAppStorageInstallationID、WebDeviceID存放在應用程式儲存空間
(App Storage)，WebDeviceStorageInstallationID存放在KeyChina區域

6.PC版請將WebAppStorageInstallationID、WebDeviceID存放在本機目錄，WebDeviceStorageInstallationID存放在regedit登錄檔



傳遞參數方式：

| Request Header |                  |
| -------------- | ---------------- |
| HTTP Method    | POST             |
| Content Type   | application/json |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



傳送Json參數：

| 參數名稱                       | 規格   | 是否必填 | 描述                                                         |
| ------------------------------ | ------ | -------- | ------------------------------------------------------------ |
| GameNo                         | int    | 昰       | 遊戲編號(EX:滿貫大亨→3012) 參考 GameTower_Member.dbo.GAME_GameProduct.INDEX_NO |
| Platform                       | int    | 是       | 平台代瑪，參考[GameTower_Member].[dbo].[CODE_UserPlatform].INDEX_NO<br>Web(PC) <br>Android<br>iOS |
| mode                           | int    | 昰       | 模式 (0-取得WebDeviceID 1-會員登入)                          |
| WebAppStorageInstallationID    | string | 否       | [Web版] 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼 |
| WebDeviceStorageInstallationID | string | 否       | [Web版] 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼  |
| WebDeviceID                    | string | 否       | [Web版] 裝置識別碼，與上方兩種識別碼至少要帶一個             |
| DeviceInfo                     | object | 是       | 請參考下方DeviceInfo結構說明                                 |



DeviceInfo結構：

| 參數名稱                    | 規格   | 是否必填 | 描述                                                         |
| --------------------------- | ------ | -------- | ------------------------------------------------------------ |
| AppStorageInstallationID    | string | 否       | [原SDK版] 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼 |
| DeviceStorageInstallationID | string | 否       | [原SDK版] 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼 |
| DeviceID                    | string | 否       | [原SDK版] 裝置識別碼                                         |
| MAC                         | string | 否       | 網卡 MAC 位址                                                |
| IDFV                        | string | 否       | iOS 供應商識別碼。(同名於 Vendor ID)                         |
| AdID                        | string | 否       | 廣告識別碼。(iOS的IDFA、Android的AAID)                       |
| IMEI_MEID                   | string | 否       | 國際移動設備識別碼                                           |
| Brand                       | string | 否       | 品牌                                                         |
| Model                       | string | 否       | 機型                                                         |
| OS                          | string | 否       | 作業系統                                                     |
| OSVersion                   | string | 否       | 作業系統版本                                                 |
| IP                          | string | 否       | 用戶端IP                                                     |
| Locale                      | string | 否       | 語系                                                         |
| DeviceMemory                | string | 否       | 裝置記憶體，MB                                               |
| AvailableDeviceMemory       | string | 否       | 可用的裝置記憶體，MB                                         |
| InternalStorage             | string | 否       | 儲存空間，MB (不含 SD 卡)                                    |
| AvaiableInternalStorage     | string | 否       | 可用的儲存空間，MB (不含 SD 卡)                              |

請求範例：

```http
POST /Webs/MobilePlatform/Member/GT_receive_login.aspx HTTP/1.1
Host: ma.gt.web
Content-Type: application/json
Cache-Control: no-cache

{"GameNo":1,"Platform":1,"mode":0
,"WebAppStorageInstallationID":"c1b315e4-9b60-44fb-b152-3bf507353499","WebDeviceStorageInstallationID":"c1b315e4-9b60-44fb-b152-3bf507353499","WebDeviceID":""
,"DeviceInfo":{"AppStorageInstallationID":"c1b315e4-9b60-44fb-b152-3bf507353462","DeviceStorageInstallationID":"c1b315e4-9b60-44fb-b152-3bf507353463","DeviceID":"c1b315e4-9b60-44fb-b152-3bf507353464"
	,"MAC":"BC677810FB73","IDFV":"","AdID":"","IMEI_MEID":"","Brand":"ios","Model":"xModel","OS":"android","OSVersion":"1.1","IP":"192.168.9.1","Locale":"TW"
,"DeviceMemory":"1024","AvailableDeviceMemory":"512","InternalStorage":"2048"
,"AvaiableInternalStorage":"123"}
}
```



回傳Json參數：

| 參數名稱       | 格式   | 描述                                                         |
| -------------- | ------ | ------------------------------------------------------------ |
| RETURN_CODE    | int    | 等於 0 時為成功，其他為失敗                                  |
| RETURN_MESSAGE | string | 回傳結果訊息(若RETURN_CODE = 0 則回傳 "成功"，反之為錯誤訊息) |
| RESULT         | object | 請參考下方RESULT結構說明 (RETURN_CODE = 0 才會回傳)          |



RESULT結構：

| 參數名稱                       | 格式              | 描述                                                         |
| ------------------------------ | ----------------- | ------------------------------------------------------------ |
| WebAppStorageInstallationID    | string            | [Web版] 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼 |
| WebDeviceStorageInstallationID | string            | [Web版] 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼  |
| WebDeviceID                    | string            | [Web版] 裝置識別碼                                           |
| WebDeviceNo                    | long              | [Web版] 裝置識別編號                                         |
| WebDeviceNoString              | string            | [Web版] 裝置識別編號(回傳字串)                               |
| AccountList                    | List<AccountInfo> | 請參考下方AccountInfo結構說明 (請求mode = 1 才會回傳)        |

  

AccountInfo結構：

| 參數名稱  | 格式   | 描述                                                         |
| --------- | ------ | ------------------------------------------------------------ |
| Account   | string | 帳號                                                         |
| LoginCode | string | 可供登入的LC字串                                             |
| Type      | string | master or other<br>對明星來說，若為多帳號則master為王牌大老二帳號,other為明星3缺1帳號<br>其他遊戲以master為主 |



成功回傳JSON範例：

```json
{
    "RETURN_CODE": 0,
    "RETURN_MESSAGE": "成功",
    "RESULT": {
        "WebAppStorageInstallationID": "c1b315e4-9b60-44fb-b152-3bf507353499",
        "WebDeviceStorageInstallationID": "c1b315e4-9b60-44fb-b152-3bf507353499",
        "WebDeviceID": "e60d09d8-41ee-476e-86ab-bbad33a5d1df",
        "AccountList": [
            {
                "Account": "1005418500@AP",
                "LoginCode": "220F431313534B434B63461348434313431348431345444754444413434B4744FE"
                "Type": "master"
            }
        ]
    }
}
```



失敗回傳JSON範例：

```json
{
    "RETURN_CODE": 1000,
    "RETURN_MESSAGE": "參數錯誤",
    "RESULT": null
}
```



## 45.『明星新聞』頁面

串接網頁網址：

[http://article-agent.gt.web/Games/Mobile/star31/tiantuan/viewdoc.aspx](http://article.agent.gt.web/Games/Mobile/star31/tiantuan/viewdoc.aspx)

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

 

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格   | 是否必填 | 描述                                         |
| -------- | ------ | -------- | -------------------------------------------- |
| an       | int    | 是       | 新聞區域的新聞關聯的新聞編號                 |
| AreaID   | string | 是       | 新聞區域，帶入固定參數MOBILE_star31_Tiantuan |



頁面顯示：

![B%GB8OVDVS\$2UM%\`6D)D\$F7](images\media\image8.png){width="6.35625in"
height="2.2694444444444444in"}

## 46.『滿貫任務說明』頁面

串接網頁網址：

[http://www.gt.web/Games/FreePlay/InGame/Taskdescription/index.aspx](http://www.gt.web/Games/FreePlay/InGame/Taskdescription/index.aspx?TaskId=90179)

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

 

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱 | 規格 | 是否必填 | 描述     |
| -------- | ---- | -------- | -------- |
| TaskId   | int  | 是       | 任務編號 |



頁面顯示：

![F73CGE\~NQB800U2F%BUOHNU](images\media\image9.png){width="4.069444444444445in"
height="3.990972222222222in"}



## 47.問卷報名系統-遊戲端詢問問卷API

驗證網址：<http://www.gt.web/common/receive/GoogleForm/check.aspx>

相關資料表：

\[GameTower_Member\].\[dbo\].\[ GOOGLE_FORM_FormMemberQualification\]

\[GameTower_Member\].\[dbo\].\[ GOOGLE_FORM_FormInformation\]

流程圖參考：

![問卷API](images\media\image10.png){width="7.478472222222222in"
height="3.2in"}

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

  

串接單位是否需要允許個資同意機制：**是**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱    | 規格 | 是否必填 | 描述     |
| ----------- | ---- | -------- | -------- |
| f_nGameNo   | int  | 是       | 遊戲編號 |
| f_nMemberNo | int  | 是       | 會員編號 |

 

回傳格式：

成功範例

```json
(有問卷)：							<?xml version="1.0" encoding="utf-8"?>
{
    "RETURN_CODE":1 ,
    "RETURN_MESSAGE": "有新問卷",
    "RETUEN_LINK":https://www.gt.web/mobile/GoogleForm/index.aspx?formno=3
}

(無問卷)：							<?xml version="1.0" encoding="utf-8"?>
{
    "RETURN_CODE":0,
    "RETURN_MESSAGE": "無新問卷",
    "RETUEN_LINK":""
}
```

失敗範例

```json
{
    "RETURN_CODE":-9,
    "RETURN_MESSAGE": "查詢失敗",
    "RETUEN_LINK":""
}
```



回傳Json參數：

| 參數名稱       | 格式   | 描述                                                     |
| -------------- | ------ | -------------------------------------------------------- |
| RETURN_CODE    | int    | 1：有問卷<br>0：無問卷<br>-9：查詢失敗。                 |
| RETURN_MESSAGE | string | 1：回傳"有新問卷"<br>0：回傳"無新問卷"<br>-9："查詢失敗" |
| RESULT         | string | 1：回傳"問卷連結"<br>0：回傳""<br>-9：回傳""             |



## 48.問卷報名系統-存取問卷資料API

驗證網址：

(測試)
<https://www.twtest.towergame.com:3098/common/receive/GoogleForm/GetValue.aspx>

(正式)
<https://www.gametower.com.tw/common/receive/GoogleForm/GetValue.aspx>

流程圖參考：

![](images\media\image11.png){width="6.0in"
height="2.417361111111111in"}

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

  

串接單位是否需要允許個資同意機制：**是**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



| 存取會員填寫資料流程說明                      |
| --------------------------------------------- |
| 1. 收到資料後，比對會員是否更改問卷預填欄位   |
| 2. 有更改到預填欄位，不把問卷填寫結果存入DB中 |
| 3. 無更改到預填欄位，將填寫結果存入DB中       |
| 4. 存取完成後將會員填寫狀態調整為已填寫完成   |



需要參數(Agent_Relay的GetValue.aspx)：

| 參數名稱(固定)                       | 規格   | 必填 | 範例             | 描述                                         |
| ------------------------------------ | ------ | ---- | ---------------- | -------------------------------------------- |
| f_nForm_No                           | int    | 是   | 2                | 問卷編號                                     |
| f_strSerial_No                       | String | 是   | FDLER77C24VXPGXJ | 會員識別明碼(與f_strAccount一起核對會員身分) |
| f_strAccount                         | String | 是   | tingweichiu      | 會員帳號(與f_strSerial_No一起核對會員身分)   |
| 題目名稱1~n欄位{ 1.請問您的性別為？} | string | 是   | 男               | 會員填寫內容(Key值會因該次問卷內容有所變化)  |



會員填寫內容範例：

```
data =
{
    'f_nForm_No': 3
    ,'f_strSerial_No': 'FDLER77C24VXPGXJ'
    ,'f_strAccount': 'tingweichiu'
    ,'1.請問您的性別為？': '男'
    ,'2.請問您的年齡為？': '25-34歲'
};
```



## 49.GooglePlay報表處理API

串接網頁網址：

<https://thirdparty.gametower.com.tw/common/receive/googleplay/report.aspx>

自動下載GooglePlay報表設定說明：

<http://confluence:8090/pages/viewpage.action?pageId=31196537>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

 

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱        | 規格   | 是否必填 | 描述                                                         |
| --------------- | ------ | -------- | ------------------------------------------------------------ |
| f_strMode       | string | 是       | LIST or DOWNLOAD                                             |
| f_strKey        | string | 是       | GooglePlay後台提供有權限的key.json內容(取得方式請參考自動下載GooglePlay報表設定說明) |
| f_strBucketName | string | 是       | BucketName (取得方式請參考自動下載GooglePlay報表設定說明)    |
| f_strFolderName | string | 否       | FolderName (LIST模式專用)，若帶空取得所有ObjectName列表，指定目錄則帶該目錄底下的ObjectName列表，舉例來說若是要取得預估報表則帶 sales，就會抓取sales目錄底下的ObjectName列表(ex. sales/salesreport_201704.zip…等) |
| f_strObjectName | string | 否       | 要下載的ObjectName(Mode=DOWNLOAD必填)，指定下載的Object      |



回傳格式(LIST模式)：

成功範例

```json
{ 
"ObjectNameList":[
	"sales/salesreport_201704.zip",
	"sales/salesreport_201705.zip",
	"sales/salesreport_201706.zip"
	]
}
```

失敗範例(500錯誤並直接輸出錯誤內容)

```json
[BucketName]不得為空白
```



回傳格式(DOWNLOAD模式)：

成功範例(application/octet-stream直接輸出檔案) 

```
檔案的MemoryStream
```

失敗範例(500錯誤並直接輸出錯誤內容)

```
[BucketName]不得為空白
```



## 50.修改隨你玩暱稱API

驗證網址(utf8呼叫)：http://ex.gt.web/Games/client/Apply/Utf8ToBig5.aspx?mode=3&lc={LC}

驗證網址(big5呼叫)：[http://ex.gt.web/Games/client/Apply/index.aspx?mode=3&lc={LC}](http://ex.gt.web/Games/client/Apply/index.aspx?mode=3&lc=%7bLC%7d)

注意：Get參數需帶LC字串驗證是哪個會員

傳遞參數方式：
| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |



需要參數

| 參數          | 值範例  | 說明         |
| ------------- | ------- | ------------ |
| f_strNickname | 樹鳥123 | 修改後的暱稱 |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需設定上一頁網址

```
UrlReferrer = \"http://ex.gt.web\" ;
```



成功時STATE為0

```xml
<?xml version="1.0" encoding="big5"?>
<ROOT>
<STATE>0</STATE>
</ROOT>
```



網頁組保留字檢查若有錯誤，STATE為-1，訊息在MESSAGE中

```xml
<?xml version="1.0" encoding="big5"?>
<ROOT>
<STATE>-1</STATE>
<MESSAGE><![CDATA[該暱稱無法使用，請重新輸入暱稱。]]></MESSAGE>
</ROOT>
```



其餘情況STATE為預存 Web_ModifyDisplayname 的回傳值

```xml
<?xml version="1.0" encoding="big5"?>
<ROOT>
<STATE>-2</STATE>
<MESSAGE><![CDATA[]]></MESSAGE>
</ROOT>
```



## 51.『選擇付費渠道頁』頁面

串接網頁網址：

https://www.gt.web/Games/Mobile/{遊戲別}/{平台 e.g Android or
iOS}/Bank/ChoiceChannel.aspx (需請網頁組配合建立套皮頁)

(EX：<https://www.gt.web/Games/Mobile/tmd/Android/Bank/ChoiceChannel.aspx?q_nGameServerGroupNo=30120&q_nTransOptionNo=69&q_strAppID=com.igs.TMD&q_strGroupID=&q_strPrizeIDs=FREEPLAY_141205_001&q_strGoogleVersion=&q_strAppVersion=&location=TW&q_strCurrencyID=TWD&q_dAmount=300&q_nPoint=300>&q_nPrizeType=1)←需先登入會員，研發端串接請透過al.aspx登入會員後再轉到該網址

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：(傳入參數需配合品項設定有符合品項才會顯示該渠道)

| 參數名稱                | 規格   | 是否必填 | 描述                                                         |
| ----------------------- | ------ | -------- | ------------------------------------------------------------ |
| q_nGameServerGroupNo    | int    | 是       | 遊戲群組編號，參考 [GameTower_Member].[dbo].[GAME_ServerGroup].INDEX_NO，通常為遊戲編號後再加一位數字0(EX:滿貫大亨的GAME_NO=0，群組編號就會是30120) |
| q_nTransOptionNo        | int    | 昰       | 交易選項，參考[GameTower_Member].[dbo].[CODE_TransOption] .INDEX_NO(滿貫大亨是購買滿貫大亨遊戲道具所以是69) |
| q_nVIPLevel             | int    | 昰       | 會員等級                                                     |
| q_strAppID              | string | 昰       | 應用程式ID(EX: com.igs.TMD)                                  |
| q_strPrizeIDs           | string | 昰       | 購買的遊戲道具的獎項ID，多筆可以用逗號分隔(EX:紅鑽→FREEPLAY_141205_001)，參考[GameTower_Member].[dbo].[PRIZE_PrizeData].ID(若q_bDirectBuy=true的話可不帶入) |
| q_strCurrencyID         | string | 昰       | 貨幣別ID(EX:TWD)                                             |
| q_dAmount               | int    | 昰       | 金額(若q_bDirectBuy=true的話可不帶入)                        |
| q_nPoint                | int    | 昰       | 點數(若q_bDirectBuy=true的話可不帶入)                        |
| q_strGoogleVersion      | string | 否       | GooglePlay版號                                               |
| q_strAppVersion         | string | 否       | 應用程式版號                                                 |
| sb                      | int    | 否       | Android上顯示儲值方式的模式(0-官網決定 1-顯示所有儲值單元 2-只顯示GooglePlay儲值單元 3-進行必要檢查之後顯示所有儲值單元 4-除了GooglePlay其他都顯示)，未帶入值的話預設為 0-官網決定 |
| q_bDirectBuy            | bool   | 否       | 是否直接購買品項(須配合q_strDirectBuyProductID 一起傳入)     |
| q_strDirectBuyProductID | string | 否       | 直接購買的品項ID(目前僅支援信用卡品項)<br>參考[GameTower_Member].[dbo].[PRODUCT_MainSet].ID |
| q_nModuleNo             | int    | 否       | 指定渠道參考[GameTower_Member].[dbo].[STOREDVALUE_CODE_Module].INDEX_NO |
| q_nPrizeType            | int    | 否       | 獎項類型(遊戲端傳入，網頁端再將原值傳回遊戲給獎預存)。P.S2   |

**P.S：若為直接購買q_bDirectBuy=true，玩家到選擇渠道頁時會直接跳轉到結帳頁面**

**P.S2：q_nPrizeType，若為 GooglePlay、iOS InAppPurchase、AppStore渠道，需另外在呼叫下列API時，將此參數**
**f_nPrizeType 加在f_strPlatformData 參數裡。**

<http://bank.gt.web/common/receive/GooglePlay/Settle.aspx>

e.q.：

f_strPlatformData = f_nPrizeType=1 (需Urlencode)

f_strPlatformData = f_nPrizeType%3D1 (Urlencode後)

頁面顯示：

![](images\media\image12.png){width="7.486805555555556in"
height="2.2958333333333334in"}



## 52.電信撥號(CallOut)服務API

串接網頁網址：

開發機：

<http://relay-agent.gt.web/common/receive/callout/send.aspx>

測試機：

<http://relay-agent-twtest.towergame.com/common/receive/callout/send.aspx>

正式機：

<http://relay-agent.gametower.com.tw/common/receive/callout/send.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

  

串接單位是否需要允許個資同意機制：**是**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱             | 規格       | 是否必填 | 描述                                                         |
| -------------------- | ---------- | -------- | ------------------------------------------------------------ |
| f_strMemberIdentity  | string     | 是       | 會員識別值(GT平台則帶入會員帳號 商用則帶入ARK_ID  OR 專案可用來區分哪個會員的識別值)，重點是讓客服好追查的一個KEY值 |
| f_strGameID          | string     | 昰       | 遊戲ID(請網頁組同仁提供)                                     |
| f_nCountryCodeManual | int        | 昰       | 手機號碼國碼(e.g. 886)                                       |
| f_strPhoneNumber     | string     | 昰       | 手機號碼(e.g. 09XXXXXXXX)                                    |
| f_strVerifyPassword  | string     | 昰       | OTP驗證碼(僅支援純數字且長度勿超過6碼)                       |
| f_strRemoteIP        | String(15) | 昰       | 使用者IP(僅支援IPV4規格 e.g: XXX.XXX.XXX.XXX)                |
| f_strCheckCode       | int        | 昰       | 檢查碼(f_strCheckCode計算方式是將傳送的參數資料依照 Key 排序，將所有 Value 相加(排除 f_strCheckCode 參數)，最後加上雙方約定的金鑰，再用 SHA1 加密並轉成大寫而成。 |
| f_strLangID          | string     | 否       | 傳入指定的LANGID，e.g 若要使用日文則帶入f_strLangID = 4<br>※ 若沒指定則依照國家別去判斷要用哪種語言<br>LANGID  語言別<br>1  中文<br>2  英文<br>3  印尼文<br>4  日文<br>5  泰文<br>6  西班牙文<br>7  越南文<br>8  馬來文 |

f_strCheckCode範例程式：

```C#
public static string GetCheckCode(NameValueCollection _csDataColl,string _strPrivateKey)
{
     StringBuilder strValue      = new StringBuilder() ;

     // 依照 Key 排序，將所有 Value 相加 (排除 CHECK_CODE 參數)
     foreach(string strKey in _csDataColl.AllKeys.OrderBy(o => o))
     {
         if (!strKey.Equals("CHECK_CODE",StringComparison.OrdinalIgnoreCase))
              strValue.Append(_csDataColl[strKey]) ;
     }
     // 最後加入私Key
     strValue.Append(_strPrivateKey) ;

     return FormsAuthentication.HashPasswordForStoringInConfigFile(strValue.ToString(),"SHA1") ;
}
```

回傳格式：

成功範例(RESULT_CODE = 200為成功)

```json
{"RESULT_CODE":"200","RESULT_MESSAGE":"Success","OPERATOR_ORDER_NO":"123456","SERVICE_CENTER_TRANSRECORD_NO":78910,"OPERATOR_RETURN_STATUS_CODE":0}
```

失敗範例(RESULT_CODE 不等於200為失敗)

```json
{"RESULT_CODE":"1","RESULT_MESSAGE":"手機號碼格式錯誤","OPERATOR_ORDER_NO":"","SERVICE_CENTER_TRANSRECORD_NO":-1,"OPERATOR_RETURN_STATUS_CODE":999}
```



備 註

1.  **需新增『個人資料保護政策』同意機制，並提供玩家在求證時可舉證同意個資的時間為何。**

    A.  **遊戲內範例**

![](images\media\image13.png){width="4.661111111111111in"
height="2.7041666666666666in"}

B.  **網頁範例**

![](images\media\image14.png){width="4.661111111111111in"
height="3.990972222222222in"}



## 53.LINE Notify訊息發送(綁gametower會員帳號版)

串接網頁網址：

開發機：

<http://notify-agent.gt.web/line/send.aspx>

測試機：

<https://notify-agent-twtest.towergame.com/line/send.aspx>

正式機：

<https://notify-agent.gametower.com.tw/line/send.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

or

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**是**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



需要參數：

| 參數名稱       | 規格   | 是否必填 | 描述                                                         |
| -------------- | ------ | -------- | ------------------------------------------------------------ |
| f_strProjectID | string | 否       | 專案識別代碼，需搭配f_strRoleIDs<br>e.g.「滿貫大亨」為TMD<br>※人員離/調職有每季清查，易於掌控，需事先透過http://www.webcase.web/向網頁組申請 |
| f_strRoleIDs   | string | 否       | 角色識別代碼，需搭配f_strProjectID<br>e.g.「運營人員」為OPERATE_USER<br>※人員離/調職有每季清查，易於掌控，需事先透過http://www.webcase.web/向網頁組申請 |
| f_strAccounts  | string | 否       | gametower會員帳號<br>※人員離/調職容易漏改                    |
| f_strMemberNos | string | 否       | gametower會員編號<br>※人員離/調職容易漏改                    |
| f_strMessage   | string | 昰       | 發送訊息內文                                                 |



回傳格式：

成功範例

```json
{"RETURN_CODE":"0"," RETURN_MESSAGE":"發送成功"}
```

失敗範例

```json
{"RETURN_CODE":"-1","RETURN_MESSAGE":"解析傳入參數後無任何接收者"}
```



錯誤代碼表：

| 代碼 | 說明                       |
| ---- | -------------------------- |
| 0    | 發送成功。                 |
| -1   | 解析傳入參數後無任何接收者 |
| -2   | 未傳入發送訊息內文         |
| -3   | 發送失敗                   |
| -999 | 未知的錯誤                 |



備註：
(一)、需事先透過<http://www.webcase.web/>向網頁組申請，並提供存取此API的主機IP

(二)、收訊人員前置作業：

1.  註冊gametower帳號：
    開發：<https://www.gt.web/member/register.aspx>\
    測試：<https://www-twtest.towergame.com/member/register.aspx>\
    正式：<https://www.gametower.com.tw/member/register.aspx>\
    ※ 「E-mail電子信箱」請填公司個人信箱e.g. *damonhou\@igs.com.tw*

2.  gametower帳號升級為標準會員：
    開發：<https://member.gt.web/member/login.aspx?re=https%3A%2F%2Fwww.gt.web%2Fmember%2Fregister.aspx>\
    測試：<https://member-twtest.towergame.com/member/login.aspx?re=https%3A%2F%2Fwww-twtest.towergame.com%2Fmember%2Fregister.aspx>\
    正式：<https://member.gametower.com.tw/member/login.aspx?re=https%3A%2F%2Fwww.gametower.com.tw%2Fmember%2Fregister.aspx>\
    ※ 請填真實姓名e.g. *侯志成*

3.  gametower帳號綁定LINE帳號：
    開發：<https://admin.gt.web/common/admin/LINENotify/index.aspx>\
    測試：<https://admin-twtest.towergame.com/common/admin/LINENotify/index.aspx>\
    正式：<https://admin.gametower.com.tw/common/admin/LINENotify/index.aspx>\
    (1) 登入gametower官方帳號：
    ![](images\media\image15.png){width="2.009027777777778in"
    height="2.1041666666666665in"}
    (2) 登入LINE：
    ![](images\media\image16.png){width="2.0694444444444446in"
    height="2.04375in"}
    (3) 擇「1-no-1 chat with LINE Notify」或「透過1對1聊天接收LINE
    Notify的通知」
    (通常都是第一個選項)
    ![](images\media\image17.png){width="2.661111111111111in"
    height="2.24375in"}或![](images\media\image18.png){width="2.426388888888889in"
    height="1.9041666666666666in"}
    (4) 完成gametower帳號與LINENotify綁定：
    ![](images\media\image19.png){width="3.2in"
    height="1.2173611111111111in"}



## 54.LINE Notify訊息發送(不需綁gametower會員帳號)

串接網頁網址：

開發機：

<http://notify-agent.gt.web/line/send.aspx>

測試機：

<https://notify-agent-twtest.towergame.com/line/send.aspx>

正式機：

<https://notify-agent.gametower.com.tw/line/send.aspx>

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



需要參數：

| 參數名稱     | 規格   | 是否必填 | 描述                                                         |
| ------------ | ------ | -------- | ------------------------------------------------------------ |
| f_strUsageID | string | 昰       | 群組識別代碼，由網頁組人員提供<br>專案需於工單提供要通知的 LINE 群，網頁組再根據群組特性命名識別代碼<br>e.g.「滿貫大亨資料異常通知」為TMD_DATA_ERROR<br>※該群組人員離/調職為各專案自行掌控 |
| f_strMessage | string | 昰       | 發送訊息內文                                                 |



回傳格式：

成功範例 

```json
{"RETURN_CODE":"0"," RETURN_MESSAGE":"發送成功"}
```

失敗範例

```json
{"RETURN_CODE":"-1","RETURN_MESSAGE":"解析傳入參數後無任何接收者"}
```

  

錯誤代碼表：

| 代碼 | 說明                       |
| ---- | -------------------------- |
| 0    | 發送成功。                 |
| -1   | 解析傳入參數後無任何接收者 |
| -2   | 未傳入發送訊息內文         |
| -3   | 發送失敗                   |
| -999 | 未知的錯誤                 |



備註：\
(一)、需事先透過<http://www.webcase.web/>向網頁組申請，並提供存取此API的主機IP

(二)、作業流程：

1.  建立要收到要通知的 LINE 群，提供於工單，並邀請「通知服務」加入該群
    (LINE ID：igsline2)

2.  網頁組人員處理完畢後，提供識別代碼 (即f_strUsageID)

3.  使用此識別代碼即可對目標群所有人進行通知服務
    (該群的組成人員請專案自行控管)

4.  請勿將成員「通知服務」、「LINE Notify」踢出群組，不然會收不到通知

##  55.Wechat 登入串接

驗證網址：<http://www.gt.web/Webs/Wechat/Member/receive_login.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

or

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

 

串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



模式說明：

一般登入(mode=1) 和記憶登入(mode=2) 的差異：

mode=1 (一般登入)會跳微信授權介面 (玩家操作步驟較多)

mode=2 (記憶登入)類似記憶帳號功能 (不會到微信授權介面)

模式處理流程說明：

(1) 檢查裝置有無上次得到的 refresh_token

有 =\> 呼叫 mode=2 =\> 得到 LC

=\> 得到 -99 (表示 refresh_token 失效了) =\> 改走 mode=1 重新要 code

無 =\> 呼叫 mode=1

(2) 玩家使用「完全登出」、呼叫 mode=2 得到 -99 都必須清掉「上次得到的 refresh_token」



一般登入需要參數：

| 參數名稱                    | 規格   | 是否必填 | 描述                                                         |
| --------------------------- | ------ | -------- | ------------------------------------------------------------ |
| mode                        | int    | 是       | 模式 (固定帶1)                                               |
| gametype                    | string | 是       | 遊戲別 (e.g. TMD)                                            |
| code                        | string | 昰       | 授權碼 (請記得做 UrlEncode 不然傳遞時會掉參數)               |
| DeviceID                    | string | 否       | 裝置識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| AppStorageInstallationID    | string | 否       | 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| DeviceStorageInstallationID | string | 否       | 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| DeviceNo                    | long   | 否       | 裝置流水號，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| SdkDeviceType               | int    | 否       | Vigor 帶 0，其他帶 1，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |



回傳參數說明：

| 值                 | 說明                                   |
| ------------------ | -------------------------------------- |
| RETURN_CODE        | 目前一律回 0                           |
| RETURN_MESSAGE     | 目前一律回空字串                       |
| RESULT.LC          | -99 為失敗，否則為純文字格式的 lc 字串 |
| RESULT.AUTH_RESULT | 授權結果 json (成功才有)               |



回傳格式：

成功範例

```json
{
  "RETURN_CODE": 0,
  "RETURN_MESSAGE": "",
  "RESULT": {
    "LC": "24011B54544E531B534D4B504B4D1B4C4C4B1B1B675B534F4B544B1B541B4E6915",
    "AUTH_RESULT": {
      "refresh_token": "13_iqMnSiPER4__OoQDcj3LOFWszcZLB_Bw",
      "openid": "oZPBb0WF3dAwjCSrP-nX_5b_Eheg",
      "scope": "snsapi_userinfo",
      "unionid": "opK-Ys3r-MgnIJycOONRmHJ8l5Ng",
      "access_token": "13_Kn1dSNcww-_8H4WGzNhFUCiu",
      "expires_in": 7200
    }
  }
}
```

失敗範例

```json
{
  "RETURN_CODE": 0,
  "RETURN_MESSAGE": "",
  "RESULT": {
    "LC": "-99"
  }
}
```



記憶登入需要參數：

| 參數名稱      | 規格   | 是否必填 | 描述                                                         |
| ------------- | ------ | -------- | ------------------------------------------------------------ |
| mode          | int    | 是       | 模式 (固定帶2)                                               |
| gametype      | string | 是       | 遊戲別 (e.g. TMD)                                            |
| refresh_token | string | 昰       | 上次「一般登入」取得的 refresh_token (請記得做 UrlEncode 不然傳遞時會掉參數) |



回傳參數說明：

| 值             | 說明                                   |
| -------------- | -------------------------------------- |
| RETURN_CODE    | 目前一律回 0                           |
| RETURN_MESSAGE | 目前一律回空字串                       |
| RESULT.LC      | -99 為失敗，否則為純文字格式的 lc 字串 |



回傳格式：

 成功範例

```json
{
  "RETURN_CODE": 0,
  "RETURN_MESSAGE": "",
  "RESULT": {
    "LC": "24011B54544E531B534D4B504B4D1B4C4C4B1B1B675B534F4B544B1B541B4E6915"
  }
}
```

 失敗範例

```json
{
  "RETURN_CODE": 0,
  "RETURN_MESSAGE": "",
  "RESULT": {
    "LC": "-99"
  }
}
```



備援登入需要參數：

| 參數名稱                    | 規格   | 是否必填 | 描述                                                         |
| --------------------------- | ------ | -------- | ------------------------------------------------------------ |
| mode                        | int    | 是       | 模式 (固定帶1)                                               |
| gametype                    | string | 是       | 遊戲別 (e.g. TMD)                                            |
| DeviceID                    | string | 是       | 裝置識別碼                                                   |
| AppStorageInstallationID    | string | 是       | 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼         |
| DeviceStorageInstallationID | string | 是       | 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼          |
| DeviceNo                    | long   | 是       | 裝置流水號                                                   |
| SdkDeviceType               | int    | 是       | Vigor 帶 0，其他帶 1                                         |
| LastAccount                 | string | 是       | 上次登入帳號<br>會去反查此帳號先前使用「一般登入」時，記錄對應的三組裝置識別碼，只要其中一個符合即可成功透過備援登入 |
| LastErrorCode               | string | 否       | 介接平台錯誤碼 (提供客服、監控人員及時了解有可能是甚麼錯) 例如：LINE 回傳「SERVER_ERROR」 |
| LastErrorDesc               | string | 否       | 介接平台錯誤訊息 (提供客服、監控人員及時了解有可能是甚麼錯)  |



回傳參數說明：

| 值             | 說明                                                         |
| -------------- | ------------------------------------------------------------ |
| RETURN_CODE    | 目前一律回 0                                                 |
| RETURN_MESSAGE | 目前一律回空字串                                             |
| RESULT.LC      | -99 為失敗，否則為純文字格式的 lc 字串<br>e.g. 24123C0C0C413D423D...etc |

回傳格式：

 成功範例

```json
{
  "RETURN_CODE": 0,
  "RETURN_MESSAGE": "",
  "RESULT": {
    "LC": "24011B54544E531B534D4B504B4D1B4C4C4B1B1B675B534F4B544B1B541B4E6915"
  }
}
```

 失敗範例

```json
{
  "RETURN_CODE": 0,
  "RETURN_MESSAGE": "",
  "RESULT": {
    "LC": "-99"
  }
}
```



流程圖：

![Wechat Login (APP
登入)](images\media\image20.png){width="7.478472222222222in"
height="8.782638888888888in"}

![WeChat Login (APP
記憶登入)](images\media\image21.png){width="6.990972222222222in"
height="9.217361111111112in"}

##  56.Apple 登入串接

驗證網址：<http://www.gt.web/Webs/Apple/Member/receive_login.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

or

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



一般登入需要參數：

| 參數名稱                    | 規格   | 是否必填 | 描述                                                         |
| --------------------------- | ------ | -------- | ------------------------------------------------------------ |
| mode                        | int    | 是       | 模式 (APP模式固定帶1)                                        |
| gametype                    | string | 是       | 遊戲別 (e.g. TMD)                                            |
| code                        | string | 昰       | 授權碼 (請記得做 UrlEncode 不然傳遞時會掉參數)<br>ASAuthorizationController.credential.authorizationCode |
| familyname                  | string | 否       | 名，ASAuthorizationController.credential.fullName.familyName |
| givenname                   | string | 否       | 姓，ASAuthorizationController.credential.fullName.givenName  |
| email                       | string | 否       | 信箱，ASAuthorizationController.credential.email             |
| DeviceID                    | string | 否       | 裝置識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| AppStorageInstallationID    | string | 否       | 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| DeviceStorageInstallationID | string | 否       | 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| DeviceNo                    | long   | 否       | 裝置流水號，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| SdkDeviceType               | int    | 否       | Vigor 帶 0，其他帶 1，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |



回傳參數說明：

| 值      | 說明                                                  |
| ------- | ----------------------------------------------------- |
| -99     | 其他錯誤                                              |
| lc 字串 | 純文字格式的 lc 字串<br>e.g. 24123C0C0C413D423D...etc |



回傳格式：

成功範例 

```json
{
    24011B54544E531B534D4B504B4D1B4C4C4B1B1B675B534F4B544B1B541B4E6915
}
```

失敗範例

```json
{
	-99
}
```



備援登入需要參數：

| 參數名稱                    | 規格   | 是否必填 | 描述                                                         |
| --------------------------- | ------ | -------- | ------------------------------------------------------------ |
| mode                        | int    | 是       | 模式 (APP模式固定帶1)                                        |
| gametype                    | string | 是       | 遊戲別 (e.g. TMD)                                            |
| DeviceID                    | string | 是       | 裝置識別碼                                                   |
| AppStorageInstallationID    | string | 是       | 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼         |
| DeviceStorageInstallationID | string | 是       | 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼          |
| DeviceNo                    | long   | 是       | 裝置流水號                                                   |
| SdkDeviceType               | int    | 是       | Vigor 帶 0，其他帶 1                                         |
| LastAccount                 | string | 是       | 上次登入帳號<br>會去反查此帳號先前使用「一般登入」時，記錄對應的三組裝置識別碼，只要其中一個符合即可成功透過備援登入 |
| LastErrorCode               | string | 否       | 介接平台錯誤碼 (提供客服、監控人員及時了解有可能是甚麼錯)<br>例如：LINE 回傳「SERVER_ERROR」 |
| LastErrorDesc               | string | 否       | 介接平台錯誤訊息 (提供客服、監控人員及時了解有可能是甚麼錯)  |



回傳參數說明：

| 值      | 說明                                                  |
| ------- | ----------------------------------------------------- |
| -99     | 其他錯誤                                              |
| lc 字串 | 純文字格式的 lc 字串<br>e.g. 24123C0C0C413D423D...etc |



回傳格式：

成功範例 

```json
{
    24011B54544E531B534D4B504B4D1B4C4C4B1B1B675B534F4B544B1B541B4E6915
}
```

失敗範例

```json
{
	-99
}
```



流程圖：

![Apple Login (APP
sdk登入)](images\media\image22.png){width="7.365277777777778in"
height="9.678472222222222in"}



##  57.Google登入串接

驗證網址：<http://www.gt.web/Webs/Google/Member/receive_login.aspx>

傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

or

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

 由於 id_token 很長，容易超過 GET 限制長度，建議用 POST



串接單位是否需要允許個資同意機制：**否**

P.S：若為『是』的話，請確認頁面上有玩家同意個資機制(請參考『備註1』)



一般登入需要參數：

| 參數名稱                    | 規格   | 是否必填 | 描述                                                         |
| --------------------------- | ------ | -------- | ------------------------------------------------------------ |
| mode                        | int    | 是       | 模式 (APP模式固定帶1)                                        |
| gametype                    | string | 是       | 遊戲別 (e.g. TMD)                                            |
| id_token                    | string | 昰       | 授權後取得的 id token (一個 JWT token，裡面有個參數是有效時間，過期會沒法用) |
| DeviceID                    | string | 否       | 裝置識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| AppStorageInstallationID    | string | 否       | 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| DeviceStorageInstallationID | string | 否       | 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| DeviceNo                    | long   | 否       | 裝置流水號，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |
| SdkDeviceType               | int    | 否       | Vigor 帶 0，其他帶 1，備援登入用，平時有傳在介接平台異常時才能使用備援登入功能 |



回傳參數說明：

| 值             | 說明                                                         |
| -------------- | ------------------------------------------------------------ |
| RETURN_CODE    | 0：成功，-99：失敗                                           |
| RETURN_MESSAGE | 有錯誤時會有錯誤訊息                                         |
| RESULT.LC      | 純文字格式的 lc 字串，RETURN_CODE = 0才有<br>e.g. 24123C0C0C413D423D...etc |



回傳格式：

成功範例 

```json
{
  "RETURN_CODE": 0,
  "RETURN_MESSAGE": "",
  "RESULT": {
    "LC": "210E4C7C7D824C7C7C7F854C93854C828C7C834C4C93847C7D7D7E84854C8084C8"
  }
}
```

失敗範例 

```json
{
  "RETURN_CODE": -99,
  "RETURN_MESSAGE": "id_token 過期",
  "RESULT": {}
}
```



備援登入需要參數：

| 參數名稱                    | 規格   | 是否必填 | 描述                                                         |
| --------------------------- | ------ | -------- | ------------------------------------------------------------ |
| mode                        | int    | 是       | 模式 (APP模式固定帶1)                                        |
| gametype                    | string | 是       | 遊戲別 (e.g. TMD)                                            |
| DeviceID                    | string | 是       | 裝置識別碼                                                   |
| AppStorageInstallationID    | string | 是       | 存放在「應用程式儲存空間 (App Storage)」的安裝識別碼         |
| DeviceStorageInstallationID | string | 是       | 存放在「裝置儲存空間 (Device Storage)」的安裝識別碼          |
| DeviceNo                    | long   | 是       | 裝置流水號                                                   |
| SdkDeviceType               | int    | 是       | Vigor 帶 0，其他帶 1                                         |
| LastAccount                 | string | 是       | 上次登入帳號<br>會去反查此帳號先前使用「一般登入」時，記錄對應的三組裝置識別碼，只要其中一個符合即可成功透過備援登入 |
| LastErrorCode               | string | 否       | 介接平台錯誤碼 (提供客服、監控人員及時了解有可能是甚麼錯)<br>例如：LINE 回傳「SERVER_ERROR」 |
| LastErrorDesc               | string | 否       | 介接平台錯誤訊息 (提供客服、監控人員及時了解有可能是甚麼錯)  |



回傳參數說明：

| 值             | 說明                                                         |
| -------------- | ------------------------------------------------------------ |
| RETURN_CODE    | 0：成功，-99：失敗                                           |
| RETURN_MESSAGE | 有錯誤時會有錯誤訊息                                         |
| RESULT.LC      | 純文字格式的 lc 字串，RETURN_CODE = 0才有<br>e.g. 24123C0C0C413D423D...etc |



回傳格式：

成功範例 

```json
{
  "RETURN_CODE": 0,
  "RETURN_MESSAGE": "",
  "RESULT": {
    "LC": "210E4C7C7D824C7C7C7F854C93854C828C7C834C4C93847C7D7D7E84854C8084C8"
  }
}
```

失敗範例 

```json
{
  "RETURN_CODE": -99,
  "RETURN_MESSAGE": "id_token 過期",
  "RESULT": {}
}
```





流程圖：

![Google Login (APP
sdk登入)](images\media\image23.png){width="7.478472222222222in"
height="6.4in"}

## 58.流失會員推廣

網址

開發：https://relay-agent.gt.web/common/receive/Member/Collect.aspx

測試：https://relay-agent-twtest.towergame.com/common/receive/Member/Collect.aspx

正式：https://relay-agent.gametower.com.tw/common/receive/Member/Collect.aspx

> 功能描述
>
> 傳入會員資訊(門號、FB ID...)，供其他遊戲推廣使用
>(廣告簡訊、FB廣告受眾...)
> 
>例如：傳入滿貫流失會員，作為金好運廣告簡訊發送名單



傳遞參數方式：

| Request Header |                       |
| -------------- | --------------------- |
| HTTP Method    | POST                  |
| Content Type   | x-www-form-urlencoded |

  

需要參數：

| 參數名稱   | 規格   | 是否必填 | 描述                                                         |
| ---------- | ------ | -------- | ------------------------------------------------------------ |
| GAME_ID    | string | 是       | 遊戲代碼 (請向網頁組申請)                                    |
| DATA       | string | 是       | 會員資料 base64 字串。原始格式參考下方DATA格式：             |
| CHECK_CODE | string | 昰       | 檢查碼<br>CHECK_CODE計算方式是將傳送的參數資料依照 Key 排序，將所有 Value 相加(排除 CHECK_CODE 參數)，最後加上雙方約定的金鑰(PRIVATE_KEY) ，再用 SHA1加密並轉成大寫而成。<br>每個 GAME_ID 會有一個對應的 PRIVATE_KEY (請向網頁組申請) |



DATA格式：

```json
[
 {
  "USER_ID":{會員識別值}
  ,"PHONE_NUMBER":{門號}
  ,"FB_UID":{fb uid}
  ,"LABELS":[
    {標籤1}
    ,{標籤2}
    ...
  ]
 }
 ,{
    "USER_ID":{會員識別值}
    ,"PHONE_NUMBER":{門號}
    ,"FB_UID":{fb uid}
    ,"LABELS":[
     {標籤1}
     ,{標籤2}
     ...
    ]
 }
 ...
]

傳入的 DATA 資料
    USER_ID 必填
    PHONE_NUMBER、FB_UID 至少填一個
    LABELS 至少一個標籤
```



CHECK_CODE範例程式：

```C#
public static string GetCheckCode(NameValueCollection _csDataColl,string _strPrivateKey)
{
     StringBuilder strValue      = new StringBuilder() ;

     // 依照 Key 排序，將所有 Value 相加 (排除 CHECK_CODE 參數)
     foreach(string strKey in _csDataColl.AllKeys.OrderBy(o => o))
     {
         if (!strKey.Equals("CHECK_CODE",StringComparison.OrdinalIgnoreCase))
              strValue.Append(_csDataColl[strKey]) ;
     }
     // 最後加入私Key
     strValue.Append(_strPrivateKey) ;

     return FormsAuthentication.HashPasswordForStoringInConfigFile(strValue.ToString(),"SHA1") ;
}
```



呼叫範例：

| 參數       | 值                                                           | 說明                                     |
| ---------- | ------------------------------------------------------------ | ---------------------------------------- |
| GAME_ID    | TMD                                                          |                                          |
| DATA       | Ww0KICB7DQogICAgIlVTRVJfSUQiOiAiMTAwNTQxNzg4OUBGQiIsDQogICAgIlBIT05FX05VTUJFUiI6ICI4ODY5MDU0Nzc3MzUiLA0KICAgICJGQl9VSUQiOiAiNzk5MjY0NDYzNTUzNzgzIiwNCiAgICAiTEFCRUxTIjogWw0KICAgICAgIua1geWksSINCiAgICBdDQogIH0sDQogIHsNCiAgICAiVVNFUl9JRCI6ICJ5b3UwODMxMSIsDQogICAgIlBIT05FX05VTUJFUiI6ICI4ODY5MzM3ODQ1MTIiLA0KICAgICJGQl9VSUQiOiAiIiwNCiAgICAiTEFCRUxTIjogWw0KICAgICAgIua1geWksSINCiAgICBdDQogIH0sDQogIHsNCiAgICAiVVNFUl9JRCI6ICJUZXN0NyIsDQogICAgIlBIT05FX05VTUJFUiI6ICI4ODY5MzM3Nzk1NTgiLA0KICAgICJGQl9VSUQiOiAiIiwNCiAgICAiTEFCRUxTIjogWw0KICAgICAgIua1geWksSINCiAgICBdDQogIH0NCl0= | 原始DATA參考下方                         |
| CHECK_CODE | 266A394A961EDF45A3690B0532572C460B501757                     | 用 DATA + GAME_ID + PRIVATE_KEY 計算得出 |

原始DATA：

```json
[
     {
       "USER_ID": "1005417889@FB",
       "PHONE_NUMBER": "886905477735",
       "FB_UID": "799264463553783",
       "LABELS": [
         "流失"
       ]
     },
     {
       "USER_ID": "you08311",
       "PHONE_NUMBER": "886933784512",
       "FB_UID": "",
       "LABELS": [
         "流失"
       ]
     },
     {
       "USER_ID": "Test7",
       "PHONE_NUMBER": "886933779558",
       "FB_UID": "",
       "LABELS": [
         "流失"
       ]
     }
   ]
```



回傳參數說明：

| 值             | 說明                 |
| -------------- | -------------------- |
| RETURN_CODE    | 0：成功，其他：失敗  |
| RETURN_MESSAGE | 有錯誤時會有錯誤訊息 |



回傳格式：

成功範例

```json
{
    "RESULT_CODE": "0",
    "RESULT_MESSAGE": "成功"
}
```

失敗範例 

```json
{
  "RESULT_CODE": "-4",
  "RESULT_MESSAGE": "來源表單內容不符，請重新進入。"
}

{
  "RESULT_CODE": "-7",
  "RESULT_MESSAGE": "第 1 筆會員識別值「1005417889@FB」未傳入要蒐集的資料。"
}
```



##  59.儲值消費上限API

網址

開發：<http://www.gt.web/common/receive/Member/CheckIsComsume.aspx>

測試：<https://www-twtest.towergame.com/common/receive/Member/CheckIsComsume.aspx>

正式：<https://www.gametower.com.tw/common/receive/Member/CheckIsComsume.aspx>

> 功能描述
>
> 因遊戲內儲值可能沒有經過網頁組製作的Order頁面就直接到商店頁面完成交易，所以就算玩家超過該遊戲的儲值上限又不在儲值上限白名單的話就不會被阻擋，故相關交易前必須呼叫該API，若玩家可以消費的話再導向至商店。

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |

 

需要參數：

| 參數名稱  | 規格   | 是否必填 | 描述                                                       |
| --------- | ------ | -------- | ---------------------------------------------------------- |
| lc        | string | 是       | LC登入碼                                                   |
| q_nGameNo | string | 是       | 遊戲編號(e.g. 滿貫大亨：3012 隨你玩：1 鑽石金流平台：1001) |
| q_nPoint  | int    | 昰       | 本次交易點數(淘點數)                                       |



回傳參數說明：

| 值             | 說明                                                         |
| -------------- | ------------------------------------------------------------ |
| RETURN_CODE    | 0：成功，其餘：失敗                                          |
| RETURN_MESSAGE | 有錯誤時會有錯誤訊息                                         |
| RESULT         | RETURN_CODE = 0 才會回傳，否則為nul<br>回傳以下參數<br>"IS_CAN_CONSUME"  是否可以消費?!(true OR false) <br>" ALERT_MESSAGE"  若不能交易的話，要給前端玩家看的訊息 (會跟官網的提示訊息一樣)(e.g. 您本月的儲值額度已超過儲值上限，請下月份再行儲值。) |



回傳格式：

成功範例

```json
{
"RETURN_CODE": 0,
"RETURN_MESSAGE": "成功",
"RESULT": 
 {
  "IS_CAN_CONSUME": false,
  "ALERT_MESSAGE": "您本月的儲值額度上限為 XXXXX，本月份您已累計儲值達 XXXXX，加上本次交易額 XXXXXX已超過儲值上限，請重新選擇您的儲值或下月份再行儲值。"
 }
}

{
"RETURN_CODE": 0,
"RETURN_MESSAGE": "成功",
"RESULT": 
 {
  "IS_CAN_CONSUME": true,
  "ALERT_MESSAGE": null
 }
}
```

失敗範例

```json
{
 "RETURN_CODE": -11,
 "RETURN_MESSAGE": "請帶入必要參數",
 "RESULT": null
}
```



##  60.儲值黑名單上限API

網址

開發：<http://www.gt.web/common/receive/Member/GetMemberBlackStatus.aspx>

測試：<https://www-twtest.towergame.com/common/receive/Member/GetMemberBlackStatus.aspx>

正式：<https://www.gametower.com.tw/common/receive/Member/GetMemberBlackStatus.aspx>

> 功能描述
>
> 因遊戲內儲值可能沒有經過網頁組製作的Order頁面就直接到商店頁面完成交易，所以若玩家被客服設定通路黑名單的話就不會被阻擋，故相關交易前必須呼叫該API，若玩家可以消費的話再導向至商店。
>
> 為了方便被擋玩家客訴時客服快速識別是因為黑名單阻擋，阻擋訊息請使用文案「\[940817x02\]此筆交易失敗，請稍侯片刻再進行嘗試，造成您的不便，請多多見諒！」

傳遞參數方式：

| Request Header |      |
| -------------- | ---- |
| HTTP Method    | GET  |



需要參數：

| 參數名稱         | 規格   | 是否必填 | 描述                                                       |
| ---------------- | ------ | -------- | ---------------------------------------------------------- |
| lc               | string | 是       | LC登入碼                                                   |
| q_nGameNo        | string | 是       | 遊戲編號(e.g. 滿貫大亨：3012 隨你玩：1 鑽石金流平台：1001) |
| q_nPlatformNo    | int    | 昰       | 裝置 (1:安卓，2:IOS，0:其他)                               |
| q_nModuleGroupNo | int    | 昰       | 通路群組(1:googleplay儲值，2:IOS儲值)                      |



回傳參數說明：

| 值             | 說明                                                         |
| -------------- | ------------------------------------------------------------ |
| RETURN_CODE    | 0：成功，其餘：失敗                                          |
| RETURN_MESSAGE | 有錯誤時會有錯誤訊息                                         |
| RESULT         | RETURN_CODE = 0 才會回傳，否則為nul<br>回傳以下參數<br>"IS_BLACK"  是否為黑名單(不是黑名單不擋)<br>"LIMIT_START"  儲值下限(是黑名單才會回傳此值)<br>"LIMIT_END"  儲值上限(是黑名單才會回傳此值)<br>"NEXT_SHOULD_SUCCESS"  是否可以成功(0 成功  -1 失敗)<br>"TOTAL_CREDIT"  期間已儲值總額(是黑名單才會回傳此值)<br>※ NEXT_SHOULD_SUCCESS 說明<br>回傳 0 : <br>  "TOTAL_CREDIT" + {玩家選擇的品項金額} < "LIMIT_START"   (不擋) <br>  "LIMIT_START" <= "TOTAL_CREDIT" + {玩家選擇的品項金額} < "LIMIT_END"   (不擋) <br>  "LIMIT_END" <= "TOTAL_CREDIT" + {玩家選擇的品項金額}   (阻擋) <br>回傳 1 : <br>  "TOTAL_CREDIT" + {玩家選擇的品項金額} < "LIMIT_START"   (不擋) <br>  "LIMIT_START" <= "TOTAL_CREDIT" + {玩家選擇的品項金額} < "LIMIT_END"   (阻擋) <br>  "LIMIT_END" <= "TOTAL_CREDIT" + {玩家選擇的品項金額}   (阻擋) |



回傳格式：

成功範例

```json
{
    "RETURN_CODE": 0,
    "RETURN_MESSAGE": "成功",
    "RESULT": {
     "IS_BLACK": true,
     "LIMIT_START": 100
     "LIMIT_END" : 200
     "NEXT_SHOULD_SUCCESS" : 0
     "TOTAL_CREDIT" : 1000
    }
}
```

失敗範例

```json
{
 "RETURN_CODE": -11,
 "RETURN_MESSAGE": "請帶入必要參數",
 "RESULT": null
}
```