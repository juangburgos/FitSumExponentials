from pyarma import *

def cumtrapz(x, y):
    return join_vert(mat(1,1), 0.5 * cumsum(diff(x) @ (y[1:y.n_elem-1,0] + y[0:y.n_elem-2,0])))

def join_horizontal(*args):
    if type(args[0]) is tuple:
        args = args[0]
    if len(args) == 1:
        return args[0]
    else:
        return join_horiz(args[0], join_horizontal(args[1:len(args)]))