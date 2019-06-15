Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F01475A7
	for <lists+amd-gfx@lfdr.de>; Sun, 16 Jun 2019 17:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C57890D7;
	Sun, 16 Jun 2019 15:53:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF23489142;
 Sat, 15 Jun 2019 14:12:18 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hc9Pf-000272-29; Sat, 15 Jun 2019 14:12:11 +0000
Date: Sat, 15 Jun 2019 07:12:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 04/12] mm/hmm: Simplify hmm_get_or_create and make
 it reliable
Message-ID: <20190615141211.GD17724@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-5-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614004450.20252-5-jgg@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sun, 16 Jun 2019 15:53:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xeia7Y2H20qxvC8T957Brc8A65sMgIu+4oNZeZROWY8=; b=dNgRTy1VE+B9PBH6hwZ144/wJ
 hPJ6HGzKtH5KFgLTt3v3DzpcFqBEl0IyH4qot6+xc/fHoQLRWtTYKcvLodHmCCN46/wHpw9o1LC+d
 nsupPfh3zYNfmm6O8UQibHe4FMPlCLRsrs6+iyIHs0QZrxD56KndDvsC847sZcv6SIrm6GQgUprWL
 dLf+9pS7RKXZVIxFmz9AdlM5H70IdanFowU889RfB3jQkG9MqEaLpup3QiULxuk0eU94Wk5oziV5R
 nPOTz5pupFoa5pc3bHOanYkNsZ9BGWIx7d1wmp4/iHlZ+xYvhlfjsKxuQQnPCPdSq4GwKA3+eNie/
 GNiDvfjrg==;
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiArCXNwaW5fbG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7Cj4gKwlpZiAobW0tPmhtbSkgewo+
ICsJCWlmIChrcmVmX2dldF91bmxlc3NfemVybygmbW0tPmhtbS0+a3JlZikpIHsKPiArCQkJc3Bp
bl91bmxvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+ICsJCQlyZXR1cm4gbW0tPmhtbTsKPiAr
CQl9Cj4gKwl9Cj4gKwlzcGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7CgpUaGlzIGNv
dWxkIGJlY29tZToKCglzcGluX2xvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwoJaG1tID0gbW0t
PmhtbQoJaWYgKGhtbSAmJiBrcmVmX2dldF91bmxlc3NfemVybygmaG1tLT5rcmVmKSkKCQlnb3Rv
IG91dF91bmxvY2s7CglzcGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7CgphcyB0aGUg
bGFzdCB0d28gbGluZXMgb2YgdGhlIGZ1bmN0aW9uIGFscmVhZHkgZHJvcCB0aGUgcGFnZV90YWJs
ZV9sb2NrCmFuZCB0aGVuIHJldHVybiBobW0uICBPciBkcm9wIHRoZSAiaG1tID0gbW0tPmhtbSIg
YXNpZ25tZW50IGFib3ZlIGFuZApyZXR1cm4gbW0tPmhtbSBhcyB0aGF0IHNob3VsZCBiZSBhbHdh
eXMgaWRlbnRpY2FsIHRvIGhtbSBhdCB0aGUgZW5kCnRvIHNhdmUgYW5vdGhlciBsaW5lLgoKPiAr
CS8qCj4gKwkgKiBUaGUgbW0tPmhtbSBwb2ludGVyIGlzIGtlcHQgdmFsaWQgd2hpbGUgbm90aWZp
ZXIgb3BzIGNhbiBiZSBydW5uaW5nCj4gKwkgKiBzbyB0aGV5IGRvbid0IGhhdmUgdG8gZGVhbCB3
aXRoIGEgTlVMTCBtbS0+aG1tIHZhbHVlCj4gKwkgKi8KClRoZSBjb21tZW50IGNvbmZ1c2VzIG1l
LiAgSG93IGRvZXMgdGhlIHBhZ2VfdGFibGVfbG9jayByZWxhdGUgdG8KcG9zc2libHkgcnVubmlu
ZyBub3RpZmllcnMsIGFzIEkgY2FuJ3QgZmluZCB0aGF0IHdlIHRha2UKcGFnZV90YWJsZV9sb2Nr
PyAgT3IgaXMgaXQganVzdCBhYm91dCB0aGUgZmFjdCB0aGF0IHdlIG9ubHkgY2xlYXIKbW0tPmht
bSBpbiB0aGUgZnJlZSBjYWxsYmFjaywgYW5kIG5vdCBpbiBobW1fZnJlZT8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
