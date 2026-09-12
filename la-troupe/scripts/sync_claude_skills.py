"""Synchronize Claude's project skills with the Codex adapters."""

from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / ".agents" / "skills"
TARGET = ROOT / ".claude" / "skills"


def main() -> int:
    check = "--check" in sys.argv[1:]
    sources = sorted(SOURCE.glob("*/SKILL.md"))
    errors = []

    for source in sources:
        target = TARGET / source.parent.name / "SKILL.md"
        content = source.read_bytes()
        if check:
            if not target.is_file() or target.read_bytes() != content:
                errors.append(str(target.relative_to(ROOT)))
        else:
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(content)

    extras = set(TARGET.glob("*/SKILL.md")) - {
        TARGET / source.parent.name / "SKILL.md" for source in sources
    }
    errors.extend(str(path.relative_to(ROOT)) for path in sorted(extras))

    if errors:
        print("Adaptateurs Claude absents, divergents ou surnumeraires:", file=sys.stderr)
        print("\n".join(errors), file=sys.stderr)
        return 1

    print(f"Claude : {len(sources)} adaptateurs {'synchronises' if not check else 'identiques a Codex'}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
