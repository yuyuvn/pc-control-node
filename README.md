# pc-control-node

## Installation

### 1. Get IFTTT Webhook key

Go to https://ifttt.com/services/maker_webhooks/settings to set up your webhook, write down your key. You can get your key in url field: `https://maker.ifttt.com/use/YOUR_KEY`

### 2. Clone this repository

```bash
git clone https://github.com/yuyuvn/pc-control-node.git
cd pc-control-node
```

### 3. Sign push.ps1 file

To execuse it in windows enviroment, you need sign it first. Run code below as administrator in powershell.
```powershell
$selfsigncert = New-SelfSignedCertificate `
                -Subject "CN=PowerShell Code Signing" `
                -KeyAlgorithm RSA `
                -KeyLength 2048 `
                -Type CodeSigningCert `
                -CertStoreLocation Cert:\LocalMachine\My\
                
Move-Item "Cert:\LocalMachine\My\$($selfsigncert.Thumbprint)" Cert:\LocalMachine\Root
$selfsignrootcert = "Cert:\LocalMachine\Root\$($selfsigncert.Thumbprint)"
$cert = get-childitem $selfsignrootcert
Set-AuthenticodeSignature ./push.ps1 $cert
```

Run it one time then choose `[A]`, you can also test if your key is worked.

```powershell
./push.ps1 -key YOUR_KEY -event test
```

Output should be like below:
```
Congratulations! You've fired the test event
```

### 4. Set callback to run push.ps1
Use Task scheduler or whatever you like
