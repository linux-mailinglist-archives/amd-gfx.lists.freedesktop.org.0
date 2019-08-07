Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C86F84E32
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 16:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB656E703;
	Wed,  7 Aug 2019 14:06:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930C76E6C8
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 13:08:00 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hvLfb-0006Iu-DD; Wed, 07 Aug 2019 13:07:59 +0000
Date: Wed, 7 Aug 2019 06:07:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Message-ID: <20190807130759.GA24028@infradead.org>
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807070834.GA24792@infradead.org>
 <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
 <20190807104104.GA18773@infradead.org>
 <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com>
 <20190807125928.GC4048@sirena.co.uk>
 <461cd4e8-31b8-def3-ca92-5b33db8d5621@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <461cd4e8-31b8-def3-ca92-5b33db8d5621@amd.com>
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
 bh=rmgbWtAZ1SkJnpcyByHyTfiJSGtDnoRv+7kKXSQccI0=; b=f2Zq4LbePSmi7NsCDnVefk8D+
 LxL1NCuMCeHAPIxU+md1raizksrHj4wVieebphgx7/zbtVQjsZe2c49hJMdRVrP4NSePYFXoBfkvA
 ygWBU3p8fvkkcX4X95wYM3/1uAqT4COnD3W9DjbFNrMa9K76lrddPngDoxKElCaHW4O+duM2LEmRa
 ZB+0ascLh8HNsSb6ddw86SU2FH/OQ0twMCEarz4rNNOnuUzl3TI2dmtd0egvDzzNn5LfHlkN4OiMb
 a5LiEPSI3VCXVUMyPwrZl5pDwoZhAKQTTH0X9KKSM6oDXAw+pYicxsPcMdijSV2kTJxt6NLod6eiM
 bI8Zohxng==;
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
 Christoph Hellwig <hch@infradead.org>, Mark Brown <broonie@kernel.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDE6MDA6NDhQTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMDcuMDguMTkgdW0gMTQ6NTkgc2NocmllYiBNYXJrIEJyb3duOgo+ID4g
T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTA6NTU6MDFBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gPj4gQW0gMDcuMDguMTkgdW0gMTI6NDEgc2NocmllYiBDaHJpc3RvcGggSGVs
bHdpZzoKPiA+Pj4gd3JpdGVxL3JlYWRxIGFyZSBwcm92aWRlZCB3aGVuZXZlciB0aGUgQ1BVIGFj
dHVhbGx5IHN1cHBvcnRzIDY0LWJpdAo+ID4+PiBhdG9taWMgbG9hZHMgYW5kIHN0b3Jlcy4KPiA+
PiBJcyB0aGVyZSBhIGNvbmZpZyBvcHRpb24gd2hpY2ggd2UgY2FuIG1ha2UgdGhlIGRyaXZlciBk
ZXBlbmQgb24/Cj4gPiA2NEJJVCBzaG91bGQgZG8gdGhlIHRyaWNrLgo+IAo+IFRoYXQgZG9lc24n
dCB3b3JrIGJlY2F1c2UgMzJiaXQgeDg2IGRvZXMgc3VwcG9ydCB3cml0ZXEvcmVhZHEgYXMgZmFy
IGFzIAo+IEkga25vdy4KCkkgYWxzbyBoYWQgYSB2YWd1ZSBtZW1vcnkgdGhhdCB4ODYtMzIgZGlk
IHN1cHBvcnQgaXQgd2l0aCBTU0UsIGJ1dApJIGNhbid0IGFjdHVhbGx5IGZpbmQgYW55IHRyYWNl
cyBvZiB0aGF0IHN1cHBvcnQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
