package com.wozi.chatmanager.client;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.Channel;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;

public class SimpleChatClient implements Runnable {
	public static void main(String[] args) throws Exception{
	        new SimpleChatClient("localhost", 12345).run();
	    }
	
	    private final String host;
	    private final int port;
	
	    public SimpleChatClient(String host, int port){
	        this.host = host;
	        this.port = port;
	    }
	
	    public void go() throws Exception{
	        EventLoopGroup group = new NioEventLoopGroup();
	        try {
	            Bootstrap bootstrap  = new Bootstrap()
	                    .group(group)
	                    .channel(NioSocketChannel.class)
	                    .handler(new SimpleChatClientInitializer());
	            Channel channel = bootstrap.connect(host, port).sync().channel();
	            BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
	            while(true){
	                channel.writeAndFlush(in.readLine() + "\r\n");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            group.shutdownGracefully();
	        }
	
	    }

		@Override
		public void run() {
			try {
				this.go();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
    }
