Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6B8184DE
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 07:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66DF894C3;
	Thu,  9 May 2019 05:35:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECC0894C3
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 05:35:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l2so1049788wrb.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 May 2019 22:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uYOMmLH6wwoS99OecycN4N06juOxktfaBSeqbrsxUKs=;
 b=o9GAG3J4mvF1An9cNN4bzUgMcQcHlK7jNRNk1695fMmAu4HVtpoRtiECnHXUYBcx2w
 92vUqJM71qoEgOimhRItyVBRHIx8zx0DFCtW0XZJoIN+jhzvMsOak1/6kjSzGVbugwyU
 rn8J9JOOP9I2MP1uvUccO/kIllDhBBchqu8JUjshR5UVBdYw8jhaSTZ4hWAQpyyE6dz2
 TWbxoUlND6yy3AzrUd0lsNYGgoOiqepxL1Voz2cxpNdn8uHE4VvgIC/Lhf3/LKjTGBI4
 7hfILtIVgGEn2wHHvN9Sb/kRIYusqsQYCQ1Wk/XqskrjQF2AYwWBOhE8BO4G5Ys69Rhg
 3pgA==
X-Gm-Message-State: APjAAAX6TnBhuzDUlj/0gjBhN14rct2LNS7usNmYxm7szwGP1dS5WJOo
 dMkJxELvxQzyfody0jXUWTVPi6FQRYBPjTO08eA=
X-Google-Smtp-Source: APXvYqzWWvtzqB33bVveM3Yd9EoOhhOI5H+aRBakGJ9qZ2tF7xRcwWT3jVYqxLij9/sXS7L/hQ2yDFnD8g7GMCAPHPo=
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr1211666wrq.317.1557380152711; 
 Wed, 08 May 2019 22:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190508064132.15971-1-evan.quan@amd.com>
In-Reply-To: <20190508064132.15971-1-evan.quan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 May 2019 01:35:40 -0400
Message-ID: <CADnq5_P1b90suvjiTd7DMHfGZhCL05U26QJJB5UsL5tJyF4=xg@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/amd/powerplay: valid Vega10
 DPMTABLE_OD_UPDATE_VDDC settings V2
To: Evan Quan <evan.quan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uYOMmLH6wwoS99OecycN4N06juOxktfaBSeqbrsxUKs=;
 b=Ura7a6hrh6QOG+OwfR3VIYruqpmnkCJ6ECc9N9By64p7BzAHKBf+nXwBc5ec+ou50C
 7HRRRE8Wb4QEi5OegtPio1+3bkdhMMkGI4ozeEPNJwYmuIqkWzbZ+kj2n6cfrMMy3/Gs
 9GKEtnwSmiCnI7GGWScA3/fdy/izkn3/+5UJXkJuhj7oS32DlzWe3iPN/Y25//Mn/nIS
 frnBRlFNymRaqEDazE90mJ9GjxQdzznupoIjZXSevNfR4uTbUoerPKzrYKCusdzYc5Qq
 eLUH/8tBkg80HTQTc1nlp7Vi4ps1Xp2sa9i9684TCzAUtC1ImhQ5Fd2r7pFUmg+s2xln
 4EJQ==
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgOCwgMjAxOSBhdCAyOjQxIEFNIEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5j
b20+IHdyb3RlOgo+Cj4gV2l0aCB1c2VyIHNwZWNpZmllZCB2b2x0YWdlKERQTVRBQkxFX09EX1VQ
REFURV9WRERDKSwgdGhlIEFWRlMKPiB3aWxsIGJlIGRpc2FibGVkLiBIb3dldmVyLCB0aGUgYnVn
Z3kgY29kZSBtYWtlcyB0aGlzIGFjdHVhbGx5IG5vdAo+IHdvcmtpbmcgYXMgZXhwZWN0ZWQuCj4K
PiAtIFYyOiBjbGVhciBhbGwgT0QgZmxhZ3MgZXhjcGV0IERQTVRBQkxFX09EX1VQREFURV9WRERD
Cj4KPiBDaGFuZ2UtSWQ6IElmYTgzYTYyNTViYjNmNmZhNGJkYjRkZTYxNjUyMWNiN2JhYjY4MzBh
Cj4gU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkFja2VkLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyB8IDkgKysrKy0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEw
X2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdt
Z3IuYwo+IGluZGV4IDEzOGY5ZjllYTc2NS4uMDVmNmJmN2Q3MDNlIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKPiBAQCAt
MjQ2NiwxMSArMjQ2Niw2IEBAIHN0YXRpYyB2b2lkIHZlZ2ExMF9jaGVja19kcG1fdGFibGVfdXBk
YXRlZChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybjsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+IC0KPiAtICAgICAgIGlmIChk
YXRhLT5uZWVkX3VwZGF0ZV9kcG1fdGFibGUgJiBEUE1UQUJMRV9PRF9VUERBVEVfVkREQykgewo+
IC0gICAgICAgICAgICAgICBkYXRhLT5uZWVkX3VwZGF0ZV9kcG1fdGFibGUgJj0gfkRQTVRBQkxF
X09EX1VQREFURV9WRERDOwo+IC0gICAgICAgICAgICAgICBkYXRhLT5uZWVkX3VwZGF0ZV9kcG1f
dGFibGUgfD0gRFBNVEFCTEVfT0RfVVBEQVRFX1NDTEsgfCBEUE1UQUJMRV9PRF9VUERBVEVfTUNM
SzsKPiAtICAgICAgIH0KPiAgfQo+Cj4gIC8qKgo+IEBAIC0zNjgzLDYgKzM2NzgsMTAgQEAgc3Rh
dGljIGludCB2ZWdhMTBfc2V0X3Bvd2VyX3N0YXRlX3Rhc2tzKHN0cnVjdCBwcF9od21nciAqaHdt
Z3IsCj4KPiAgICAgICAgIHZlZ2ExMF91cGRhdGVfYXZmcyhod21ncik7Cj4KPiArICAgICAgIC8q
Cj4gKyAgICAgICAgKiBDbGVhciBhbGwgT0QgZmxhZ3MgZXhjZXB0IERQTVRBQkxFX09EX1VQREFU
RV9WRERDLgo+ICsgICAgICAgICogVGhhdCB3aWxsIGhlbHAgdG8ga2VlcCBBVkZTIGRpc2FibGVk
Lgo+ICsgICAgICAgICovCj4gICAgICAgICBkYXRhLT5uZWVkX3VwZGF0ZV9kcG1fdGFibGUgJj0g
RFBNVEFCTEVfT0RfVVBEQVRFX1ZEREM7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+IC0tCj4gMi4y
MS4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
