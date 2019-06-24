Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B29502DC
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 09:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D5289A8C;
	Mon, 24 Jun 2019 07:15:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCCE897DC
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 03:41:19 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7FB05AA6FE8AC36B0002;
 Mon, 24 Jun 2019 11:41:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.96) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 24 Jun 2019
 11:41:11 +0800
Subject: Re: [PATCH -next v2] drm/amdgpu: return 'ret' in amdgpu_pmu_init
To: Joe Perches <joe@perches.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <dan.carpenter@oracle.com>, <julia.lawall@lip6.fr>
References: <20190622104318.GT28859@kadam>
 <20190622130527.182022-1-maowenan@huawei.com>
 <0ab82cdb0bec30e7e431f106f8e0e9d141491555.camel@perches.com>
From: maowenan <maowenan@huawei.com>
Message-ID: <b468d765-bef7-70a8-9a14-bad0e6ed14df@huawei.com>
Date: Mon, 24 Jun 2019 11:41:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <0ab82cdb0bec30e7e431f106f8e0e9d141491555.camel@perches.com>
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
Cc: Jonathan Kim <jonathan.kim@amd.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LzYvMjMgMjoxMywgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gU2F0LCAyMDE5LTA2
LTIyIGF0IDIxOjA1ICswODAwLCBNYW8gV2VuYW4gd3JvdGU6Cj4+IFRoZXJlIGlzIG9uZSB3YXJu
aW5nOgo+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmM6IEluIGZ1bmN0
aW9uIOKAmGFtZGdwdV9wbXVfaW5pdOKAmToKPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BtdS5jOjI0OTo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBu
b3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPj4gICBpbnQgcmV0ID0gMDsKPiBb
XQo+PiAgdjEtPnYyOiBjaGFuZ2UgdGhlIHN1YmplY3QgZm9yIHRoaXMgcGF0Y2g7IGNoYW5nZSB0
aGUgaW5kZW50aW5nIHdoZW4gaXQgY2FsbHMgaW5pdF9wbXVfYnlfdHlwZTsgdXNlIHRoZSB2YWx1
ZSAncmV0JyBpbgo+PiAgYW1kZ3B1X3BtdV9pbml0KCkuCj4gW10KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwo+IFtdCj4+IEBAIC0yNTIsOCArMjUyLDggQEAgaW50IGFt
ZGdwdV9wbXVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4gIAljYXNlIENISVBf
VkVHQTIwOgo+PiAgCQkvKiBpbml0IGRmICovCj4+ICAJCXJldCA9IGluaXRfcG11X2J5X3R5cGUo
YWRldiwgZGZfdjNfNl9hdHRyX2dyb3VwcywKPj4gLQkJCQkgICAgICAgIkRGIiwgImFtZGdwdV9k
ZiIsIFBFUkZfVFlQRV9BTURHUFVfREYsCj4+IC0JCQkJICAgICAgIERGX1YzXzZfTUFYX0NPVU5U
RVJTKTsKPj4gKwkJCQkJCQkgICAiREYiLCAiYW1kZ3B1X2RmIiwgUEVSRl9UWVBFX0FNREdQVV9E
RiwKPj4gKwkJCQkJCQkgICBERl9WM182X01BWF9DT1VOVEVSUyk7Cj4gCj4gdHJpdmlhOgo+IAo+
IFRoZSBpbmRlbnRhdGlvbiBjaGFuZ2Ugc2VlbXMgc3VwZXJmbHVvdXMgYW5kCj4gYXBwZWFycyB0
byBtYWtlIHRoZSBjb2RlIGhhcmRlciB0byByZWFkLgo+IAo+IFlvdSBjb3VsZCBhbHNvIGNjIEpv
bmF0aGFuIEtpbSB3aG8gd3JvdGUgYWxsIG9mIHRoaXMuCkkgdGhpbmsgdGhpcyBpcyBqdXN0IGRp
c3BsYXkgaXNzdWUgaW4gbWFpbCBmb3JtYXQuIEl0IGlzIGNvcnJlY3QgdGhhdCBpbiB2aS92aW0u
ClRoZSBhcmd1bWVudHMgYXJlIGxpbmUgdXAgd2l0aCAnKCcgYWZ0ZXIgbXkgY2hhbmdlLgoKCkBA
IC0yNTIsOCArMjUyLDggQEAgaW50IGFtZGdwdV9wbXVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikkCiBeSWNhc2UgQ0hJUF9WRUdBMjA6JAogXkleSS8qIGluaXQgZGYgKi8kCiBeSV5J
cmV0ID0gaW5pdF9wbXVfYnlfdHlwZShhZGV2LCBkZl92M182X2F0dHJfZ3JvdXBzLCQKLV5JXkle
SV5JICAgICAgICJERiIsICJhbWRncHVfZGYiLCBQRVJGX1RZUEVfQU1ER1BVX0RGLCQKLV5JXkle
SV5JICAgICAgIERGX1YzXzZfTUFYX0NPVU5URVJTKTskCiteSV5JXkleSV5JXkleSSAgICJERiIs
ICJhbWRncHVfZGYiLCBQRVJGX1RZUEVfQU1ER1BVX0RGLCQKK15JXkleSV5JXkleSV5JICAgREZf
VjNfNl9NQVhfQ09VTlRFUlMpOyQKICQKIF5JXkkvKiBvdGhlciBwbXUgdHlwZXMgZ28gaGVyZSov
JAogXkleSWJyZWFrOyQKCgoKCgo+IAo+IAo+IAo+IC4KPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
