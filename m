Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FB26364E
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 14:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCE889991;
	Tue,  9 Jul 2019 12:59:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006EC89991
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 12:59:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h19so2376207wme.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 09 Jul 2019 05:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YSLOraJmg1ZUca4uoReiwytWdx4cSpQmsAbpFlVOiSc=;
 b=JA06UxOyX+dSWwLZ/y8I7uMQGkt/stWgA6xQat0IBWGVqupmmbZ3RkUFApH37gUrOi
 lvKNHwFECcPW2mB+1tDLLNs5FvvyZAedFIcn7UwMAQfE3Qz7vSWKKId8r+knxgRJW3N3
 CnoH3wdh5hpp8zHes7gAZlUAxxHTagRo+VaRzRZlddCaWMLAjaoYYQMSoq5Efs75TFN5
 1Djotr1FpL4TIW+OaKjEK5iB+zPccUI9G6qkBjK481oK8zMj7cYjvj9dW8+suP2VPsjF
 VJXkO7lqUF/OyOu7X23GJr7FGjL0IwooLjOeHPCRdy8UlYapSdSEv6FWLpLmmyUnRvEj
 9mJQ==
X-Gm-Message-State: APjAAAXhIt5rIiuswwQTpYRSyso9IOy7Lx+paJHJ5tPsYhXOgSDiVrFw
 DWmL2mnV3B80zbODwzh5UECZuZ81JWBxEAkPNO4=
X-Google-Smtp-Source: APXvYqwtpjt/q1tu3OCIj/xfm3Mzbxyid9s4U8Fr88m0Q77E4hLmNoVM5+R3nI83+4wkDYdwOkzxZGdxriUdcCInCmk=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr23561790wmk.127.1562677189595; 
 Tue, 09 Jul 2019 05:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190709053222.22588-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190709053222.22588-1-Felix.Kuehling@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Jul 2019 08:59:37 -0400
Message-ID: <CADnq5_M8dWR8HiCQoEikLDm7EKjPt3Qp8c3NK1ZA68QXOnp_2w@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for
 sensitive data
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YSLOraJmg1ZUca4uoReiwytWdx4cSpQmsAbpFlVOiSc=;
 b=nfTT0ATo4e9S1VRcR7QxTiRy8LC+l8UQ9URVphHIK8HtqlpenuKj2Bszna7Alq8gXI
 yHWvSnUrjMeR4TGmXqau8hzN2LHvCAc/Jy69DMDPfJWvHTL3c/sb5PQ6jCjkrqMQM0tP
 AJ5o++DxCSoUsR3JcX0iHPaya/kqQLSaakXEEPTwUY2DlRbbXVoUm4uiwfIsJOo2l521
 JtOXsqv9uwERnML5LfGZtONqfW9/A/QllF4rguqMBc1qdDZLwWGycnX0w7Z3BLVua2zz
 eZEVGe91LnmsnSmK7OjA0EJsaMVdC8lwyRkrO5uRC8bxwU3uXhlo6Gix2a8+9N+MnoL8
 VdCQ==
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

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCAxOjMyIEFNIEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIG1lbW9yeSBhbGxvY2F0aW9uIGZsYWcgd2ls
bCBiZSB1c2VkIHRvIGluZGljYXRlIEJPcyBjb250YWluaW5nCj4gc2Vuc2l0aXZlIGRhdGEgdGhh
dCBzaG91bGQgbm90IGJlIGxlYWtlZCB0byBvdGhlciBwcm9jZXNzZXMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiAtLS0KPiAgaW5j
bHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2Ry
bS5oIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKPiBpbmRleCA2MTg3MDQ3OGJjOWMu
LjU4NjU5YzI4YzI2ZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0u
aAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCj4gQEAgLTEzMSw2ICsxMzEs
MTAgQEAgZXh0ZXJuICJDIiB7Cj4gICAqIGZvciB0aGUgc2Vjb25kIHBhZ2Ugb253YXJkIHNob3Vs
ZCBiZSBzZXQgdG8gTkMuCj4gICAqLwo+ICAjZGVmaW5lIEFNREdQVV9HRU1fQ1JFQVRFX01RRF9H
Rlg5ICAgICAgICAgICAgICgxIDw8IDgpCj4gKy8qIEZsYWcgdGhhdCBCTyBtYXkgY29udGFpbiBz
ZW5zaXRpdmUgZGF0YSB0aGF0IG11c3QgYmUgY2xlYXJlZCBiZWZvcmUKPiArICogcmVsZWFzaW5n
IHRoZSBtZW1vcnkKPiArICovCj4gKyNkZWZpbmUgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9TRU5T
SVRJVkUgICAgICAgKDEgPDwgOSkKCklmIHdlIGRlY2lkZSB0byBnbyB0aGlzIHJvdXRlLCBJJ2Qg
bGlrZSB0byBtYWtlIHRoaXMgZmxhZyBtb3JlIGV4cGxpY2l0LiAgRS5nLiwKCkFNREdQVV9HRU1f
Q1JFQVRFX1ZSQU1fQ0xFQVJfT05fRlJFRQoKQWxleAoKPgo+ICBzdHJ1Y3QgZHJtX2FtZGdwdV9n
ZW1fY3JlYXRlX2luICB7Cj4gICAgICAgICAvKiogdGhlIHJlcXVlc3RlZCBtZW1vcnkgc2l6ZSAq
Lwo+IC0tCj4gMi4xNy4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
