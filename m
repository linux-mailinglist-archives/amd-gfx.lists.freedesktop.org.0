Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D27A1B7292
	for <lists+amd-gfx@lfdr.de>; Fri, 24 Apr 2020 13:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5FE6E45E;
	Fri, 24 Apr 2020 11:02:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8CC6E45E
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 Apr 2020 11:02:33 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03OAr9M2195861;
 Fri, 24 Apr 2020 11:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=G6GyPfkli9cRGvAFKHdxyVIeJXUkdgDavfz9cU5qJgo=;
 b=ewUtGuCDoQ+qm/ZVnInuPBnd8/e49Boiky24Ct4NE7PjFYuDgWEX47XX+/PFdJOsF2zD
 5czO+GIek4lGHax+TYu+da+LC2SEu50FFRNNg7px+/LuUAvEbCNPzDBINRtOeXfnXNNv
 4qbvG0IgbNhXo3LMKLJGfqMeRi6UOp/9hoJngAckROqt4dStyfveVk5QiqtzcWJZEy6J
 THjdgx0obI/E0/eg19ecJp2jst+1K5wm8CpvzjzOv6fHUO1OSI8SdwFO3l2pWCmLoFqD
 Po5UPLOqmuq5YWPMV6sBLIdhUY4VunxD+CVt1b7dOR7xqvJWHoK0y0Dsszz7EeMRaTQG yQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 30ketdkqsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 11:02:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03OB2S2m141665;
 Fri, 24 Apr 2020 11:02:30 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 30gb1phjfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 11:02:30 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03OB2KM8013148;
 Fri, 24 Apr 2020 11:02:20 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 24 Apr 2020 04:02:19 -0700
Date: Fri, 24 Apr 2020 14:02:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Evan Quan <evan.quan@amd.com>
Subject: Re: [PATCH] drm/amdgpu: address the static checker warnings
Message-ID: <20200424110214.GR2682@kadam>
References: <20200424104115.28738-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424104115.28738-1-evan.quan@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9600
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004240086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9600
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240085
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
Cc: Alexander.Deucher@amd.com, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 06:41:15PM +0800, Evan Quan wrote:
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4199 amdgpu_device_gpu_recover()
> error: we previously assumed 'hive' could be null (see line 4196)
> 
> This is introduced by "drm/amdgpu: optimize the gpu reset for XGMI setup V2".
> 
> Change-Id: I9c22b57abc9f512114112f93fb035f1fecf26beb
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 71278942f9f0..898338dc9605 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4274,7 +4274,8 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  		if (!amdgpu_device_lock_adev(tmp_adev, !hive)) {
>  			DRM_INFO("Bailing on TDR for s_job:%llx, as another already in progress",
>  				  job ? job->base.id : -1);
> -			mutex_unlock(&hive->hive_lock);
> +			if (hive)
> +				mutex_unlock(&hive->hive_lock);

In the current code, we know for a fact that "hive" is NULL at this
point.  Presumably this will be changed in the future?  Otherwise why
not just delete the mutex_unlock() because it is dead code.

regards,
dan carpenter

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
