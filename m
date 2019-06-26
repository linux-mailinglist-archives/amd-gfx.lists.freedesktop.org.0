Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C519D56B4E
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 15:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9506E443;
	Wed, 26 Jun 2019 13:53:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFA16E391
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 11:35:54 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 85506CFD3134A0E4BC1F;
 Wed, 26 Jun 2019 19:35:50 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.96) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 26 Jun 2019
 19:35:45 +0800
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
From: maowenan <maowenan@huawei.com>
Message-ID: <2d7c2525-4503-3706-7d00-0b9bf230266d@huawei.com>
Date: Wed, 26 Jun 2019 19:35:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CH2PR12MB3831BE36FF61D74FC529F64F85E00@CH2PR12MB3831.namprd12.prod.outlook.com>
X-Originating-IP: [10.177.96.96]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 26 Jun 2019 13:53:51 +0000
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

CgpPbiAyMDE5LzYvMjUgMTo0MiwgS2ltLCBKb25hdGhhbiB3cm90ZToKPiBJbW1lZGlhdGUgcmV0
dXJuIHNob3VsZCBiZSBvayBzaW5jZSBwZXJmIHJlZ2lzdHJhdGlvbiBpc24ndCBkZXBlbmRlbnQg
b24gZ3B1IGh3Lgo+IAo+IFJldmlld2VkLWJ5OiBKb25hdGhhbiBLaW0gPEpvbmF0aGFuLktpbUBh
bWQuY29tPgoKdGhhbmtzIGZvciByZXZpZXcuCgo+IAo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4gRnJvbTogTWFvIFdlbmFuIDxtYW93ZW5hbkBodWF3ZWkuY29tPiAKPiBTZW50OiBNb25k
YXksIEp1bmUgMjQsIDIwMTkgNzoyMyBBTQo+IFRvOiBhaXJsaWVkQGxpbnV4LmllOyBkYW5pZWxA
ZmZ3bGwuY2g7IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47
IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBaaG91LCBEYXZp
ZChDaHVuTWluZykgPERhdmlkMS5aaG91QGFtZC5jb20+OyBkYW4uY2FycGVudGVyQG9yYWNsZS5j
b207IGp1bGlhLmxhd2FsbEBsaXA2LmZyCj4gQ2M6IGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5l
bC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBLaW0sIEpvbmF0aGFuIDxKb25hdGhhbi5LaW1AYW1kLmNvbT47IE1hbyBXZW5h
biA8bWFvd2VuYW5AaHVhd2VpLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggLW5leHQgdjRdIGRybS9h
bWRncHU6IHJldHVybiAncmV0JyBpbW1lZGlhdGVseSBpZiBmYWlsZWQgaW4gYW1kZ3B1X3BtdV9p
bml0Cj4gCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQo+IAo+IFRoZXJlIGlzIG9uZSB3YXJu
aW5nOgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzogSW4gZnVuY3Rp
b24g4oCYYW1kZ3B1X3BtdV9pbml04oCZOgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbXUuYzoyNDk6Njogd2FybmluZzogdmFyaWFibGUg4oCYcmV04oCZIHNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gICBpbnQgcmV0ID0gMDsKPiAgICAg
ICBeCj4gYW1kZ3B1X3BtdV9pbml0KCkgaXMgY2FsbGVkIGJ5IGFtZGdwdV9kZXZpY2VfaW5pdCgp
IGluIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYywKPiB3aGljaCB3
aWxsIHVzZSB0aGUgcmV0dXJuIHZhbHVlLiBTbyBpdCBzaG91bGQgcmV0dXJuICdyZXQnIGltbWVk
aWF0ZWx5IGlmIGluaXRfcG11X2J5X3R5cGUoKSBmYWlsZWQuCj4gYW1kZ3B1X2RldmljZV9pbml0
KCkKPiAgICAgICAgIHIgPSBhbWRncHVfcG11X2luaXQoYWRldik7Cj4gCj4gRml4ZXM6IDljN2M4
NWY3ZWExZiAoImRybS9hbWRncHU6IGFkZCBwbXUgY291bnRlcnMiKQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1hbyBXZW5hbiA8bWFvd2VuYW5AaHVhd2VpLmNvbT4KPiAtLS0KPiAgdjEtPnYyOiBjaGFu
Z2UgdGhlIHN1YmplY3QgZm9yIHRoaXMgcGF0Y2g7IGNoYW5nZSB0aGUgaW5kZW50aW5nIHdoZW4g
aXQgY2FsbHMgaW5pdF9wbXVfYnlfdHlwZTsgdXNlIHRoZSB2YWx1ZSAncmV0JyBpbiAgYW1kZ3B1
X3BtdV9pbml0KCkuCj4gIHYyLT52MzogY2hhbmdlIHRoZSBzdWJqZWN0IGZvciB0aGlzIHBhdGNo
OyByZXR1cm4gJ3JldCcgaW1tZWRpYXRlbHkgaWYgZmFpbGVkIHRvIGNhbGwgaW5pdF9wbXVfYnlf
dHlwZSgpLgo+ICB2My0+djQ6IGRlbGV0ZSB0aGUgaW5kZW50aW5nIGZvciBpbml0X3BtdV9ieV90
eXBlKCkgYXJndW1lbnRzLiBUaGUgb3JpZ2luYWwgaW5kZW50aW5nIGlzIGNvcnJlY3QuCj4gCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYyB8IDIgKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcG11LmMKPiBpbmRleCAwZTZkYmE5ZjYwZjAuLmM5OGNmNzdhMzdmMyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMKPiBAQCAtMjU0LDYgKzI1NCw4IEBA
IGludCBhbWRncHVfcG11X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAgICAg
ICAgICAgICAgIHJldCA9IGluaXRfcG11X2J5X3R5cGUoYWRldiwgZGZfdjNfNl9hdHRyX2dyb3Vw
cywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiREYiLCAiYW1kZ3B1
X2RmIiwgUEVSRl9UWVBFX0FNREdQVV9ERiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBERl9WM182X01BWF9DT1VOVEVSUyk7Cj4gKyAgICAgICAgICAgICAgIGlmIChy
ZXQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAKPiAgICAgICAgICAg
ICAgICAgLyogb3RoZXIgcG11IHR5cGVzIGdvIGhlcmUqLwo+ICAgICAgICAgICAgICAgICBicmVh
azsKPiAtLQo+IDIuMjAuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
