import subprocess

subprocess.run(["terraform", "destroy", "-auto-approve"], cwd="..")
