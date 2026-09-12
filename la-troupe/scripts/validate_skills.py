"""Validate La Troupe and adapter skill metadata."""

from pathlib import Path
import sys

import yaml


WORKSPACE = Path(__file__).resolve().parents[2]


def skill_files() -> list[Path]:
    roots = [
        WORKSPACE / ".agents" / "skills",
        WORKSPACE / "la-troupe" / "core",
        WORKSPACE / "la-troupe" / "modules",
        WORKSPACE / "la-troupe" / "workflows",
    ]
    files = [WORKSPACE / "la-troupe" / "SKILL.md"]
    for root in roots:
        files.extend(root.glob("*/SKILL.md"))
    return sorted(files)


def frontmatter(path: Path) -> dict:
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---\n"):
        raise ValueError("frontmatter YAML absent")
    try:
        raw = text.split("---\n", 2)[1]
        data = yaml.safe_load(raw)
    except (IndexError, yaml.YAMLError) as exc:
        raise ValueError(f"frontmatter YAML invalide: {exc}") from exc
    if not isinstance(data, dict):
        raise ValueError("frontmatter YAML vide")
    if "TODO" in text:
        raise ValueError("marqueur TODO restant")
    return data


def main() -> int:
    errors: list[str] = []
    files = skill_files()
    for path in files:
        try:
            data = frontmatter(path)
            if not isinstance(data.get("name"), str) or not data["name"].strip():
                raise ValueError("name absent")
            description = data.get("description")
            if not isinstance(description, str) or len(description.strip()) < 40:
                raise ValueError("description absente ou trop courte")

            interface = path.parent / "agents" / "openai.yaml"
            if interface.exists():
                ui = yaml.safe_load(interface.read_text(encoding="utf-8")) or {}
                fields = ui.get("interface", {})
                short = fields.get("short_description", "")
                if not 25 <= len(short) <= 64:
                    raise ValueError("short_description doit contenir 25 a 64 caracteres")
        except (OSError, ValueError, yaml.YAMLError) as exc:
            errors.append(f"{path.relative_to(WORKSPACE)}: {exc}")

    if errors:
        print("\n".join(errors), file=sys.stderr)
        return 1

    print(f"La Troupe: {len(files)} skills valides.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
