Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830AF49A4D
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 09:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8B66E0FC;
	Tue, 18 Jun 2019 07:19:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469BF6E0B7
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 00:45:11 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so13201538qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 17:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xyVcNd9oooqBQ01pz08myANSFTdx0SwnrW4fjYnawJM=;
 b=CmAhQE0/FVXcUpxF/36IbddgE3oXD0xuoRQQtLhzfBxVWiKe4igRDIDMz0806wihB2
 wgiOel4DtkS1o2ATs5lGebM0LBSuQb4Nz1/Ws74gYbd+VqC0vq7bP1ba8c9zKJ7bW271
 HOnzKuCXnEUaiqqwP52qbglwfovoe4Y3oKrHlCF9OC2XHzAq3O2hgml2hiTmAIa2SZNU
 4gt4R4VZ62f3kNGhW72YSlddaOZB4+TKjXNgN1GbrWhY3vaDO8mYCvO5B0Lc3y9maiY2
 N8uXd9tbmvg8v93CWABbDWMf3BT7peoCgm6aYCqDXZzA8Zutn7192EqKmyFuFHFQIEXf
 mrUg==
X-Gm-Message-State: APjAAAXrhjBgcjHP9YA1KR9BS9Z4tmxzY43WwsOJGGvL1rwXXXHko0wH
 GWVdsQhqfZ2qPRQjq50s1Vzl8Q==
X-Google-Smtp-Source: APXvYqwWPeoiWiUq38eemfOuoOnFZtRLG1ij33tWBeptCPrHnF05gR5s5sk1ou0VyceV16bnn7ukkQ==
X-Received: by 2002:ac8:2763:: with SMTP id h32mr99156393qth.350.1560818710425; 
 Mon, 17 Jun 2019 17:45:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id z57sm9460981qta.62.2019.06.17.17.45.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Jun 2019 17:45:09 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hd2FJ-0000ob-FF; Mon, 17 Jun 2019 21:45:09 -0300
Date: Mon, 17 Jun 2019 21:45:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 hmm 11/12] mm/hmm: Remove confusing comment and logic
 from hmm_release
Message-ID: <20190618004509.GE30762@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-12-jgg@ziepe.ca>
 <20190615142106.GK17724@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615142106.GK17724@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:19:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xyVcNd9oooqBQ01pz08myANSFTdx0SwnrW4fjYnawJM=;
 b=EbwbRCaTtFd2OjM2jNOG+48iONnisGaulMgt8GBSlGmHHmNOKbiX/pQ5UIlGAp8yUz
 vNA1zIvWXYK1S4TWgK+86NqYoCUVC/0ZevX6IRfWzWSNvQ8g+Og+/8wxKQstLAZ+revM
 VL5EZh1MRj6Ew8rlA3u8Y12VqUKY0LSaNX6vUqI1xIiehSserEbesl80q+pA69T5mmHc
 9ILTNBce92/Mo7e4Kup6uNkn8cC7R1Ht2U5myxg80c8SBX/Bf59IAzM3jiTwz6+ORmYB
 TG1ZP8xw47a6bZF6oV577gILRTEpeuB3t1687rIrkCR/XgY0ASSrboWRYKGE3cjxdvtm
 1zGA==
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
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMTUsIDIwMTkgYXQgMDc6MjE6MDZBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6NDQ6NDlQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gRnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFu
b3guY29tPgo+ID4gCj4gPiBobW1fcmVsZWFzZSgpIGlzIGNhbGxlZCBleGFjdGx5IG9uY2UgcGVy
IGhtbS4gb3BzLT5yZWxlYXNlKCkgY2Fubm90Cj4gPiBhY2NpZGVudGFsbHkgdHJpZ2dlciBhbnkg
YWN0aW9uIHRoYXQgd291bGQgcmVjdXJzZSBiYWNrIG9udG8KPiA+IGhtbS0+bWlycm9yc19zZW0u
Cj4gCj4gSW4gbGludXgtbmV4dCBhbWRncHUgYWN0dWFsbHkgY2FsbHMgaG1tX21pcnJvcl91bnJl
Z2lzdGVyIGZyb20gaXRzCj4gcmVsZWFzZSBmdW5jdGlvbi4gIFRoYXQgd2hvbGUgcmVsZWFzZSBm
dW5jdGlvbiBsb29rcyByYXRoZXIgc2tldGNoeSwKPiBidXQgd2UgcHJvYmFibHkgbmVlZCB0byBz
b3J0IHRoYXQgb3V0IGZpcnN0LgoKRG9lcyBpdD8gSSBzZWUgdGhpczoKCnN0YXRpYyB2b2lkIGFt
ZGdwdV9obW1fbWlycm9yX3JlbGVhc2Uoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvcikKewogICAg
ICAgIHN0cnVjdCBhbWRncHVfbW4gKmFtbiA9IGNvbnRhaW5lcl9vZihtaXJyb3IsIHN0cnVjdCBh
bWRncHVfbW4sIG1pcnJvcik7CgogICAgICAgIElOSVRfV09SSygmYW1uLT53b3JrLCBhbWRncHVf
bW5fZGVzdHJveSk7CiAgICAgICAgc2NoZWR1bGVfd29yaygmYW1uLT53b3JrKTsKfQoKc3RhdGlj
IHN0cnVjdCBobW1fbWlycm9yX29wcyBhbWRncHVfaG1tX21pcnJvcl9vcHNbXSA9IHsKICAgICAg
ICBbQU1ER1BVX01OX1RZUEVfR0ZYXSA9IHsKICAgICAgICAgICAgICAgIC5zeW5jX2NwdV9kZXZp
Y2VfcGFnZXRhYmxlcyA9IGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXNfZ2Z4LAogICAgICAgICAg
ICAgICAgLnJlbGVhc2UgPSBhbWRncHVfaG1tX21pcnJvcl9yZWxlYXNlCiAgICAgICAgfSwKICAg
ICAgICBbQU1ER1BVX01OX1RZUEVfSFNBXSA9IHsKICAgICAgICAgICAgICAgIC5zeW5jX2NwdV9k
ZXZpY2VfcGFnZXRhYmxlcyA9IGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXNfaHNhLAogICAgICAg
ICAgICAgICAgLnJlbGVhc2UgPSBhbWRncHVfaG1tX21pcnJvcl9yZWxlYXNlCiAgICAgICAgfSwK
fTsKCgpBbSBJIGxvb2tpbmcgYXQgdGhlIHdyb25nIHRoaW5nPyBMb29rcyBsaWtlIGl0IGNhbGxz
IGl0IHRocm91Z2ggYSB3b3JrCnF1ZXVlIHNob3VsZCBzaG91bGQgYmUgT0suLgoKVGhvdWdoIHZl
cnkgc3RyYW5nZSB0aGF0IGFtZGdwdSBvbmx5IGRlc3Ryb3lzIHRoZSBtaXJyb3IgdmlhIHJlbGVh
c2UsCnRoYXQgY2Fubm90IGJlIHJpZ2h0LgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
