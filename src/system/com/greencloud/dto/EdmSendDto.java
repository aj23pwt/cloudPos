/**
 * 
 */
package com.greencloud.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * @author zlf 2013-12-31
 *
 */
public class EdmSendDto implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 9057071299838843057L;
	public String receive = "";
    public String subject = "";
    public String content = "";
    public String linkId ;
    public String name;
    public Date sendTime ;
    public int timeLimit = 1;

}
