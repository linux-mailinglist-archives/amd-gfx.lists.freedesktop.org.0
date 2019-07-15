Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCC9684B4
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 09:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AA88979D;
	Mon, 15 Jul 2019 07:58:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A963689830
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 02:49:00 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id r9so14557108ljg.5
 for <amd-gfx@lists.freedesktop.org>; Sun, 14 Jul 2019 19:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0xXZnp3zLEv9/8rZrVJ8Bb1hgH0mFVq0ktioQL8IoBE=;
 b=CWx2kVQPzU6569gwWdccvc25sZs9g97Ct22hLNvngtH8s6TvO5nVCdrzU2JVF+v1oi
 cU02bZBwZG+PDnEAauX8S0m7c4PvbVLAFPG5Tt9ANTUOHgkdYKZJBtX1/C3CbaO+ajSa
 0rsfBJ5V/Iae1ELwetYMmVOimKw5D6IBq3VW8ZoUeiFJSmRU7bBaTYKq1MA1MVsD+E51
 2tBVUg3NvVO+lFhERKbO+AqHQly3uXZ3sf+zlXi0Vjv8xle3ldZzCGGEvMj7J7G7bpBK
 FoYOz53KN9V0brAS0WjqhxgkXsZSDcqbW3eUut1rrR5OllnHpTw9CdaI11Tyi23fgiUm
 tHZQ==
X-Gm-Message-State: APjAAAUlEdwnnFVN2R0/SmpGf+87VGwU5xpj8UWYFl3G5Z6UOaIwBrdm
 XzjmVHl156vPS09LA87ku7flt0oX4pk=
X-Google-Smtp-Source: APXvYqxkPjXHtrO6b5Ou3I3fA0g1fZN9uTuVie9Q5Hg1pqSwB4RVQBLdfmtW1Pc4qrfhRipWX7mAFw==
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr12598232ljg.65.1563158938851; 
 Sun, 14 Jul 2019 19:48:58 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id n24sm2909792ljc.25.2019.07.14.19.48.56
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 19:48:56 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id i21so14562954ljj.3
 for <amd-gfx@lists.freedesktop.org>; Sun, 14 Jul 2019 19:48:56 -0700 (PDT)
X-Received: by 2002:a2e:9ec9:: with SMTP id h9mr11885151ljk.90.1563158936002; 
 Sun, 14 Jul 2019 19:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190709192418.GA13677@ziepe.ca>
In-Reply-To: <20190709192418.GA13677@ziepe.ca>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 Jul 2019 19:48:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgHKrYEMDbA9CxZ2Sw8JuW3=Wxr1fZo+EvXXLhg4iUOmw@mail.gmail.com>
Message-ID: <CAHk-=wgHKrYEMDbA9CxZ2Sw8JuW3=Wxr1fZo+EvXXLhg4iUOmw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull hmm changes
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Approved-At: Mon, 15 Jul 2019 07:58:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0xXZnp3zLEv9/8rZrVJ8Bb1hgH0mFVq0ktioQL8IoBE=;
 b=QG6qimnZ0OuOr18TPPyD1ZpsfC2oaBrHXD55BhiSP6dw+mQqPSGsIUy/Yf4/KOcnWu
 3PMYYqkRk/B44HHs/mOcE5iy2y+FDx49TCkO+kDXoObGp0hcYXLYXFAlMjRw25zjrKgL
 tjFllJ7em2UwShT6KqGZwlL9Geykn6fnTBnEs=
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
Cc: David Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCAxMjoyNCBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gSSdtIHNlbmRpbmcgaXQgZWFybHkgYXMgaXQgaXMgbm93IGEg
ZGVwZW5kZW5jeSBmb3Igc2V2ZXJhbCBwYXRjaGVzIGluCj4gbW0ncyBxdWlsdC4KCi4uIGJ1dCBJ
IHdhaXRlZCB0byBtZXJnZSBpdCB1bnRpbCBJIGhhZCB0aW1lIHRvIHJldmlldyBpdCBtb3JlCmNs
b3NlbHksIGJlY2F1c2UgSSBleHBlY3RlZCB0aGUgcmV2aWV3IHRvIGJlIHBhaW5mdWwuCgpJJ20g
aGFwcHkgdG8gc2F5IHRoYXQgSSB3YXMgb3Zlcmx5IHBlc3NpbWlzdGljLCBhbmQgdGhhdCBpbnN0
ZWFkIG9mCmZpbmRpbmcgdGhpbmdzIHRvIGhhdGUsIEkgZm91bmQgaXQgYWxsIGxvb2tpbmcgZ29v
ZC4KClBhcnRpY3VsYXJseSB0aGUgd2hvbGUgInVzZSByZWZlcmVuY2UgY291bnRzIHByb3Blcmx5
LCBzbyB0aGF0CmxpZmV0aW1lcyBtYWtlIHNlbnNlIGFuZCBhbGwgdGhvc2UgbmFzdHkgY2FzZXMg
Y2FuJ3QgaGFwcGVuIiBwYXJ0cy4KCkl0J3MgYWxsIG1lcmdlZCwganVzdCB3YWl0aW5nIGZvciB0
aGUgdGVzdC1idWlsZCB0byB2ZXJpZnkgdGhhdCBJCmRpZG4ndCBtaXNzIGFueXRoaW5nICh3ZWxs
LCBhdCBsZWFzdCBub3RoaW5nIG9idmlvdXMpLgoKICAgICAgICAgICAgICAgICAgICAgIExpbnVz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
