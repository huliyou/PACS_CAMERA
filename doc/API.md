# PACS_CAMERA

## Login

### request
> 登陆信息验证

|Method|参数1|参数2|eg|
|-----|------|----|---|
|get|username|password|{"username":"huliyou","password":"password"}|

### response
> 登陆成功 200 返回用户信息

|Status|参数   |eg|
|------|---   |--|
|200   |userid|{"userid":"11111111"}

> 登陆不成功 403

|Method|Status|
|---|---------|
|get|403|

## Condition
### request
> 类型

|Method|参数1|eg|
|-|-|-|
|get|method|{"method":"condition"}

### response
> 返回数据类型

|Method|eg|
|-|:-|
|get|[{"conditionName":"xxx","conditionid":"xxx"},{"conditionName":"xxx","conditionid":"xxx"}]

> 返回失败

|Method|Status|
|---|---------|
|get|502|

## Upload

### request
> 单组图片上传

|method|参数1|参数2|参数3|参数4|eg
|-|-|-|-|-|-|
|POST|userid|patientid|conditionid|date|{"userid":"xxx","patientid":"xxx","conditionid":"xxx","date","1990-4-22-10-13"}
```
图片文件 文件名规则 $1_$2.png  $1组 $2单元
```
### response
> 上传成功

|Method|Status|
|-|-|
|post|200|

> 上传失败

|Method|Status|
|-|-|
|pst|502|

## UploadGroups
### request
> 多组图片上传

|Method|参数1|参数2|eg|
|--|--|--|--|
|POST|groupid|groupContent|[{"groupid":"$1","groupContent":"{"userid":"xxx","patientid":"xxx","conditionid":"xxx","date","1990-4-22-10-13"}"}]
```
图片文件 文件名规则 $1_$2.png  $1组 $2单元
```
### response
> 上传成功

|Method|Status|
|-|-|
|post|200|

> 上传失败

|Method|Status|
|-|-|
|pst|502|
