Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A048EA4AC6
	for <lists+amd-gfx@lfdr.de>; Sun,  1 Sep 2019 19:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B017898F1;
	Sun,  1 Sep 2019 17:09:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9B289DC9
 for <amd-gfx@lists.freedesktop.org>; Sun,  1 Sep 2019 15:48:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id d16so12165015wme.2
 for <amd-gfx@lists.freedesktop.org>; Sun, 01 Sep 2019 08:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xYeciFLLmX25khCjRMfxfbMPUMT1mlx5jp69Fy+wXdQ=;
 b=kXhCEMOyXZypPTVbVTV9pvru+7p95U9vOA71BwKXL2yUqixOknZ61xBVHDvZlW4iKj
 ZNvwkf3vYWIqJK870d3jz3nueknNbo4hjh38oH+A92SjZx7+oPip4c6uqrvTZ6vL2gwZ
 fA0viO9F+oxAiIT1qiO8qvIuO5DzoCboY8R0Q40sAeLBfDVl4J1tVdjZ7bgTq0lSz+eF
 4Z/CZryvELzc2nQEt/YRu2mHDRL8Wz55FtFb6dz9j0l+4Sc+mONJsP78IAyR/EGq3cX9
 axJLVWoS8ha/reZCvKTQH8CRg7PEArXgEWFEvaTrYK0S0yMsODuY485kQnn8jKr7UolL
 fVBQ==
X-Gm-Message-State: APjAAAU8eqYRJbcXZPDAZN4Ft+fzgccAvYRv/v7OCf78LUzvwytOpJif
 78CBrRd0Plvoa8R4dZ2zkP4gogod
X-Google-Smtp-Source: APXvYqzkWB8GMWcu0+cHetAlgPZe5lLu+JcQOAijkGngfcIT6vzAng/m/b1vzQbdRU/t2K8+/WRsQw==
X-Received: by 2002:a05:600c:218c:: with SMTP id
 e12mr3643724wme.40.1567352915689; 
 Sun, 01 Sep 2019 08:48:35 -0700 (PDT)
Received: from kontron.lan
 (2001-1ae9-0ff1-f191-7c4c-b13a-fe89-a24c.ip6.tmcz.cz.
 [2001:1ae9:ff1:f191:7c4c:b13a:fe89:a24c])
 by smtp.gmail.com with ESMTPSA id l5sm10082480wmj.4.2019.09.01.08.48.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 Sep 2019 08:48:35 -0700 (PDT)
Subject: Re: [BUG, regression] Dereferencing of NULL pointer in
 radeon_mn_unregister()
To: Jason Gunthorpe <jgg@mellanox.com>
References: <dad0e51a-0f06-e2b0-cef7-3587207c2045@gmail.com>
 <20190901140409.GA1251@mellanox.com>
From: Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <2fc7ef14-e89a-1f2d-381d-1c9b05da02d3@gmail.com>
Date: Sun, 1 Sep 2019 17:48:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901140409.GA1251@mellanox.com>
Content-Language: cs
X-Mailman-Approved-At: Sun, 01 Sep 2019 17:09:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xYeciFLLmX25khCjRMfxfbMPUMT1mlx5jp69Fy+wXdQ=;
 b=eYK3/jXo9TXbDldY8s54CmHT85IpC2zUsXMmBfmPz2KSPotJj5MDPPEZ34eyy4Qz9A
 fCqL29enqlPXS6u/ItWIo8imFIxDgQkcsfS6fKtQUjmVDvU6W87Quk5WdniPZdEZBDej
 r7EcQi95iuU6bqWRi4pkerRRh9X3gbiqffkPDVxvJ56E66JTkSSGkR59wBuZqfj12glS
 H1hChgiLmHx5AP5OrusXLxbMBGKf0udbWNXLt/4F4vGp3QZf5ONdrbdKQjS8YsHzSzKr
 A6eUCl6U8M0B9JGB1Tp2NQdLDiT2kCQ1Hna8+VFmaa6Oh+43BzseuRALAyic+wh4DwQX
 oT7w==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>, "Koenig,
 Christian" <christian.koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RG5lIDAxLiAwOS4gMTkgdiAxNjowNCBKYXNvbiBHdW50aG9ycGUgbmFwc2FsKGEpOgo+IE9uIFN1
biwgU2VwIDAxLCAyMDE5IGF0IDExOjM4OjEwQU0gKzAyMDAsIFBldHIgQ3ZlayB3cm90ZToKPiAK
Pj4gVGhlIGNvZGUgaXM6Cj4+Cj4+IAlzdHJ1Y3QgcmFkZW9uX21uICpybW4gPSBiby0+bW47Cj4+
IAkuLi4KPj4gCW11dGV4X2xvY2soJnJtbi0+bG9jayk7CQkvLzwtY3Jhc2gKPj4KPj4gQSBxdWlj
ayBhc3NlcnQgcHJvdmVzIHRoZSBiby0+bW4gcmV0dXJucyBOVUxMLiBUaGUgY29kZSB3b3JrZWQg
aW4KPj4gNC4xOS1yYyBhbmQgaXQgc2VlbXMgdGhlIHByb2JsZW1hdGljIHBhdGNoIGlzCj4gCj4g
SHVtLCB0aGUgY29kZSB3ZW50IGF3YXkgYmVjYXVzZSB0aGUgbG9ja2luZyBwcm90ZWN0aW5nIHRo
YXQgdmFyaWFibGUKPiB3ZW50IGF3YXkuLiBJdCBtZWFucyB0aGUgY2FsbGVyIGlzIG5vdCBjYXJl
ZnVsIHRvIHBhaXIgcmVnaXN0ZXIgYW5kCj4gdW5yZWdpc3Rlci4KPiAgCj4+IAlkcm0vcmFkZW9u
OiB1c2UgbW11X25vdGlmaWVyX2dldC9wdXQgZm9yIHN0cnVjdCByYWRlb25fbW4KPj4KPj4gYXMg
aXQgcmVtb3ZlcyB0aGUgTlVMTCBjaGVjay4KPj4KPj4gRm9yY2luZyAtRU5PREVWIGluIHRoZSBy
ZWdpc3RlciBmdW50aW9uIChhbmQgaW1tZWRpYXRlIHJldHVybiBpbgo+PiB1bnJlZ2lzdGVyIGFz
IHdpdGhvdXQgQ09ORklHX01NVV9OT1RJRklFUikgd29ya3MuCj4gCj4gSXMganVzdCBhZGRpbmcg
YQo+IAo+ICAgaWYgKCFybW4pCj4gICAgICAgIHJldHJ1bgo+IAo+IFRvIHRoZSB0b3Agb2YgcmFk
ZW9uX21uX3VucmVnaXN0ZXIgZW5vdWdoIHRvIGZpeCBpdD8KClllYWggaXQgc2VlbXMgdG8gd29y
ay4gQSBmdXJ0aGVyIHRlc3Qgd2l0aCBtaW5ldGVzdCB3b3JrcyB0b28uCgpQZXRyIAoKPiAKPiBK
YXNvbgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
