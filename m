Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E78504B1
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 10:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8948986D;
	Mon, 24 Jun 2019 08:40:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B358986D
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 08:40:20 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5O8dY5K123395;
 Mon, 24 Jun 2019 08:40:10 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t9brsw0gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 08:40:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5O8dRBm050198;
 Mon, 24 Jun 2019 08:40:09 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t9acbctw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 08:40:09 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5O8e1gL028104;
 Mon, 24 Jun 2019 08:40:02 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Jun 2019 01:40:01 -0700
Date: Mon, 24 Jun 2019 11:39:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Mao Wenan <maowenan@huawei.com>
Subject: Re: [PATCH -next v3] drm/amdgpu: return 'ret' immediately if failed
 in amdgpu_pmu_init
Message-ID: <20190624083952.GO18776@kadam>
References: <alpine.DEB.2.21.1906230809400.4961@hadrien>
 <20190624034532.135201-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624034532.135201-1-maowenan@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906240072
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906240072
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
 bh=6ck8MBwXxLWycwZKvrYVSaIGF3TxSfLus7KSpoOIBjU=;
 b=vC2302H4F6dWabhAgytQ6Jo351FpiF16D8mZXPZBMgRXsl529QkM4ygIo8XSTSyqlh7J
 mhZSMu4lWjxzMYVpM/G/ndyL/7V4XXSLdDwvKZTTpYi3eEzdqOpIB1iENGdw2JpDxneE
 N3pp0EEjDYIgtXUegZ6CZzty9V3gtAZBx6XrBRB6SsK2sHR+7SrZeFWB+JLtaADrFw1Q
 T9kGUQc2e/3DS2GOKorK5ZRYCC+ji8BuggTWLQxnn3dsU2q0e27g6ADrcX0JrDZ7Bf/w
 B45/EUB/DMrWYzNhAJoQMftCLKuChGHHVeo9vbfcH4eyfXpzOx3/n1GTr2cPO8GPW0Yg pw== 
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
Cc: David1.Zhou@amd.com, jonathan.kim@amd.com, airlied@linux.ie,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, julia.lawall@lip6.fr, daniel@ffwll.ch,
 alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6NDU6MzJBTSArMDgwMCwgTWFvIFdlbmFuIHdyb3Rl
Ogo+IFRoZXJlIGlzIG9uZSB3YXJuaW5nOgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbXUuYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X3BtdV9pbml04oCZOgo+IGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzoyNDk6Njogd2FybmluZzogdmFyaWFibGUg
4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4g
ICBpbnQgcmV0ID0gMDsKPiAgICAgICBeCj4gYW1kZ3B1X3BtdV9pbml0KCkgaXMgY2FsbGVkIGJ5
IGFtZGdwdV9kZXZpY2VfaW5pdCgpIGluIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYywKPiB3aGljaCB3aWxsIHVzZSB0aGUgcmV0dXJuIHZhbHVlLiBTbyBpdCBzaG91
bGQgcmV0dXJuICdyZXQnIGltbWVkaWF0ZWx5IGlmIGluaXRfcG11X2J5X3R5cGUoKSBmYWlsZWQu
Cj4gYW1kZ3B1X2RldmljZV9pbml0KCkKPiAJciA9IGFtZGdwdV9wbXVfaW5pdChhZGV2KTsKPiAK
PiBUaGlzIHBhdGNoIGlzIGFsc28gdG8gdXBkYXRlIHRoZSBpbmRlbnRpbmcgb24gdGhlIGFyZ3Vt
ZW50cyBzbyB0aGV5IGxpbmUgdXAgd2l0aCB0aGUgJygnLgo+IAo+IEZpeGVzOiA5YzdjODVmN2Vh
MWYgKCJkcm0vYW1kZ3B1OiBhZGQgcG11IGNvdW50ZXJzIikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBN
YW8gV2VuYW4gPG1hb3dlbmFuQGh1YXdlaS5jb20+Cj4gLS0tCj4gIHYxLT52MjogY2hhbmdlIHRo
ZSBzdWJqZWN0IGZvciB0aGlzIHBhdGNoOyBjaGFuZ2UgdGhlIGluZGVudGluZyB3aGVuIGl0IGNh
bGxzIGluaXRfcG11X2J5X3R5cGU7IHVzZSB0aGUgdmFsdWUgJ3JldCcgaW4KPiAgYW1kZ3B1X3Bt
dV9pbml0KCkuCj4gIHYyLT52MzogY2hhbmdlIHRoZSBzdWJqZWN0IGZvciB0aGlzIHBhdGNoOyBy
ZXR1cm4gJ3JldCcgaW1tZWRpYXRlbHkgaWYgZmFpbGVkIHRvIGNhbGwgaW5pdF9wbXVfYnlfdHlw
ZSgpLiAKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtdS5jIHwgNyAr
KysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwo+IGluZGV4IDBlNmRi
YTkuLmI3MDIzMjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BtdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtdS5j
Cj4gQEAgLTI1Miw4ICsyNTIsMTEgQEAgaW50IGFtZGdwdV9wbXVfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKPiAgCWNhc2UgQ0hJUF9WRUdBMjA6Cj4gIAkJLyogaW5pdCBkZiAqLwo+
ICAJCXJldCA9IGluaXRfcG11X2J5X3R5cGUoYWRldiwgZGZfdjNfNl9hdHRyX2dyb3VwcywKPiAt
CQkJCSAgICAgICAiREYiLCAiYW1kZ3B1X2RmIiwgUEVSRl9UWVBFX0FNREdQVV9ERiwKPiAtCQkJ
CSAgICAgICBERl9WM182X01BWF9DT1VOVEVSUyk7Cj4gKwkJCQkJCQkgICAiREYiLCAiYW1kZ3B1
X2RmIiwKPiArCQkJCQkJCSAgIFBFUkZfVFlQRV9BTURHUFVfREYsCj4gKwkJCQkJCQkgICBERl9W
M182X01BWF9DT1VOVEVSUyk7Cj4gKwkJaWYgKHJldCkKPiArCQkJcmV0dXJuIHJldDsKCk5vIG5v
LiAgU29ycnksIHRoZSBvcmlnaW5hbCBpbmRlbnRpbmcgd2FzIGNvcnJlY3QgYW5kIGxpbmVkIHVw
IHdpdGggdGhlCicoJyBjaGFyYWN0ZXIgaW4gJ2luaXRfcG11X2J5X3R5cGUoJywgdGhhdCdzIHRo
ZSB3YXkgaXQgc2hvdWxkIGJlLiAgSWYKd2Ugd2VyZSB0byByZW1vdmUgdGhlICJyZXQgPSAiIHRo
ZW4gd2UnZCBoYXZlIHRvIHB1bGwgdGhlIGFyZ3VtZW50cyBiYWNrCmFzIHdlbGwuICBJIHRoaW5r
IHRoaXMgZml4IHRoYXQgSnVsaWEgc3VnZ2VzdGVkIGlzIHJlYWxseSB0aGUgcmlnaHQgc28KbGVh
dmUgdGhlIGluZGVudGluZyBhbG9uZS4KCkl0IGxvb2tzIGxpa2UgeW91J3ZlIHJpZ2h0IGFsaWdu
ZWQgdGhlIGFyZ3VtZW50cy4gIFRoYXQncyBub3QgdGhlIHJpZ2h0CndheSwgdGhlIG9yaWdpbmFs
IHdhcyBjb3JyZWN0LgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
