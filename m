Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D528C4C854
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 09:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143AD6E53C;
	Thu, 20 Jun 2019 07:22:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B49C6E328;
 Wed, 19 Jun 2019 08:07:09 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hdVcX-00045B-4O; Wed, 19 Jun 2019 08:07:05 +0000
Date: Wed, 19 Jun 2019 01:07:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v3 hmm 11/12] mm/hmm: Remove confusing comment and logic
 from hmm_release
Message-ID: <20190619080705.GA5164@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-12-jgg@ziepe.ca>
 <20190615142106.GK17724@infradead.org>
 <20190618004509.GE30762@ziepe.ca>
 <20190618053733.GA25048@infradead.org>
 <be4f8573-6284-04a6-7862-23bb357bfe3c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be4f8573-6284-04a6-7862-23bb357bfe3c@amd.com>
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
 bh=joSQX+c79LrXwDofUn4UcqKpzHato3fL9zTkPCCp5Mk=; b=WdRlzSpz2usjiHEXhhtXkURap
 JR/ywCqFnns9c9y2t4j4VowNJXeRydRRNboQlVSHN8bq2ehggKbdZH1HlMzQMHyezwSB+PRDQklSm
 QGdvWLYUFZn9VrVTSA3XepaQVYpa+5bgROMB9yzWCXXaKy+/WJuY+VzMSw9v59/fKxlT2CobF5aT/
 iKwPEhqNC+F/eV+jAM/BxqQZIwJr5YGZ/rjVwaXAmRH+b9vNvmm3V2rDsAcKr5ORPlRjhxXjkKPPx
 3nWz74yeA+o4L5ZKbl6tDC67LBLtYr13ByiHJ3KK4La27WSvZ17+VriT5N6Bx7Ur9bTQVNY8zxBGU
 CLLHoGCOg==;
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, "Yang,
 Philip" <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6NTM6NTVBTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IFRoaXMgY29kZSBpcyBkZXJpdmVkIGZyb20gb3VyIG9sZCBNTVUgbm90aWZpZXIg
Y29kZS4gQmVmb3JlIEhNTSB3ZSB1c2VkIAo+IHRvIHJlZ2lzdGVyIGEgc2luZ2xlIE1NVSBub3Rp
ZmllciBwZXIgbW1fc3RydWN0IGFuZCBsb29rIHVwIHZpcnR1YWwgCj4gYWRkcmVzcyByYW5nZXMg
dGhhdCBoYWQgYmVlbiByZWdpc3RlcmVkIGZvciBtaXJyb3JpbmcgdmlhIGRyaXZlciBBUEkgCj4g
Y2FsbHMuIFRoZSBpZGVhIHdhcyB0byByZXVzZSBhIHNpbmdsZSBNTVUgbm90aWZpZXIgZm9yIHRo
ZSBsaWZlIHRpbWUgb2YgCj4gdGhlIHByb2Nlc3MuIEl0IHdvdWxkIHJlbWFpbiByZWdpc3RlcmVk
IHVudGlsIHdlIGdvdCBhIG5vdGlmaWVyX3JlbGVhc2UuCj4gCj4gaG1tX21pcnJvciB0b29rIHRo
ZSBwbGFjZSBvZiB0aGF0IHdoZW4gd2UgY29udmVydGVkIHRoZSBjb2RlIHRvIEhNTS4KPiAKPiBJ
IHN1cHBvc2Ugd2UgY291bGQgZGVzdHJveSB0aGUgbWlycm9yIGVhcmxpZXIsIHdoZW4gd2UgaGF2
ZSBubyBtb3JlIAo+IHJlZ2lzdGVyZWQgdmlydHVhbCBhZGRyZXNzIHJhbmdlcywgYW5kIGNyZWF0
ZSBhIG5ldyBvbmUgaWYgbmVlZGVkIGxhdGVyLgoKSSBkaWRuJ3Qgd3JpdGUgdGhlIGNvZGUsIGJ1
dCBpZiB5b3UgbG9vayBhdCBobW1fbWlycm9yIGl0IGFscmVhZHkgaXMKYSBtdWx0aXBsZXhlciBv
dmVyIHRoZSBtbXUgbm90aWZpZXIsIGFuZCB0aGUgaW50ZW50IGNsZWFybHkgc2VlbXMgdGhhdAp5
b3UgcmVnaXN0ZXIgb25lIHBlciByYW5nZSB0aGF0IHlvdSB3YW50IHRvIG1pcnJvciwgYW5kIG5v
dCBtdWx0aXBsZXgKaXQgb25jZSBhZ2Fpbi4gIEluIG90aGVyIHdvcmRzIC0gSSB0aGluayBlYWNo
IGFtZGdwdV9tbl9ub2RlIHNob3VsZApwcm9iYWJseSBoYXZlIGl0cyBvd24gaG1tX21pcnJvci4g
IEFuZCB3aGlsZSB0aGUgYW1kZ3B1X21uX25vZGUgb2JqZWN0cwphcmUgY3VycmVudGx5IHN0b3Jl
ZCBpbiBhbiBpbnRlcnZhbCB0cmVlIGl0IHNlZW1zIGxpa2UgdGhleSBhcmUgb25seQpsaW5lYXJs
eSBpdGVyYXRlZCBhbnl3YXksIHNvIGEgbGlzdCBhY3R1YWxseSBzZWVtcyBwcmV0dHkgc3VpdGFi
bGUuICBJZgpub3Qgd2UgbmVlZCB0byBpbXByb3ZlIHRoZSBjb3JlIGRhdGEgc3RydWN0dXJlcyBp
bnN0ZWFkIG9mIHdvcmtpbmcKYXJvdW5kIHRoZW0uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
