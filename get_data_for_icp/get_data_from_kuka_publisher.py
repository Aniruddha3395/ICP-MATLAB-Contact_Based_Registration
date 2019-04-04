import _thread as thread
import time
import sys

file_num = sys.argv[1]
file_dir = "/home/rflin/Videos/KUKA_log/"
file_name = "TCP_Readings.csv"
full_file_name = file_dir+file_name
write_to_file = "data"+ file_num +"_for_icp.csv"

def thread_for_input(input_value):
    input("Press enter to stop...\n")
    input_value.append(None)

# time step in seconds for reading from file
time_step = 0.001
store_data = []
input("Press enter to start...\n")

input_value = []
thread.start_new_thread(thread_for_input, (input_value,))
while True:
    if input_value:
        break
    try:
        read_file = open(full_file_name,"r");
        text = read_file.read()
        store_data.append(text)
        time.sleep(time_step)
        read_file.close()
    except FileNotFoundError:
        pass


try:
    write_file = open(write_to_file,"w");
    for i in store_data:
        write_file.write(i + "\n")
except FileNotFoundError:
    pass

write_file.close()








# # ## reading from one file and writing into the other
# import _thread as thread
# import time

# file_dir = "/home/rflin/Videos/KUKA_log/"
# # file_name = "State_Readings.csv"
# file_name = "TCP_Readings.csv"
# full_file_name = file_dir+file_name

# def thread_for_input(input_value):
#    input("Press enter to stop...\n")
#    input_value.append(None)

# # time step in seconds for reading from file
# time_step = 0.001

# input("Press enter to start...\n")
   

# try:
#     write_file = open("data_for_icp_10172018.csv","w");    
# except FileNotFoundError:
#     pass

# input_value = []
# thread.start_new_thread(thread_for_input, (input_value,))
# while True:
#     if input_value:
#         break
#     try:

#         read_file = open(full_file_name,"r");
#         text = read_file.read()
#         # print (text)
#         write_file.write(text)
#         write_file.write("\n")
#         time.sleep(time_step)
#         read_file.close()
#     except FileNotFoundError:
#         pass


# write_file.close()
