# Troubleshooting of Oracle VM VirtualBox #

## TS:01 - Screen Resize Issue ##

**Run the Following Command**
```
sudo apt update && sudo apt upgrade -y
sudo apt install -y linux-headers-$(uname -r) build-essential dkms
```
**_Note:** If you get any error, re run the the above command_

**_Result_**
![image](https://user-images.githubusercontent.com/111234771/194798887-06fa75b3-0a8a-47a0-a5bd-34614186941f.png)

**Setting Up Additional cd Image**
![image](https://user-images.githubusercontent.com/111234771/194798972-1a90d727-485a-4771-b48c-e1d50c2512b1.png)

_If you are not able to see the Menu Option (Refer the above image) in the VB, Please right side button <ctrl+f> ***(^f)*** and follow on screen instruction_
Step 1 - Go to <Devices> Menu => Select the Menu <Insert Guest Additional CD Image> (Refer the below Image)
![image](https://user-images.githubusercontent.com/111234771/194799121-218869db-788d-4313-9675-7323922c6359.png)
Step 2 - Go to the Terminal and find the media drive
```
cd /media<user name>VBox_GAs_6.1.38/
./autorun.sh
```
**_Note:** Please follow on screen instruction to complete the activity and restart the machine and enter the password when prompted_
  ![image](https://user-images.githubusercontent.com/111234771/194799459-c2521a83-1fe5-479e-a40e-9e62c47c4f60.png)

  _Once Completed you will get the screen as shown below image_
![image](https://user-images.githubusercontent.com/111234771/194799459-c2521a83-1fe5-479e-a40e-9e62c47c4f60.png)

  ## TS:02 - Mouse Pointer Issue / Copy Paste Issues ##

  #### Step 1 - Make Sure you have set the Mouse to Bidirectional ####
  #### Step 2 - Make Sure you have set the Mouse to Bidirectional ####
