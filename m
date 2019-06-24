Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB87502DD
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 09:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2292B89A91;
	Mon, 24 Jun 2019 07:15:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AD18928F
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 03:16:50 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9FB2A91CF8408B57CC70;
 Mon, 24 Jun 2019 11:16:47 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.96) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 24 Jun 2019
 11:16:45 +0800
Subject: Re: [PATCH -next v2] drm/amdgpu: return 'ret' in amdgpu_pmu_init
To: Julia Lawall <julia.lawall@lip6.fr>
References: <20190622104318.GT28859@kadam>
 <20190622130527.182022-1-maowenan@huawei.com>
 <alpine.DEB.2.21.1906221504110.3253@hadrien>
 <063c9726-8f16-f9b7-2d16-bc87a99085bb@huawei.com>
 <alpine.DEB.2.21.1906221559060.3253@hadrien>
From: maowenan <maowenan@huawei.com>
Message-ID: <fced7783-1216-ff3f-039f-d7c3a70b4916@huawei.com>
Date: Mon, 24 Jun 2019 11:16:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906221559060.3253@hadrien>
X-Originating-IP: [10.177.96.96]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 24 Jun 2019 07:15:51 +0000
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

CgpPbiAyMDE5LzYvMjIgMjI6MDAsIEp1bGlhIExhd2FsbCB3cm90ZToKPiAKPiAKPiBPbiBTYXQs
IDIyIEp1biAyMDE5LCBtYW93ZW5hbiB3cm90ZToKPiAKPj4KPj4KPj4gT24gMjAxOS82LzIyIDIx
OjA2LCBKdWxpYSBMYXdhbGwgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIFNhdCwgMjIgSnVuIDIwMTks
IE1hbyBXZW5hbiB3cm90ZToKPj4+Cj4+Pj4gVGhlcmUgaXMgb25lIHdhcm5pbmc6Cj4+Pj4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtdS5jOiBJbiBmdW5jdGlvbiDigJhhbWRn
cHVfcG11X2luaXTigJk6Cj4+Pj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bt
dS5jOjI0OTo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QgdXNlZCBb
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPj4+PiAgIGludCByZXQgPSAwOwo+Pj4+ICAgICAg
IF4KPj4+PiBhbWRncHVfcG11X2luaXQoKSBpcyBjYWxsZWQgYnkgYW1kZ3B1X2RldmljZV9pbml0
KCkgaW4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jLAo+Pj4+IHdo
aWNoIHdpbGwgdXNlIHRoZSByZXR1cm4gdmFsdWUuIFNvIGl0IHJldHVybnMgJ3JldCcgZm9yIGNh
bGxlci4KPj4+PiBhbWRncHVfZGV2aWNlX2luaXQoKQo+Pj4+IAlyID0gYW1kZ3B1X3BtdV9pbml0
KGFkZXYpOwo+Pj4+Cj4+Pj4gRml4ZXM6IDljN2M4NWY3ZWExZiAoImRybS9hbWRncHU6IGFkZCBw
bXUgY291bnRlcnMiKQo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTWFvIFdlbmFuIDxtYW93ZW5h
bkBodWF3ZWkuY29tPgo+Pj4+IC0tLQo+Pj4+ICB2MS0+djI6IGNoYW5nZSB0aGUgc3ViamVjdCBm
b3IgdGhpcyBwYXRjaDsgY2hhbmdlIHRoZSBpbmRlbnRpbmcgd2hlbiBpdCBjYWxscyBpbml0X3Bt
dV9ieV90eXBlOyB1c2UgdGhlIHZhbHVlICdyZXQnIGluCj4+Pj4gIGFtZGdwdV9wbXVfaW5pdCgp
Lgo+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMgfCA2ICsrKy0t
LQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
bXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwo+Pj4+IGluZGV4
IDBlNmRiYTkuLjE0NWU3MjAgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BtdS5jCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BtdS5jCj4+Pj4gQEAgLTI1Miw4ICsyNTIsOCBAQCBpbnQgYW1kZ3B1X3BtdV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+Pj4+ICAJY2FzZSBDSElQX1ZFR0EyMDoKPj4+
PiAgCQkvKiBpbml0IGRmICovCj4+Pj4gIAkJcmV0ID0gaW5pdF9wbXVfYnlfdHlwZShhZGV2LCBk
Zl92M182X2F0dHJfZ3JvdXBzLAo+Pj4+IC0JCQkJICAgICAgICJERiIsICJhbWRncHVfZGYiLCBQ
RVJGX1RZUEVfQU1ER1BVX0RGLAo+Pj4+IC0JCQkJICAgICAgIERGX1YzXzZfTUFYX0NPVU5URVJT
KTsKPj4+PiArCQkJCQkJCSAgICJERiIsICJhbWRncHVfZGYiLCBQRVJGX1RZUEVfQU1ER1BVX0RG
LAo+Pj4+ICsJCQkJCQkJICAgREZfVjNfNl9NQVhfQ09VTlRFUlMpOwo+Pj4+Cj4+Pj4gIAkJLyog
b3RoZXIgcG11IHR5cGVzIGdvIGhlcmUqLwo+Pj4KPj4+IEkgZG9uJ3Qga25vdyB3aGF0IGlzIHRo
ZSBpbXBhY3Qgb2YgdGhlIG90aGVyIHBtdSB0eXBlcyB0aGF0IGFyZSBwbGFubmVkCj4+PiBmb3Ig
dGhlIGZ1dHVyZS4gIFBlcmhhcHMgaXQgd291bGQgYmUgYmV0dGVyIHRvIGFib3J0IHRoZSBmdW5j
dGlvbgo+Pj4gaW1tZWRpYXRlbHkgaW4gdGhlIGNhc2Ugb2YgYSBmYWlsdXJlLgo+PgoKT0ssIHYz
IHdpbGwgYmUgc2VudC4KCj4+IEkgZ3Vlc3MgaXQgd291bGQgYmUgYmV0dGVyIHRvIHVzZSBuZXcg
ZnVuY3Rpb24gb3IgbmV3IHN3aXRjaCBjYXNlIGNsYXVzZSB0byBwcm9jZXNzIGRpZmZlcmVudCBQ
TVUgdHlwZXMKPj4gaW4gZnV0dXJlLgo+IAo+IEkgZG9uJ3Qga25vdy4gIEJ1dCBub3JtYWxseSB3
aGVuIGFuIGVycm9yIG1heSBvY2N1ciBpdCBpcyBjaGVja2VkIGZvcgo+IGltbWVkaWF0ZWx5LCBy
YXRoZXIgdGhhbiBqdXN0IGxldHRpbmcgaXQgZ28gdW50aWwgdGhlIGVuZCBvZiB0aGUgZnVuY3Rp
b24uCj4gQnV0IG1heWJlIHRoZSBkZXZlbG9wZXIga25vdyB3aGF0IGlzIHBsYW5uZWQgZm9yIHRo
ZSBmdXR1cmUgZm9yIHRoaXMKPiBmdW5jdGlvbi4KPiAKPiBqdWxpYQo+IAo+Pgo+Pj4KPj4+IGp1
bGlhCj4+Pgo+Pj4+ICAJCWJyZWFrOwo+Pj4+IEBAIC0yNjEsNyArMjYxLDcgQEAgaW50IGFtZGdw
dV9wbXVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4+PiAgCQlyZXR1cm4gMDsK
Pj4+PiAgCX0KPj4+Pgo+Pj4+IC0JcmV0dXJuIDA7Cj4+Pj4gKwlyZXR1cm4gcmV0Owo+Pj4+ICB9
Cj4+Pj4KPj4+Pgo+Pj4+IC0tCj4+Pj4gMi43LjQKPj4+Pgo+Pj4+Cj4+Pgo+Pgo+Pgo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
