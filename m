Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7BE4F637
	for <lists+amd-gfx@lfdr.de>; Sat, 22 Jun 2019 16:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AA76E055;
	Sat, 22 Jun 2019 14:34:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FEA6E95E
 for <amd-gfx@lists.freedesktop.org>; Sat, 22 Jun 2019 07:21:01 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 66B90551CB76559889A1;
 Sat, 22 Jun 2019 15:20:55 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.96) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Sat, 22 Jun 2019
 15:20:50 +0800
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variables 'ret'
To: Julia Lawall <julia.lawall@lip6.fr>
References: <20190622030314.169640-1-maowenan@huawei.com>
 <alpine.DEB.2.21.1906220801210.3253@hadrien>
From: maowenan <maowenan@huawei.com>
Message-ID: <1a3b6f23-21cb-5931-b8fd-e8dd43e5cf2d@huawei.com>
Date: Sat, 22 Jun 2019 15:20:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906220801210.3253@hadrien>
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
 alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LzYvMjIgMTQ6MDIsIEp1bGlhIExhd2FsbCB3cm90ZToKPiAKPiAKPiBPbiBTYXQs
IDIyIEp1biAyMDE5LCBNYW8gV2VuYW4gd3JvdGU6Cj4gCj4+IEZpeGVzIGdjYyAnLVd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPj4KPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BtdS5jOiBJbiBmdW5jdGlvbiDigJhhbWRncHVfcG11X2luaXTigJk6Cj4+IGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzoyNDk6Njogd2FybmluZzogdmFy
aWFibGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFi
bGVdCj4+ICAgaW50IHJldCA9IDA7Cj4+ICAgICAgIF4KPj4KPj4gSXQgaXMgbmV2ZXIgdXNlZCBz
aW5jZSBpbnRyb2R1Y3Rpb24gaW4gOWM3Yzg1ZjdlYTFmICgiZHJtL2FtZGdwdTogYWRkIHBtdSBj
b3VudGVycyIpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hbyBXZW5hbiA8bWFvd2VuYW5AaHVhd2Vp
LmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMg
fCA0ICstLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
bXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwo+PiBpbmRleCAw
ZTZkYmE5Li4wYmY0ZGQ5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcG11LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BtdS5jCj4+IEBAIC0yNDYsMTIgKzI0NiwxMCBAQCBzdGF0aWMgaW50IGluaXRfcG11X2J5X3R5
cGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+ICAvKiBpbml0IGFtZGdwdV9wbXUgKi8K
Pj4gIGludCBhbWRncHVfcG11X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+ICB7
Cj4+IC0JaW50IHJldCA9IDA7Cj4+IC0KPj4gIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewo+
PiAgCWNhc2UgQ0hJUF9WRUdBMjA6Cj4+ICAJCS8qIGluaXQgZGYgKi8KPj4gLQkJcmV0ID0gaW5p
dF9wbXVfYnlfdHlwZShhZGV2LCBkZl92M182X2F0dHJfZ3JvdXBzLAo+PiArCQlpbml0X3BtdV9i
eV90eXBlKGFkZXYsIGRmX3YzXzZfYXR0cl9ncm91cHMsCj4+ICAJCQkJICAgICAgICJERiIsICJh
bWRncHVfZGYiLCBQRVJGX1RZUEVfQU1ER1BVX0RGLAo+PiAgCQkJCSAgICAgICBERl9WM182X01B
WF9DT1VOVEVSUyk7Cj4gCj4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIHVzZSByZXQ/Cj4g
Cj4gSWYga25vd2luZyB3aGV0aGVyIHRoZSBjYWxsIGhhcyBmYWlsZWQgaXMgcmVhbGx5IHVzZWxl
c3MsIHRoZW4gbWF5YmUgdGhlCj4gcmV0dXJuIHR5cGUgc2hvdWxkIGJlIHZvaWQ/CgpyaWdodC4K
CmFtZGdwdV9wbXVfaW5pdCgpIGlzIGNhbGxlZCBieSBhbWRncHVfZGV2aWNlX2luaXQoKSBpbiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMsCndoaWNoIHdpbGwgdXNl
IHRoZSByZXR1cm4gdmFsdWUuCmFtZGdwdV9kZXZpY2VfaW5pdCgpCglyID0gYW1kZ3B1X3BtdV9p
bml0KGFkZXYpOwoKCnRoYW5rcywgSSB3aWxsIHNlbmQgdjIuCj4gCj4ganVsaWEKPiAKPiAKPj4K
Pj4gLS0KPj4gMi43LjQKPj4KPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
