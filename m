Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45CD7A2E3
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 10:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FAE89F6E;
	Tue, 30 Jul 2019 08:12:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A293089FC9;
 Tue, 30 Jul 2019 05:52:19 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL3W-00014y-Mf; Tue, 30 Jul 2019 05:52:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Subject: hmm_range_fault related fixes and legacy API removal v3
Date: Tue, 30 Jul 2019 08:51:50 +0300
Message-Id: <20190730055203.28467-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 30 Jul 2019 08:12:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a6luPAARjEvL6+wrepaiTAj3y4NIety29NPDFmox12Y=; b=TcyrmqgStzKv1ExUPq4X25C2K
 GsS0yBUn84eEzTV3G+bIV6w/Wz+zdOtTQgYRWctpWBG4m8RZX8Wy5MsS4r7N3hmMjWfF6ufk06OEH
 Lb7wBYPu04YPbG9Q8/2AJ6Yg8EEmECICcfu4PZLtOkUbiZWv74mKnfRaChmb+dINOOXncvrUhYWIv
 FKLVC7qSEfWk3r47f87nsmoAX+/yb/XktofWaUBfRO6uAoKsabsXIxOdJ5S8pbSz8XGvfre96fE80
 m2Gz/7orow4ek0yS3DFI6va1nnSu5TOByhwgh6aRhwa3qUsmh/YCoO7ECAkPuk19GkYAT1cbpKh6f
 QmbBIraeQ==;
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CkhpIErDqXLDtG1lLCBCZW4sIEZlbHhpIGFuZCBKYXNvbiwKCmJlbG93IGlzIGEgc2VyaWVzIGFn
YWluc3QgdGhlIGhtbSB0cmVlIHdoaWNoIGNsZWFucyB1cCB2YXJpb3VzIG1pbm9yCmJpdHMgYW5k
IGFsbG93cyBITU1fTUlSUk9SIHRvIGJlIGJ1aWx0IG9uIGFsbCBhcmNoaXRlY3R1cmVzLgoKRGlm
ZnN0YXQ6CgogICAgNyBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspLCAxNzEgZGVsZXRp
b25zKC0pCgpBIGdpdCB0cmVlIGlzIGFsc28gYXZhaWxhYmxlIGF0OgoKICAgIGdpdDovL2dpdC5p
bmZyYWRlYWQub3JnL3VzZXJzL2hjaC9taXNjLmdpdCBobW0tY2xlYW51cHMKCkdpdHdlYjoKCiAg
ICBodHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0L3Nob3J0bG9nL3Jl
ZnMvaGVhZHMvaG1tLWNsZWFudXBzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
