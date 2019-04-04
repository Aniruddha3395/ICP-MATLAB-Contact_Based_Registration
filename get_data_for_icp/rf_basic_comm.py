from __future__ import absolute_import, division, print_function, unicode_literals
__metaclass__ = type


import socket
import time
import sys
import binascii
import struct

class basic_comm:

	def __init__ (self,Host,Port):
		self.host = Host
		self.port = Port
		return

	def connect(self,robot):
		self.robot_obj = robot
		self.sock = socket.socket( socket.AF_INET, socket.SOCK_STREAM )
		self.sock.bind( ( self.host, self.port ) )
		self.sock.listen(3)
		self.robot,self.addr = self.sock.accept()
		print ("Connection Established to Robot: ", self.robot_obj)
		return

	def send(self,msg, robot):
		self.obj = robot
		self.msg = msg
		self.msg = self.msg + "\r\n"
		try:
			# print ("Sending Message")
			# self.robot.sendall(str.encode(self.msg))
			self.robot.sendall(self.msg)
			# print ("Command Sent to: " , self.obj)
		except:
			print ("Sending Failed")
		self.reply = ""
		return

	def ack(self, robot):
		self.obj = robot
		current_joint_val = ""
		try:
			self.reply = ""
			while ("current_joint_val" not in self.reply):
				self.reply = self.robot.recv(1024)
				self.reply = self.reply.decode()
			if "current_joint_val" in self.reply:
				print (self.reply)
				print ()
				# print ("current_joint_val: ", self.reply)
				current_joint_val = self.reply
			else:
				print ("Could not query current_joint_val")
		except:
			print ("Comm error in Receving Data",sys.exc_info())

		self.reply = ""
		return current_joint_val

	def ack_tcp(self, robot):
		self.obj = robot
		current_TCP_val = ""
		try:
			self.reply = ""
			while ("current_TCP_val" not in self.reply):
				self.reply = self.robot.recv(1024)
				self.reply = self.reply.decode()
			if "current_TCP_val" in self.reply:
				# print (self.reply)
				# print ()
				# print ("current_joint_val: ", self.reply)
				current_TCP_val = self.reply
			else:
				print ("Could not query current_TCP_val")
		except:
			print ("Comm error in Receving Data",sys.exc_info())

		self.reply = ""
		return current_TCP_val

	def close(self,msg):
		self.msg = msg
		self.msg = self.msg + "\r\n"
		try:
			print ("Sending Message")
			self.robot.sendall(str.encode(self.msg))
			print("Robot acknowledged to close the port")
		except:
			print ("Sending Failed")
		time.sleep(2)
		self.robot.close()
		self.sock.close()
		return

	def Close(self):
		self.robot.close()
		self.sock.close()