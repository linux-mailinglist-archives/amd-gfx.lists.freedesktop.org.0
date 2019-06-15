Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3114A475A9
	for <lists+amd-gfx@lfdr.de>; Sun, 16 Jun 2019 17:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C66890EB;
	Sun, 16 Jun 2019 15:53:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C707C8925C;
 Sat, 15 Jun 2019 14:21:08 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hc9YI-0006ZY-6Y; Sat, 15 Jun 2019 14:21:06 +0000
Date: Sat, 15 Jun 2019 07:21:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 11/12] mm/hmm: Remove confusing comment and logic
 from hmm_release
Message-ID: <20190615142106.GK17724@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-12-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614004450.20252-12-jgg@ziepe.ca>
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
 bh=sEhX+5INXIgfDveglz8gCZJwRNPPLquY/78YPpDhP50=; b=LeqG71y6vq8cRRf0pGteG7bcH
 HvoPvv9qFjmSsTBZ9o0j+/SJhwGrrOJkbpoG+GwXablTi80OMbKwnEw7mTByKiIBk489iaKOVoA+D
 /OiesUxDChOxPgq/dSVYfc5Hdkd7XstEEuVVfytRleA6Jllqcy3xuLWIVdHLMYeYiMqgMMpHNHa7i
 xFl/EEzXp/7foQuyKq+ZHcAO773G0dER0i17hYTQ9Z9HMFVxIbRP0LdNLpEFnnqw3bQ20PvXCKXNV
 MQ2L6Y6gwRipK4Onamw/OH/772GYRdkgi/R+hfrOssVzYum29EhgKmkU2oAYA+Ad1rlB+AO6Aq/hm
 ZjNsVwdSQ==;
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
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6NDQ6NDlQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBo
bW1fcmVsZWFzZSgpIGlzIGNhbGxlZCBleGFjdGx5IG9uY2UgcGVyIGhtbS4gb3BzLT5yZWxlYXNl
KCkgY2Fubm90Cj4gYWNjaWRlbnRhbGx5IHRyaWdnZXIgYW55IGFjdGlvbiB0aGF0IHdvdWxkIHJl
Y3Vyc2UgYmFjayBvbnRvCj4gaG1tLT5taXJyb3JzX3NlbS4KCkluIGxpbnV4LW5leHQgYW1kZ3B1
IGFjdHVhbGx5IGNhbGxzIGhtbV9taXJyb3JfdW5yZWdpc3RlciBmcm9tIGl0cwpyZWxlYXNlIGZ1
bmN0aW9uLiAgVGhhdCB3aG9sZSByZWxlYXNlIGZ1bmN0aW9uIGxvb2tzIHJhdGhlciBza2V0Y2h5
LApidXQgd2UgcHJvYmFibHkgbmVlZCB0byBzb3J0IHRoYXQgb3V0IGZpcnN0LgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
