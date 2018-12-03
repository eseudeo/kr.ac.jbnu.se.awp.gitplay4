package data;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.SocketException;
 
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPReply;
 
public class FtpClient {
 
    private String svrIp;
    private int svrPort;
    private String user;
    private String passwd;
    private String defaultPath;
    private org.apache.commons.net.ftp.FTPClient clnt;
    
    public FtpClient() {
        svrIp = Constants.SERVER_URL;
        svrPort = Integer.valueOf(Constants.SERVER_PORT);
        user = Constants.SERVER_USER;
        passwd = Constants.SERVER_PASSWORD;
       
        
       defaultPath = "";
    }
    
    /**
     * 파일 업로드
     * @param org 원본파일
     * @param targetFile 저장할 파일위치/파일명
     * @throws IOException 
     * @throws SocketException 
     */
    public boolean upload(File org, String targetFile)
            throws SocketException, IOException, Exception {
        
        FileInputStream fis = null;
        
        org.apache.commons.net.ftp.FTPClient clnt = new org.apache.commons.net.ftp.FTPClient();
        clnt.setControlEncoding("utf-8");
        
        try {
            clnt.connect(svrIp, svrPort);
            clnt.setBufferSize(1024*1024);
            int reply = clnt.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                throw new Exception("ftp connection refused");
            }
            
            clnt.setSoTimeout(1000 * 10);
            clnt.login(user, passwd);
            clnt.setFileType(FTP.BINARY_FILE_TYPE);
            
            
            clnt.enterLocalActiveMode();
            
            //clnt.enterLocalPassiveMode();
            //clnt.changeWorkingDirectory(defaultPath);
            //clnt.makeDirectory("");
            
            fis = new FileInputStream(org);
            return clnt.storeFile(targetFile, fis);
        } finally {
            if (clnt.isConnected()) {
                clnt.disconnect();
            }
            if (fis != null) {
                fis.close();
            }
        }
    }
}
