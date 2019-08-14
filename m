Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596DF8E167
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 01:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9288C6E876;
	Wed, 14 Aug 2019 23:56:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7BE6E875;
 Wed, 14 Aug 2019 23:56:04 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d549f960003>; Wed, 14 Aug 2019 16:56:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 14 Aug 2019 16:56:04 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 14 Aug 2019 16:56:04 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Aug
 2019 23:56:02 +0000
Subject: Re: [PATCH v3 hmm 00/11] Add mmu_notifier_get/put for managing mmu
 notifier registrations
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>
References: <20190806231548.25242-1-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <5c836cd9-3c20-aaea-8e98-e6d92e6879d9@nvidia.com>
Date: Wed, 14 Aug 2019 16:56:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565826967; bh=KQZIZADkTJTVQx2WPyHcZuejYCxTybKh1hB7YAzhaws=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=DPQAE2pgSQl/XQn1sjjM9NrKUE4dIfRSf7GHRsdRrmPgihcpBk5GabDJW04Y61TSS
 7iAncQ3+R1+zgw3UEbBaoE6pxrkmIYOeqhpoN16KZs/TsqsxdJ7djkvTLnIdMXr3NZ
 MVIMdUI9Q0Ivtmh86bTP2EH6iSvh/Fs1CI4WxT4AwNTtCCdOzKeSza9E3gIVs+zCaf
 g+7s7qtlxYKTA3dgKGsvDrDH7MrVctT0aqnVuDzqleqRtjf1u7r3PA3avRVgwlnqhC
 czXgQ20q0CQOn4peDoypa5Awpun++K0FRd7ut9Npwa0KmwUlGmgCSmGvNNSlheFdH6
 E0wJVcbqJ+BkQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Dimitri Sivanich <sivanich@sgi.com>, Gavin Shan <shangw@linux.vnet.ibm.com>,
 Andrea Righi <andrea@betterlinux.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@mellanox.com>, Alex
 Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDgvNi8xOSA0OjE1IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gRnJvbTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IFRoaXMgc2VyaWVzIGludHJvZHVjZXMg
