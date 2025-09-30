import yaml, sys, subprocess, json

def main(yaml_file):
    with open(yaml_file, "r") as f:
        config = yaml.safe_load(f)

    # Write tfvars.json
    with open("../terraform.tfvars.json", "w") as f:
        json.dump(config, f)

    subprocess.run(["terraform", "init"], cwd="..")
    subprocess.run(["terraform", "apply", "-auto-approve"], cwd="..")

if __name__ == "__main__":
    main(sys.argv[1])
