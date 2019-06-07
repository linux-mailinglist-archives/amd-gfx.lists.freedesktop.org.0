Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116343952D
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 21:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846A289E41;
	Fri,  7 Jun 2019 19:02:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EE489E41;
 Fri,  7 Jun 2019 19:01:48 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfab4990002>; Fri, 07 Jun 2019 12:01:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 12:01:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 12:01:47 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 7 Jun 2019 19:01:45 +0000
Subject: Re: [PATCH v2 hmm 05/11] mm/hmm: Remove duplicate condition test
 before wait_event_timeout
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-6-jgg@ziepe.ca>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <6833be96-12a3-1a1c-1514-c148ba2dd87b@nvidia.com>
Date: Fri, 7 Jun 2019 12:01:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-6-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Jun 2019 19:02:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559934106; bh=Kx8oCHq1Rv6wVMPa9pb6SeAWwPMNVFkybn8lVkznCEc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=OOE2pgqo7ftC767YP6v8PyPJPNGYFCNcGs3HC/wYDfhNkODHLGUlKLiR8twf0HPhF
 VG3vpikEzbQgYg0mL8d7raWpxbdlSwGYJw0RS+JY/Lj5EGMWeHLmNWN64HFIf0Fj3C
 gvuanE1Ein7NVB78p8uWHwSEyjF7u87vyfbAmxvnusudonZMGMZnXcSDOOe9Yhjsq5
 bXuliTWimMjus4vzSrggE4UG/DLDLHfMsCOGfmJe3NHCkSR7SriUK1SQuuZOV38Qe5
 U0WLCrHGhX4NFqFb1R/uHzaqYgg1R4s21W0L5TIFq8RtPAb4nx4xG/vdLfpantfVmz
 4bvGVZAbHZNjQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDYvNi8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IEZyb206IEphc29u
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBUaGUgd2FpdF9ldmVudF90aW1lb3V0
IG1hY3JvIGFscmVhZHkgdGVzdHMgdGhlIGNvbmRpdGlvbiBhcyBpdHMgZmlyc3QKPiBhY3Rpb24s
IHNvIHRoZXJlIGlzIG5vIHJlYXNvbiB0byBvcGVuIGNvZGUgYW5vdGhlciB2ZXJzaW9uIG9mIHRo
aXMsIGFsbAo+IHRoYXQgZG9lcyBpcyBza2lwIHRoZSBtaWdodF9zbGVlcCgpIGRlYnVnZ2luZyBp
biBjb21tb24gY2FzZXMsIHdoaWNoIGlzCj4gbm90IGhlbHBmdWwuCj4gCj4gRnVydGhlciwgYmFz
ZWQgb24gcHJpb3IgcGF0Y2hlcywgd2UgY2FuIG5vIHNpbXBsaWZ5IHRoZSByZXF1aXJlZCBjb25k
aXRpb24KPiB0ZXN0Ogo+ICAgLSBJZiByYW5nZSBpcyB2YWxpZCBtZW1vcnkgdGhlbiBzbyBpcyBy
YW5nZS0+aG1tCj4gICAtIElmIGhtbV9yZWxlYXNlKCkgaGFzIHJ1biB0aGVuIHJhbmdlLT52YWxp
ZCBpcyBzZXQgdG8gZmFsc2UKPiAgICAgYXQgdGhlIHNhbWUgdGltZSBhcyBkZWFkLCBzbyBubyBy
ZWFzb24gdG8gY2hlY2sgYm90aC4KPiAgIC0gQSB2YWxpZCBobW0gaGFzIGEgdmFsaWQgaG1tLT5t
bS4KPiAKPiBBbHNvLCBhZGQgdGhlIFJFQURfT05DRSBmb3IgcmFuZ2UtPnZhbGlkIGFzIHRoZXJl
IGlzIG5vIGxvY2sgaGVsZCBoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3Jw
ZSA8amdnQG1lbGxhbm94LmNvbT4KPiBSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xp
c3NlQHJlZGhhdC5jb20+Cj4gLS0tCj4gICBpbmNsdWRlL2xpbnV4L2htbS5oIHwgMTIgKystLS0t
LS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgv
aG1tLmgKPiBpbmRleCA0ZWUzYWNhYmU1ZWQyMi4uMmFiMzViNDA5OTJiMjQgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9saW51eC9obW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvaG1tLmgKPiBAQCAt
MjE4LDE3ICsyMTgsOSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgaG1tX3JhbmdlX3Bh
Z2Vfc2l6ZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAgIHN0YXRpYyBpbmxpbmUg
Ym9vbCBobW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwK
PiAgIAkJCQkJICAgICAgdW5zaWduZWQgbG9uZyB0aW1lb3V0KQo+ICAgewo+IC0JLyogQ2hlY2sg
aWYgbW0gaXMgZGVhZCA/ICovCj4gLQlpZiAocmFuZ2UtPmhtbSA9PSBOVUxMIHx8IHJhbmdlLT5o
bW0tPmRlYWQgfHwgcmFuZ2UtPmhtbS0+bW0gPT0gTlVMTCkgewo+IC0JCXJhbmdlLT52YWxpZCA9
IGZhbHNlOwo+IC0JCXJldHVybiBmYWxzZTsKPiAtCX0KPiAtCWlmIChyYW5nZS0+dmFsaWQpCj4g
LQkJcmV0dXJuIHRydWU7Cj4gLQl3YWl0X2V2ZW50X3RpbWVvdXQocmFuZ2UtPmhtbS0+d3EsIHJh
bmdlLT52YWxpZCB8fCByYW5nZS0+aG1tLT5kZWFkLAo+ICsJd2FpdF9ldmVudF90aW1lb3V0KHJh
bmdlLT5obW0tPndxLCByYW5nZS0+dmFsaWQsCj4gICAJCQkgICBtc2Vjc190b19qaWZmaWVzKHRp
bWVvdXQpKTsKPiAtCS8qIFJldHVybiBjdXJyZW50IHZhbGlkIHN0YXR1cyBqdXN0IGluIGNhc2Ug
d2UgZ2V0IGx1Y2t5ICovCj4gLQlyZXR1cm4gcmFuZ2UtPnZhbGlkOwo+ICsJcmV0dXJuIFJFQURf
T05DRShyYW5nZS0+dmFsaWQpOwo+ICAgfQo+ICAgCj4gICAvKgo+IAoKU2luY2Ugd2UgYXJlIHNp
bXBsaWZ5aW5nIHRoaW5ncywgcGVyaGFwcyB3ZSBzaG91bGQgY29uc2lkZXIgbWVyZ2luZwpobW1f
cmFuZ2Vfd2FpdF91bnRpbF92YWxpZCgpIGluZm8gaG1tX3JhbmdlX3JlZ2lzdGVyKCkgYW5kCnJl
bW92aW5nIGhtbV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKCkgc2luY2UgdGhlIHBhdHRlcm4KaXMg
dG8gYWx3YXlzIGNhbGwgdGhlIHR3byB0b2dldGhlci4KCkluIGFueSBjYXNlLCB0aGlzIGxvb2tz
IE9LIHRvIG1lIHNvIHlvdSBjYW4gYWRkClJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNh
bXBiZWxsQG52aWRpYS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
