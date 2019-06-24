Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A187350DA0
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 16:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E2E89BB0;
	Mon, 24 Jun 2019 14:12:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA2F893A4
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 09:29:51 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0BEF76D46187D21E210D;
 Mon, 24 Jun 2019 17:29:48 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.96) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Mon, 24 Jun 2019
 17:29:46 +0800
Subject: Re: [PATCH -next v3] drm/amdgpu: return 'ret' immediately if failed
 in amdgpu_pmu_init
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <alpine.DEB.2.21.1906230809400.4961@hadrien>
 <20190624034532.135201-1-maowenan@huawei.com> <20190624083952.GO18776@kadam>
From: maowenan <maowenan@huawei.com>
Message-ID: <4795ba5c-8e41-e1e0-c96a-47fdda3995e3@huawei.com>
Date: Mon, 24 Jun 2019 17:29:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190624083952.GO18776@kadam>
X-Originating-IP: [10.177.96.96]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 24 Jun 2019 14:12:23 +0000
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

CgpPbiAyMDE5LzYvMjQgMTY6MzksIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4gT24gTW9uLCBKdW4g
MjQsIDIwMTkgYXQgMTE6NDU6MzJBTSArMDgwMCwgTWFvIFdlbmFuIHdyb3RlOgo+PiBUaGVyZSBp
cyBvbmUgd2FybmluZzoKPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtdS5j
OiBJbiBmdW5jdGlvbiDigJhhbWRncHVfcG11X2luaXTigJk6Cj4+IGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzoyNDk6Njogd2FybmluZzogdmFyaWFibGUg4oCYcmV04oCZ
IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4+ICAgaW50IHJl
dCA9IDA7Cj4+ICAgICAgIF4KPj4gYW1kZ3B1X3BtdV9pbml0KCkgaXMgY2FsbGVkIGJ5IGFtZGdw
dV9kZXZpY2VfaW5pdCgpIGluIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYywKPj4gd2hpY2ggd2lsbCB1c2UgdGhlIHJldHVybiB2YWx1ZS4gU28gaXQgc2hvdWxkIHJl
dHVybiAncmV0JyBpbW1lZGlhdGVseSBpZiBpbml0X3BtdV9ieV90eXBlKCkgZmFpbGVkLgo+PiBh
bWRncHVfZGV2aWNlX2luaXQoKQo+PiAJciA9IGFtZGdwdV9wbXVfaW5pdChhZGV2KTsKPj4KPj4g
VGhpcyBwYXRjaCBpcyBhbHNvIHRvIHVwZGF0ZSB0aGUgaW5kZW50aW5nIG9uIHRoZSBhcmd1bWVu
dHMgc28gdGhleSBsaW5lIHVwIHdpdGggdGhlICcoJy4KPj4KPj4gRml4ZXM6IDljN2M4NWY3ZWEx
ZiAoImRybS9hbWRncHU6IGFkZCBwbXUgY291bnRlcnMiKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBN
YW8gV2VuYW4gPG1hb3dlbmFuQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgdjEtPnYyOiBjaGFuZ2Ug
dGhlIHN1YmplY3QgZm9yIHRoaXMgcGF0Y2g7IGNoYW5nZSB0aGUgaW5kZW50aW5nIHdoZW4gaXQg
Y2FsbHMgaW5pdF9wbXVfYnlfdHlwZTsgdXNlIHRoZSB2YWx1ZSAncmV0JyBpbgo+PiAgYW1kZ3B1
X3BtdV9pbml0KCkuCj4+ICB2Mi0+djM6IGNoYW5nZSB0aGUgc3ViamVjdCBmb3IgdGhpcyBwYXRj
aDsgcmV0dXJuICdyZXQnIGltbWVkaWF0ZWx5IGlmIGZhaWxlZCB0byBjYWxsIGluaXRfcG11X2J5
X3R5cGUoKS4gCj4+Cj4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMg
fCA3ICsrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcG11LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMKPj4gaW5k
ZXggMGU2ZGJhOS4uYjcwMjMyMiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BtdS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbXUuYwo+PiBAQCAtMjUyLDggKzI1MiwxMSBAQCBpbnQgYW1kZ3B1X3BtdV9pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiAgCWNhc2UgQ0hJUF9WRUdBMjA6Cj4+ICAJCS8q
IGluaXQgZGYgKi8KPj4gIAkJcmV0ID0gaW5pdF9wbXVfYnlfdHlwZShhZGV2LCBkZl92M182X2F0
dHJfZ3JvdXBzLAo+PiAtCQkJCSAgICAgICAiREYiLCAiYW1kZ3B1X2RmIiwgUEVSRl9UWVBFX0FN
REdQVV9ERiwKPj4gLQkJCQkgICAgICAgREZfVjNfNl9NQVhfQ09VTlRFUlMpOwo+PiArCQkJCQkJ
CSAgICJERiIsICJhbWRncHVfZGYiLAo+PiArCQkJCQkJCSAgIFBFUkZfVFlQRV9BTURHUFVfREYs
Cj4+ICsJCQkJCQkJICAgREZfVjNfNl9NQVhfQ09VTlRFUlMpOwo+PiArCQlpZiAocmV0KQo+PiAr
CQkJcmV0dXJuIHJldDsKPiAKPiBObyBuby4gIFNvcnJ5LCB0aGUgb3JpZ2luYWwgaW5kZW50aW5n
IHdhcyBjb3JyZWN0IGFuZCBsaW5lZCB1cCB3aXRoIHRoZQo+ICcoJyBjaGFyYWN0ZXIgaW4gJ2lu
aXRfcG11X2J5X3R5cGUoJywgdGhhdCdzIHRoZSB3YXkgaXQgc2hvdWxkIGJlLiAgSWYKPiB3ZSB3
ZXJlIHRvIHJlbW92ZSB0aGUgInJldCA9ICIgdGhlbiB3ZSdkIGhhdmUgdG8gcHVsbCB0aGUgYXJn
dW1lbnRzIGJhY2sKPiBhcyB3ZWxsLiAgSSB0aGluayB0aGlzIGZpeCB0aGF0IEp1bGlhIHN1Z2dl
c3RlZCBpcyByZWFsbHkgdGhlIHJpZ2h0IHNvCj4gbGVhdmUgdGhlIGluZGVudGluZyBhbG9uZS4K
PiAKCj4gSXQgbG9va3MgbGlrZSB5b3UndmUgcmlnaHQgYWxpZ25lZCB0aGUgYXJndW1lbnRzLiAg
VGhhdCdzIG5vdCB0aGUgcmlnaHQKPiB3YXksIHRoZSBvcmlnaW5hbCB3YXMgY29ycmVjdC4KPiAK
QWZ0ZXIgdXNpbmcgOCBjaGFyYWN0ZXIgZm9yIHRhYih0aGFua3MgdG8gSm9lKSwgdGhlIGFsaWdu
ZWQgaGVyZSBpcyB3cm9uZywgeWVzLCB0aGUgb3JpZ2luYWwgd2FzIGNvcnJlY3QuCgpzbyBteSB2
NCBpcyBvbmx5IHRvIGNoYW5nZSByZXQsIGRvbid0IGNoYW5nZSB0aGUgaW5kZW50aW5nPwoKPiBy
ZWdhcmRzLAo+IGRhbiBjYXJwZW50ZXIKPiAKPiAKPiAuCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
