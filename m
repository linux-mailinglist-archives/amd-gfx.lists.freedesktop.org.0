Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240174C84C
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 09:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6330D6E546;
	Thu, 20 Jun 2019 07:22:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC83F6E2BE;
 Wed, 19 Jun 2019 08:19:51 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hdVoq-0000mV-EN; Wed, 19 Jun 2019 08:19:48 +0000
Date: Wed, 19 Jun 2019 01:19:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 08/12] mm/hmm: Remove racy protection against
 double-unregistration
Message-ID: <20190619081948.GC24900@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-9-jgg@ziepe.ca>
 <20190615141612.GH17724@infradead.org>
 <20190618131324.GF6961@ziepe.ca>
 <20190618132722.GA1633@infradead.org>
 <20190618185757.GP6961@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618185757.GP6961@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:22:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oj2mVxSa+2J+fkcSLZJgmIgirExhWFgh1cb5vCMP3vI=; b=tf5cAthDjPtD5dgpkrrmWm6iX
 hJT+iCl3LI50nk+ly+ZUajqlu/ZYu5I81HuuxxEoOqgz7cy6G/879N+lqH8TGVpEIzKb8gY3RWEH3
 spycirx2fT31SjuibyhyqizZP8JiXuZ7DC4RaFSjwiDEGgpm42e6/0HTM69qw1BUen2f8789MSOfC
 3BFfTed174q1HfdzIVms/k2iwj1c/fqiYCnF/5TegT2vD/aAyWCTylC372dVxF67j6a4/CwjOm3IO
 /J6MW7+6GXoWPYd0XJsHHz0VI9rAa4XLWjR2isQ4WJ9LmCy9LcN2FEXjp26JXuspZegFhyO4rNb9S
 ZStiJlmvw==;
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDM6NTc6NTdQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IFdpdGggdGhlIHByZXZpb3VzIGxvb3NlIGNvdXBsaW5nIG9mIHRoZSBtaXJyb3Ig
YW5kIHRoZSByYW5nZSBzb21lIGNvZGUKPiBtaWdodCByYW5jZSB0byB0cnkgdG8gY3JlYXRlIGEg
cmFuZ2Ugd2l0aG91dCBhIG1pcnJvciwgd2hpY2ggd2lsbCBub3cKPiByZWxpYWJseSBjcmFzaCB3
aXRoIHRoZSBwb2lzb24uCj4gCj4gSXQgaXNuJ3Qgc28gbXVjaCB0aGUgZG91YmxlIHVucmVnaXN0
ZXIgdGhhdCB3b3JyaWVzIG1lLCBidXQgcmFjaW5nCj4gdW5yZWdpc3RlciB3aXRoIHJhbmdlIGZ1
bmN0aW9ucy4KCk9oIHdlbGwuICBJdCB3YXMganVzdCBhIG5pdHBpY2sgZm9yIHRoZSBoaWdobHkg
dW51c3VhbCBjb2RlIHBhdHRlcm5zCmluIHRoZSB0d28gdW5yZWdpc3RlciByb3V0aW5lcywgcHJv
YmFibHkgbm90IHdvcnRoIGZpZ2h0aW5nIG92ZXIgZXZlbgppZiBJIHN0aWxsIGRvbid0IHNlZSB0
aGUgcG9pbnQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
