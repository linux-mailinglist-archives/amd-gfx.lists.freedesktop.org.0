Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06A50618
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 11:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CBC88862;
	Mon, 24 Jun 2019 09:49:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBBE89A4A
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 09:49:13 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5O9hSNr092560;
 Mon, 24 Jun 2019 09:49:04 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2t9c9pdc62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 09:49:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5O9lmoQ083074;
 Mon, 24 Jun 2019 09:49:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2t99f36a0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 09:49:03 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5O9mx5D002113;
 Mon, 24 Jun 2019 09:48:59 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Jun 2019 02:48:59 -0700
Date: Mon, 24 Jun 2019 12:48:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: maowenan <maowenan@huawei.com>
Subject: Re: [PATCH -next v3] drm/amdgpu: return 'ret' immediately if failed
 in amdgpu_pmu_init
Message-ID: <20190624094850.GQ18776@kadam>
References: <alpine.DEB.2.21.1906230809400.4961@hadrien>
 <20190624034532.135201-1-maowenan@huawei.com>
 <20190624083952.GO18776@kadam>
 <4795ba5c-8e41-e1e0-c96a-47fdda3995e3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4795ba5c-8e41-e1e0-c96a-47fdda3995e3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906240082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906240082
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
 bh=6KQBOb8kDteiRaAmKhWFG2uycaXZff/cbFNmgbb3afs=;
 b=gLaVosSKzNgFwu/dzLOasmWKAU6RF7pnKBJh3FK5PiQCiGGhiffmLidfxdqWVDhRMDy3
 C6Dct9zVB/I4MSRgjZwW+OhsHMZWZfFGYhWmW4fr3If6D8AAcdTWEDw6h7fzIAb9601c
 jPKXrzCF2prFGbdNckGXOEv2skGVfk0WmZZcTF+yNmw/OvyXHOd7ct7ct7UZZiMilx0k
 uEY86ICkgHjqzrKA0Ry7kHQdHIl9jND/UVd0uoURoG66XnxqIeffakJu16RNZizn2TOT
 J4BxzoEgLD4JKw0uvNHyEE8xl5jZj/F+GktoFBFGibp/+kBdeO3LaSfqxoC77DM2BNts 2Q== 
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
 alexander.deucher@amd.com, Joe Perches <joe@perches.com>,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDU6Mjk6MzNQTSArMDgwMCwgbWFvd2VuYW4gd3JvdGU6
