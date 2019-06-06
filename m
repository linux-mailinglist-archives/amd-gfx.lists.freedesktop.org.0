Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2876A36B84
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 07:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D3489237;
	Thu,  6 Jun 2019 05:25:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534C689237
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 05:25:19 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id v186so714654oie.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 05 Jun 2019 22:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U78VXPux3r76fkTPf2NcR92O7OtIqWfSlpgMdm1/Q7s=;
 b=FJAzO6RUPAVCuV+EKoVVwlmh8GtoTJi4rKU9ZOAERDhrhtsvHE4Isbm7c76nfCRlEh
 Gc9TUsKcEqjLWtRkWrcDTyFpvf+s4SDFwGt3V6V1HKgpB/mvbbL94sipqs0EvWiEqBif
 mExW4YTkaWxZn48ixtAWY+JrdWc3X1XnAji/lW/JCwhWsuvrTBjzTk3cPnfgfDSRKBcz
 CR2o6lSsXK15yU+XxnH4zHIo0JUrZ0aOIUNWEwWZ166mSUurzBQvway9WBbe0tXT/qWt
 SHrQ1Au3L3/u+xDbNrX0ZHus7PDYmAtzGF7CO+nVAifMRff4CObvBxh3HKhHPoGd08cH
 9H6g==
X-Gm-Message-State: APjAAAUIJzwsNwZgm2MdbfYN1/qSR2nGqKXohFE9RFs18iZ7L8z4wVam
 TBdW8sUg5crJ5cbpfwjGAdXqa7t/137trq2WEtST4w==
X-Google-Smtp-Source: APXvYqzIzGfG/FcWYRo/sKS23AMXB4kqmAWOjhNsQKWfRhO5XIAs6LJzLZ06tEJiF0zb5Sb3OJ6X1589v+ZWjf40TTQ=
X-Received: by 2002:aca:6208:: with SMTP id w8mr11312302oib.128.1559798718502; 
 Wed, 05 Jun 2019 22:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190605191157.3134-1-alexander.deucher@amd.com>
 <CAPM=9twLRm41uHjsYn8KG-fsCrG=cdpQ8Jh1VJ1kBcFs2FFWYA@mail.gmail.com>
 <CADnq5_PdnFMjA4RqJgC6jo=Zc__t=z3deNYebbcvngc8UmV39Q@mail.gmail.com>
