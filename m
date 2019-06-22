Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7502C4F5B2
	for <lists+amd-gfx@lfdr.de>; Sat, 22 Jun 2019 14:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F046891D5;
	Sat, 22 Jun 2019 12:21:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 5888 seconds by postgrey-1.36 at gabe;
 Sat, 22 Jun 2019 12:21:53 UTC
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F041891D5
 for <amd-gfx@lists.freedesktop.org>; Sat, 22 Jun 2019 12:21:52 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5MAe6EL149137;
 Sat, 22 Jun 2019 10:43:35 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2t9c9p8pp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Jun 2019 10:43:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5MAhPYm103599;
 Sat, 22 Jun 2019 10:43:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2t9c5239h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Jun 2019 10:43:35 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5MAhQga013247;
 Sat, 22 Jun 2019 10:43:26 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 22 Jun 2019 03:43:25 -0700
Date: Sat, 22 Jun 2019 13:43:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Mao Wenan <maowenan@huawei.com>
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variables 'ret'
Message-ID: <20190622104318.GT28859@kadam>
References: <20190622030314.169640-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190622030314.169640-1-maowenan@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9295
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906220098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9295
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906220098
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=kq0vqQjo14XEI66TpU/rqYxVUPhSaWKc+eKAGmgwWQA=;
 b=xUHaVXMSzCBsFfEes7e5FsFtZJjipV7WL6pW++EZJmcpQWQLGIXSBL+JnjPEf9qYFLTk
 WS5T7GxE1Nzobuppq2hF/Bmr8tWQ6Zy/T3sPNfSw2kIhBUhqxPME8z4MzauDRJUtdmnc
 9s2M6LGTgzzHVuwJl1L5brdsZoo7kEHUn932cQRnyLIpuZx2DVx6oprsFIi0oR+MDKXx
 VY7E23g19pi4QauLQyApJY+qfCVnHWNfd86EFz+PzZYKvn8oF+wLx9QKJrFowKtxdgsF
 pJRmpMpv7Dg1rU+B0p4cCfbq7aAIaDA+YGQk9vI0X3C4QA5uou2aA5WckZXlqZ5BkGBK Dg== 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David1.Zhou@amd.com, airlied@linux.ie, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMjIsIDIwMTkgYXQgMTE6MDM6MTRBTSArMDgwMCwgTWFvIFdlbmFuIHdyb3Rl
Ogo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMKPiBpbmRleCAwZTZkYmE5
Li4wYmY0ZGQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwo+
IEBAIC0yNDYsMTIgKzI0NiwxMCBAQCBzdGF0aWMgaW50IGluaXRfcG11X2J5X3R5cGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gIC8qIGluaXQgYW1kZ3B1X3BtdSAqLwo+ICBpbnQgYW1k
Z3B1X3BtdV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICB7Cj4gLQlpbnQgcmV0
ID0gMDsKPiAtCj4gIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewo+ICAJY2FzZSBDSElQX1ZF
R0EyMDoKPiAgCQkvKiBpbml0IGRmICovCj4gLQkJcmV0ID0gaW5pdF9wbXVfYnlfdHlwZShhZGV2
LCBkZl92M182X2F0dHJfZ3JvdXBzLAo+ICsJCWluaXRfcG11X2J5X3R5cGUoYWRldiwgZGZfdjNf
Nl9hdHRyX2dyb3VwcywKPiAgCQkJCSAgICAgICAiREYiLCAiYW1kZ3B1X2RmIiwgUEVSRl9UWVBF
X0FNREdQVV9ERiwKPiAgCQkJCSAgICAgICBERl9WM182X01BWF9DT1VOVEVSUyk7CgoKWW91J3Jl
IHJlc2VuZGluZyB0aGlzIGZvciBvdGhlciByZWFzb25zLCBidXQgZG9uJ3QgZm9yZ2V0IHRvIHVw
ZGF0ZSB0aGUKaW5kZW50aW5nIG9uIHRoZSBhcmd1bWVudHMgc28gdGhleSBzdGlsbCBsaW5lIHVw
IHdpdGggdGhlICcoJy4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
