# WebCase 日報轉 Google 日報

[TOC]

### 1. Chrome 連 [21.個人日報 - 今日工作](http://www.webcase.web/board/Board21.aspx) 按 F12 開啟 ```開發人員工具```



### 2. ```Source``` > ```Snippets``` > ```+New snippet```

![image-20210702155045132](http://igscloud2/index.php/s/s8TFwgttzPLrSi7/preview)



### 3. 於右邊窗格貼上以下指令碼

![image-20210702155232181](http://igscloud2/index.php/s/mKk6AAwpRGPZ2KP/preview)

```javascript
let oMember       = {
    "侯志成" : "A",
    "呂正中" : "A",
    "謝昇富" : "A",
    "王峻鴻" : "A",
    "翁士祐" : "A",
    "王琮郁" : "A",
    "盧泛菲" : "A",
    "王家隆" : "A",
    "吳俊生" : "B",
    "魏嘉男" : "B",
    "林宥良" : "B",
    "吳志豪" : "B",
    "林子傑" : "B",
    "黃汶淑" : "B",
    "陳姝姝" : "B",
    "陳怡如" : "B",
}
let strResult     = "";
$("td[width=20][align=center]:contains('#'):first").closest("tr").siblings().each((i, item) => {
    let rgTds     = $(item).find("td");
    let strName   = $("select[name=f_nRole]").closest("td").text().substr(6, 3);

    strResult     += `${strResult == "" ? "" : "\r\n"}${(new Date()).toLocaleDateString()}`;
    strResult     += `\t${strName}`;
    strResult     += `\t${$(rgTds[2]).text()}`;
    strResult     += `\t${$(rgTds[4]).text()}`;
    strResult     += `\t${$(rgTds[4]).find("a").attr("href").split("=")[1]}`;

    let strTeam   = oMember[strName];
    let nProgress = $(rgTds[7]).html().split("<br>")[0];

    strResult     += `\t${strTeam == "A" ? nProgress +"%" : ""}`;
    strResult     += `\t${strTeam == "B" ? nProgress +"%" : ""}`;
    strResult     += `\t${strTeam == "C" ? nProgress +"%" : ""}`;

    strResult     += `\t${$(rgTds[9]).find("span:first").text().split(" ")[0]}`;
    strResult     += `\t${$(rgTds[10]).find("span:first").text().split(" ")[0]}`;

    let rgstrMemo = [];
    $(rgTds[5]).find("pre").html().split("<br>").forEach((pre, j) => {
        rgstrMemo.push($($.parseHTML(pre)).text());
    });
    strResult     += `\t"${rgstrMemo.join("\r\n")}"`;
});
copy(strResult);
```



### 4. 於項目點右鍵，選 ```Rename...```

![image-20210702155459176](http://igscloud2/index.php/s/MPrWM33ptXagjym/preview)



### 5. 更名為 ```產出並複製Google日報```



### 6. Ctrl + S 儲存腳本



### 7. 於項目點右鍵，選 ```Run``` 複製日報

![image-20210702155958933](http://igscloud2/index.php/s/fHY9HWQ74wq4MCp/preview)



### 8. 將複製的日報貼入 [Google 報表](https://docs.google.com/spreadsheets/d/1mRGcE5rfytXucbrufbUu4Ela8qOAa41NnnFY7HHj0-Q/edit#gid=0)

![image-20210702160551122](http://igscloud2/index.php/s/63D2tzXfBkdBc96/preview)