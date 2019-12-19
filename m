Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D5A125A50
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Dec 2019 05:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5096E072;
	Thu, 19 Dec 2019 04:31:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F31D6E072;
 Thu, 19 Dec 2019 03:39:01 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 86F6FE7A4898DE8BFA25;
 Thu, 19 Dec 2019 11:38:58 +0800 (CST)
Received: from huawei.com (10.175.127.16) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Thu, 19 Dec 2019
 11:38:50 +0800
From: Pan Zhang <zhangpan26@huawei.com>
To: <christian.koenig@amd.com>, <michel@daenzer.net>,
 <alexander.deucher@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <ray.huang@amd.com>, <irmoy.das@amd.com>,
 <sam@ravnborg.org>, <zhangpan26@huawei.com>, <hushiyuan@huawei.com>
Subject: Re: Re: [PATCH 2/3] gpu: drm: dead code elimination
Date: Thu, 19 Dec 2019 11:38:31 +0800
Message-ID: <1576726711-14394-1-git-send-email-zhangpan26@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <484b831b-671a-12f4-8259-1cb6b75e93e3@daenzer.net>
References: <484b831b-671a-12f4-8259-1cb6b75e93e3@daenzer.net>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.16]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 19 Dec 2019 04:31:12 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMi0xOCA1OjUyIHAubS4sIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5u
ZXQ+IHdyb3RlOgoKPj4gdGhpcyBzZXQgYWRkcyBzdXBwb3J0IGZvciByZW1vdmFsIG9mIGdwdSBk
cm0gZGVhZCBjb2RlLgo+PiAKPj4gcGF0Y2gyOgo+PiBgbnVtX2VudHJpZXNgIGlzIGEgZGF0YSBv
ZiB1bnNpZ25lZCB0eXBlKGNvbXBpbGVycyBhbHdheXMgdHJlYXQgYXMgCj4+IHVuc2lnbmVkIGlu
dCkgYW5kIFNJWkVfTUFYID09IH4wLAo+PiAKPj4gc28gdGhlcmUgaXMgYSBpbXBvc3NpYmxlIGNv
bmRpdGlvbjoKPj4gJyhudW1fZW50cmllcyA+ICgofjApIC0gNTYpIC8gNzIpID0+IChtYXgoMC11
MzIpID4gMjU2MjA0Nzc4ODAxNTIxNTQ5KScuCgo+V2hpbGUgdGhpcyBsb29rcyBjb3JyZWN0IGZv
ciA2NC1iaXQsIHdoZXJlIHNpemVfdCBpcyB1bnNpZ25lZCBsb25nLCBvbiAzMi1iaXQgaXQncyB1
bnNpZ25lZCBpbnQsIGluIHdoaWNoIGNhc2UgdGhpcyBpc24ndCBkZWFkIGNvZGUuCgphbmQKCk9u
IDIwMTktMTItMTggNTo1MiBwLm0uLCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QHh4eHh4eHg+IHdyb3RlOgoKPk5BSywgdGhhdCBjYWxjdWxhdGlvbiBpcyBub3QgY29ycmVjdCBv
biAzMi1iaXQgc3lzdGVtcy4KCj5DaHJpc3RpYW4uCgpZZXMsIHlvdSBhcmUgcmlnaHQuIEkganVz
dCBmaWd1cmVkIHRoaXMgb3V0IChiZWNhdXNlIG91ciBTZXJ2ZXIgdXN1YWxseSB1c2VzIDY0IGJp
dHMpLgoKdGhhbmtzLgoKCj4+U2lnbmVkLW9mZi1ieTogUGFuIFpoYW5nIDx6aGFuZ3BhbjI2QHh4
eHh4eHh4eHg+Cj4+LS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9f
bGlzdC5jIHwgNCAtLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPj5kaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMKPj5pbmRleCA4NWIwNTE1
Li4xMGE3ZjMwIDEwMDY0NAo+Pi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9ib19saXN0LmMKPj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9f
bGlzdC5jCj4+QEAgLTcxLDEwICs3MSw2IEBAIGludCBhbWRncHVfYm9fbGlzdF9jcmVhdGUoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlscCwKPj4gCXVuc2ln
bmVkIGk7Cj4+IAlpbnQgcjsKPj4gCj4+LQlpZiAobnVtX2VudHJpZXMgPiAoU0laRV9NQVggLSBz
aXplb2Yoc3RydWN0IGFtZGdwdV9ib19saXN0KSkKPj4tCQkJCS8gc2l6ZW9mKHN0cnVjdCBhbWRn
cHVfYm9fbGlzdF9lbnRyeSkpCj4+LQkJcmV0dXJuIC1FSU5WQUw7Cj4+LQo+PiAJc2l6ZSA9IHNp
emVvZihzdHJ1Y3QgYW1kZ3B1X2JvX2xpc3QpOwo+PiAJc2l6ZSArPSBudW1fZW50cmllcyAqIHNp
emVvZihzdHJ1Y3QgYW1kZ3B1X2JvX2xpc3RfZW50cnkpOwo+PiAJbGlzdCA9IGt2bWFsbG9jKHNp
emUsIEdGUF9LRVJORUwpOwo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngK
