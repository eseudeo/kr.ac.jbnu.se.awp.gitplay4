package sign;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

public class Example {
	FTPClient client = null;
	String s = "";
	public Example(String host, String user, String pw) throws Exception{
		client = new FTPClient();
		int reply;
		client.connect(host);
		reply = client.getReplyCode();
		if(!FTPReply.isPositiveCompletion(reply)) {
			client.disconnect();
			throw new Exception("외부 서버 접속 에러");
		}
		client.login(user,pw);
		client.setFileType(FTP.BINARY_FILE_TYPE);
		client.enterLocalPassiveMode();
	}
	
	public void uploadFile(String localFileFullName, String fileName, String hostDir) throws Exception{
		try(InputStream input = new FileInputStream(new File(localFileFullName))) {
			this.client.storeFile(hostDir + fileName, input);
		}
	}
	
	public void disconnect() {
		if(this.client.isConnected()) {
			try {
				client.logout();
				client.disconnect();
			}catch(IOException i) {
				System.out.println(i);
			}
		}
	}
}
