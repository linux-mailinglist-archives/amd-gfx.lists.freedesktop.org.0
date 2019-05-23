Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFEB273B6
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 03:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FB189C53;
	Thu, 23 May 2019 01:02:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDC389AA2
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 00:20:55 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h1so4738369qtp.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 17:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kja4wR6FLtasYFQS1xUbhik8iG88bHuMFvf2ArrK0nw=;
 b=e//MTtCXm0KlmX/B695c0NFsXrUgy7bhGULkToDtRyJohvVAWTUl1V4O66kJI5D/Iv
 RuIQyVfwevN6MWq4SdVuZPazj3sQiRz8ivopQStnaLV12D4YTw3fjQNAhI58WfjfqTTI
 MjMKBjHdhZ35ufrATefxzu1jXIlwD65BdPsixZ/lhM6akX8+FjkAp5TysNSqw6baQ6eT
 36jxJ7TQRF/ssBScPwkReHCOKDB8tiy1KGO0tNWgbmkQMOECYHrHGQIuWZ09uYQd4wxT
 vIKrfp3IMs5iJxztUHJP2yC33upSC7Y9qmyZsDFf8p6to2wMFv5fLOFsQ4JNAm9v1+1o
 /EWA==
X-Gm-Message-State: APjAAAU3tFcJgTZkqg5V4glYf6CaJBe2NZ9YryqkWhnqKMICe8ctzIJI
 xX3SdXEvIy8eXIYPoSp1G7I1GA==
X-Google-Smtp-Source: APXvYqwzvo9H/aW7qSfx2OQVIHnUtdd1Cyzpi6J44RNo2JLbDhDXh7kfDH2OJy33sD2sQGXynL6VQQ==
X-Received: by 2002:ac8:f71:: with SMTP id l46mr70609860qtk.321.1558570854263; 
 Wed, 22 May 2019 17:20:54 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-49-251.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.49.251])
 by smtp.gmail.com with ESMTPSA id t30sm15637238qtc.80.2019.05.22.17.20.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 17:20:53 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hTbTZ-0001Zh-03; Wed, 22 May 2019 21:20:53 -0300
Date: Wed, 22 May 2019 21:20:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190523002052.GF15389@ziepe.ca>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <20190521184856.GC2922@ziepe.ca>
 <20190522134925.GV28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522134925.GV28398@e103592.cambridge.arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 23 May 2019 01:02:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kja4wR6FLtasYFQS1xUbhik8iG88bHuMFvf2ArrK0nw=;
 b=b1PxbkXji6rxJkxXzX+E8hmtsDc4EAG6spndGBpqTY6Mtd1Z82qmKG7IFdzEDWmzKK
 cpfPgmFkndIKUtDn3lZmf4ZAYcKRjit4YkqMU72A44nfyHayfu0+OGxh9SgysS/YRAv2
 RDEnuh2qly9nvvswbClZIbFXuZCzwJj2KYSwWCU/YgJUugR9fRVuJUTKIe2+8zLwiPOj
 anBDeIuRaK3lpaZn56KojfHXM/H6EWmNRZuecl/6erGrJ5dc4+VdWT4yxUQf8Rpv9nUY
 hRDkUmUo3tTzvQuC1Vf8iYC9BBrTle8EWAWahcABrO+2gaF43DLowx5aiqsiUBpSVZlJ
 7EAg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Lee Smith <Lee.Smith@arm.com>, linux-kselftest@vger.kernel.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDI6NDk6MjhQTSArMDEwMCwgRGF2ZSBNYXJ0aW4gd3Jv