Cj4gCj4gCj4gT24gMjAxOS82LzI0IDE2OjM5LCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+ID4gT24g
TW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6NDU6MzJBTSArMDgwMCwgTWFvIFdlbmFuIHdyb3RlOgo+
ID4+IFRoZXJlIGlzIG9uZSB3YXJuaW5nOgo+ID4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wbXUuYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X3BtdV9pbml04oCZOgo+ID4+IGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzoyNDk6Njogd2FybmluZzogdmFy
aWFibGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFi
bGVdCj4gPj4gICBpbnQgcmV0ID0gMDsKPiA+PiAgICAgICBeCj4gPj4gYW1kZ3B1X3BtdV9pbml0
KCkgaXMgY2FsbGVkIGJ5IGFtZGdwdV9kZXZpY2VfaW5pdCgpIGluIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYywKPiA+PiB3aGljaCB3aWxsIHVzZSB0aGUgcmV0dXJu
IHZhbHVlLiBTbyBpdCBzaG91bGQgcmV0dXJuICdyZXQnIGltbWVkaWF0ZWx5IGlmIGluaXRfcG11
X2J5X3R5cGUoKSBmYWlsZWQuCj4gPj4gYW1kZ3B1X2RldmljZV9pbml0KCkKPiA+PiAJciA9IGFt
ZGdwdV9wbXVfaW5pdChhZGV2KTsKPiA+Pgo+ID4+IFRoaXMgcGF0Y2ggaXMgYWxzbyB0byB1cGRh
dGUgdGhlIGluZGVudGluZyBvbiB0aGUgYXJndW1lbnRzIHNvIHRoZXkgbGluZSB1cCB3aXRoIHRo
ZSAnKCcuCj4gPj4KPiA+PiBGaXhlczogOWM3Yzg1ZjdlYTFmICgiZHJtL2FtZGdwdTogYWRkIHBt
dSBjb3VudGVycyIpCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNYW8gV2VuYW4gPG1hb3dlbmFu
QGh1YXdlaS5jb20+Cj4gPj4gLS0tCj4gPj4gIHYxLT52MjogY2hhbmdlIHRoZSBzdWJqZWN0IGZv
ciB0aGlzIHBhdGNoOyBjaGFuZ2UgdGhlIGluZGVudGluZyB3aGVuIGl0IGNhbGxzIGluaXRfcG11
X2J5X3R5cGU7IHVzZSB0aGUgdmFsdWUgJ3JldCcgaW4KPiA+PiAgYW1kZ3B1X3BtdV9pbml0KCku
Cj4gPj4gIHYyLT52MzogY2hhbmdlIHRoZSBzdWJqZWN0IGZvciB0aGlzIHBhdGNoOyByZXR1cm4g
J3JldCcgaW1tZWRpYXRlbHkgaWYgZmFpbGVkIHRvIGNhbGwgaW5pdF9wbXVfYnlfdHlwZSgpLiAK
PiA+Pgo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMgfCA3ICsr
KysrLS0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcG11LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMKPiA+PiBp
bmRleCAwZTZkYmE5Li5iNzAyMzIyIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9wbXUuYwo+ID4+IEBAIC0yNTIsOCArMjUyLDExIEBAIGludCBhbWRncHVfcG11
X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gPj4gIAljYXNlIENISVBfVkVHQTIw
Ogo+ID4+ICAJCS8qIGluaXQgZGYgKi8KPiA+PiAgCQlyZXQgPSBpbml0X3BtdV9ieV90eXBlKGFk
ZXYsIGRmX3YzXzZfYXR0cl9ncm91cHMsCj4gPj4gLQkJCQkgICAgICAgIkRGIiwgImFtZGdwdV9k
ZiIsIFBFUkZfVFlQRV9BTURHUFVfREYsCj4gPj4gLQkJCQkgICAgICAgREZfVjNfNl9NQVhfQ09V
TlRFUlMpOwo+ID4+ICsJCQkJCQkJICAgIkRGIiwgImFtZGdwdV9kZiIsCj4gPj4gKwkJCQkJCQkg
ICBQRVJGX1RZUEVfQU1ER1BVX0RGLAo+ID4+ICsJCQkJCQkJICAgREZfVjNfNl9NQVhfQ09VTlRF
UlMpOwo+ID4+ICsJCWlmIChyZXQpCj4gPj4gKwkJCXJldHVybiByZXQ7Cj4gPiAKPiA+IE5vIG5v
LiAgU29ycnksIHRoZSBvcmlnaW5hbCBpbmRlbnRpbmcgd2FzIGNvcnJlY3QgYW5kIGxpbmVkIHVw
IHdpdGggdGhlCj4gPiAnKCcgY2hhcmFjdGVyIGluICdpbml0X3BtdV9ieV90eXBlKCcsIHRoYXQn
cyB0aGUgd2F5IGl0IHNob3VsZCBiZS4gIElmCj4gPiB3ZSB3ZXJlIHRvIHJlbW92ZSB0aGUgInJl
dCA9ICIgdGhlbiB3ZSdkIGhhdmUgdG8gcHVsbCB0aGUgYXJndW1lbnRzIGJhY2sKPiA+IGFzIHdl
bGwuICBJIHRoaW5rIHRoaXMgZml4IHRoYXQgSnVsaWEgc3VnZ2VzdGVkIGlzIHJlYWxseSB0aGUg
cmlnaHQgc28KPiA+IGxlYXZlIHRoZSBpbmRlbnRpbmcgYWxvbmUuCj4gPiAKPiAKPiA+IEl0IGxv
b2tzIGxpa2UgeW91J3ZlIHJpZ2h0IGFsaWduZWQgdGhlIGFyZ3VtZW50cy4gIFRoYXQncyBub3Qg
dGhlIHJpZ2h0Cj4gPiB3YXksIHRoZSBvcmlnaW5hbCB3YXMgY29ycmVjdC4KPiA+IAo+IEFmdGVy
IHVzaW5nIDggY2hhcmFjdGVyIGZvciB0YWIodGhhbmtzIHRvIEpvZSksIHRoZSBhbGlnbmVkIGhl
cmUgaXMgd3JvbmcsIHllcywgdGhlIG9yaWdpbmFsIHdhcyBjb3JyZWN0Lgo+IAo+IHNvIG15IHY0
IGlzIG9ubHkgdG8gY2hhbmdlIHJldCwgZG9uJ3QgY2hhbmdlIHRoZSBpbmRlbnRpbmc/Cj4gCgpZ
ZXMsIHBsZWFzZS4gIFNvcnJ5IGZvciBteSBjb25mdXNpbmcgZW1haWwgZWFybGllci4KCnJlZ2Fy
ZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
