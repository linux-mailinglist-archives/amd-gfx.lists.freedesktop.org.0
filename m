Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9595514F6C8
	for <lists+amd-gfx@lfdr.de>; Sat,  1 Feb 2020 06:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE476E2E0;
	Sat,  1 Feb 2020 05:57:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72B46E2E0;
 Sat,  1 Feb 2020 05:57:03 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0115rnjn154505;
 Sat, 1 Feb 2020 05:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=6Y7Q6ylJXc6nIB3cUIivnJdaFcNjADagPIMOpx/zuek=;
 b=aVAm7YmXkTLAlco7AxLJOCTRaGxTJvZuMseCklfSStqk8bJymtguBvWvIkT1WTf6Uxm7
 /BMAL100VrjfkSqWjaIqKfDLNM4uiZkfVMHeW1CSIc9mmf0Fde/xKMNJM968yxxjO2S2
 G1T0k9frPUeGYraJoBFN2PmJ8kzEM9ueMf0N74qyetK5fn099yEcnTvJvk3dVNT5xkY1
 sg4Akj54b60BYUb719mhSlQMz8ozP4gHZiIC9GPO0fEdfUTn1KsO0Nu2jWZr/Zz/Lie7
 XrerRwlm1ZaDe/PYwVKcD+5+EH7ZVIzZ7Uy3Tksi/4Kpca0EjZukan42jSop5TRcjl8R Aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2xw1yqr7y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 01 Feb 2020 05:56:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0115mTNl109936;
 Sat, 1 Feb 2020 05:56:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2xw15wm6kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 01 Feb 2020 05:56:36 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0115uR75028315;
 Sat, 1 Feb 2020 05:56:27 GMT
Received: from kadam (/129.205.23.165) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 31 Jan 2020 21:56:26 -0800
Date: Sat, 1 Feb 2020 08:56:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: syzbot <syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in vgem_gem_dumb_create
Message-ID: <20200201055612.GF1778@kadam>
References: <000000000000ae2f81059d7716b8@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000ae2f81059d7716b8@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9517
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002010040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9517
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002010041
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
Cc: robdclark@chromium.org, davem@davemloft.net, airlied@linux.ie,
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 chris@chris-wilson.co.uk, linaro-mm-sig@lists.linaro.org, eric@anholt.net,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 alexander.deucher@amd.com, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

I don't totally understand the stack trace but I do see a double free
bug.

drivers/gpu/drm/vgem/vgem_drv.c
   186  static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
   187                                                struct drm_file *file,
   188                                                unsigned int *handle,
   189                                                unsigned long size)
   190  {
   191          struct drm_vgem_gem_object *obj;
   192          int ret;
   193  
   194          obj = __vgem_gem_create(dev, size);

obj->base.handle_count is zero.

   195          if (IS_ERR(obj))
   196                  return ERR_CAST(obj);
   197  
   198          ret = drm_gem_handle_create(file, &obj->base, handle);

We bump it +1 and then the error handling calls
drm_gem_object_handle_put_unlocked(obj);
which calls drm_gem_object_put_unlocked(); which frees obj.


   199          drm_gem_object_put_unlocked(&obj->base);

So this is a double free.  Could someone check my thinking and send
a patch?  It's just a one liner.  Otherwise I can send it on Monday.

   200          if (ret)
   201                  return ERR_PTR(ret);
   202  
   203          return &obj->base;
   204  }

regards,
dan carpenter
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
