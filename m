Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36074B60EB
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 11:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA796EE99;
	Wed, 18 Sep 2019 09:59:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA826EE99
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 09:59:44 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a22so6601664ljd.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 02:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odPvXU+gL6pgA2w4slXkk/dSyt+IkkRdXPCWJ/ob6Hg=;
 b=je9HSUESzRnaAL2lZclXNyUlm10FTlOi/ViELMhF/2cEnRpPX/LTy1zviQSomZQaEO
 9vMmXNaMYWWUg4okgMMQ2JqnZaRMSZa2lIa86NQ0pzsjGtIuZz8V1k7xcNomWhyvFw9P
 yCY9Q4bEASfpJ16D6E5+6R9AmDazR1BZDWSDBaoeqpmtM9RGdmm3OzXb3d+vT7sEQFgO
 eAtyjq8E7fUaDuATMj0YT6L+5BZUp4Sqbrenth4YEtY1T/5UobasB1lNxohfxQbI1HkW
 FjZYbrF1LW8Jfa1fRmC6Mm9dAN8ERwdeSLQCAnMxiTVowAReUQWYtXqnPyqClvNZZw6F
 UIxw==
X-Gm-Message-State: APjAAAU/GZlUhvLk3qiEJ+MMJAplEWaTE08AFrqR5iWcIUawaCJc3ZpH
 tcXf+SYOZK7PYpvEcfOT8utgQAoq2kuN3VkLFj1Z6g==
X-Google-Smtp-Source: APXvYqzv4YZvB/cbUQ9Dnb8Gy1l821fE3G3BBCmTRD7WMB89uZJqRr4jrG42Bhiq3tB1H/5sgvFzVNHQT4yrijXs7dQ=
X-Received: by 2002:a2e:9708:: with SMTP id r8mr1688599lji.58.1568800783039;
 Wed, 18 Sep 2019 02:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190902030915.20116-1-airlied@gmail.com>
 <BN6PR12MB1809BC6D87E3E4C564CB0CB8F7B40@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809BC6D87E3E4C564CB0CB8F7B40@BN6PR12MB1809.namprd12.prod.outlook.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 18 Sep 2019 19:59:31 +1000
Message-ID: <CAPM=9tz8BqBZomce4cS-wDNHMiV9wVGNNX8pRMaWwv2-MzobCg@mail.gmail.com>
Subject: Re: [PATCH] radeon: add option so DVI always respect HPD over DDC
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=odPvXU+gL6pgA2w4slXkk/dSyt+IkkRdXPCWJ/ob6Hg=;
 b=KZuusNIPDiJpuekQZjhdFbF1SFvE1yp4HAyst5kfSgj9yd6eJp3/l92GTtzZ81LBCZ
 cWEbC+3L5RNhcxxZfqIPqD9ta4pAsnJqHWvrBXBJ2triThwcCKV5EmxjBwAftuDwSf6S
 wqT+H0LgC0TYU9JFai9megTH7lngrbr8P7T7WqYzoiY5AtCylzACDjRIhnYwryYsiKGd
 fPJqA2YsU798gNIuiJsZOA8BaGhEMHWP941WdIZKiqy+4QFtThwFltUdfcROvDP+wSHg
 sOizV1PEs2jPiOuSDjOFYfgPyMhkvKgAbE5Xw6w0EfuXDxJuUo8VCexOrEDE37WInhpL
 hAgw==
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

T24gTW9uLCA5IFNlcCAyMDE5IGF0IDA4OjUyLCBEZXVjaGVyLCBBbGV4YW5kZXIKPEFsZXhhbmRl
ci5EZXVjaGVyQGFtZC5jb20+IHdyb3RlOgo+Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQo+ID4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz4gT24gQmVoYWxmIE9mCj4gPiBEYXZlIEFpcmxpZQo+ID4gU2VudDogU3VuZGF5LCBTZXB0ZW1i
ZXIgMSwgMjAxOSAxMTowOSBQTQo+ID4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gPiBTdWJqZWN0OiBbUEFUQ0hdIHJhZGVvbjogYWRkIG9wdGlvbiBzbyBEVkkgYWx3YXlzIHJl
c3BlY3QgSFBEIG92ZXIgRERDCj4gPgo+ID4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVk
aGF0LmNvbT4KPiA+Cj4gPiBQdXJlbGluayBGWC1EMTIwIChEVkkgb3ZlciBmaWJyZSBleHRlbmRl
ZGVycykgZHJpdmUgdGhlIEhQRCBsaW5lIGxvdyBvbiB0aGUKPiA+IEdQVSBzaWRlIHdoZW4gdGhl
IG1vbml0b3Igc2lkZSBkZXZpY2UgaXMgdW5wbHVnZ2VkIG9yIGxvc2VzIHRoZSBjb25uZWN0aW9u
Lgo+ID4gSG93ZXZlciB0aGUgR1BVIHNpZGUgZGV2aWNlIHNlZW1zIHRvIGNhY2hlIEVESUQgaW4g
dGhpcyBjYXNlLiBQZXIgRFZJIHNwZWMKPiA+IHRoZSBIUEQgbGluZSBtdXN0IGJlIGRyaXZlbiBp
biBvcmRlciBmb3IgRURJRCB0byBiZSBkb25lLCBidXQgd2UndmUgbWV0Cj4gPiBlbm91Z2ggYnJv
a2VuIGRldmljZXMgKG1haW5seQo+ID4gVkdBLT5EVkkgY29udmVydG9ycykgdGhhdCBkbyB0aGUg
d3JvbmcgdGhpbmcgd2l0aCBIUEQgdGhhdCB3ZSBpZ25vcmUKPiA+IGl0IGlmIGEgRERDIHByb2Jl
IHN1Y2NlZWRzLgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWRkcyBhbiBvcHRpb24gdG8gdGhlIHJhZGVv
biBkcml2ZXIgdG8gYWx3YXlzIHJlc3BlY3QgSFBEIG9uIERWSQo+ID4gY29ubmVjdG9ycyBzdWNo
IHRoYXQgaWYgdGhlIEhQRCBsaW5lIGlzbid0IGRyaXZlbiB0aGVuIEVESUQgaXNuJ3QgcHJvYmVk
Lgo+Cj4gUHJvYmFibHkgY2xlYW5lciB0byBtYWtlIHRoaXMgYSBjb25uZWN0b3IgcHJvcGVydHkg
cmF0aGVyIHRoYW4gYSBnbG9iYWwgZW5hYmxlLCBidXQgSSdtIG5vdCB0b28gcHJlc3NlZCBlaXRo
ZXIgd2F5LgoKSnVzdCB3YW50ZWQgYSB3YXkgdG8gbGV0IHRoZW0gc2V0IGl0IG9uIHRoZSBjb21t
YW5kIGxpbmUsIHJhdGhlciB0aGFuCnJ1biBhIHNjcmlwdCBhdCBib290dXAsIGJ1dCBtYXliZSBp
dCdzIGNsZWFuZXIsIHdpbGwgbG9vayBpbnRvIGl0IGEKYml0IG1vcmUuCgpEYXZlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
