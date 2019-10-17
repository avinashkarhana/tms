from django import template
register = template.Library()

@register.filter(name = 'remno')
def remno(value):
    qw=''.join([i for i in value if not i.isdigit()])
    return (qw)