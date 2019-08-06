Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD383210
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 15:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E806E372;
	Tue,  6 Aug 2019 13:01:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B775789F2A;
 Tue,  6 Aug 2019 07:31:07 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hutw1-0006tX-GD; Tue, 06 Aug 2019 07:31:05 +0000
Date: Tue, 6 Aug 2019 00:31:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH hmm] drm/amdkfd: fix a use after free race with
 mmu_notififer unregister
Message-ID: <20190806073105.GA20575@infradead.org>
References: <20190802200705.GA10110@ziepe.ca>
 <c59ebe8b-9b18-24b8-b02c-8ccaa7df4dc9@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c59ebe8b-9b18-24b8-b02c-8ccaa7df4dc9@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 06 Aug 2019 13:01:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=crhuruONrHFEz4gXAFuP/D7saXD4jPoaf+inORpxRGM=; b=WIwjlkRbC2r7feW/pdrPAmV4+
 bFlx8zSxpRn0QCdNac1h1NTijp5r8nyNHWs1uEkEOsbtNw+WXAISm5GXQgvlArXduBJizVY40Yttp
 OS+EGO70Zb9K4IBi1htqP0T7zBToyH6cbgPHFl9E4EW6NAs/nUmdQtP9IhenbXk8ceCpUI4qEaLP3
 FVKhM3Km5f0oB/JpID9rkroeSV0yQFPlxDgTQ6A5OiKxE6kdHVzB4IxwQUvl3+ZCl7yYY8bsTW+fU
 G7jmcPuJHn8tf/SIOeR1DNeK/OlrI2uguLuK3ZSMPUzUOLXSRj+SxGKyaFAD5Eu35j8o0lY83Bw3X
 AQvUq/KiA==;
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
Cc: Oded Gabbay <oded.gabbay@gmail.com>, Ben Goz <ben.goz@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QnR3LCB3aG8gbWFpbnRhaW5zIGFta2ZkIHRoZXNlIGRheXM/ICBNQUlOVEFJTkVSUyBzdGlsbCBs
aXN0cwpPZGVkLCBidXQgaGUgc2VlbXMgdG8gaGF2ZSBtb3ZlZCBvbiB0byBIYWJhbmFsYWJzIGFu
ZCBtYWludGFpbnMgdGhhdApkcml2ZXJzIG5vdyB3aGlsZSBub3QgaGF2aW5nIGFueSBhY3Rpb24g
b24gYW1ka2ZkIGZvciBvdmVyIGEgeWVhci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