YSBuZXcgcmVnaXN0cmF0aW9uIGZsb3cgZm9yIG1tdV9ub3RpZmllcnMgYmFzZWQgb24KPiB0aGUg
aWRlYSB0aGF0IHRoZSB1c2VyIHdvdWxkIGxpa2UgdG8gZ2V0IGEgc2luZ2xlIHJlZmNvdW50ZWQg
cGllY2Ugb2YKPiBtZW1vcnkgZm9yIGEgbW0sIGtleWVkIHRvIGl0cyB1c2UuCj4gCj4gRm9yIGlu
c3RhbmNlIG1hbnkgdXNlcnMgb2YgbW11X25vdGlmaWVycyB1c2UgYW4gaW50ZXJ2YWwgdHJlZSBv
ciBzaW1pbGFyCj4gdG8gZGlzcGF0Y2ggbm90aWZpY2F0aW9ucyB0byBzb21lIG9iamVjdC4gVGhl
cmUgYXJlIG1hbnkgb2JqZWN0cyBidXQgb25seQo+IG9uZSBub3RpZmllciBzdWJzY3JpcHRpb24g
cGVyIG1tIGhvbGRpbmcgdGhlIHRyZWUuCj4gCj4gT2YgdGhlIDEyIHBsYWNlcyB0aGF0IGNhbGwg
bW11X25vdGlmaWVyX3JlZ2lzdGVyOgo+ICAgLSA3IGFyZSBtYWludGFpbmluZyBzb21lIGtpbmQg
b2Ygb2J2aW91cyBtYXBwaW5nIG9mIG1tX3N0cnVjdCB0bwo+ICAgICBtbXVfbm90aWZpZXIgcmVn
aXN0cmF0aW9uLCBpZSBpbiBzb21lIGxpbmtlZCBsaXN0IG9yIGhhc2ggdGFibGUuIE9mCj4gICAg
IHRoZSA3IHRoaXMgc2VyaWVzIGNvbnZlcnRzIDQgKGdydSwgaG1tLCBSRE1BLCByYWRlb24pCj4g
Cj4gICAtIDMgKGhmaTEsIGdudGRldiwgdmhvc3QpIGFyZSByZWdpc3RlcmluZyBtdWx0aXBsZSBu
b3RpZmllcnMsIGJ1dCBlYWNoCj4gICAgIG9uZSBpbW1lZGlhdGVseSBkb2VzIHNvbWUgVkEgcmFu
Z2UgZmlsdGVyaW5nLCBpZSB3aXRoIGFuIGludGVydmFsIHRyZWUuCj4gICAgIFRoZXNlIHdvdWxk
IGJlIGJldHRlciB3aXRoIGEgZ2xvYmFsIHN1YnN5c3RlbS13aWRlIHJhbmdlIGZpbHRlciBhbmQK
PiAgICAgY291bGQgY29udmVydCB0byB0aGlzIEFQSS4KPiAKPiAgIC0gMiAoa3ZtLCBhbWRfaW9t
bXUpIGFyZSBkZWxpYmVyYXRlbHkgdXNpbmcgYSBzaW5nbGUgbW0gYXQgYSB0aW1lLCBhbmQKPiAg
ICAgcmVhbGx5IGNhbid0IHVzZSB0aGlzIEFQSS4gT25lIG9mIHRoZSBpbnRlbC1zdm0ncyBtb2Rl
cyBpcyBhbHNvIGluIHRoaXMKPiAgICAgbGlzdAo+IAo+IFRoZSAzLzcgdW5jb252ZXJ0ZWQgZHJp
dmVycyBhcmU6Cj4gICAtIGludGVsLXN2bQo+ICAgICBUaGlzIGRyaXZlciB0cmFja3MgbW0ncyBp
biBhIGdsb2JhbCBsaW5rZWQgbGlzdCAnZ2xvYmFsX3N2bV9saXN0Jwo+ICAgICBhbmQgd291bGQg
YmVuZWZpdCBmcm9tIHRoaXMgQVBJLgo+IAo+ICAgICBJdHMgZmxvdyBpcyBhIGJpdCBjb21wbGV4
LCBzaW5jZSBpdCBhbHNvIHdhbnRzIGEgc2V0IG9mIG5vbi1zaGFyZWQKPiAgICAgbm90aWZpZXJz
Lgo+IAo+ICAgLSBpOTE1X2dlbV91c3JwdHIKPiAgICAgVGhpcyBkcml2ZXIgdHJhY2tzIG1tJ3Mg
aW4gYSBwZXItZGV2aWNlIGhhc2gKPiAgICAgdGFibGUgKGRldl9wcml2LT5tbV9zdHJ1Y3RzKSwg
YnV0IG9ubHkgaGFzIGFuIG9wdGlvbmFsIHVzZSBvZgo+ICAgICBtbXVfbm90aWZpZXJzLiAgU2lu
Y2UgaXQgc3RpbGwgc2VlbXMgdG8gbmVlZCB0aGUgaGFzaCB0YWJsZSBpdCBpcwo+ICAgICBkaWZm
aWN1bHQgdG8gY29udmVydC4KPiAKPiAgIC0gYW1ka2ZkL2tmZF9wcm9jZXNzCj4gICAgIFRoaXMg
ZHJpdmVyIGlzIHVzaW5nIGEgZ2xvYmFsIFNSQ1UgaGFzaCB0YWJsZSB0byB0cmFjayBtbSdzCj4g
Cj4gICAgIFRoZSBjb250cm9sIGZsb3cgaGVyZSBpcyB2ZXJ5IGNvbXBsaWNhdGVkIGFuZCB0aGUg
ZHJpdmVyIGlzIHJlbHlpbmcgb24KPiAgICAgdGhpcyBoYXNoIHRhYmxlIHRvIGJlIGZhc3Qgb24g
dGhlIGlvY3RsIHN5c2NhbGwgcGF0aC4KPiAKPiAgICAgSXQgd291bGQgZGVmaW5pdGVseSBiZW5l
Zml0LCBidXQgb25seSBpZiB0aGUgaW9jdGwgcGF0aCBkaWRuJ3QgbmVlZCB0bwo+ICAgICBkbyB0
aGUgc2VhcmNoIHNvIG9mdGVuLgo+IAo+IFRoaXMgc2VyaWVzIGlzIGFscmVhZHkgZW50YW5nbGVk
IHdpdGggcGF0Y2hlcyBpbiB0aGUgaG1tICYgUkRNQSB0cmVlIGFuZAo+IHdpbGwgcmVxdWlyZSBz
b21lIGdpdCB0b3BpYyBicmFuY2hlcyBmb3IgdGhlIFJETUEgT0RQIHN0dWZmLiBJIGludGVuZCBm
b3IKPiBpdCB0byBnbyB0aHJvdWdoIHRoZSBobW0gdHJlZS4KPiAKPiBUaGVyZSBpcyBhIGdpdCB2
ZXJzaW9uIGhlcmU6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2pndW50aG9ycGUvbGludXgvY29t
bWl0cy9tbXVfbm90aWZpZXIKPiAKPiBXaGljaCBoYXMgdGhlIHJlcXVpcmVkIHByZS1wYXRjaGVz
IGZvciB0aGUgUkRNQSBPRFAgY29udmVyc2lvbiB0aGF0IGFyZQo+IHN0aWxsIGJlaW5nIHJldmll
d2VkLgo+IAo+IEphc29uIEd1bnRob3JwZSAoMTEpOgo+ICAgIG1tL21tdV9ub3RpZmllcnM6IGhv
aXN0IGRvX21tdV9ub3RpZmllcl9yZWdpc3RlciBkb3duX3dyaXRlIHRvIHRoZQo+ICAgICAgY2Fs
bGVyCj4gICAgbW0vbW11X25vdGlmaWVyczogZG8gbm90IHNwZWN1bGF0aXZlbHkgYWxsb2NhdGUg
YSBtbXVfbm90aWZpZXJfbW0KPiAgICBtbS9tbXVfbm90aWZpZXJzOiBhZGQgYSBnZXQvcHV0IHNj
aGVtZSBmb3IgdGhlIHJlZ2lzdHJhdGlvbgo+ICAgIG1pc2Mvc2dpLWdydTogdXNlIG1tdV9ub3Rp
Zmllcl9nZXQvcHV0IGZvciBzdHJ1Y3QgZ3J1X21tX3N0cnVjdAo+ICAgIGhtbTogdXNlIG1tdV9u
b3RpZmllcl9nZXQvcHV0IGZvciAnc3RydWN0IGhtbScKPiAgICBSRE1BL29kcDogdXNlIG1tdV9u
b3RpZmllcl9nZXQvcHV0IGZvciAnc3RydWN0IGliX3Vjb250ZXh0X3Blcl9tbScKPiAgICBSRE1B
L29kcDogcmVtb3ZlIGliX3Vjb250ZXh0IGZyb20gaWJfdW1lbQo+ICAgIGRybS9yYWRlb246IHVz
ZSBtbXVfbm90aWZpZXJfZ2V0L3B1dCBmb3Igc3RydWN0IHJhZGVvbl9tbgo+ICAgIGRybS9hbWRr
ZmQ6IGZpeCBhIHVzZSBhZnRlciBmcmVlIHJhY2Ugd2l0aCBtbXVfbm90aWZlciB1bnJlZ2lzdGVy
Cj4gICAgZHJtL2FtZGtmZDogdXNlIG1tdV9ub3RpZmllcl9wdXQKPiAgICBtbS9tbXVfbm90aWZp
ZXJzOiByZW1vdmUgdW5yZWdpc3Rlcl9ub19yZWxlYXNlCj4gCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgIHwgICAxICsKPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9wcml2LmggICAgfCAgIDMgLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3Byb2Nlc3MuYyB8ICA4OCArKysrLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfZHJtLmMgICAgfCAgIDMgKwo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb24uaCAgICAgICAgICB8ICAgMyAtCj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kZXZpY2UuYyAgIHwgICAyIC0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Ry
di5jICAgICAgfCAgIDIgKwo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW4uYyAg
ICAgICB8IDE1NyArKysrLS0tLS0tLS0tLS0tCj4gICBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91
bWVtLmMgICAgICAgICAgIHwgICA0ICstCj4gICBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVt
X29kcC5jICAgICAgIHwgMTgzICsrKysrKy0tLS0tLS0tLS0tLQo+ICAgZHJpdmVycy9pbmZpbmli
YW5kL2NvcmUvdXZlcmJzX2NtZC5jICAgICB8ICAgMyAtCj4gICBkcml2ZXJzL2luZmluaWJhbmQv
Y29yZS91dmVyYnNfbWFpbi5jICAgIHwgICAxICsKPiAgIGRyaXZlcnMvaW5maW5pYmFuZC9ody9t
bHg1L21haW4uYyAgICAgICAgfCAgIDUgLQo+ICAgZHJpdmVycy9taXNjL3NnaS1ncnUvZ3J1Zmls
ZS5jICAgICAgICAgICB8ICAgMSArCj4gICBkcml2ZXJzL21pc2Mvc2dpLWdydS9ncnV0YWJsZXMu
aCAgICAgICAgIHwgICAyIC0KPiAgIGRyaXZlcnMvbWlzYy9zZ2ktZ3J1L2dydXRsYnB1cmdlLmMg
ICAgICAgfCAgODQgKysrLS0tLS0tCj4gICBpbmNsdWRlL2xpbnV4L2htbS5oICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEyICstCj4gICBpbmNsdWRlL2xpbnV4L21tX3R5cGVzLmggICAgICAgICAg
ICAgICAgIHwgICA2IC0KPiAgIGluY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggICAgICAgICAg
ICAgfCAgNDAgKysrLQo+ICAgaW5jbHVkZS9yZG1hL2liX3VtZW0uaCAgICAgICAgICAgICAgICAg
ICB8ICAgMiArLQo+ICAgaW5jbHVkZS9yZG1hL2liX3VtZW1fb2RwLmggICAgICAgICAgICAgICB8
ICAxMCArLQo+ICAgaW5jbHVkZS9yZG1hL2liX3ZlcmJzLmggICAgICAgICAgICAgICAgICB8ICAg
MyAtCj4gICBrZXJuZWwvZm9yay5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxIC0K
PiAgIG1tL2htbS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMjEgKysrLS0t
LS0tLS0tCj4gICBtbS9tbXVfbm90aWZpZXIuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMjMw
ICsrKysrKysrKysrKysrKysrLS0tLS0tCj4gICAyNSBmaWxlcyBjaGFuZ2VkLCA0MDggaW5zZXJ0
aW9ucygrKSwgNTU5IGRlbGV0aW9ucygtKQoKRm9yIHRoZSBjb3JlIE1NLCBITU0sIGFuZCBub3V2
ZWF1IGNoYW5nZXMgeW91IGNhbiBhZGQ6ClRlc3RlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1w
YmVsbEBudmlkaWEuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
