pip install --upgrade pip
sudo pip3 install Pandas
sudo pip3 install xlwt

Traceback (most recent call last):
  File "/app/work/aml/pandas/aml.py", line 114, in <module>
    mysql.export('tb_company', 'test_input.xls')
  File "/app/work/aml/pandas/aml.py", line 82, in export
    self.exportsheet(workbook, 'tb_ins_rcla')
  File "/app/work/aml/pandas/aml.py", line 38, in exportsheet
    self._cursor.scroll(0, mode='absolute')
  File "/usr/local/lib64/python3.6/site-packages/pymysql/cursors.py", line 321, in scroll
    raise IndexError("out of range")
IndexError: out of range