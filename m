Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A52E270
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 18:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEACE6E119;
	Wed, 29 May 2019 16:42:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F186C6E115;
 Wed, 29 May 2019 16:42:53 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id w127so1044995yba.0;
 Wed, 29 May 2019 09:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i1abKtipxDqtMm+aW1zsKLMCmM/hhkvgaB2Yn0xf76U=;
 b=mIChAYKxBIVqSu4CytEDPlsPWFgf1zNNWSGok/agvrJ6h8Cpg9Uhvg+Qjl8Yv9Efv9
 SuOslhbPnSr/LNJbrEZSwiYU/OxLiueUDYxwbcp4pvTGQcIOUmC7YwoQ1elbJYY1lbw4
 rwXunmYwFEY3rXfVry4NdPIy0bprTt5a93i8ksb0p66CBYFv43wwG88kigP+2l2Q+8fC
 eEe3a4ni6YfTb1+CiP3b4i0FEHfVPDUq0WyeOq+QaRH6hNhZHYMV99DmFKn/eH+uIob/
 STP9nzIs9ZbcRgtJKJsLivOe1Jnio5N7RHoSQoFn4LnMtvCrTX/PHzoguGgev5A/xetk
 MZ7w==
X-Gm-Message-State: APjAAAXfQ+YxGG99odt3Kfpec5GkB2km4+Pu4uVDdkH/sugGJC6zMGLL
 vmNa1L+QZACrHVnctvnEg7SiUd6nOLeiku5+vfk=
X-Google-Smtp-Source: APXvYqzKwHwOXjxk1hHc3Ze+gVbwZLl1kp615n7jxilSmT1EUP5A8ZJAVPahMmsLanNyLjrixL0hWFNpIe2XyqylLN8=
X-Received: by 2002:a5b:908:: with SMTP id a8mr12512633ybq.273.1559148172624; 
 Wed, 29 May 2019 09:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <1559140180-6762-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1559140180-6762-1-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 May 2019 12:42:40 -0400
Message-ID: <CADnq5_PoQ-+rmbr4Rq_DefyPcw+gUz8a5nL_YUEbHhXmzGQc=g@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix make htmldocs warnings.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=i1abKtipxDqtMm+aW1zsKLMCmM/hhkvgaB2Yn0xf76U=;
 b=jaYtfhkfTwk3lTH9MVzcSRwsTIzn8aLSyyuo19WIFHOuUCankCRupnr0Odj2Vdhyff
 4YqO8oDRetn5VrBBBH1c/p6Hkdd8vd9Yo8Tp6oHSZBz1nDHAYLydVicarcuYW1tFDiV0
 GlYRKDNOrfvlVXQD8m0aUKOifVNUvFuMEL9dHJaDPB78Mqv+GGeILoV1eU06Q7Ln4A2t
 TFQ88fQTRXQ2Qx0iT+wGF1oU+an9CIJxU69aXDgcpeiwuc4pa2U7u71QUfoIDY7EKMzL
 DBbGn8vfiWsuOhu+vPA+Qjsp6Bmh5QV9M4Sn4Nk59yy4u6wMFPX1UCW5I4mawjg3j/bS
 soeg==
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
Cc: Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTA6MjkgQU0gQW5kcmV5IEdyb2R6b3Zza3kKPGFuZHJl
eS5ncm9kem92c2t5QGFtZC5jb20+IHdyb3RlOgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdy
b2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKSSdsbCBwdXNoIGl0IHRvIGRybS1t
aXNjIGluIGEgbWludXRlIHVubGVzcyB5b3UgaGF2ZSBjb21taXQgcmlnaHRzLgoKQWxleAoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAyICsrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jCj4gaW5kZXggNDllN2QwNy4uYzEwNThlZSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gQEAgLTM1Myw2ICszNTMsNyBAQCBFWFBPUlRfU1lN
Qk9MKGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSk7Cj4gICAqIGRybV9zY2hlZF9zdG9wIC0gc3Rv
cCB0aGUgc2NoZWR1bGVyCj4gICAqCj4gICAqIEBzY2hlZDogc2NoZWR1bGVyIGluc3RhbmNlCj4g
KyAqIEBiYWQ6IGpvYiB3aGljaCBjYXVzZWQgdGhlIHRpbWUgb3V0Cj4gICAqCj4gICAqIFN0b3Ag
dGhlIHNjaGVkdWxlciBhbmQgYWxzbyByZW1vdmVzIGFuZCBmcmVlcyBhbGwgY29tcGxldGVkIGpv
YnMuCj4gICAqIE5vdGU6IGJhZCBqb2Igd2lsbCBub3QgYmUgZnJlZWQgYXMgaXQgbWlnaHQgYmUg
dXNlZCBsYXRlciBhbmQgc28gaXQncwo+IEBAIC00MjIsNiArNDIzLDcgQEAgRVhQT1JUX1NZTUJP
TChkcm1fc2NoZWRfc3RvcCk7Cj4gICAqIGRybV9zY2hlZF9qb2JfcmVjb3ZlcnkgLSByZWNvdmVy
IGpvYnMgYWZ0ZXIgYSByZXNldAo+ICAgKgo+ICAgKiBAc2NoZWQ6IHNjaGVkdWxlciBpbnN0YW5j
ZQo+ICsgKiBAZnVsbF9yZWNvdmVyeTogcHJvY2VlZCB3aXRoIGNvbXBsZXRlIHNjaGVkIHJlc3Rh
cnQKPiAgICoKPiAgICovCj4gIHZvaWQgZHJtX3NjaGVkX3N0YXJ0KHN0cnVjdCBkcm1fZ3B1X3Nj
aGVkdWxlciAqc2NoZWQsIGJvb2wgZnVsbF9yZWNvdmVyeSkKPiAtLQo+IDIuNy40Cj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
