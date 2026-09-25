#!/bin/sh
# Fails if any ACL review line number was typeset inside a text column
# rather than in a margin. Run after building.
python3 -c "
import pdfplumber, collections, sys
tot=0; pages=set()
with pdfplumber.open('main.pdf') as pdf:
    for i,p in enumerate(pdf.pages,1):
        rows=collections.defaultdict(list)
        for ch in p.chars:
            if 'NimbusSanL-Bold' in ch['fontname'] and 7.5<ch['size']<8.5 and ch.get('non_stroking_color')==(0.75,):
                rows[round(ch['top'],0)].append(ch)
        for y,chs in rows.items():
            chs.sort(key=lambda c:c['x0'])
            run=[chs[0]]; runs=[]
            for c in chs[1:]:
                if c['x0']-run[-1]['x1']<3: run.append(c)
                else: runs.append(run); run=[c]
            runs.append(run)
            for r in runs:
                if not (r[0]['x0']<40 or r[0]['x0']>550):
                    tot+=1; pages.add(i)
if tot:
    print('FAIL: %d stray line numbers on pages %s -- run another pdflatex pass' % (tot, sorted(pages)))
    sys.exit(1)
print('OK: all line numbers are in the margins')
"
