# 利用IIS應用程式集區實現負載平衡

開始 → 執行 → 輸入 `Inetmgr` 開啟 IIS 管理介面 → 應用程式集區  → e.g. GTW_Web → 右鍵 → 進階設定

![image-20210929143013669](http://igscloud2/index.php/s/GMjLffrq4874tz9/preview)

工作者處理序上限：3 (設為 3 代表該站台會產生 3 個 w3wp.exe 執行個體)

![image-20210929143025694](http://igscloud2/index.php/s/ayLHn2eGDqcFoKf/preview)