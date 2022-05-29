# Automation Test On Digikala

### Test Scenario :

- مرتب سازی قیمت ها بر اساس گرانترین

### Test Case :

- کاربر به دسته بندی لپ تاپ برود
- در قسمت مرتب سازی گزینه گرانترین را انتخاب کند
- قیمت لپ تاپ ها از گرانترین به ارزان ترین مرتب شود

### Pre-Conditions :

 نصب و فعال سازی محیط تست و اجرای تست

-  python 3.8 نصب

- دستور زیر را در ترمینال اجرا کنید تا محیط تست ایجاد شود

      python3 -m virtualenv venv

- در ترمینال با دستور زیر محیط تست را فعال کنید

      source venv/bin/activate

- برای اجرای تست در مرورگر کروم آخرین نسخه درایور را دانلود کرده و در دایرکتوری زیر قرار دهید:

      https://sites.google.com/chromium.org/driver/

      "venv/bin" directory

- در ترمینال با دستور زیر کتابخانه های مربوط به ربات فریمورک را نصب کنید

      pip install -r requirements.txt

- در ترمینال با دستور زیر فایل تست را اجرا کنید

      robot ~/test.robot

### Expected Result :

- قیمت ها بر اساس گرانترین مرتب شود
