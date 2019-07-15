Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB17F698E9
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 18:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA1B89A1A;
	Mon, 15 Jul 2019 16:12:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1062689A1A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 16:12:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f9so17695256wre.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 09:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=82awBsbEYnS55oeanF+K9lmUapCuMgbN0ZoUUGbcU0o=;
 b=AZpeagHIimeqvOYmmfm3mKqvRIyzO01nSy95v/I/Ug/Ioo57k2NjyqxTpsfJSqzLHI
 WtyzCvPHZH3PgptgpTcE3Wqg9m/w8o5Lp08KgM3hMdp/3GmVjzijjWBTpVBGBg5MJNpE
 orU67+AnhWdUSxt5KSqr0X7RaCqfqIdmbfqz+i2gat5FNUiAJVbnBETc9DVg9IFZTwjb
 oiNyQuwkGoKsquRNKWFx59DPrAS0MSkHIYpT6lxW+LtL9mUpOFS4pemKjzMRR072pAEk
 U8fanqH/nKek4ICSYngvdaRNSlLvRcRODMWx1NvICyHF+SpjUSKSK/M4vfGa2ZnhXIX/
 iuJA==
X-Gm-Message-State: APjAAAUMTVHxZdBb+wTSfV6ksxdCSffTzly83HHzPTKVRmY10KwBxHLB
 3DUe6JkGvMwEdobJkg9Gcff6KUpUKE5JrUIEPvU=
X-Google-Smtp-Source: APXvYqz0Scip8lBz/r0GP+cB4OW2KZiPCHMRdYlecSLMGlOpib5sWABVknomRYF2W2/6j4u1U418dJB7Ayvgdv5ECAs=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr31501088wrn.142.1563207143634; 
 Mon, 15 Jul 2019 09:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190713064245.20097-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190713064245.20097-1-Felix.Kuehling@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jul 2019 12:12:12 -0400
Message-ID: <CADnq5_OCXiEoPU5+K2-NQ+9zNMVRd2mMwY6NYeK6Jp0ssLcjtg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix unaligned memory copies
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=82awBsbEYnS55oeanF+K9lmUapCuMgbN0ZoUUGbcU0o=;
 b=AJqM3o5jjHovvxQ+9XamowWHibsQUshhWBNBTzVZVf7jLXz2cw4+BtGtyoaR4u2F3S
 tDurl0Sy8amXKyPenOhvZCkTDH5/ISTbmjN6yqI0H/u6MedLcAmknoa8ZSGoJ8CnF3IK
 JIR8o8hO4+NNGmbuF7T+em6g9neT3ye12zRwc/slcfT7expRpHLgTqK+XZSyyDllse5g
 1eaahBKc+k6wUSYzxDKLR9/bjmRVeTP13WsPrTZdWyKpS1YpOYfrs4bn4V2SOBarYFZz
 fE2ZV2w9FynMbERox0rrfEq8YzjbDlGD7twhVFqvjr/dVkJrmqleecweTdWuXkZKDqrG
 hWyQ==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCBKdWwgMTMsIDIwMTkgYXQgMjo0MyBBTSBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4gV2hlbiBzdGFydGluZyBhIG5ldyBtbV9ub2RlLCB0
aGUgcGFnZV9vZmZzZXQgYmVjb21lcyAwLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxp
bmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gaW5kZXggMzdk
OWEzYjA5OTQ2Li5kMGY2YzIzZWM3Y2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jCj4gQEAgLTM4Niw2ICszODYsNyBAQCBpbnQgYW1kZ3B1X3R0bV9jb3B5X21l
bV90b19tZW0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgc3JjX25vZGVfc3RhcnQgPSBhbWRncHVfbW1fbm9kZV9hZGRyKHNyYy0+Ym8sICsrc3Jj
X21tLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzcmMtPm1lbSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc3JjX25vZGVf
c2l6ZSA9IChzcmNfbW0tPnNpemUgPDwgUEFHRV9TSElGVCk7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgc3JjX3BhZ2Vfb2Zmc2V0ID0gMDsKPiAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBzcmNfbm9kZV9zdGFydCArPSBjdXJfc2l6ZTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBzcmNfcGFnZV9vZmZzZXQgPSBzcmNfbm9kZV9zdGFydCAmIChQ
QUdFX1NJWkUgLSAxKTsKPiBAQCAtMzk1LDYgKzM5Niw3IEBAIGludCBhbWRncHVfdHRtX2NvcHlf
bWVtX3RvX21lbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBkc3Rfbm9kZV9zdGFydCA9IGFtZGdwdV9tbV9ub2RlX2FkZHIoZHN0LT5ibywgKytk
c3RfbW0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGRzdC0+bWVtKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBkc3Rfbm9k
ZV9zaXplID0gKGRzdF9tbS0+c2l6ZSA8PCBQQUdFX1NISUZUKTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBkc3RfcGFnZV9vZmZzZXQgPSAwOwo+ICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGRzdF9ub2RlX3N0YXJ0ICs9IGN1cl9zaXplOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGRzdF9wYWdlX29mZnNldCA9IGRzdF9ub2RlX3N0YXJ0ICYg
KFBBR0VfU0laRSAtIDEpOwo+IC0tCj4gMi4xNy4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
