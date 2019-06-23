Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C34FA71
	for <lists+amd-gfx@lfdr.de>; Sun, 23 Jun 2019 08:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3D389D46;
	Sun, 23 Jun 2019 06:00:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0886289D46
 for <amd-gfx@lists.freedesktop.org>; Sun, 23 Jun 2019 06:00:50 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5N5xPkZ118818;
 Sun, 23 Jun 2019 06:00:42 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2t9brst328-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 23 Jun 2019 06:00:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5N5xqJX142593;
 Sun, 23 Jun 2019 06:00:41 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2t9x1ej6sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 23 Jun 2019 06:00:41 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5N60aku021412;
 Sun, 23 Jun 2019 06:00:37 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 22 Jun 2019 23:00:35 -0700
Date: Sun, 23 Jun 2019 09:00:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Mao Wenan <maowenan@huawei.com>
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variables 'ret'
Message-ID: <20190623060027.GU28859@kadam>
References: <20190622030314.169640-1-maowenan@huawei.com>
 <20190622104318.GT28859@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190622104318.GT28859@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9296
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906230052
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9296
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906230052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=3Tqxh9oXL076ygce3iRd3OSDhwc/AqTWDgGWjKB7jzU=;
 b=u8cYt3D8fx4rByZ8Kowuln3CYMbi9ubjwSQCfykl6KCupJN4TmO8X4Xyamx66n0/GydA
 ytg04soBoG1ilu6pSYSxPRe2BCkQGAoqG9y5NK8DtchGm9MjdepTcOto6qhLDQZmaeGb
 IniAnXDyUxnleyorU24VOxoEPkPFX+2mMm8Njz6w8uzqpSWFuN5Ci+UfbbrYZ//HzF41
 8BbVBOSZKEsoxuMciqS8dxc//wH8b4wDL3ENvDin9bZySNmWZPcvqsi3RVmRFBxLGMVu
 ErEjGc8izlBubGhubeD1afYvBFlg2i0PoKP6/6p/Qz1NAcWLm6r1noOnQT5PHLKHmhUl KQ== 
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

T24gU2F0LCBKdW4gMjIsIDIwMTkgYXQgMDE6NDM6MTlQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBPbiBTYXQsIEp1biAyMiwgMjAxOSBhdCAxMTowMzoxNEFNICswODAwLCBNYW8gV2Vu
YW4gd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtdS5jCj4gPiBp
bmRleCAwZTZkYmE5Li4wYmY0ZGQ5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BtdS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcG11LmMKPiA+IEBAIC0yNDYsMTIgKzI0NiwxMCBAQCBzdGF0aWMgaW50IGluaXRf
cG11X2J5X3R5cGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gPiAgLyogaW5pdCBhbWRn
cHVfcG11ICovCj4gPiAgaW50IGFtZGdwdV9wbXVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKPiA+ICB7Cj4gPiAtCWludCByZXQgPSAwOwo+ID4gLQo+ID4gIAlzd2l0Y2ggKGFkZXYt
PmFzaWNfdHlwZSkgewo+ID4gIAljYXNlIENISVBfVkVHQTIwOgo+ID4gIAkJLyogaW5pdCBkZiAq
Lwo+ID4gLQkJcmV0ID0gaW5pdF9wbXVfYnlfdHlwZShhZGV2LCBkZl92M182X2F0dHJfZ3JvdXBz
LAo+ID4gKwkJaW5pdF9wbXVfYnlfdHlwZShhZGV2LCBkZl92M182X2F0dHJfZ3JvdXBzLAo+ID4g
IAkJCQkgICAgICAgIkRGIiwgImFtZGdwdV9kZiIsIFBFUkZfVFlQRV9BTURHUFVfREYsCj4gPiAg
CQkJCSAgICAgICBERl9WM182X01BWF9DT1VOVEVSUyk7Cj4gCj4gCj4gWW91J3JlIHJlc2VuZGlu
ZyB0aGlzIGZvciBvdGhlciByZWFzb25zLCBidXQgZG9uJ3QgZm9yZ2V0IHRvIHVwZGF0ZSB0aGUK
PiBpbmRlbnRpbmcgb24gdGhlIGFyZ3VtZW50cyBzbyB0aGV5IHN0aWxsIGxpbmUgdXAgd2l0aCB0
aGUgJygnLgo+IAoKU29ycnksIEkgd2FzIHVuY2xlYXIuICBJZiB5b3UgcHVsbCB0aGUgaW5pdF9w
bXVfYnlfdHlwZSggYmFjayA2CmNoYXJhY3RlcnMgdGhlbiB5b3UgYWxzbyBuZWVkIHRvIHB1bGwg
dGhlICJERiIgYmFjayA2IGNoYXJhY3RlcnMuCgoJCWluaXRfcG11X2J5X3R5cGUoYWRldiwgZGZf
djNfNl9hdHRyX2dyb3VwcywgIkRGIiwgImFtZGdwdV9kZiIsCgkJCQkgUEVSRl9UWVBFX0FNREdQ
VV9ERiwgREZfVjNfNl9NQVhfQ09VTlRFUlMpOwoKWW91IGNhbiBhY3R1YWxseSBmaXQgaXQgaW50
byB0d28gbGluZXMgYWZ0ZXJ3YXJkcy4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
