Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC38DE4C
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 22:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E4689C0D;
	Wed, 14 Aug 2019 20:04:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44E089C0D
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 20:04:31 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p77so4041865wme.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 13:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NiNfPrdSOd5tW/XbR/jBz6rnFliVsxPahF57nhCnLFk=;
 b=h2/jevJbNwuZtSv9xinPxs0gxzYxIfLOQa1nS+3bo9CZ5cs/FJGwV2I706KMUQBHoy
 MqbZNLiBK+IWkBASUzQPsGMH0Y4dC83IF3wR2Ee+0vBC5tebff57/kVMwl3wFLYRAvni
 h/qrEbmexMzhlrrFfGvUINJcYvjbskPYlRqlTTFpJOkWWoF7MH1lSyNyFFdHcbXncRN9
 9MZh/ZarNfrpwVth4Inh3KLf+BXloxP+xFQipyqsqKGL5PUpj2GCSWkM3vhfOrGlIvsB
 uzHSbb5bSdqXYOYQ0D+cq1Sm0CA9EJLZgNvPE54G0rtM53lc89ceq6OApRofuU65U7EC
 VLlA==
X-Gm-Message-State: APjAAAXj84OPdwEzfUhP96rJ6yscVanSq/llGUzwksE3a7oUZfBNz6ep
 6uxv+b+B9N26oiMYKnsD/Jp9kblg5/Ii8Xli2PI5qA==
X-Google-Smtp-Source: APXvYqx2LR1Yl/o39yQy7zCxu714VQdbpHiB3bms6GCVQLgvJEsje2o0qfcTNqRteKXfr0Mn2fIaTSR4zKnFRe79Zkw=
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr747811wml.102.1565813070338; 
 Wed, 14 Aug 2019 13:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <1565812414-26117-1-git-send-email-andrey.grodzovsky@amd.com>
 <1565812414-26117-2-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1565812414-26117-2-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 Aug 2019 16:04:19 -0400
Message-ID: <CADnq5_PxNzEa7Wfx-1DmVNh3Bj_D8UcLNaNNqgZiVn_OGn6sqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amd/powerplay: Fix meaning of 0x1E PPSMC_MSG
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NiNfPrdSOd5tW/XbR/jBz6rnFliVsxPahF57nhCnLFk=;
 b=dRQVIMMDATTXsSDKFMD6qg5GYhECR1j58MqspXWtNv6cq9JUSjYWgmCFQC48kZSzYV
 xxYDWnJIxnKM/42rugJy+ttaA83IEOQ/tbBaU3GWm9i+XDqKO36hOjaPAUX+l+rdMCrE
 JCDYkmUeVT60ulXTPyAfE1Kiyo/J3/ynRPNk6Evm+ykyvjzrxU8sDpubdyWuYRzHxiTO
 frtjz/tYAL4o9nYEfO8I4zAufS0zwvxSJJq84l3fndmbzLaJ2Dr6WXhO1082MP0/p/dL
 J80P8SBgMOflc1pdZIfgJw5voD6OlI1FuNsm1OepuWfqMGCdRKuUA/qNqcsXlEDRGvhC
 xf4g==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <evan.quan@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMzo1MyBQTSBBbmRyZXkgR3JvZHpvdnNreQo8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4gd3JvdGU6Cj4KPiBCeSBjb21wYXJpbmcgdG8gd2luZG93cyBp
dCBtZWFucyBBU0lDIHJlc2V0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kg
PGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaW5jL3J2X3Bwc21jLmggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2luYy9ydl9wcHNtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL3J2X3Bwc21jLmgKPiBpbmRleCA5MDg3OWU0Li5kZjQ2NzdkIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9ydl9wcHNtYy5oCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3J2X3Bwc21jLmgKPiBAQCAtNTksNyArNTks
NyBAQAo+ICAjZGVmaW5lIFBQU01DX01TR19TZXREcml2ZXJEcmFtQWRkckxvdyAgICAgICAgICAw
eDFCCj4gICNkZWZpbmUgUFBTTUNfTVNHX1RyYW5zZmVyVGFibGVTbXUyRHJhbSAgICAgICAgIDB4
MUMKPiAgI2RlZmluZSBQUFNNQ19NU0dfVHJhbnNmZXJUYWJsZURyYW0yU211ICAgICAgICAgMHgx
RAo+IC0jZGVmaW5lIFBQU01DX01TR19Db250cm9sR2Z4Uk0gICAgICAgICAgICAgICAgICAweDFF
Cj4gKyNkZWZpbmUgUFBTTUNfTVNHX0RldmljZURyaXZlclJlc2V0ICAgICAgICAgICAgIDB4MUUK
PiAgI2RlZmluZSBQUFNNQ19NU0dfU2V0R2Z4Y2xrT3ZlcmRyaXZlQnlGcmVxVmlkICAgMHgxRgo+
ICAjZGVmaW5lIFBQU01DX01TR19TZXRIYXJkTWluRGNlZmNsa0J5RnJlcSAgICAgICAweDIwCj4g
ICNkZWZpbmUgUFBTTUNfTVNHX1NldEhhcmRNaW5Tb2NjbGtCeUZyZXEgICAgICAgIDB4MjEKPiAt
LQo+IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
