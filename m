Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C438431A
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 06:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351DE6E5E8;
	Wed,  7 Aug 2019 04:03:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77A46E5E8
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 04:03:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 31so89909426wrm.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug 2019 21:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DS8TkoatmhBOAOl9/V+vPjhoaY+z/XSVugAwkdDAxDE=;
 b=mHTs/pxFtnyyG9/wbeCXh3fW/+yhKUHjoaBP2+MQM8iiOHe63QietP26wMHFt2kBvD
 D05vKW7H9uu0GsV4pYyjRLbLiGgXjUxoQws0DvTUcyrITIP9E+GD3zwUE6nhBeUkKtp/
 VJOr6+wK67oqKD/kJLEk9ZRY9Bxidt9GwQJLVREJ24zLkjDS44jrAOk9Nk19oOQdXujZ
 kC9nMixltzK/6rIi3ICgfxdZZVDG9XIW2W2M02p2DbRBmrdcRIytPJen79P0zidpKvwI
 J7L9+nL4oOHT/6S0Clf0J1Se0bP9Ov80ZWjNfAKmLYmAOVAegPHsv1Buwjhcx85UsJT6
 Zc4w==
X-Gm-Message-State: APjAAAVSEAXB3sIPrg1vRH4Eu7Lg4xaO2mo6s894Sz8s0TLs7t2oBMqs
 AjiHWKS47NX/4J859tpZWh9WkZO8aMo6hMFdWAk=
X-Google-Smtp-Source: APXvYqypr7OZCh/KU83kbzMyUIE6B2KmPb/cud+JZwza2yq2Tl4YmBUJEBmRnmQ76YWLN1ImgGN8IIxHwo/lzSs3tWM=
X-Received: by 2002:adf:f94a:: with SMTP id q10mr7224149wrr.341.1565150595348; 
 Tue, 06 Aug 2019 21:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190807025640.682-1-tao.zhou1@amd.com>
In-Reply-To: <20190807025640.682-1-tao.zhou1@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 Aug 2019 00:03:03 -0400
Message-ID: <CADnq5_Pet0SMuxayjJpWpBuWP4gZvkeCbOuQmw=z=iSi9bdNrQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
To: Tao Zhou <tao.zhou1@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DS8TkoatmhBOAOl9/V+vPjhoaY+z/XSVugAwkdDAxDE=;
 b=b/fjFJD70KifetHPM3oBOkfqbuB3X8qM5XiUKl/O/ygxcK8TRWfCWG3yAyHX2mcX4u
 bda+TLKIzAwYDK+F0sxMuVEQClgAT/+1Vg2JeqrnqIeyxVEfojTLSRejKQogYrJay/j0
 z8hegFZhwSrUn0I/Z1GT442l9JkU8oZViVDsS2mSBmLTDjIZtdoUFuZ5cjZXaZ7+84UL
 zKeLNG9zlKXrrWy/jiMmmOMP2BcdMU59OwboLM+TeviH2blbVrJg+cFTv/s5soekn0/A
 wIhMmt6YZIxphAguaEg97B7e39vt13CU/8n9FpO/Aj6ocPPSvAk9UIDlpaa++u1Z4HFj
 cQ1w==
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 kernel-build-reports@lists.linaro.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <dennis.li@amd.com>,
 Hawking Zhang <hawking.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxMDo1NiBQTSBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5j
b20+IHdyb3RlOgo+Cj4gcmVhZHEvd3JpdGVxIGFyZSBub3Qgc3VwcG9ydGVkIG9uIGFsbCBhcmNo
aXRlY3R1cmVzCj4KPiBTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+
CgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgOCAr
Ky0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4
IDU1OGZlNmQwOTFlZC4uN2ViOWUwYjkyMzVhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IEBAIC0yNzIsMTQgKzI3MiwxMCBAQCB2b2lkIGFtZGdw
dV9tbV93cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCByZWcsIHVpbnQz
Ml90IHYsCj4gICAqLwo+ICB1aW50NjRfdCBhbWRncHVfbW1fcnJlZzY0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCB1aW50MzJfdCByZWcpCj4gIHsKPiAtICAgICAgIHVpbnQ2NF90IHJldDsK
PiAtCj4gICAgICAgICBpZiAoKHJlZyAqIDQpIDwgYWRldi0+cm1taW9fc2l6ZSkKPiAtICAgICAg
ICAgICAgICAgcmV0ID0gcmVhZHEoKCh2b2lkIF9faW9tZW0gKilhZGV2LT5ybW1pbykgKyAocmVn
ICogNCkpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gYXRvbWljNjRfcmVhZCgoYXRvbWljNjRf
dCAqKShhZGV2LT5ybW1pbyArIChyZWcgKiA0KSkpOwo+ICAgICAgICAgZWxzZQo+ICAgICAgICAg
ICAgICAgICBCVUcoKTsKPiAtCj4gLSAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAgLyoqCj4g
QEAgLTI5NCw3ICsyOTAsNyBAQCB1aW50NjRfdCBhbWRncHVfbW1fcnJlZzY0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCByZWcpCj4gIHZvaWQgYW1kZ3B1X21tX3dyZWc2NChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50NjRfdCB2KQo+ICB7
Cj4gICAgICAgICBpZiAoKHJlZyAqIDQpIDwgYWRldi0+cm1taW9fc2l6ZSkKPiAtICAgICAgICAg
ICAgICAgd3JpdGVxKHYsICgodm9pZCBfX2lvbWVtICopYWRldi0+cm1taW8pICsgKHJlZyAqIDQp
KTsKPiArICAgICAgICAgICAgICAgYXRvbWljNjRfc2V0KChhdG9taWM2NF90ICopKGFkZXYtPnJt
bWlvICsgKHJlZyAqIDQpKSwgdik7Cj4gICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIEJV
RygpOwo+ICB9Cj4gLS0KPiAyLjE3LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
