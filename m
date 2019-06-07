Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA73B6C1
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A084789176;
	Mon, 10 Jun 2019 14:08:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DB6899F2;
 Fri,  7 Jun 2019 20:49:08 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfacdc20001>; Fri, 07 Jun 2019 13:49:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 13:49:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 13:49:08 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 20:49:06 +0000
Subject: Re: [PATCH v2 hmm 10/11] mm/hmm: Do not use list*_rcu() for
 hmm->ranges
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-11-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <57cf91db-bebe-24f0-29c3-64274f10d10b@nvidia.com>
Date: Fri, 7 Jun 2019 13:49:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-11-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Mon, 10 Jun 2019 14:08:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559940546; bh=oGeyU71GSCfi4k4k8mSueh4JEltagVCe/KlNbvsSutg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=UJz2Qt1QfanMEhOyt/3R/g2DHXV8MDxZ8h5tNqHZXgifBkiWanoofMHj0WGWGojU3
 r7hVfwPkjuzgQD7LU06bneMH68aqOd5ZgdE2TfB1EmRGNULUoGCRnsfVCsdcub+iS1
 03SomttNcSlu+bgApB2KFIb/oMQ8U6aQKkg+bakwP+c+sQwjrKCDv8TUTDpkPUHIMr
 sGnkKrGR06RJOx8WxR7boji2N9rK6vQxJGwimzGESBTMzTX7Rla6rzRRhoGVTpbSc+
 pJlxWklk2KTdXTtn3LcrHxzebmMdPEOIuDL28O14ysFKMaSnkp4n1nQImnJoYkwMRl
 ITLcdbPEakgYg==
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
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBUaGlzIGxpc3QgaXMgYWx3YXlzIHJl
YWQgYW5kIHdyaXR0ZW4gd2hpbGUgaG9sZGluZyBobW0tPmxvY2sgc28gdGhlcmUgaXMKPiBubyBu
ZWVkIGZvciB0aGUgY29uZnVzaW5nIF9yY3UgYW5ub3RhdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IFJldmlld2VkLWJ5OiBKw6ly
w7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBSYWxwaCBDYW1w
YmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cgo+IC0tLQo+ICAgbW0vaG1tLmMgfCA0ICsrLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiBpbmRleCBjMmZlY2IzZWNiMTFlMS4u
NzA5ZDEzOGRkNDkwMjcgMTAwNjQ0Cj4gLS0tIGEvbW0vaG1tLmMKPiArKysgYi9tbS9obW0uYwo+
IEBAIC05MTEsNyArOTExLDcgQEAgaW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3QgaG1tX3Jh
bmdlICpyYW5nZSwKPiAgIAltdXRleF9sb2NrKCZobW0tPmxvY2spOwo+ICAgCj4gICAJcmFuZ2Ut
PmhtbSA9IGhtbTsKPiAtCWxpc3RfYWRkX3JjdSgmcmFuZ2UtPmxpc3QsICZobW0tPnJhbmdlcyk7
Cj4gKwlsaXN0X2FkZCgmcmFuZ2UtPmxpc3QsICZobW0tPnJhbmdlcyk7Cj4gICAKPiAgIAkvKgo+
ICAgCSAqIElmIHRoZXJlIGFyZSBhbnkgY29uY3VycmVudCBub3RpZmllcnMgd2UgaGF2ZSB0byB3
YWl0IGZvciB0aGVtIGZvcgo+IEBAIC05NDEsNyArOTQxLDcgQEAgdm9pZCBobW1fcmFuZ2VfdW5y
ZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAgIAkJcmV0dXJuOwo+ICAgCj4gICAJ
bXV0ZXhfbG9jaygmaG1tLT5sb2NrKTsKPiAtCWxpc3RfZGVsX3JjdSgmcmFuZ2UtPmxpc3QpOwo+
ICsJbGlzdF9kZWwoJnJhbmdlLT5saXN0KTsKPiAgIAltdXRleF91bmxvY2soJmhtbS0+bG9jayk7
Cj4gICAKPiAgIAkvKiBEcm9wIHJlZmVyZW5jZSB0YWtlbiBieSBobW1fcmFuZ2VfcmVnaXN0ZXIo
KSAqLwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
