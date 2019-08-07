Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0E88528D
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 20:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D266E74B;
	Wed,  7 Aug 2019 18:00:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446F06E74B
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 18:00:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c2so89040775wrm.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Aug 2019 11:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pFr71ba4wTvnk5UDS39uecfIkQHbPN6xMB7Jqj/WRjI=;
 b=GMH+zl6ko8cfip+NWxnmoMCotxlo6UEylNWjuH8SKjLQpRbEVEdDOcl68WDeJs4VrZ
 aTHLVypPssSgGJYY4ctTOZKqobjz1cGgqgKzdnff2oWOMxgUizqkk5By/XL98R1F9cVP
 pMVpuieijFRA2TdgMSk36wkJwkNn4CO5U1+2uBc0S8fLK2sXyhhAn5lsMRkbOHYMJMQH
 +saKEBBvxpJeACfMwFMlf+xfj/4cxpna7Bn4P8vwGsgrrNXwNN2vG8RGmB5gnLmzc2Ct
 AVki0umGEMbuvNLa+J/WkU+K7yhxcooMMzd8QqQOXLidXsm+tPSFuytyGYe1mwN2lg0q
 FHkQ==
X-Gm-Message-State: APjAAAVQlgzEeoA9DoiiGxLQUksa99DT0MRcC0pnfq/qHqXUQ9pb/O5z
 0keTn4/rBzyJqyOw5BuVgt4BzH9puzw/VjuXI08=
X-Google-Smtp-Source: APXvYqxaCIZWdK+Tqrsn08yT+fqkM7ITkRh9oQN0LjCE02z/d6ocRZC1bG+I6yilPRfn2AKU8KzS1UbPFYRTzQWESuw=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr12673000wrc.4.1565200827673; 
 Wed, 07 Aug 2019 11:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807070834.GA24792@infradead.org>
 <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
 <20190807104104.GA18773@infradead.org>
 <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com>
 <20190807130043.GA6023@infradead.org>
 <c613ca25-4443-f275-ea8d-6d55af10ac77@amd.com>
In-Reply-To: <c613ca25-4443-f275-ea8d-6d55af10ac77@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 Aug 2019 14:00:15 -0400
Message-ID: <CADnq5_M8YvmsA1SDCNygQ2+tcxGjDCbz9ETQ1Fu22OUr03t29g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pFr71ba4wTvnk5UDS39uecfIkQHbPN6xMB7Jqj/WRjI=;
 b=m9c1MHBuDCeo2Z88IwdSKM3amtE+vs5AoTgGWNdzmSKxistPEwZwFwKjKOLAiLTeV6
 piYs3QuMN0mGgOTedewVtsKw6qXYqOQJOQPsI5Rm8+ruxJDY7UzJ0azIgMMOGtyZK+lV
 V7In9wNR3+wK9STFB9PBqcyUKPMKk7zpVsyzghfv//fV2Ebtgud3fEvcjSc7HTvIofTb
 Qd+WAVy0hbQmfbe4a2WUuvfG8a6nAvDRMPFqtp0p13DTdg3Pj2Q+jxfAHLlIwmkCdvHs
 1rlYxkg6QGFqJXU/uqlv42MHh0n48W1PN9Ac1hDIIwt118wPYPPSqTk0Y1U70qTPHe0L
 biLw==
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
Cc: "kernel-build-reports@lists.linaro.org"
 <kernel-build-reports@lists.linaro.org>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Dennis" <Dennis.Li@amd.com>, Christoph Hellwig <hch@infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgNywgMjAxOSBhdCA5OjAzIEFNIEtvZW5pZywgQ2hyaXN0aWFuCjxDaHJpc3Rp