dGU6Cj4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDM6NDg6NTZQTSAtMDMwMCwgSmFzb24gR3Vu
dGhvcnBlIHdyb3RlOgo+ID4gT24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDM6NDk6MzFQTSArMDEw
MCwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOgo+ID4gCj4gPiA+IFRoZSB0YWdnZWQgcG9pbnRlcnMg
KHdoZXRoZXIgaHdhc2FuIG9yIE1URSkgc2hvdWxkIGlkZWFsbHkgYmUgYQo+ID4gPiB0cmFuc3Bh
cmVudCBmZWF0dXJlIGZvciB0aGUgYXBwbGljYXRpb24gd3JpdGVyIGJ1dCBJIGRvbid0IHRoaW5r
IHdlIGNhbgo+ID4gPiBzb2x2ZSBpdCBlbnRpcmVseSBhbmQgbWFrZSBpdCBzZWFtbGVzcyBmb3Ig
dGhlIG11bHRpdHVkZSBvZiBpb2N0bHMoKS4KPiA+ID4gSSdkIHNheSB5b3Ugb25seSBvcHQgaW4g
dG8gc3VjaCBmZWF0dXJlIGlmIHlvdSBrbm93IHdoYXQgeW91IGFyZSBkb2luZwo+ID4gPiBhbmQg
dGhlIHVzZXIgY29kZSB0YWtlcyBjYXJlIG9mIHNwZWNpZmljIGNhc2VzIGxpa2UgaW9jdGwoKSwg
aGVuY2UgdGhlCj4gPiA+IHByY3RsKCkgcHJvcG9zYWwgZXZlbiBmb3IgdGhlIGh3YXNhbi4KPiA+
IAo+ID4gSSdtIG5vdCBzdXJlIHN1Y2ggYSBkaXJlIHZpZXcgaXMgd2FycmVudGVkLi4gCj4gPiAK
PiA+IFRoZSBpb2N0bCBzaXR1YXRpb24gaXMgbm90IHNvIGJhZCwgb3RoZXIgdGhhbiBhIGZldyBz
cGVjaWFsIGNhc2VzLAo+ID4gbW9zdCBkcml2ZXJzIGp1c3QgdGFrZSBhICd2b2lkIF9fdXNlciAq
JyBhbmQgcGFzcyBpdCBhcyBhbiBhcmd1bWVudCB0bwo+ID4gc29tZSBmdW5jdGlvbiB0aGF0IGFj
Y2VwdHMgYSAndm9pZCBfX3VzZXIgKicuIHNwYXJzZSBldCBhbCB2ZXJpZnkKPiA+IHRoaXMuIAo+
ID4gCj4gPiBBcyBsb25nIGFzIHRoZSBjb3JlIGZ1bmN0aW9ucyBkbyB0aGUgcmlnaHQgdGhpbmcg
dGhlIGRyaXZlcnMgd2lsbCBiZQo+ID4gT0suCj4gPiAKPiA+IFRoZSBvbmx5IHBsYWNlIHRoaW5n
cyBnZXQgZGljeSBpcyBpZiBzb21lb25lIGNhc3RzIHRvIHVuc2lnbmVkIGxvbmcKPiA+IChpZSBm
b3Igdm1hIHdvcmspIGJ1dCBJIHRoaW5rIHRoYXQgcmVmbGVjdHMgdGhhdCBvdXIgZHJpdmVyIGZh
Y2luZwo+ID4gQVBJcyBmb3IgVk1BcyBhcmUgY29tcGF0aWJsZSB3aXRoIHN0YXRpYyBhbmFseXNp
cyAoaWUgSSBoYXZlIG5vCj4gPiBlYXJ0aGx5IGlkZWEgd2h5IGdldF91c2VyX3BhZ2VzKCkgYWNj
ZXB0cyBhbiB1bnNpZ25lZCBsb25nKSwgbm90IHRoYXQKPiA+IHRoaXMgaXMgdG9vIGhhcmQuCj4g
Cj4gSWYgbXVsdGlwbGUgcGVvcGxlIHdpbGwgY2FyZSBhYm91dCB0aGlzLCBwZXJoYXBzIHdlIHNo
b3VsZCB0cnkgdG8KPiBhbm5vdGF0ZSB0eXBlcyBtb3JlIGV4cGxpY2l0bHkgaW4gU1lTQ0FMTF9E
RUZJTkV4KCkgYW5kIEFCSSBkYXRhCj4gc3RydWN0dXJlcy4KPiAKPiBGb3IgZXhhbXBsZSwgd2Ug
Y291bGQgaGF2ZSBhIGNvdXBsZSBvZiBtdXR1YWxseSBleGNsdXNpdmUgbW9kaWZpZXJzCj4gCj4g
VCBfX29iamVjdCAqCj4gVCBfX3ZhZGRyICogKG9yIFUgX192YWRkcikKPiAKPiBJbiB0aGUgZmly
c3QgY2FzZSB0aGUgcG9pbnRlciBwb2ludHMgdG8gYW4gb2JqZWN0IChpbiB0aGUgQyBzZW5zZSkK
PiB0aGF0IHRoZSBjYWxsIG1heSBkZXJlZmVyZW5jZSBidXQgbm90IHVzZSBmb3IgYW55IG90aGVy
IHB1cnBvc2UuCgpIb3cgd291bGQgeW91IHVzZSB0aGVzZSB0d28gZGlmZmVyZW50bHk/CgpTbyBm
YXIgdGhlIGtlcm5lbCBoYXMgd29ya2VkIHRoYXQgX191c2VyIHNob3VsZCB0YWcgYW55IHBvaW50
ZXIgdGhhdAppcyBmcm9tIHVzZXJzcGFjZSBhbmQgdGhlbiB5b3UgY2FuJ3QgZG8gYW55dGhpbmcg
d2l0aCBpdCB1bnRpbCB5b3UKdHJhbnNmb3JtIGl0IGludG8gYSBrZXJuZWwgc29tZXRoaW5nCgo+
IHRvIHRlbGwgc3RhdGljIGFuYWx5c2VycyB0aGUgcmVhbCB0eXBlIG9mIHBvaW50ZXJzIHNtdWdn
bGVkIHRocm91Z2gKPiBVQVBJIGRpc2d1aXNlZCBhcyBvdGhlciB0eXBlcyAoKmNvdWdoKiBLVk0s
IGV0Yy4pCgpZZXMsIHRoYXQgd291bGQgaGVscCBhbG90LCB3ZSBvZnRlbiBoYXZlIHRvIHBhc3Mg
cG9pbnRlcnMgdGhyb3VnaCBhCnU2NCBpbiB0aGUgdUFQSSwgYW5kIHRoZXJlIGlzIG5vIHN0YXRp
YyBjaGVja2VyIHN1cHBvcnQgdG8gbWFrZSBzdXJlCnRoZXkgYXJlIHJ1biB0aHJvdWdoIHRoZSB1
NjRfdG9fdXNlcl9wdHIoKSBoZWxwZXIuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
