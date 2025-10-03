"""Find JPG/JPEG files in docs/linearni_algerbra_diskretni_mat and append
Markdown image embeds to index.md if not already present.
"""
from pathlib import Path


def main():
    folder = Path(__file__).resolve().parents[1] / 'docs' / 'linearni_algerbra_diskretni_mat'
    if not folder.exists():
        print('Folder not found:', folder)
        return
    jpgs = [p for p in folder.iterdir() if p.suffix.lower() in ('.jpg', '.jpeg')]
    if not jpgs:
        print('No jpg files found in', folder)
        return
    index = folder / 'index.md'
    text = index.read_text(encoding='utf-8') if index.exists() else ''
    added = []
    for jpg in sorted(jpgs):
        md = f'![]({jpg.name})'
        if md not in text:
            text += '\n' + md + '\n'
            added.append(jpg.name)
    if added:
        index.write_text(text, encoding='utf-8')
        print('Added images to index.md:')
        for a in added:
            print('-', a)
    else:
        print('No new images to add.')


if __name__ == '__main__':
    main()
