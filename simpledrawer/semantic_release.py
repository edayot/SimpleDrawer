
"""Monkey-patch semantic_release shell() to ignore the env parameter.

This module must be imported before semantic_release runs.
"""

from __future__ import annotations

from collections.abc import Mapping
import sys
import subprocess

from semantic_release.cli.commands import version as version_module
from semantic_release.__main__ import main as _semantic_release_main
import os


_original_shell = version_module.shell


def _patched_shell(
	cmd: str, *, env: Mapping[str, str] | None = None, check: bool = True
) -> subprocess.CompletedProcess:
	"""Wrapper around semantic_release shell() that ignores the env argument."""

	# Do not forward "env" to the original implementation.
	# list all environment variables to pass to subprocess
	# this is needed to fix issues with DISPLAY variable missing in some environments
	new_env = os.environ.copy()
	new_env.update(env or {})

	return _original_shell(cmd, env=new_env, check=check)


# Apply the monkey-patch.
version_module.shell = _patched_shell


def main() -> None:
	"""Entry point that runs semantic-release CLI with the monkey-patch applied."""
	# semantic_release's CLI is Click-based and reads arguments from sys.argv,
	# so we just delegate to its main function.
	_semantic_release_main()


if __name__ == "__main__":  # pragma: no cover - manual CLI invocation
	main()



