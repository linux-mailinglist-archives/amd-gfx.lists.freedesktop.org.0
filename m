Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D61D3B4233
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Jun 2021 13:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCCB6EB03;
	Fri, 25 Jun 2021 11:09:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614066EB03
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Jun 2021 11:09:18 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15PB0qTc012816; Fri, 25 Jun 2021 11:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=mfiygMDJGXMOlBOrrbWLHpMXLx6mbi2yDyCSYrDklUA=;
 b=aWcKSjokNwnED1JzyiHXph3iYiw+ZjMhfKeZKh8f1MStiubOPwzSCh6+vw7am855OW2E
 jPSET675UDZSvhqKNgovi2xEKOdUQ50smjRQEkcKm5z/R5nvDqv2KEGENEsghEKs43/Q
 OBQXytQ5zO9IgupBT6uh6GHlVV7qeO5VxwMsBKs+/sizqKVaRFEaXchPoFbtrsz+4oeS
 HggyUHPUwbHkRxad4pWHyj7l/Ik2Y88djBzUF0pFjMIMFR1Ufz5ubuLRH8bNOn6Rm3y9
 PzUK4nvl+2DbMFeeqyX6raGH8RZ6JMWmgMfZiQzVi6YoePuzRV5M90/w+PR38LE3PHPv Ww== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39d2ahs2vk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 11:09:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15PB5mnN193010;
 Fri, 25 Jun 2021 11:09:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 39d2py24a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 11:09:14 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15PB8AQQ004721;
 Fri, 25 Jun 2021 11:09:14 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 39d2py24a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 11:09:14 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15PB9ATn018448;
 Fri, 25 Jun 2021 11:09:13 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 25 Jun 2021 04:09:10 -0700
Date: Fri, 25 Jun 2021 14:09:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: nicholas.kazlauskas@amd.com, Alex Deucher <alexander.deucher@amd.com>
Subject: [bug report] drm/amd/display: Add DCN3.1 HDCP support
Message-ID: <YNW5UHoL19dZhyDM@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: q12KRKRw0Zw12CimHeAY4bc_qVUt8aQe
X-Proofpoint-GUID: q12KRKRw0Zw12CimHeAY4bc_qVUt8aQe
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hello Nicholas Kazlauskas,

This is a semi-automatic email about new static checker warnings.

The patch bf62221e9d0e: "drm/amd/display: Add DCN3.1 HDCP support" 
from May 19, 2021, leads to the following Smatch complaint:

    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.c:474 update_config()
    error: we previously assumed 'aconnector->dc_sink' could be null (see line 463)

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.c
   462	
   463		if (aconnector->dc_sink != NULL)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^
Check for NULL

   464			link->mode = mod_hdcp_signal_type_to_operation_mode(aconnector->dc_sink->sink_signal);
   465	
   466		display->controller = CONTROLLER_ID_D0 + config->otg_inst;
   467		display->dig_fe = config->dig_fe;
   468		link->dig_be = config->dig_be;
   469		link->ddc_line = aconnector->dc_link->ddc_hw_inst + 1;
   470		display->stream_enc_idx = config->stream_enc_idx;
   471		link->link_enc_idx = config->link_enc_idx;
   472		link->phy_idx = config->phy_idx;
   473		link->hdcp_supported_informational = dc_link_is_hdcp14(aconnector->dc_link,
   474				aconnector->dc_sink->sink_signal) ? 1 : 0;
                                ^^^^^^^^^^^^^^^^^^^
Unchecked dereference.  Originally there were some #ifdefs here and
that maybe ensured that ->dc_sink was non-NULL?  I'm not sure.

   475		link->dp.rev = aconnector->dc_link->dpcd_caps.dpcd_rev.raw;
   476		link->dp.assr_enabled = config->assr_enabled;

regards,
dan carpenter
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
