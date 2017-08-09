# -*- coding: utf-8 -*-
import json


class Export(object):
    def __init__(self):
        pass

    def get_objects(self, notes):
        lst = []
        for note in notes:
            pass

        return [ ]

    def get_json_export(self, notes):
        results = self.get_objects(notes)
        return json.dumps({'notes':results}, ensure_ascii=False, indent=4)