from django.core.cache import cache

class ICache(object):
	timeout = 60*60*24*5

	def incr(self, key):
		if not cache.has_key(key):
			cache.set(key, 0, self.timeout)
		else:
			cache.incr(key)

	def incr_many(self, keys):
		values = cache.get_many(keys)
		for key in keys:
			if key in values:
				values[key] += 1
			else:
				values[key] = 0

		cache.set_many(values, self.timeout)

	def get_sum(self, keys):
		objects = cache.get_many(keys)
		s = 0
		for k, v in objects.iteritems():
			s = s + v

		return s

	def get_versioned(self, key, version):
		obj = cache.get(key)
		if obj != None:
			if obj['version'] == version:
				return obj['value']
			else:
				cache.delete(key)
		return None

	def set_versioned(self, key, value, version):
		cache.set(key, {
			'value': value,
			'version': version
		}, self.timeout)



icache = ICache()