Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261ED64BCA
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 19:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0F96E11D;
	Wed, 10 Jul 2019 17:59:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5CF892F6
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 07:31:40 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 40D38EDBC7DF22691293;
 Wed, 10 Jul 2019 15:31:34 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.96) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 10 Jul 2019
 15:31:31 +0800
Subject: Re: [PATCH -next v4] drm/amdgpu: return 'ret' immediately if failed
 in amdgpu_pmu_init
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "dan.carpenter@oracle.com"
 <dan.carpenter@oracle.com>, "julia.lawall@lip6.fr" <julia.lawall@lip6.fr>
References: <20190624094850.GQ18776@kadam>
 <20190624112318.149299-1-maowenan@huawei.com>
 <CH2PR12MB3831BE36FF61D74FC529F64F85E00@CH2PR12MB3831.namprd12.prod.outlook.com>
 <2d7c2525-4503-3706-7d00-0b9bf230266d@huawei.com>
From: maowenan <maowenan@huawei.com>
Message-ID: <8008fcf8-47a1-111f-4467-1a16171129dd@huawei.com>
Date: Wed, 10 Jul 2019 15:31:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <2d7c2525-4503-3706-7d00-0b9bf230266d@huawei.com>
X-Originating-IP: [10.177.96.96]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 10 Jul 2019 17:59:40 +0000
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CmdlbnRsZSBwaW5nCgoKT24gMjAxOS82LzI2IDE5OjM1LCBtYW93ZW5hbiB3cm90ZToKPiAKPiAK
PiBPbiAyMDE5LzYvMjUgMTo0MiwgS2ltLCBKb25hdGhhbiB3cm90ZToKPj4gSW1tZWRpYXRlIHJl
dHVybiBzaG91bGQgYmUgb2sgc2luY2UgcGVyZiByZWdpc3RyYXRpb24gaXNuJ3QgZGVwZW5kZW50
IG9uIGdwdSBody4KPj4KPj4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIEtpbSA8Sm9uYXRoYW4uS2lt
QGFtZC5jb20+Cj4gCj4gdGhhbmtzIGZvciByZXZpZXcuCj4gCj4+Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IE1hbyBXZW5hbiA8bWFvd2VuYW5AaHVhd2VpLmNvbT4gCj4+
IFNlbnQ6IE1vbmRheSwgSnVuZSAyNCwgMjAxOSA3OjIzIEFNCj4+IFRvOiBhaXJsaWVkQGxpbnV4
LmllOyBkYW5pZWxAZmZ3bGwuY2g7IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNo
ZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+
OyBaaG91LCBEYXZpZChDaHVuTWluZykgPERhdmlkMS5aaG91QGFtZC5jb20+OyBkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb207IGp1bGlhLmxhd2FsbEBsaXA2LmZyCj4+IENjOiBrZXJuZWwtamFuaXRv
cnNAdmdlci5rZXJuZWwub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgS2ltLCBKb25hdGhhbiA8Sm9uYXRoYW4uS2ltQGFtZC5j
b20+OyBNYW8gV2VuYW4gPG1hb3dlbmFuQGh1YXdlaS5jb20+Cj4+IFN1YmplY3Q6IFtQQVRDSCAt
bmV4dCB2NF0gZHJtL2FtZGdwdTogcmV0dXJuICdyZXQnIGltbWVkaWF0ZWx5IGlmIGZhaWxlZCBp
biBhbWRncHVfcG11X2luaXQKPj4KPj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQo+Pgo+PiBU
aGVyZSBpcyBvbmUgd2FybmluZzoKPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BtdS5jOiBJbiBmdW5jdGlvbiDigJhhbWRncHVfcG11X2luaXTigJk6Cj4+IGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzoyNDk6Njogd2FybmluZzogdmFyaWFibGUg4oCY
cmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4+ICAg
aW50IHJldCA9IDA7Cj4+ICAgICAgIF4KPj4gYW1kZ3B1X3BtdV9pbml0KCkgaXMgY2FsbGVkIGJ5
IGFtZGdwdV9kZXZpY2VfaW5pdCgpIGluIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYywKPj4gd2hpY2ggd2lsbCB1c2UgdGhlIHJldHVybiB2YWx1ZS4gU28gaXQgc2hv
dWxkIHJldHVybiAncmV0JyBpbW1lZGlhdGVseSBpZiBpbml0X3BtdV9ieV90eXBlKCkgZmFpbGVk
Lgo+PiBhbWRncHVfZGV2aWNlX2luaXQoKQo+PiAgICAgICAgIHIgPSBhbWRncHVfcG11X2luaXQo
YWRldik7Cj4+Cj4+IEZpeGVzOiA5YzdjODVmN2VhMWYgKCJkcm0vYW1kZ3B1OiBhZGQgcG11IGNv
dW50ZXJzIikKPj4KPj4gU2lnbmVkLW9mZi1ieTogTWFvIFdlbmFuIDxtYW93ZW5hbkBodWF3ZWku
Y29tPgo+PiAtLS0KPj4gIHYxLT52MjogY2hhbmdlIHRoZSBzdWJqZWN0IGZvciB0aGlzIHBhdGNo
OyBjaGFuZ2UgdGhlIGluZGVudGluZyB3aGVuIGl0IGNhbGxzIGluaXRfcG11X2J5X3R5cGU7IHVz
ZSB0aGUgdmFsdWUgJ3JldCcgaW4gIGFtZGdwdV9wbXVfaW5pdCgpLgo+PiAgdjItPnYzOiBjaGFu
Z2UgdGhlIHN1YmplY3QgZm9yIHRoaXMgcGF0Y2g7IHJldHVybiAncmV0JyBpbW1lZGlhdGVseSBp
ZiBmYWlsZWQgdG8gY2FsbCBpbml0X3BtdV9ieV90eXBlKCkuCj4+ICB2My0+djQ6IGRlbGV0ZSB0
aGUgaW5kZW50aW5nIGZvciBpbml0X3BtdV9ieV90eXBlKCkgYXJndW1lbnRzLiBUaGUgb3JpZ2lu
YWwgaW5kZW50aW5nIGlzIGNvcnJlY3QuCj4+Cj4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcG11LmMgfCAyICsrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMKPj4gaW5kZXggMGU2
ZGJhOWY2MGYwLi5jOThjZjc3YTM3ZjMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcG11LmMKPj4gQEAgLTI1NCw2ICsyNTQsOCBAQCBpbnQgYW1kZ3B1X3BtdV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiAgICAgICAgICAgICAgICAgcmV0ID0gaW5p
dF9wbXVfYnlfdHlwZShhZGV2LCBkZl92M182X2F0dHJfZ3JvdXBzLAo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiREYiLCAiYW1kZ3B1X2RmIiwgUEVSRl9UWVBFX0FN
REdQVV9ERiwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREZfVjNf
Nl9NQVhfQ09VTlRFUlMpOwo+PiArICAgICAgICAgICAgICAgaWYgKHJldCkKPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4KPj4gICAgICAgICAgICAgICAgIC8qIG90aGVy
IHBtdSB0eXBlcyBnbyBoZXJlKi8KPj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAtLQo+PiAy
LjIwLjEKPj4KPiAKPiAKPiAuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
