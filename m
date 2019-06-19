Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256364C844
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 09:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBC86E526;
	Thu, 20 Jun 2019 07:22:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD346E316;
 Wed, 19 Jun 2019 08:14:22 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hdVjU-0006aZ-Cc; Wed, 19 Jun 2019 08:14:16 +0000
Date: Wed, 19 Jun 2019 01:14:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 02/12] mm/hmm: Use hmm_mirror not mm as an
 argument for hmm_range_register
Message-ID: <20190619081416.GA24900@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-3-jgg@ziepe.ca>
 <20190615135906.GB17724@infradead.org>
 <20190618130544.GC6961@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618130544.GC6961@ziepe.ca>
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
 bh=0ZL0Rt+On3+fcA7ZOTp27GEbaFXAtfEHfk/A4omOFs8=; b=VTq/5defW3rvl0qSVOJTGq4WO
 PXQkheSR6n7cepjJuJbIsuVqXJAeoO6w1Usz/0OOo4rXXtGYEvT83GQ+qAKZ8bmqtqvMjBo88SJmL
 IIWd00nGQ1ntnsuA6llhTgwbAcNH+LoQHYo8RR3DLgE3rFAmRgqjhTiFPPyQfPWNhfGwJr+UsyQJa
 gMhBPjfITvI13/SnXh1sjD0CDMc7PiYSMIBJUj4LSHubqiu5ZQC8eq0kA/vGy9kJi/xCtwqSUmiY3
 BM7plvYLHHJiXz7AgxGshkFNjukTfR/NZqKEqUb7nNjEyBrB+qHiXhOT0y+6rLL8sO6KZljTddayk
 Pd1lyxT4g==;
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
 amd-gfx@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTA6MDU6NDRBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEknbSB0aGlua2luZyB0byB0YWNrbGUgdGhhdCBhcyBwYXJ0IG9mIHRoZSBtbXUg
bm90aWZpZmVyIGludmxvY2sKPiBpZGVhLi4gT25jZSB0aGUgcmFuZ2UgbG9vc2VzIHRoZSBsb2Nr
IHRoZW4gd2UgZG9uJ3QgcmVhbGx5IG5lZWQgdG8KPiByZWdpc3RlciBpdCBhdCBhbGwuCgpPay4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
