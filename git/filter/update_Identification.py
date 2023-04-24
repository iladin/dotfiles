#!/usr/bin/env python3
import sys
import subprocess

def clean_line(line):
    """Cleans a line by removing characters beyond column 72 and trailing whitespace."""
    return line[:72].rstrip() + '\n'

def smudge_line(line):
    """Smudges a line by adding the output of 'git blame' in the specified format."""
    blame = subprocess.check_output(['git', 'blame', '-L', f'{line},{line}', sys.argv[3]])
    blame_parts = blame.decode().split()
    initials = ''.join(part[0] for part in blame_parts[2:4])
    date_parts = blame_parts[4].split('-')
    date = f"{date_parts[0][-2:]}{date_parts[1]}{date_parts[2]}"
    return f"{clean_line(line)}  {initials}{date}\n"

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
            sys.stdout.write(clean_line(line))
    elif mode == 'smudge':
        for line in lines:
            sys.stdout.write(smudge_line(line.rstrip()))
    else:
        sys.stderr.write(f'Unsupported mode "{mode}".\n')
        sys.exit(1)

if __name__ == '__main__':
    main()
