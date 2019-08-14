Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A438DE83
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 22:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147E589191;
	Wed, 14 Aug 2019 20:14:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFBD6E82C;
 Wed, 14 Aug 2019 20:14:26 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d546ba40000>; Wed, 14 Aug 2019 13:14:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 14 Aug 2019 13:14:26 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 14 Aug 2019 13:14:26 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Aug
 2019 20:14:24 +0000
Subject: Re: [PATCH v3 hmm 01/11] mm/mmu_notifiers: hoist
 do_mmu_notifier_register down_write to the caller
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>
References: <20190806231548.25242-1-jgg@ziepe.ca>
 <20190806231548.25242-2-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <1391be01-932c-68ca-0160-e08ed2a0243d@nvidia.com>
Date: Wed, 14 Aug 2019 13:14:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190806231548.25242-2-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565813668; bh=l693Dsnz2cNYZkVUIa0hGWj4gZqviofo6oB5vcHDRgE=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=R5LCsQ2RGYP/aRbOOTYVqp3+mNbaFthG3djuEbE/Q5RcS9mR/XTArigIkLJIJcoUm
 2K4ojNSONT0DPE3p48KuDCnr8/b/xkcFIsjgMnEh2A4XHosGTEQqAsOIgDIYpKjhA6
 rkPNvw30YaNhLDpHwnvQ22Rq+l1U9m2Nr7cxGupNe9zheNvIiYxkmouASaeFKHn1Ne
 hfrZ3XyWn84qlbZhdg2Z+7hrQwZnGR5tn9y+gosmO+PTqodnJTwNCIDxM/tYLWvgwz
 yiPA4kvRNQ0JR0eN4UhFvOmVWdRm65jh/bJrrdWl3KFGl5AiupxGl6Jnjo5KFXd1mW
 QlJuphdrdgDvw==
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
 Christoph Hellwig <hch@infradead.org>,
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
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IFRoaXMgc2ltcGxpZmllcyB0aGUgY29k
ZSB0byBub3QgaGF2ZSBzbyBtYW55IG9uZSBsaW5lIGZ1bmN0aW9ucyBhbmQgZXh0cmEKPiBsb2dp
Yy4gX19tbXVfbm90aWZpZXJfcmVnaXN0ZXIoKSBzaW1wbHkgYmVjb21lcyB0aGUgZW50cnkgcG9p
bnQgdG8KPiByZWdpc3RlciB0aGUgbm90aWZpZXIsIGFuZCB0aGUgb3RoZXIgb25lIGNhbGxzIGl0
IHVuZGVyIGxvY2suCj4gCj4gQWxzbyBhZGQgYSBsb2NrZGVwX2Fzc2VydCB0byBjaGVjayB0aGF0
IHRoZSBjYWxsZXJzIGFyZSBob2xkaW5nIHRoZSBsb2NrCj4gYXMgZXhwZWN0ZWQuCj4gCj4gU3Vn
Z2VzdGVkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Cj4gU2lnbmVk
LW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKTmljZSBjbGVhbiB1
cC4KUmV2aWV3ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