YW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDcuMDguMTkgdW0gMTU6MDAgc2Nocmll
YiBDaHJpc3RvcGggSGVsbHdpZzoKPiA+IE9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDEwOjU1OjAx
QU0gKzAwMDAsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+ID4+Pj4gRXNzZW50aWFsbHkgd3Jp
dGVxL3JlYWRxIGRvZXNuJ3Qgc2VlbXMgdG8gYmUgYXZhaWxhYmxlIG9uIGFsbAo+ID4+Pj4gYXJj
aGl0ZWN0dXJlcyBlaXRoZXIuCj4gPj4+IHdyaXRlcS9yZWFkcSBhcmUgcHJvdmlkZWQgd2hlbmV2
ZXIgdGhlIENQVSBhY3R1YWxseSBzdXBwb3J0cyA2NC1iaXQKPiA+Pj4gYXRvbWljIGxvYWRzIGFu
ZCBzdG9yZXMuCj4gPj4gSXMgdGhlcmUgYSBjb25maWcgb3B0aW9uIHdoaWNoIHdlIGNhbiBtYWtl
IHRoZSBkcml2ZXIgZGVwZW5kIG9uPwo+ID4+Cj4gPj4gSSBtZWFuIHRoYXQgQVJNIGRvZXNuJ3Qg
c3VwcG9ydCA2NGJpdCBhdG9taWMgbG9hZHMgYW5kIHN0b3JlcyBvbiBNTUlPIGlzCj4gPj4gcXVp
dGUgYSBib29tZXIgZm9yIHVzLgo+ID4gVGhlIG1vZGVsIGlzIHRvIGNoZWFjayBpZiByZWFkcS93
cml0ZXEgYXJlIGRlZmluZWQsIGFuZCBpZiBub3QgdG8KPiA+IGluY2x1ZGUgdGhlIG9uZSBvZiBp
by02NC1ub25hdG9taWMtaGktbG8uaCBvciBpby02NC1ub25hdG9taWMtbG8taGkuaC4KPiA+IFRo
ZSByZWFzb24gZm9yIHRoYXQgaXMgdGhhdCBoYXJkd2FyZSBpcyBzdXBwb3NlZCB0byBiZSBhYmxl
IHRvIGRlYWwgd2l0aAo+ID4gdHdvIDMyLWJpdCB3cml0ZXMsIGJ1dCBpdCBkZXBlbmRzIG9uIHRo
ZSBoYXJkd2FyZSBpZiB0aGUgbG93ZXIgb3IgdXBwZXIKPiA+IGhhbGYgaXMgd2hhdCBjb21taXRz
IHRoZSB3cml0ZS4KPgo+IFJlYWQsIGJ1dCBhcyBJIHVuZGVyc3Rvb2QgVGFvIGNoYW5nZSB0aGlz
IGlzIG5vdCB0aGUgY2FzZSBoZXJlLgo+IE90aGVyd2lzZSB3ZSB3b3VsZCBqdXN0IHVzZSBvdXIg
V1JFRzMyL1JSRUczMiBtYWNyb3MgaW4gdGhlIGRyaXZlci4KPgo+IFRhbywgcGxlYXNlIGV4cGxh
aW4gd2h5IGV4YWN0bHkgd2UgbmVlZCB0aGUgV1JFRzY0L1JSRUc2NCBjaGFuZ2Ugd2hpY2gKPiBj
YXVzZWQgdGhpcy4KCldlIHVzZSB0aGlzIGZvciBkb29yYmVsbHMgYXMgd2VsbCB3aGljaCBpcyBh
bHNvIE1NSU8uICBCYXNpY2FsbHkgd2UKaGF2ZSB0aGUgcmVxdWlyZW1lbnQgdG8gcmVhZCBvciB3
cml0ZSB0aGUgZnVsbCA2NCBiaXRzIGluIG9uZQpvcGVyYXRpb24uICBFLmcuLCBmb3IgNjQtYml0
IGRvb3JiZWxscywgdGhlIGVudGlyZSByZWdpc3RlciBpcyB0aGUKdHJpZ2dlciBzbyBpZiB3ZSBk
byBpdCBhcyB0d28gd3JpdGVzLCB3ZSdsbCBtaXNzIGhhbGYgdGhlIHVwZGF0ZS4gIEluCnRoZSBj
YXNlIG9mIHNvbWUgZXJyb3IgY291bnRlciByZWdpc3RlcnMsIHJlYWRpbmcgdGhlIHJlZ2lzdGVy
IHdpbGwKY2xlYXIgdGhlIHZhbHVlIHNvIHdlIG5lZWQgdG8gcmVhZCBvdXQgdGhlIGZ1bGwgdmFs
dWUgb3Igd2UgbG9zZSB0aGUKaGFsZiB0aGUgdmFsdWUuICBUaGlzIHdvcmtzIHByb3Blcmx5IG9u
IHg4NiBhbmQgQU1ENjQuCgpBbGV4Cgo+Cj4gQ2hyaXN0aWFuLgo+Cj4gPgo+ID4gVGhlIG9ubHkg
MzItYml0IHBsYXRmb3JtIHRoYXQgY2xhaW1zIHN1cHBvcnQgZm9yIHJlYWRxL3dyaXRlcSBpcyBz
aCwKPiA+IGFuZCBJIGhhdmUgZG91YnRzIGlmIHRoYXQgYWN0dWFsbHkgd29ya3MgYXMgZXhwZWN0
ZWQuCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
