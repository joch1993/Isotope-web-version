#!/bin/zsh
set -euo pipefail
ROOT="/Users/jonathanchristensen/Desktop/ai_workspace"
cp "$ROOT/app.R" "$ROOT/isotope-web-src/app.R"
python3 - <<'PY'
import json, re
from pathlib import Path
root = Path("/Users/jonathanchristensen/Desktop/ai_workspace")
app = (root / "app.R").read_text(encoding="utf-8")
(root / "isotope-web" / "app.json").write_text(
    json.dumps([{"name": "app.R", "content": app}], ensure_ascii=False, separators=(",", ":")),
    encoding="utf-8",
)
m = re.search(r'(id = "iso-web-build", class = "iso-build", ")v(\d+)', app)
nxt = int(m.group(2)) + 1 if m else 40
app = re.sub(r'(id = "iso-web-build", class = "iso-build", ")v\d+', rf'\g<1>v{nxt}', app)
idx = root / "isotope-web" / "index.html"
html = idx.read_text(encoding="utf-8")
html = re.sub(r'(id="iso-build-stamp"[^>]*>)v\d+', rf'\g<1>v{nxt}', html)
idx.write_text(html, encoding="utf-8")
(root / "app.R").write_text(app, encoding="utf-8")
(root / "isotope-web-src" / "app.R").write_text(app, encoding="utf-8")
(root / "isotope-web" / "app.json").write_text(
    json.dumps([{"name": "app.R", "content": app}], ensure_ascii=False, separators=(",", ":")),
    encoding="utf-8",
)
print("sw", nxt, "app.json", (root / "isotope-web" / "app.json").stat().st_size)
PY
echo "local export ready; push isotope-web to joch1993/Isotope-web-version"