In-Reply-To: <CADnq5_PdnFMjA4RqJgC6jo=Zc__t=z3deNYebbcvngc8UmV39Q@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 6 Jun 2019 07:25:06 +0200
Message-ID: <CAKMK7uEQ_HvT1LBrBj2PO92XSUMyh9A3Vtc+NTFAnEmjBGY66w@mail.gmail.com>
Subject: Re: [pull] amdgpu, ttm drm-next-5.3
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=U78VXPux3r76fkTPf2NcR92O7OtIqWfSlpgMdm1/Q7s=;
 b=Grtd8dvtRUHUMI94BTcidfMzZWPjjzBF24crzxu7/m+dSpk8/yNanrbL2D5usZ+ezf
 9nYm8PrptkPh6ofynXqZBLcDk3UOh4Dg9XbJ4bWXlx1/wGv7KITJxVuNzExZ+9XSIYtE
 s7rwdx3FpjKlK7JG5/MQKpUpx0hjh2bdVL5jw=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCA1OjA1IEFNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDUsIDIwMTkgYXQgMTA6MzQgUE0gRGF2
ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIDYgSnVu
IDIwMTkgYXQgMDU6MTIsIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gSGkgRGF2ZSwgRGFuaWVsLAo+ID4gPgo+ID4gPiBNb3JlIG5ldyBzdHVm
ZiBmb3IgNS4zOgo+ID4gPgo+ID4gPiBhbWRncHU6Cj4gPiA+IC0gUmV2ZXJ0IHRpbWVsaW5lIHN1
cHBvcnQgdW50aWwgS0hSIGlzIHJlYWR5Cj4gPiA+IC0gVmFyaW91cyBkcml2ZXIgcmVsb2FkIGZp
eGVzCj4gPiA+IC0gUmVmYWN0b3IgY2xvY2sgaGFuZGxpbmcgaW4gREMKPiA+ID4gLSBBdXggZml4
ZXMgZm9yIERDCj4gPiA+IC0gQmFuZHdpZHRoIGNhbGN1bGF0aW9uIHVwZGF0ZXMgZm9yIERDCj4g
PiA+IC0gRml4IGRvY3VtZW50YXRpb24gZHVlIHRvIGZpbGUgcmVuYW1lCj4gPiA+IC0gUkFTIGZp
eAo+ID4gPiAtIEZpeCByYWNlIGluIGxhdGVfaW5pdAo+ID4gPgo+ID4gPiB0dG06Cj4gPiA+IC0g
QWxsb3cgZm9yIGJldHRlciBmb3J3YXJkIHByb2dyZXNzIHdoZW4gdGhlcmUgaXMgaGVhdnkgbWVt
b3J5IGNvbnRlbnRpb24KPiA+Cj4gPiBkaW06IDEzN2E3ZGE5MjU1NyAoIlJldmVydCAiZHJtL2Ft
ZGdwdTogYWRkIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FIHRvCj4gPiBhbWRncHUiIik6IG1hbmRh
dG9yeSByZXZpZXcgbWlzc2luZy4KPiA+IGRpbTogY2YyNWI2NDQ0Mzc2ICgiZ3B1OiBhbWRncHU6
IGZpeCBicm9rZW4gYW1kZ3B1X2RtYV9idWYuYwo+ID4gcmVmZXJlbmNlcyIpOiBTSEExIGluIGZp
eGVzIGxpbmUgbm90IGZvdW5kOgo+ID4gZGltOiAgICAgOTg4MDc2Y2Q4YzVjICgiZHJtL2FtZGdw
dTogcmVuYW1lIGFtZGdwdV9wcmltZS5bY2hdIGludG8KPiA+IGFtZGdwdV9kbWFfYnVmLltjaF0i
KQo+ID4KPiA+IFRoZSBmaXJzdCBJJ20gbm90IHdvcnJpZWQgYWJvdXQsIGJ1dCB0aGUgZml4ZXMg
bGluZSBzaG91bGQgYmUgZml4ZWQKPiA+IGJlZm9yZSBJIGNhbiBwdWxsIHRoaXMuCj4gPiAyZmJk
NmY5NGFjY2RiYjIyM2FjY2NhZGE2ODk0MGI1MGIwYzY2OGQ5IGlzIHRoZSB1cHN0cmVhbSBjb21t
aXQgaW4gbXkgdHJlZS4KPgo+IFdlaXJkLiAgZGltIGRpZG4ndCBjb21wbGFpbiB3aGVuIEkgcmFu
IGl0LiAgSSBndWVzcyB0aGUgb2xkIGNvbW1pdAo+IGhhcHBlbmVkIHRvIGJlIGluIG15IHJlcG8u
ICBJJ2xsIGZpeCBpdCB1cC4KCkkgc2hvdWxkIGNoZWNrIGFsc28gdGhhdCBpdCdzIGFuIGFuY2Vz
dG9yIGNvbW1pdCwgbm90IGp1c3QgdGhhdCBpdCdzCmluIHRoZSByZXBvIChidXQgdGhhdCdzIGEg
ZmV3IGNvbmRpdGlvbnMgbGF0ZXIgb24sIGZvciBEYXZlIGl0Cm9idmlvdXNseSBmYWlsZWQgZWFy
bGllcikuIFNpbmNlIGl0J3MgYSBicmFuY2ggbm90IGEgdGFnIEkgY2FuJ3QgcHVsbAp0aGUgb2xk
IHZlcnNpb24gYW55bW9yZSBhbmQgdGFrZSBhIGxvb2sgYW5kIGZpZ3VyZSBvdXQgd2hhdCBtaWdo
dCBiZQp0aGUgcmVhc29uLCBidXQgdGhpcyBzaG91bGQgaGF2ZSB3b3JrZWQuCi1EYW5pZWwKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAo
MCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
