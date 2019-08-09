Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2B87D50
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 16:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3221A6EE20;
	Fri,  9 Aug 2019 14:56:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDC86E1F4;
 Fri,  9 Aug 2019 12:20:49 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 464kpy5K69z9sBF;
 Fri,  9 Aug 2019 22:20:42 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 38/41] powerpc: convert put_page() to put_user_page*()
In-Reply-To: <248c9ab2-93cc-6d8b-606d-d85b83e791e5@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
 <20190807013340.9706-39-jhubbard@nvidia.com>
 <87k1botdpx.fsf@concordia.ellerman.id.au>
 <248c9ab2-93cc-6d8b-606d-d85b83e791e5@nvidia.com>
Date: Fri, 09 Aug 2019 22:20:40 +1000
Message-ID: <875zn6ttrb.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Aug 2019 14:56:11 +0000
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0?= =?utf-8?B?bWU=?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPiB3cml0ZXM6Cj4gT24gOC83LzE5IDEw
OjQyIFBNLCBNaWNoYWVsIEVsbGVybWFuIHdyb3RlOgo+PiBIaSBKb2huLAo+PiAKPj4gam9obi5o
dWJiYXJkQGdtYWlsLmNvbSB3cml0ZXM6Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21t
L2Jvb2szczY0L2lvbW11X2FwaS5jIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2lvbW11X2Fw
aS5jCj4+PiBpbmRleCBiMDU2Y2FlMzM4OGIuLmUxMjYxOTNiYTI5NSAxMDA2NDQKPj4+IC0tLSBh
L2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9pb21tdV9hcGkuYwo+Pj4gKysrIGIvYXJjaC9wb3dl
cnBjL21tL2Jvb2szczY0L2lvbW11X2FwaS5jCj4+PiBAQCAtMjAzLDYgKzIwMiw3IEBAIHN0YXRp
YyB2b2lkIG1tX2lvbW11X3VucGluKHN0cnVjdCBtbV9pb21tdV90YWJsZV9ncm91cF9tZW1fdCAq
bWVtKQo+Pj4gIHsKPj4+ICAJbG9uZyBpOwo+Pj4gIAlzdHJ1Y3QgcGFnZSAqcGFnZSA9IE5VTEw7
Cj4+PiArCWJvb2wgZGlydHkgPSBmYWxzZTsKPj4gCj4+IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQg
dGhhdCBpbml0aWFsaXNhdGlvbiBkbyB5b3U/Cj4+IAo+Cj4gTm9wZSwgaXQgY2FuIGdvLiBGaXhl
ZCBsb2NhbGx5LCB0aGFua3MuCgpUaGFua3MuCgo+IERpZCB5b3UgZ2V0IGEgY2hhbmNlIHRvIGxv
b2sgYXQgZW5vdWdoIG9mIHRoZSBvdGhlciBiaXRzIHRvIGZlZWwgY29tZm9ydGFibGUgCj4gd2l0
aCB0aGUgcGF0Y2gsIG92ZXJhbGw/CgpNb3N0bHkgOikgSXQncyBub3QgcmVhbGx5IG15IGFyZWEs
IGJ1dCBhbGwgdGhlIGNvbnZlcnNpb25zIGxvb2tlZApjb3JyZWN0IHRvIG1lIGFzIGJlc3QgYXMg
SSBjb3VsZCB0ZWxsLgoKU28gSSdtIGZpbmUgZm9yIGl0IHRvIGdvIGluIGFzIHBhcnQgb2YgdGhl
IHNlcmllczoKCkFja2VkLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+
IChwb3dlcnBjKQoKY2hlZXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
