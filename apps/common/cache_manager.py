#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: liuyc
@file: cache_manager.py
@time: 2017/7/24 20:32
@describe:
"""

import redis
from apscheduler.schedulers.background import BackgroundScheduler

from notes.models import Notes

RUNNING_TIMER = False
REDIS_DB = redis.StrictRedis(host='127.0.0.1', port=6379, db=2)


class CacheMannager(object):
    def __init__(self):
        pass

    def update_click(self, node):
        if REDIS_DB.hexists("CLICKS", node.id):
            print('REDIS_DB.hexists...' + str(node.id))
            REDIS_DB.hincrby('CLICKS', node.id)
        else:
            print('REDIS_DB.not_hexists...' + str(node.id))
            REDIS_DB.hset("CLICKS", node.id, node.click_nums+1)
        self.run_timer()

    def get_click(self, node):
        """ 获取点击数 """
        if REDIS_DB.hexists("CLICK", node.id):
            return REDIS_DB.hget("CLICK", node.id)
        else:
            REDIS_DB.hset("CLICKS", node.id, node.click_nums)
            return node.click_nums

    def run_timer(self):
        global RUNNING_TIMER
        if not RUNNING_TIMER:
            RUNNING_TIMER = True
            # 30分钟同步一次文章点击率
            print("30分钟同步一次文章点击率 ")
            scheduler = BackgroundScheduler()
            scheduler.add_job(self.sync_click, 'interval', minutes=30)
            scheduler.start()

    def sync_click(self):
        for k in REDIS_DB.hkeys("CLICKS"):
            try:
                obj = Notes.objects.get(id=k)
                if not obj:
                    continue
                print('db_click={0}'.format(obj.click_nums))
                cache_click = self.get_click(obj)
                print('cache_click={0}'.format(cache_click))
                if cache_click != obj.click_nums:
                    obj.click_nums = cache_click
                    obj.save()
            except:
                print("Error sync_click")


