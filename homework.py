from tornado import httpserver
from tornado import ioloop
from tornado import options
from tornado.web import RequestHandler, Application
import pymysql, os

from tornado.options import define, options
define('port', default='8080', type=int)

class IndexHandler(RequestHandler):
    def get(self):
        self.render('index.html')

class SelectHandler(RequestHandler):
    def get(self):
        self.render('page.html', types='select')

    def post(self, *args, **kwargs):
        stu_id = self.get_argument('stu_id')
        conn = pymysql.Connect(user='root',passwd='root',db='university',charset='utf8')
        cur = conn.cursor()
        # result = []
        if stu_id == '':
            cur.execute('select * from student')
        else:
            cur.execute('select * from student where ID = '+str(stu_id))
        result = cur.fetchall()
        cur.close()
        conn.close()
        self.render('result.html', types='select',result=result)

class InsertHandler(RequestHandler):
    def get(self):
        self.render('page.html', types='insert')

    def post(self, *args, **kwargs):
        stu_id = self.get_argument('stu_id')
        name = self.get_argument('name')
        dept_name = self.get_argument('dept_name')
        cred = self.get_argument('tot_cred')

        item = [stu_id, name, dept_name, cred]
        conn = pymysql.Connect(user='root', passwd='root', db='university', charset='utf8')
        cur = conn.cursor()
        sql = 'insert student values(%s, %s, %s, %s)'
        cur.execute(sql, item)
        conn.commit()
        cur.close()
        conn.close()
        self.render('result2.html', types='insert')

class UpdateHandler(RequestHandler):
    def get(self):
        self.render('page.html', types='update')

    def post(self, *args, **kwargs):
        stu_id = self.get_argument('stu_id')
        name = self.get_argument('name')
        dept_name = self.get_argument('dept_name')
        cred = self.get_argument('tot_cred')

        item = [ name, dept_name, cred, stu_id]
        conn = pymysql.Connect(user='root', passwd='root', db='university', charset='utf8')
        cur = conn.cursor()
        sql = 'update student set name = %s, dept_name = %s, tot_cred = %s where ID = %s '
        cur.execute(sql, item)
        conn.commit()
        cur.close()
        conn.close()
        self.render('result2.html', types='update')

class DeleteHandler(RequestHandler):
    def get(self):
        self.render('page.html', types='delete')

    def post(self):
        stu_id = self.get_argument('stu_id')
        conn = pymysql.Connect(user='root', passwd='root', db='university', charset='utf8')
        cur = conn.cursor()
        sql = 'delete from student where ID = '+str(stu_id)
        cur.execute(sql)
        conn.commit()
        cur.close()
        conn.close()
        self.render('result2.html', types='delete')


if __name__ == '__main__':
    app = Application([
        ('/', IndexHandler),
        ('/select', SelectHandler),
        ('/insert', InsertHandler),
        ('/update', UpdateHandler),
        ('/delete', DeleteHandler)
    ],
        debug=True,
        template_path="templates",
        static_path="static"
    )
    server = httpserver.HTTPServer(app)
    server.listen(options.port, address='0.0.0.0')
    ioloop.IOLoop.instance().start()
