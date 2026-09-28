status = input()

if status == "up":
    print("running")
elif status == "down":
    print("alert")
elif status == "idle":
    print("standby")
else:
    print("invalid")
