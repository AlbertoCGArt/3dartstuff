$outputDir = "H:\TheHub\3dartstuff\images"
if (!(Test-Path $outputDir)) { New-Item -ItemType Directory -Path $outputDir | Out-Null }

$images = @(
    "https://images.squarespace-cdn.com/content/v1/649dafaba60a166f753a617a/f6879349-305f-4898-805d-72e76460b0ba/scifi_scanner_ac_03.jpg",
    "https://images.squarespace-cdn.com/content/v1/649dafaba60a166f753a617a/1688156266750-CJ1TZ4TR5SO8WLE4DDPF/ac_scope_02.jpg",
    "https://images.squarespace-cdn.com/content/v1/649dafaba60a166f753a617a/97f35a71-dfbc-4d0c-a81e-7470c10a54de/sci-fi_battery_ac_01.jpg",
    "https://images.squarespace-cdn.com/content/v1/649dafaba60a166f753a617a/8805f31c-2810-4c54-b868-5ddbc14c440a/workshop_blockout_20.png",
    "https://images.squarespace-cdn.com/content/v1/649dafaba60a166f753a617a/22145a83-2a2b-4a87-a662-7588b6b498f7/ac_The_back_Room_a.jpg",
    "https://images.squarespace-cdn.com/content/v1/649dafaba60a166f753a617a/57159a24-e79c-4b6d-9a6d-c5894e3d1755/ac_scope_03.jpg",
    "https://images.squarespace-cdn.com/content/v1/649dafaba60a166f753a617a/1261d5b5-b7f8-45cb-9775-bf07c7f3f408/scifi_scanner_ac_06.png",
    "https://images.squarespace-cdn.com/content/v1/649dafaba60a166f753a617a/dcae0779-73d9-4bd9-9266-830c29b12c0f/blending_mats_02.png",
    "https://images.squarespace-cdn.com/content/v1/649dafaba60a166f753a617a/2a91cc75-a531-4e69-8f59-5e093a2a84be/vertex_paint_01.png",
    "https://images.squarespace-cdn.com/content/v1/649dafaba60a166f753a617a/1d827ffa-765b-47ca-a8b0-7025592ba33c/random_modeling_in_plasticity1.jpg",
    "https://images.squarespace-cdn.com/content/v1/649dafaba60a166f753a617a/188c7821-0c94-4e81-9228-9179145dccf3/sb_render_03.png",
    "https://static1.squarespace.com/static/649dafaba60a166f753a617a/t/666e1f8a6ceeac74c10f4ccb/1718493376095/",
    "https://static1.squarespace.com/static/649dafaba60a166f753a617a/t/666e1f8a6ceeac74c10f4cee/1718495600957/",
    "https://static1.squarespace.com/static/649dafaba60a166f753a617a/t/666e1f896ceeac74c10f4c63/1718495804120/",
    "https://static1.squarespace.com/static/649dafaba60a166f753a617a/t/666e1f896ceeac74c10f4c8a/1718820047460/",
    "https://static1.squarespace.com/static/649dafaba60a166f753a617a/t/666e1f896ceeac74c10f4ca3/1718820676612/",
    "https://static1.squarespace.com/static/649dafaba60a166f753a617a/t/666e1f896ceeac74c10f4cb5/1718820770325/",
    "https://static1.squarespace.com/static/649dafaba60a166f753a617a/t/66732189646a5042cb796eab/1718821277424/",
    "https://static1.squarespace.com/static/649dafaba60a166f753a617a/t/667322ce49eb5143d05ac703/1718821636437/",
    "https://static1.squarespace.com/static/649dafaba60a166f753a617a/t/667323f592879a0ec2b085ea/1718822417994/",
    "https://static1.squarespace.com/static/649dafaba60a166f753a617a/t/6673268349eb5143d05aca7b/1718822563694/"
)

foreach ($url in $images) {
    $name = $url.Split("/")[-2]
    if ($name -eq "") { $name = $url.Split("/")[-3] }
    if (-not ($name -match "\.(jpg|png|jpeg|gif|webp)$")) { $name = $name + ".jpg" }
    $dest = "$outputDir\$name"
    try {
        Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
        Write-Host "OK $name" -ForegroundColor Green
    } catch {
        Write-Host "FAIL $name" -ForegroundColor Red
    }
}
Write-Host "Done! Images saved to $outputDir" -ForegroundColor Cyan
