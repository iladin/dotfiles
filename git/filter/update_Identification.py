#!/usr/bin/env python3
import sys
import subprocess

def clean_line(line):
    """Cleans a line by removing characters beyond column 72 and trailing whitespace."""
    return line[:72].ljust(72)

def smudge_line(line, line_no):
    """Smudges a line by adding the output of 'git blame' in the specified format."""
    blame = subprocess.check_output(['git', 'blame', '-L', f'{line_no},{line_no}', sys.argv[3]])
    blame_parts = blame.decode().split()
    first_initial = blame_parts[1][1:2]
    if blame_parts[2][0] == '2':
        last_initial = '@'
        blame_index=2
    else:
        last_initial = blame_parts[2][0:1]
        blame_index=3
    initials = first_initial + last_initial
    date_parts = blame_parts[blame_index].split('-')
    year=date_parts[0][-2:]
    month=date_parts[1]
    day=date_parts[2]
    date = year + month + day
    cleaned_line=clean_line(line)
    return_line=f"{cleaned_line}{initials}{date}\n"
    return return_line

def main():
    if len(sys.argv) < 2 or sys.argv[1] not in ('clean', 'smudge'):
        sys.stderr.write('Usage: clean_and_smudge.py <mode> [-f <filename>]\n')
        sys.stderr.write('Mode must be "clean" or "smudge".\n')
        sys.exit(1)

    mode = sys.argv[1]

    if len(sys.argv) > 2 and sys.argv[2] == '-f' and len(sys.argv) > 3 and sys.argv[3]:
        with open(sys.argv[3], 'r') as f:
            lines = f.readlines()
    else:
        lines = sys.stdin.readlines()

    if mode == 'clean':
        for line in lines:
            sys.stdout.write(clean_line(line,))
    elif mode == 'smudge':
        for line_no, line in enumerate(lines):
            sys.stdout.write(smudge_line(line.rstrip(),line_no + 1))
    else:
        sys.stderr.write(f'Unsupported mode "{mode}".\n')
        sys.exit(1)

if __name__ == '__main__':
    main()
