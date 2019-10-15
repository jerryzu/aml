#!/usr/bin/python3
# -*- coding: UTF-8 -*-
import sys, getopt
import xlwt
import pymysql
import pandas as pd
import configparser

class MYSQL:
    def __init__(self):
        pass

    def connectDB(self):
        try:
            config=configparser.ConfigParser()  
            config.read('db.ini')
            self._connect = pymysql.Connect(
                host=config.get('mysql','host'),
                port=config.getint('mysql','port'),
                user=config.get('mysql','user'),
                passwd=config.get('mysql','passwd'),
                db=config.get('mysql','db'),
                charset=config.get('mysql','charset')
            )
            return 0
        except:
            return -1

    def exportsheet(self, workbook, table_name):
        self._cursor = self._connect.cursor()
        count = self._cursor.execute('select * from '+table_name)
        print(count)
        results = self._cursor.fetchall()
        fields = self._cursor.description
        sheet = workbook.add_sheet(table_name, cell_overwrite_ok=True)
        for field in range(0, len(fields)):
            sheet.write(0, field, fields[field][0])
        row = 1
        col = 0
        for row in range(1, len(results)+1):
            for col in range(0, len(fields)):
                sheet.write(row, col, u'%s' % results[row-1][col])

    def exportexcel(self, output_path):
        workbook = xlwt.Workbook()
        self.exportsheet(workbook, 'tb_company')
        self.exportsheet(workbook, 'tb_ins_rtype')
        self.exportsheet(workbook, 'tb_ins_pers')
        self.exportsheet(workbook, 'tb_ins_unit')
        self.exportsheet(workbook, 'tb_ins_bo')
        self.exportsheet(workbook, 'tb_ins_rpol')
        self.exportsheet(workbook, 'tb_ins_gpol')
        self.exportsheet(workbook, 'tb_ins_fav_cst')
        self.exportsheet(workbook, 'tb_ins_renewal')
        self.exportsheet(workbook, 'tb_ins_rsur')
        self.exportsheet(workbook, 'tb_ins_rpay')
        self.exportsheet(workbook, 'tb_ins_rcla')
        self.exportsheet(workbook, 'tb_ins_rchg')
        self.exportsheet(workbook, 'tb_ins_risk_new')
        self.exportsheet(workbook, 'tb_ins_risk')
        self.exportsheet(workbook, 'tb_lar_report')
        self.exportsheet(workbook, 'tb_sus_report')
        workbook.save(output_path)

    def exportcsv(self, output_path, sql):
        df = pd.read_sql(sql, con=self._connect)
        print(df.head())
        csvfile = output_path + '/' + table_name + '.csv'
        df.to_csv(csvfile,quotechar='"',sep='|' 
        # ,line_terminator =''
        )

    def exportcsvs(self, output_path):
        self.exportcsv(output_path, 'tb_company')
        self.exportcsv(output_path,  'tb_ins_rtype')
        self.exportcsv(output_path,  'tb_ins_pers')
        self.exportcsv(output_path,  'tb_ins_unit')
        self.exportcsv(output_path,  'tb_ins_bo')
        self.exportcsv(output_path,  'tb_ins_rpol')
        self.exportcsv(output_path,  'tb_ins_gpol')
        self.exportcsv(output_path,  'tb_ins_fav_cst')
        self.exportcsv(output_path,  'tb_ins_renewal')
        self.exportcsv(output_path,  'tb_ins_rsur')
        self.exportcsv(output_path,  'tb_ins_rpay')
        self.exportcsv(output_path,  'tb_ins_rcla')
        self.exportcsv(output_path,  'tb_ins_rchg')
        self.exportcsv(output_path,  'tb_ins_risk_new')
        self.exportcsv(output_path,  'tb_ins_risk')
        self.exportcsv(output_path,  'tb_lar_report')
        self.exportcsv(output_path,  'tb_sus_report')

if __name__ == '__main__':
    argv = sys.argv[1:]
    if argv: 
        pass
    else: 
        print('请提供导出文件类型参数:csv或excel')
        sys.exit(2)
        
    try:
        opts, args = getopt.getopt(argv,"he:", ["help","export="])
    except getopt.GetoptError:
        print('aml.py -e <exportfiletype>')
        sys.exit(2)
    for opt, arg in opts:
        if opt in ('-h', '--help'):
            print('aml.py -e<exportfiletype>')
            print('aml.py --export <exportfiletype>')
            print('    exportfiletype:')    
            print('      c: csv')    
            print('      e: excel')    
        elif opt in ("-e", "--export"):
            exportfiletype=arg
            if exportfiletype in ('csv', 'excel'):
                print('导出文件类型:', exportfiletype)
            else:
                print('导出文件类型:', exportfiletype)
                print('导出文件类型参数只能是:csv或excel')
                sys.exit(2)

    mysql = MYSQL()
    flag = mysql.connectDB()
    if flag == -1:
        print('数据库连接失败')
    else:
        print('数据库连接成功')
        if exportfiletype == 'excel':
            mysql.exportexcel('test_input.xls')
        elif exportfiletype == 'csv':
            mysql.exportcsvs('csv')