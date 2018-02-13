from datetime import datetime
now = datetime.now()

print '%s-%s-%s' % (now.year, now.month, now.day)

print '%s/%s/%s' % (now.month, now.day, now.year)
