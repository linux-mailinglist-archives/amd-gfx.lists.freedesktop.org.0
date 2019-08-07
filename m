Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9B884E33
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 16:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B3D6E705;
	Wed,  7 Aug 2019 14:06:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF71A6E046
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 13:00:44 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hvLYZ-0003Jq-N1; Wed, 07 Aug 2019 13:00:43 +0000
Date: Wed, 7 Aug 2019 06:00:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Message-ID: <20190807130043.GA6023@infradead.org>
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807070834.GA24792@infradead.org>
 <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
 <20190807104104.GA18773@infradead.org>
 <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com>
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
 bh=OZyBmQgI8Oh6YprDHrt4RkjNg4MFHRyORK6zRT+ks5c=; b=Ab/3WIfZYR7HVsss4h5mc6Jzi
 KqDIiPKJOaZHXwuVH0HBIPzlkuAm+MyAsVeNrVCx6od2jt6qU+vb4dw97MeJVWJ2NHJMEqpROnzSy
 Dff74FQhzT0o9xuyeABC3I/B56W1TOhG3J+WfG5fa1zNABrVt+VORMXBWdot4tP6fvyGirmt0Usyw
 mOGXvpaS/J1kFR2PuQ1xVsnYOTFnNR6BGr9FazwCf7jY4tKwZWElQ/PBW6S3BTOxyvN8HIwBiGR94
 d/5y9CUSFrNZNgnlP29Uvr+vrTIiyAOyUGN8PLw+SwCahmQVqlT34YADR0tmAo0rnjp+g4gSOczMs
 YYGRqN/wg==;
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

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTA6NTU6MDFBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gPj4gRXNzZW50aWFsbHkgd3JpdGVxL3JlYWRxIGRvZXNuJ3Qgc2VlbXMgdG8g
YmUgYXZhaWxhYmxlIG9uIGFsbAo+ID4+IGFyY2hpdGVjdHVyZXMgZWl0aGVyLgo+ID4gd3JpdGVx
L3JlYWRxIGFyZSBwcm92aWRlZCB3aGVuZXZlciB0aGUgQ1BVIGFjdHVhbGx5IHN1cHBvcnRzIDY0
LWJpdAo+ID4gYXRvbWljIGxvYWRzIGFuZCBzdG9yZXMuCj4gCj4gSXMgdGhlcmUgYSBjb25maWcg
b3B0aW9uIHdoaWNoIHdlIGNhbiBtYWtlIHRoZSBkcml2ZXIgZGVwZW5kIG9uPwo+IAo+IEkgbWVh
biB0aGF0IEFSTSBkb2Vzbid0IHN1cHBvcnQgNjRiaXQgYXRvbWljIGxvYWRzIGFuZCBzdG9yZXMg
b24gTU1JTyBpcyAKPiBxdWl0ZSBhIGJvb21lciBmb3IgdXMuCgpUaGUgbW9kZWwgaXMgdG8gY2hl
YWNrIGlmIHJlYWRxL3dyaXRlcSBhcmUgZGVmaW5lZCwgYW5kIGlmIG5vdCB0bwppbmNsdWRlIHRo
ZSBvbmUgb2YgaW8tNjQtbm9uYXRvbWljLWhpLWxvLmggb3IgaW8tNjQtbm9uYXRvbWljLWxvLWhp
LmguClRoZSByZWFzb24gZm9yIHRoYXQgaXMgdGhhdCBoYXJkd2FyZSBpcyBzdXBwb3NlZCB0byBi
ZSBhYmxlIHRvIGRlYWwgd2l0aAp0d28gMzItYml0IHdyaXRlcywgYnV0IGl0IGRlcGVuZHMgb24g
dGhlIGhhcmR3YXJlIGlmIHRoZSBsb3dlciBvciB1cHBlcgpoYWxmIGlzIHdoYXQgY29tbWl0cyB0
aGUgd3JpdGUuCgpUaGUgb25seSAzMi1iaXQgcGxhdGZvcm0gdGhhdCBjbGFpbXMgc3VwcG9ydCBm
b3IgcmVhZHEvd3JpdGVxIGlzIHNoLAphbmQgSSBoYXZlIGRvdWJ0cyBpZiB0aGF0IGFjdHVhbGx5
IHdvcmtzIGFzIGV4cGVjdGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
