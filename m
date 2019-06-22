Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161EA4F633
	for <lists+amd-gfx@lfdr.de>; Sat, 22 Jun 2019 16:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2106E033;
	Sat, 22 Jun 2019 14:34:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCAA6E032
 for <amd-gfx@lists.freedesktop.org>; Sat, 22 Jun 2019 13:56:09 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8BA39B392CC39294426D;
 Sat, 22 Jun 2019 21:56:03 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.96) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Sat, 22 Jun 2019
 21:56:01 +0800
Subject: Re: [PATCH -next v2] drm/amdgpu: return 'ret' in amdgpu_pmu_init
To: Julia Lawall <julia.lawall@lip6.fr>
References: <20190622104318.GT28859@kadam>
 <20190622130527.182022-1-maowenan@huawei.com>
 <alpine.DEB.2.21.1906221504110.3253@hadrien>
From: maowenan <maowenan@huawei.com>
Message-ID: <063c9726-8f16-f9b7-2d16-bc87a99085bb@huawei.com>
Date: Sat, 22 Jun 2019 21:56:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906221504110.3253@hadrien>
X-Originating-IP: [10.177.96.96]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 22 Jun 2019 14:34:27 +0000
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
 alexander.deucher@amd.com, christian.koenig@amd.com, dan.carpenter@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LzYvMjIgMjE6MDYsIEp1bGlhIExhd2FsbCB3cm90ZToKPiAKPiAKPiBPbiBTYXQs
IDIyIEp1biAyMDE5LCBNYW8gV2VuYW4gd3JvdGU6Cj4gCj4+IFRoZXJlIGlzIG9uZSB3YXJuaW5n
Ogo+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmM6IEluIGZ1bmN0aW9u
IOKAmGFtZGdwdV9wbXVfaW5pdOKAmToKPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BtdS5jOjI0OTo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPj4gICBpbnQgcmV0ID0gMDsKPj4gICAg
ICAgXgo+PiBhbWRncHVfcG11X2luaXQoKSBpcyBjYWxsZWQgYnkgYW1kZ3B1X2RldmljZV9pbml0
KCkgaW4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jLAo+PiB3aGlj
aCB3aWxsIHVzZSB0aGUgcmV0dXJuIHZhbHVlLiBTbyBpdCByZXR1cm5zICdyZXQnIGZvciBjYWxs
ZXIuCj4+IGFtZGdwdV9kZXZpY2VfaW5pdCgpCj4+IAlyID0gYW1kZ3B1X3BtdV9pbml0KGFkZXYp
Owo+Pgo+PiBGaXhlczogOWM3Yzg1ZjdlYTFmICgiZHJtL2FtZGdwdTogYWRkIHBtdSBjb3VudGVy
cyIpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hbyBXZW5hbiA8bWFvd2VuYW5AaHVhd2VpLmNvbT4K
Pj4gLS0tCj4+ICB2MS0+djI6IGNoYW5nZSB0aGUgc3ViamVjdCBmb3IgdGhpcyBwYXRjaDsgY2hh
bmdlIHRoZSBpbmRlbnRpbmcgd2hlbiBpdCBjYWxscyBpbml0X3BtdV9ieV90eXBlOyB1c2UgdGhl
IHZhbHVlICdyZXQnIGluCj4+ICBhbWRncHVfcG11X2luaXQoKS4KPj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYyB8IDYgKysrLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BtdS5jCj4+IGluZGV4IDBlNmRiYTkuLjE0NWU3MjAgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMKPj4gQEAgLTI1Miw4ICsyNTIsOCBA
QCBpbnQgYW1kZ3B1X3BtdV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiAgCWNh
c2UgQ0hJUF9WRUdBMjA6Cj4+ICAJCS8qIGluaXQgZGYgKi8KPj4gIAkJcmV0ID0gaW5pdF9wbXVf
YnlfdHlwZShhZGV2LCBkZl92M182X2F0dHJfZ3JvdXBzLAo+PiAtCQkJCSAgICAgICAiREYiLCAi
YW1kZ3B1X2RmIiwgUEVSRl9UWVBFX0FNREdQVV9ERiwKPj4gLQkJCQkgICAgICAgREZfVjNfNl9N
QVhfQ09VTlRFUlMpOwo+PiArCQkJCQkJCSAgICJERiIsICJhbWRncHVfZGYiLCBQRVJGX1RZUEVf
QU1ER1BVX0RGLAo+PiArCQkJCQkJCSAgIERGX1YzXzZfTUFYX0NPVU5URVJTKTsKPj4KPj4gIAkJ
Lyogb3RoZXIgcG11IHR5cGVzIGdvIGhlcmUqLwo+IAo+IEkgZG9uJ3Qga25vdyB3aGF0IGlzIHRo
ZSBpbXBhY3Qgb2YgdGhlIG90aGVyIHBtdSB0eXBlcyB0aGF0IGFyZSBwbGFubmVkCj4gZm9yIHRo
ZSBmdXR1cmUuICBQZXJoYXBzIGl0IHdvdWxkIGJlIGJldHRlciB0byBhYm9ydCB0aGUgZnVuY3Rp
b24KPiBpbW1lZGlhdGVseSBpbiB0aGUgY2FzZSBvZiBhIGZhaWx1cmUuCgpJIGd1ZXNzIGl0IHdv
dWxkIGJlIGJldHRlciB0byB1c2UgbmV3IGZ1bmN0aW9uIG9yIG5ldyBzd2l0Y2ggY2FzZSBjbGF1
c2UgdG8gcHJvY2VzcyBkaWZmZXJlbnQgUE1VIHR5cGVzCmluIGZ1dHVyZS4KCj4gCj4ganVsaWEK
PiAKPj4gIAkJYnJlYWs7Cj4+IEBAIC0yNjEsNyArMjYxLDcgQEAgaW50IGFtZGdwdV9wbXVfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4gIAkJcmV0dXJuIDA7Cj4+ICAJfQo+Pgo+
PiAtCXJldHVybiAwOwo+PiArCXJldHVybiByZXQ7Cj4+ICB9Cj4+Cj4+Cj4+IC0tCj4+IDIuNy40
Cj4+Cj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
