# Setting up New Account

## Adding Sudo User
```
sudo adduser yirjohn
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/201988286-49168147-3887-4e71-be27-8169e54702e4.png)

```
cat /etc/passwd | grep yirjohn
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/201988342-cb36c570-ed9a-43ae-b31f-76de0d81c4c9.png)

```
id yirjohn
```
![image](https://user-images.githubusercontent.com/111234771/201988396-5e5f68cb-68c9-4473-80c6-6e5ea5baa98d.png)

**Option 1 for Addid user to to SUDO**
```
sudo adduser yirjohn sudo
```
_Login with new user_
```
su -l yirjohn
```

**Option 2 for Addid user to to SUDO**
```
sudo usermod -aG sudo yirjohn
groups yirjohn
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/201988589-31c56939-a498-4e7f-8194-36cc489941a2.png)

```
su -  yirjohn
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/201988917-05887540-e1e3-4dac-85a1-f696cdcbebdc.png)

```
ssh-keygen
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/201989515-75087d2b-8658-4bab-a4ca-ffd4557b84d2.png)


## Remove Admin Privillages
- Remove the yirjohn user from the sudo group
```
sudo deluser yirjohn sudo
```
- To further improve your yirjohn server’s security, lock the yirjohn user’s password using the passwd command
```
sudo passwd yirjohn -l
```
- at this point, only root or a sudo user can log in as kafka
```
sudo su - yirjohn
```
- In the future, if you want to unlock it, use passwd with the -u option
```
sudo passwd yirjohn -u
```
