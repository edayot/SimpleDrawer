@ECHO OFF
py -m beet l --minecraft "C:\Users\erwan\AppData\Roaming\PrismLauncher\instances\1.20.1\.minecraft" 
py -m beet l --resource-pack "C:\Users\erwan\AppData\Roaming\PrismLauncher\instances\1.20.1\.minecraft\resourcepacks"
py -m beet l --data-pack "C:\Users\erwan\Documents\Dev\Server\world\datapacks"

py -m beet --project .\beet-dev.yaml w


