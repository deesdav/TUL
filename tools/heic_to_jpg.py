"""Convert .HEIC images under docs/ to .jpg and write small Markdown snippets
to embed them in their folder index.md files.

Usage:
    py tools\heic_to_jpg.py

Requires: pillow, pyheif
Install with: py -m pip install pillow pyheif
"""
from pathlib import Path
from PIL import Image
try:
    import pillow_heif
    HEIF_BACKEND = 'pillow_heif'
except Exception:
    try:
        import pyheif
        HEIF_BACKEND = 'pyheif'
    except Exception:
        HEIF_BACKEND = None


def convert_heic(src: Path, dst: Path):
    if HEIF_BACKEND == 'pillow_heif':
        img = pillow_heif.open_heif(src)
        pil = Image.frombytes(img.mode, img.size, img.data, 'raw', img.mode)
        pil.save(dst, format='JPEG', quality=90)
    elif HEIF_BACKEND == 'pyheif':
        heif_file = pyheif.read(src)
        image = Image.frombytes(
            heif_file.mode,
            heif_file.size,
            heif_file.data,
            "raw",
            heif_file.mode,
        )
        image.save(dst, format='JPEG', quality=90)
    else:
        raise RuntimeError('No HEIF backend available (pillow_heif or pyheif)')


def ensure_index_has_images(index_path: Path, images):
    if not index_path.exists():
        index_path.write_text('# Images\n\n')
    text = index_path.read_text(encoding='utf-8')
    lines = []
    for img in images:
        rel = img.name
        md = f'![]({rel})'
        if md not in text:
            lines.append(md)
    if lines:
        with index_path.open('a', encoding='utf-8') as f:
            f.write('\n'.join(lines) + '\n')


def main():
    root = Path(__file__).resolve().parents[1] / 'docs'
    heics = list(root.rglob('*.HEIC'))
    if not heics:
        print('No HEIC files found under docs/')
        return

    for h in heics:
        jpg = h.with_suffix('.jpg')
        try:
            convert_heic(h, jpg)
            print(f'Converted: {h} -> {jpg}')
            # add to index.md in same folder
            index = h.parent / 'index.md'
            ensure_index_has_images(index, [jpg])
        except Exception as e:
            print(f'Failed to convert {h}: {e}')


if __name__ == '__main__':
    main()
