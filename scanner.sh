date=$(date +%Y-%m-%d_%H:%M:%S)
echo =======SCAN START=======
echo 开始处理...
echo  

# 建立目录 Create output file
mkdir -p output/$date
touch output/$date/.all.txt

# 扫描流程 Scanner working

# 处理png Process "png" file
if [ "$(ls input/*.png 2> /dev/null | wc -l)" != "0" ];then # 判断文件是否存在 IF "png" file exist
for i in input/*.png 
do
    result=$(zbarimg --raw -q ${i%%.*}.png) # 扫描 Scanning
    echo $result>>output/$date/.all.txt # 保存到总文件 Save to total file
    touch output/$date/${i#*/}.txt # 创建单文件 Create single file
    echo $result>>output/$date/${i#*/}.txt # 保存到单文件 Save to single file
done
fi

# 处理jpg/jpeg Process "jpg/jpeg" file
if [ "$(ls input/*.jpg 2> /dev/null | wc -l)" != "0" ];then
for i in input/*.jpg
do
    result=$(zbarimg --raw -q ${i%%.*}.png)
    echo $result>>output/$date/.all.txt
    touch output/$date/${i#*/}.txt
    echo $result>>output/$date/${i#*/}.txt
done
fi

if [ "$(ls input/*.jpeg 2> /dev/null | wc -l)" != "0" ];then
for i in input/*.jpeg
do
    result=$(zbarimg --raw -q ${i%%.*}.png)
    echo $result>>output/$date/.all.txt
    touch output/$date/${i#*/}.txt
    echo $result>>output/$date/${i#*/}.txt
done
fi

# 完成 Finish!
echo ========SCAN END========
echo 处理完成，已将内容保存至 output/$date 文件夹.
echo 所有结果已保存至 output/$date/.all.txt 文件.
echo 20s后自动退出，您可以手动关闭窗口.
sleep 20
