Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 857F23B6DC
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6223F891B9;
	Mon, 10 Jun 2019 14:08:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1597789202
 for <amd-gfx@lists.freedesktop.org>; Sat,  8 Jun 2019 11:33:08 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d23so5418250qto.2
 for <amd-gfx@lists.freedesktop.org>; Sat, 08 Jun 2019 04:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2lXGspEHCJbsk8rcUX58kNgJSDj9yX2lNCrXRKPLPfY=;
 b=k3HwF7WWegvBWSgHNpHepJHVwcEeUQC3lw3i/Q44riGtGPrzcfNywREq9YSr6o5HUU
 20Kj66VLuViciqM+JrCWVPIm2z5EZFv2v0Ct/hn+ROBVK5a4UvdrV0PeQSzBtaJNRg75
 VEkP6i6T9Foh9QOXnvfIirnaLui6HY1fZNDMJAocarejyYPxmQyWjVbwwtgZoWbkPSO/
 +/YOlPSVpJuRBxtpQ+4Qn0VVopgZCImzViJ9Hs2E3NQ6IOJ8RAvjBT1MNUuMHzd5oAPm
 fXGDPkXiK7Gyi5oxlk0KvYmtVlfTRuNjSR7qXtvIL4tv8sMeF230cfO2B8KaSVrkz2y+
 8nKA==
X-Gm-Message-State: APjAAAULFHdGadbNb/uoX1Cim4g8jGK7YFgQUlLOJ6Wz8wyC1voORqsT
 523zNKZw/LiOYgru+oUAKsUfuQ==
X-Google-Smtp-Source: APXvYqxyYPohAHdX/cPPDfW1JlnojtSPLPS5vSeQSfnXomKNh388kBmPHyLX8ufWHVYbMbkJEo8bCw==
X-Received: by 2002:a0c:c164:: with SMTP id i33mr30155410qvh.37.1559993587190; 
 Sat, 08 Jun 2019 04:33:07 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i55sm3386912qtc.21.2019.06.08.04.33.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 08 Jun 2019 04:33:06 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZZar-0003rc-2C; Sat, 08 Jun 2019 08:33:05 -0300
Date: Sat, 8 Jun 2019 08:33:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 hmm 01/11] mm/hmm: fix use after free with struct hmm
 in the mmu notifiers
Message-ID: <20190608113305.GA12419@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-2-jgg@ziepe.ca>
 <20190608084948.GA32185@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190608084948.GA32185@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 10 Jun 2019 14:08:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2lXGspEHCJbsk8rcUX58kNgJSDj9yX2lNCrXRKPLPfY=;
 b=cQto6lY11nB7CtyFVsb4EWl/wSLEbWjYy53473tDxhVa+M8kUBtzMhsyB4GzDkwDxV
 q+kMV3+bqlucZoGG+l3NUydWUmA01Kdk2/AmaOWjogGX9cZ5VHeo4NXfNrqxa9973eio
 jEWacea/Hw5cMfA8v2U6v7fZH/FxhaA8zRa/sqGqp9oG8OkETGNmhyB3dR63HPNpwJq3
 bTef+d3XCAUCKnqZ2kfsu5R+6/Una6mdshi9VfoOWhgkoKLdvmGi1Faluq9FD8FSmrwe
 Lml1z8nOCaJ2hrr3JC/PpvYRD94dpvVxrBx2HEhfbkPIJl6PJI/3BtMNPyc9TsLDPXIT
 qE0Q==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMDgsIDIwMTkgYXQgMDE6NDk6NDhBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gSSBzdGlsbCB0aGluayBzcnVjdCBobW0gc2hvdWxkIGRpZS4gIFdlIGFscmVh
ZHkgaGF2ZSBhIHN0cnVjdHVyZSB1c2VkCj4gZm9yIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gZm9y
IGRyaXZlcnMgaGF2aW5nIGNyYXpseSB0aWdodCBpbnRlZ3JhdGlvbgo+IGludG8gdGhlIFZNLCBh
bmQgaXQgaXMgY2FsbGVkIHN0cnVjdCBtbXVfbm90aWZpZXJfbW0uICBXZSByZWFsbHkgbmVlZAo+
IHRvIHJldXNlIHRoYXQgaW50ZWFkIG9mIGR1cGxpY2F0aW5nIGl0IGJhZGx5LgoKUHJvYmFibHku
IEJ1dCBhdCBsZWFzdCBpbiBPRFAgd2UgbmVlZGVkIHNvbWV0aGluZyB2ZXJ5IHNpbWlsYXIgdG8K
J3N0cnVjdCBobW0nIHRvIG1ha2Ugb3VyIG1tdSBub3RpZmllciBpbXBsZW1lbnRhdGlvbiB3b3Jr
LgoKVGhlIG1tdSBub3RpZmllciBhcGkgcmVhbGx5IGxlbmRzIGl0c2VsZiB0byBoYXZpbmcgYSBw
ZXItbW0gc3RydWN0dXJlCmluIHRoZSBkcml2ZXIgdG8gaG9sZCB0aGUgJ3N0cnVjdCBtbXVfbm90
aWZpZXInLi4KCkkgdGhpbmsgSSBzZWUgb3RoZXIgZHJpdmVycyBhcmUgZG9pbmcgdGhpbmdzIGxp
a2UgYXNzdW1pbmcgdGhhdCB0aGVyZQppcyBvbmx5IG9uZSBtbSBpbiB0aGVpciB3b3JsZCAoZGVz
cGl0ZSBiZWluZyBGRCBiYXNlZCwgc28gdGhpcyBpcyBub3QKcmVhbGx5IGd1YXJlbnRlZWQpCgpT
bywgbXkgZmlyc3QgYXR0ZW1wdCB3b3VsZCBiZSBhbiBhcGkgc29tZXRoaW5nIGxpa2U6CgogICBw
cml2ID0gbW11X25vdGlmaWZlcl9hdHRhY2hfbW0ob3BzLCBjdXJyZW50LT5tbSwgc2l6ZW9mKG15
X3ByaXYpKQogICBtbXVfbm90aWZpZXJfZGV0YWNoX21tKHByaXYpOwoKIG9wcy0+aW52YWxpZGF0
ZV9zdGFydChzdHJ1Y3QgbW11X25vdGlmaWZlciAqbW4pOgogICBzdHJ1Y3QgcCAqcHJpdiA9IG1t
dV9ub3RpZmllcl9wcml2KG1uKTsKClN1Y2ggdGhhdAogLSBUaGVyZSBpcyBvbmx5IG9uZSBwcml2
IHBlciBtbQogLSBBbGwgdGhlIHNyY3Ugc3R1ZmYgaXMgaGFuZGxlZCBpbnNpZGUgbW11IG5vdGlm
aWVyCiAtIEl0IGlzIHJlZmVyZW5jZSBjb3VudGVkLCBzbyBvcHMgY2FuIGJlIGF0dGFjaGVkIG11
bHRpcGxlIHRpbWVzIHRvCiAgIHRoZSBzYW1lIG1tCgpUaGVuIG9kcCdzIHBlcl9tbSwgYW5kIHN0
cnVjdCBobW0gKGlmIHdlIGtlZXAgaXQgYXQgYWxsKSBpcyBzaW1wbHkgYQoncHJpdicgaW4gdGhl
IGFib3ZlLgoKSSB3YXMgdGhpbmtpbmcgb2YgbG9va2luZyBhdCB0aGlzIHN0dWZmIG5leHQsIG9u
Y2UgdGhpcyBzZXJpZXMgaXMKZG9uZS4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
