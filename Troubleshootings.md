# Troubleshooting of Oracle VM VirtualBox #

## TS:01 - Screen Resize Issue ##

**Step 1 - Run the Following Command**
```
sudo apt update && sudo apt upgrade -y
sudo apt install -y linux-headers-$(uname -r) build-essential dkms
```
_**Note:** If you get any error, re run the the above command_

**_Result:-_**
![image](https://user-images.githubusercontent.com/111234771/194798887-06fa75b3-0a8a-47a0-a5bd-34614186941f.png)

**Step 2 -Setting Up Additional cd Image**
![image](https://user-images.githubusercontent.com/111234771/194798972-1a90d727-485a-4771-b48c-e1d50c2512b1.png)

_If you are not able to see the Menu Option (Refer the above image) in the VB, Please press the right side button <ctrl+f> ***(^f)*** and follow on screen instruction_

  Step 2.1 - Go to <Devices> Menu => Select the Menu <Insert Guest Additional CD Image> (Refer the below Image)
    ![image](https://user-images.githubusercontent.com/111234771/194799121-218869db-788d-4313-9675-7323922c6359.png)

  Step 2.2 - Go to the Terminal and find the media drive
```
cd /media<user name>VBox_GAs_6.1.38/
./autorun.sh
```
_**Note:** Please follow on screen instruction to complete the activity and restart the machine and enter the password when prompted_
    ![image](https://user-images.githubusercontent.com/111234771/194799459-c2521a83-1fe5-479e-a40e-9e62c47c4f60.png)

  _Once Completed you will get the screen as shown below image_
  ![image](https://user-images.githubusercontent.com/111234771/194807750-7421ab4e-b902-45c9-8191-37e288117711.png)

  ## TS:02 - Mouse Pointer Issue / Copy Paste Issues ##

  #### Step 1 - Make Sure you have set the Mouse to Bidirectional ####
  ![image](https://user-images.githubusercontent.com/111234771/194800357-2f231130-ca9a-45da-92a6-d6eae379306c.png)
  
  #### Step 2 - Make Sure you have set the Pointing Device to <USB Multi-Touch Tablet> ####
  ![image](https://user-images.githubusercontent.com/111234771/194800445-0f8443c8-c732-4ff1-a068-19350e2cd84a.png)
  
  #### Step 3 - Changes in the grub File ####
  ```
  sudo nano /etc/default/grub
  ```
  _add the below to the line in the file and save (Refer Below Image)_
  ```
  i8042.nomux i8024.noloop"
  ```
  Change this line <this is default>
  ![image](https://user-images.githubusercontent.com/111234771/194801063-99d1174a-185d-43ca-9c26-3c5c9b51dd18.png)

  Make the change in the specified Line
  ![image](https://user-images.githubusercontent.com/111234771/194801256-5c82d91e-fbce-41e5-8d65-5a3a747f9b22.png)

  ![image](https://user-images.githubusercontent.com/111234771/194801191-0a4d7317-ea9a-4fd3-82fd-b255e8bca28e.png)

  ```
  sudo update-grub
  sudo shutdown now	

  ```

  # Troubleshooting on Hostname Issue #
  
  ```
  hostnamectl
  sudo sysctl kernel.hostname=localhost # Change the transient hostname
  hostnamectl
  ```
  
  **OR**
```
  hostnamectl
  sudo hostnamectl set-hostname localhost
  hostname
  exec bash
```
