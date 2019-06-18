Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDF34B30E
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 09:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74ED16E30C;
	Wed, 19 Jun 2019 07:27:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604DA6E17D;
 Tue, 18 Jun 2019 13:27:31 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hdE8w-0000uS-GG; Tue, 18 Jun 2019 13:27:22 +0000
Date: Tue, 18 Jun 2019 06:27:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 08/12] mm/hmm: Remove racy protection against
 double-unregistration
Message-ID: <20190618132722.GA1633@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-9-jgg@ziepe.ca>
 <20190615141612.GH17724@infradead.org>
 <20190618131324.GF6961@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618131324.GF6961@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:27:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R8Y3KUjrFsX7X/g2S4dMsmTowqPuT9Y71h6/+llmgw0=; b=n3ZDxpzbEjb8R1YKJLBpAmwI5
 fg4UHLI0YBDL1Xe27VYvdUCGF95z2vAUdWoaWGPThlJIFk6rgNQuGjNp5TDE1LLU9ECS4LxQw96ML
 +RCnUJDGNPupO5iWQgPgY71z5jdI6LT9v+5khZpolVw0InzMNQKiIn4/PHhnOF17eUM1E32oFnzqC
 iWauMQoWTacJNZ46XZqRsJeWRwGpaq1/Dv10jtsfzimXcwJGM/5zSO47R/FPNsz/wwBuKwfpsz2uG
 yZpfrSudQW9FDkAJR2C2gjZlV/jsEeePTa3LPRYnyVcRAYJnFrHd7UlJ5Qr1Dwk10+mVVNEVELOb+
 AJSeWlhpA==;
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

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTA6MTM6MjRBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gSSBkb24ndCBldmVuIHRoaW5rIHdlIGV2ZW4gbmVlZCB0byBib3RoZXIgd2l0
aCB0aGUgUE9JU09OLCBub3JtYWwgbGlzdAo+ID4gZGVidWdnaW5nIHdpbGwgYWxyZWFkeSBjYXRj
aCBhIGRvdWJsZSB1bnJlZ2lzdHJhdGlvbiBhbnl3YXkuCj4gCj4gbWlycm9yLT5obW0gaXNuJ3Qg
YSBsaXN0IHNvIGxpc3QgZGVidWdnaW5nIHdvbid0IGhlbHAuCj4gCj4gTXkgY29uY2VybiB3aGVu
IEkgd3JvdGUgdGhpcyB3YXMgdGhhdCBvbmUgb2YgdGhlIGluIGZsaWdodCBwYXRjaGVzIEkKPiBj
YW4ndCBzZWUgbWlnaHQgYmUgZGVwZW5kaW5nIG9uIHRoaXMgZG91YmxlLXVucmVnaXN0ZXItaXMt
c2FmZQo+IGJlaGF2aW9yLCBzbyBJIHdhbnRlZCB0aGVtIHRvIGNyYXNoIHJlbGlhYmx5Lgo+IAo+
IEl0IGlzIGEgcmVhbGx5IG92ZXJseSBjb25zZXJ2YXRpdmUgdGhpbmcgdG8gZG8uLgoKbWlycm9y
LT5saXN0IGlzIGEgbGlzdCwgYW5kIGlmIHdlIGRvIGEgbGlzdF9kZWwgb24gaXQgZHVyaW5nIHRo
ZQpzZWNvbmQgdW5yZWdpc3RyYXRpb24gaXQgd2lsbCB0cmlwIHVwIG9uIHRoZSBsaXN0IHBvaXNv
bmluZy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
