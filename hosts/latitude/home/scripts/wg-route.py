#!/usr/bin/env python
import subprocess

def ipgrep(togrep):
    part1 = subprocess.Popen(["ip", "route"], stdout=subprocess.PIPE)
    part2 = subprocess.Popen(["grep", togrep], stdin=part1.stdout, stdout=subprocess.PIPE)
    return(part2)

def main():
    geteps = subprocess.Popen(["wg", "show", "wg0", "endpoints"], stdout=subprocess.PIPE)
    eps = str(geteps.communicate()[0]).split("'")[1].split('\\n')
    eps.pop(2)
    eps = [ i.split('\\t')[1].split(':')[0] for i in eps ]
    endpoints = []
    multiples = []
    for x,i in enumerate(eps):
        multiple = False
        for y,j in enumerate(eps):
            if i == j and x != y:
                multiple = True
        if i not in multiples:
            endpoints.append(eps[x])
        else:
            break
        if multiple == True:
            multiples.append(i)
    
    gw_dev = []
    for x,i in enumerate(str(ipgrep("default").communicate()[0]).split(' ')):
        if x == 2 or x == 4:
            gw_dev.append(i)
    
    for i in endpoints:
        found = str(ipgrep(i).communicate()[0]).split("'")[1].rstrip('\\n ')
        if found != "":
            subprocess.Popen(["ip", "route", "del", i])
        subprocess.Popen(["ip", "route", "add", i, "via", gw_dev[0], "dev", gw_dev[1]])


if __name__ == "__main__":
    main()