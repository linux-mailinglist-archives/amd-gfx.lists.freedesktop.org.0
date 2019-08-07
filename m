Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750EC84E30
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 16:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237CC6E701;
	Wed,  7 Aug 2019 14:06:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F94D893A7
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 10:41:06 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hvJNQ-0006tJ-Sh; Wed, 07 Aug 2019 10:41:04 +0000
Date: Wed, 7 Aug 2019 03:41:04 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Message-ID: <20190807104104.GA18773@infradead.org>
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807070834.GA24792@infradead.org>
 <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 07 Aug 2019 14:06:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fgf3H+Zny8XhFzIqJuO3eRIYcYBD/cE5mEO7YezNCWA=; b=M4APjbqJ0KcEZaaq7eaKKLLjB
 3qR1Ix9nfDpAOsONHfaWUoJNlSIz6ncmztBvkszadaXMzImR35TurTfE4ZsO3HVfvg3Zc3sZ8Lm6Q
 VMzkk7QbX82KOBsYvylli2YuzzzNlvH+L8rqN7zIk01shyDTscwPjDSow9Q8+dEb3Fd6coTSfSYxN
 FsLJ7EgIGqjtte30NHp0ZrpoOmk3JIm4Eh34LPCmzfq9X6IIiVv4hC6MQ3xxEayzpTTz1mNkMg70z
 F4xwiMvPQe6gbgl3/FAdL9YPBeihfcwAEDwdKGVVBkthGgtAu3audlX+JiWolwHbnOMYohTaoVpEv
 FUBctJ4lQ==;
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kernel-build-reports@lists.linaro.org"
 <kernel-build-reports@lists.linaro.org>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDg6NTM6MjVBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMDcuMDguMTkgdW0gMDk6MDggc2NocmllYiBDaHJpc3RvcGggSGVsbHdp
ZzoKPiA+IE9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDEwOjU2OjQwQU0gKzA4MDAsIFRhbyBaaG91
IHdyb3RlOgo+ID4+IHJlYWRxL3dyaXRlcSBhcmUgbm90IHN1cHBvcnRlZCBvbiBhbGwgYXJjaGl0
ZWN0dXJlcwo+ID4gTkFLLiAgWW91IG11c3Qgbm90IHVzZSBhdG9taWNfKiBvbiBfX2lvbWVtIChN
TUlPKSBtZW1vcnkuCj4gCj4gV2VsbCB0aGVuIHdoYXQncyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8g
aGVyZT8KPiAKPiBFc3NlbnRpYWxseSB3cml0ZXEvcmVhZHEgZG9lc24ndCBzZWVtcyB0byBiZSBh
dmFpbGFibGUgb24gYWxsIAo+IGFyY2hpdGVjdHVyZXMgZWl0aGVyLgoKd3JpdGVxL3JlYWRxIGFy
ZSBwcm92aWRlZCB3aGVuZXZlciB0aGUgQ1BVIGFjdHVhbGx5IHN1cHBvcnRzIDY0LWJpdAphdG9t
aWMgbG9hZHMgYW5kIHN0b3Jlcy4gIElmIGl0IGRvZXNuJ3QgcHJvdmlkZSB0aGVtIGF0b21pYzY0
KiBpcwpub3QgZ29pbmcgdG8gYmUgYXRvbWljIHZzIHRoZSBJL08gZGV2aWNlIGVpdGhlci4gIEFu
ZCB0aGF0IGlzIG9uIHRvcApvZiB0aGUgZmFjdCB0aGF0IGZvciB2YXJpb3VzIGFyY2hpdGVjdHVy
ZXMgeW91IGNhbid0IHNpbXBseSB1c2UKcGxhaW4gbG9hZHMgYW5kIHN0b3JlcyBvbiBNTUlPIG1l
bW9yeSB0byBzdGFydCB3aXRoLCB3aGljaCBpcyB3aHkKd2UgaGF2ZSB0aGUgc3BlY2lhbCBhY2Nl
c3NvcnMgYW5kIHRoZSBfX2lvbWVtIGFubm90YXRpb24uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
