#!/usr/bin/env python
from __future__ import absolute_import, division, print_function, unicode_literals

# Python includes
import sys
import time
import thread as thread
# ROS includes
import roslib
import rospy
from std_msgs.msg import String
# custom
from rf_basic_comm import basic_comm
# rospy.on_shutdown(cleanup_node)

file_num = sys.argv[1]
file_dir = "/home/rflin/Desktop/ICP/test/test_for_car_bonnet/"
write_data_to_file = file_dir + "data"+ file_num +"_for_icp.csv"
delay_time = 1

def thread_for_input(input_value):
    raw_input("Press enter to stop...\n")
    input_value.append(None)

def establish_communication():
    host = "192.168.10.100"
    port = 3025
    communicator1 = basic_comm(host,port)
    communicator1.connect("KUKA-1")
    time.sleep(0.1)
    communicator1.send( "Start_TCP_Publisher", "KUKA-1" )
    return communicator1
        
def terminate_communication():
    global communicator1
    try:
        # print("Asking KUKA - 1 to move to point")
        communicator1.send( "terminate", "KUKA-1" )
        communicator1.ack_tcp("KUKA-1")
        # print("KUKA - 1 completed the motion") 
        communicator1.Close()   
    except:
        pass

def main():
    # establish communication

    communicator1 = establish_communication()

    # start collecting data
    
    store_data = []
    raw_input("Press enter to start...\n")

    input_value = []
    thread.start_new_thread(thread_for_input, (input_value,))    
    while True:
        if input_value:
            communicator1.send("terminate", "KUKA-1")
            break
        communicator1.send( "tcp_val", "KUKA-1" )
        current_TCP_val = communicator1.ack_tcp("KUKA-1")
        store_data.append(current_TCP_val)
        # time.sleep(delay_time)

    try:
        write_file = open(write_data_to_file,"w");
        for i in store_data:
            data_line = i.split(',')
            write_file.write(data_line[1] + "," + data_line[2] + "," + data_line[3] + "," + data_line[4] + "," + data_line[5] + "," + data_line[6]  + "\n")
        write_file.close()
    except EnvironmentError as e:
        pass


if __name__ == '__main__':
    main()




