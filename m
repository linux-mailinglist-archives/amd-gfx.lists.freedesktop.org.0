Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3FA2B2A9
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 13:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDA08980C;
	Mon, 27 May 2019 11:02:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FA48980C
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 11:02:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t4so8225643wrx.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 04:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=AedBwxgMPIsNOycjH9aaelkxlfADJiXTet/1Kc2zfAs=;
 b=lOy6qN/RMjWnsF7CGkzrk6ThHvwY/ETj0lyie6loH1ewNdFGOZ1LEr+0/0//DtFYtT
 sclmYW+R2iJp3luEtgYTLs4k9k7Cq44YoNUGR0wuKpKLqUoe2JpJzi6SlwY32P5qEj1y
 evUd9Fmx8beRS9ebvJRuFKvHkxxw080ZUhqcU3ibV1WGQew0NSUknAnFvnhV04yXiKIn
 r7jv+/UPsLNyT3xZPEWqrLKOhR1W7iHYDsyKFxs5f+D0DLeDIyM0gr5l+m8PNWK2VONv
 36Z0MhEeo9EM8RLcvl9agQVHABOcLRuAvVVhvM/06y+hvL0KckEejNXj/btkgVZ6xzZk
 e3eg==
X-Gm-Message-State: APjAAAVga97yWkPnowXJqsbNhcsGZXf2hASZIroccJvvI5Jbn57s2Ics
 5vcwiIPUHyyarwoqOGfI9y649RrA
X-Google-Smtp-Source: APXvYqwbnYK1HUX79M54detThkY1s5EoTJ0gTcIf5/Ixugig8RU3/+Fwn7te2oc+l+BJPxVItPFZCg==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr74329848wrk.293.1558954943158; 
 Mon, 27 May 2019 04:02:23 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g185sm9459187wmf.30.2019.05.27.04.02.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 04:02:22 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
To: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org
References: <1558946487-18034-1-git-send-email-Emily.Deng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e15ac75c-fb1a-2a05-b857-d3761f5c905e@gmail.com>
Date: Mon, 27 May 2019 13:02:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558946487-18034-1-git-send-email-Emily.Deng@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=AedBwxgMPIsNOycjH9aaelkxlfADJiXTet/1Kc2zfAs=;
 b=l/7LqaH/ABrdLTfJKa7UvgBp6IqDhnEpSDAEWVFtuSRtIUvv5hO1OLupA0IVkmqVHr
 VmXngCDO+0lnMYu+tBGOQdmmtvy2D39D2JsnL3r48Rx5CbDpJX2PuvD+piOeZOoROS4O
 Y0MG3fadenDSWv5os/5VGYK1XflRQW0sOlSv3mKRkfEbojVg0/h/ZGVXxxqLd4U+mAXV
 3G6Zz7a0x3fpv8qW6OdNOVxrYzfZXJXPDOKbY3+0A8LIaV6Em4TKyLV8+2lUjHadbEcu
 VWLD071OJTO/qvFMcTujX/ymrO6mpJJMOsqtGeFdsD1rq+bRCobtF+y9tr88lK1RqivE
 Zk5g==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjcuMDUuMTkgdW0gMTA6NDEgc2NocmllYiBFbWlseSBEZW5nOgo+IEFzIGl0IHdpbGwgZGVz
dHJveSBjbGVhcl9zdGF0ZV9vYmosIGFuZCBhbHNvIHdpbGwKPiB1bnBpbiBpdCBpbiB0aGUgZ2Z4
X3Y5XzBfc3dfZmluaSwgc28gZG9uJ3QgbmVlZCB0bwo+IGNhbGwgY3NiX3ZyYW0gdW5waW4gaW4g
Z2Z4X3Y5XzBfaHdfZmluaSwgb3IgaXQgd2lsbAo+IGhhdmUgdW5waW4gd2FybmluZy4KPgo+IHYy
OiBGb3Igc3VzcGVuZCwgc3RpbGwgbmVlZCB0byBkbyB1bnBpbgo+Cj4gU2lnbmVkLW9mZi1ieTog
RW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDMgKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMKPiBpbmRleCA1ZWI3MGU4Li41YjFmZjQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jCj4gQEAgLTMzOTUsNyArMzM5NSw4IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5
XzBfaHdfZmluaSh2b2lkICpoYW5kbGUpCj4gICAJZ2Z4X3Y5XzBfY3BfZW5hYmxlKGFkZXYsIGZh
bHNlKTsKPiAgIAlhZGV2LT5nZngucmxjLmZ1bmNzLT5zdG9wKGFkZXYpOwo+ICAgCj4gLQlnZnhf
djlfMF9jc2JfdnJhbV91bnBpbihhZGV2KTsKPiArCWlmIChhZGV2LT5pbl9zdXNwZW5kKQo+ICsJ
CWdmeF92OV8wX2NzYl92cmFtX3VucGluKGFkZXYpOwoKVGhhdCBkb2Vzbid0IGxvb2tzIGxpa2Ug
YSBnb29kIGlkZWEgdG8gbWUuCgpXaHkgZG8gd2UgaGF2ZSB1bnBpbiBib3RoIGluIHRoZSBzd19m
aW5pIGFzIHdlbGwgYXMgdGhlIGh3X2ZpbmkgY29kZSBwYXRocz8KClJlZ2FyZHMsCkNocmlzdGlh
bi4KCj4gICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
