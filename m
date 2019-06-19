Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0FA4C853
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 09:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077E26E530;
	Thu, 20 Jun 2019 07:22:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4396E2BE;
 Wed, 19 Jun 2019 08:19:01 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hdVo2-0000Z1-N3; Wed, 19 Jun 2019 08:18:58 +0000
Date: Wed, 19 Jun 2019 01:18:58 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 06/12] mm/hmm: Hold on to the mmget for the
 lifetime of the range
Message-ID: <20190619081858.GB24900@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-7-jgg@ziepe.ca>
 <20190615141435.GF17724@infradead.org>
 <20190618151100.GI6961@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618151100.GI6961@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:22:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gJX7HuiaCgGHU1tdXgWOcBNZy61GCc1VlLrp6/M8Mfw=; b=F790NaadzLyX7kysrjoApfm8RL
 4B1qNTBJfA0dl3N2JFg7SkdFf/LV7qaQII9PBdIa20bkjqtxcmGUwf+IuWcV2ibWAgsqDFtgZ10h3
 RmDk6y3Jz8+Gq/K8bwcRJ82kfshQD98z9+21iRI1lhYdvFPXMWHI2KrNHEW9Zp4fz+eddphLaeKmK
 7YKDKbdhA2jVqdoHJ2IwfWMe8r3oyhcU8AeQcHnGgGUETxIzdZ41ILhG+33dgEOu49ViOMsWHeo8G
 IUy9pHZKLxnzdOSeyWXtSPzsK7Po1H4f4mu7rgQNltggATnslxmZYgJ4TgX6agsLnNAyjvYsFfIno
 WBSAPrTg==;
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

PiAgCW11dGV4X2xvY2soJmhtbS0+bG9jayk7Cj4gLQlsaXN0X2RlbCgmcmFuZ2UtPmxpc3QpOwo+
ICsJbGlzdF9kZWxfaW5pdCgmcmFuZ2UtPmxpc3QpOwo+ICAJbXV0ZXhfdW5sb2NrKCZobW0tPmxv
Y2spOwoKSSBkb24ndCBzZWUgdGhlIHBvaW50IHdoeSB0aGlzIGlzIGEgbGlzdF9kZWxfaW5pdCAt
IHRoYXQganVzdApyZWluaXRpYWxpemXRlSByYW5nZS0+bGlzdCwgYnV0IGRvZXNuJ3QgY2hhbmdl
IGFueXRoaW5nIGZvciB0aGUgbGlzdApoZWFkIGl0IHdhcyByZW1vdmVkIGZyb20uICAoYW5kIGlm
IHRoZSBsaXN0X2RlbF9pbml0IHdhcyBpbnRlbmRlZAphIGxhdGVyIHBhdGNoIGluIHlvdXIgYnJh
bmNoIHJldmVydHMgaXQgdG8gcGxhaW4gbGlzdF9kZWwuLikKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
