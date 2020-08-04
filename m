Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF25C23BEEA
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Aug 2020 19:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6666489DF7;
	Tue,  4 Aug 2020 17:35:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A14789DF7
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Aug 2020 17:35:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id x5so3432336wmi.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Aug 2020 10:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=moikFXOUhYzWQlP6dimVGVbv0r7k/XVQZmJnqhWPu4c=;
 b=V1nDuZ25O0PxeiQtLIaZAhNnvEWTwpWEqmcwbqZXIGIV1wLN75RbJn8XiVjGFDVHq2
 0h/UvbetJ/vKWIXyQZqVcAsJXM3YrKZnrXb6wAF9TdQe6Hr2JxoPWLTnheeGYTQH3zKW
 367M/mPianzzmOblBmBgUE/8dfJB940XB8g+zxpra9nvIJdRUDo/4bHsYxv29FDgThUv
 3RGhqGsMxzeBwtmsHi3Npi1ONZNoTXH2gx6lw89Q5aQGe05Qve39mol0zjXrAZ4c4NyZ
 uLVfT190rMm01myRHsLrt1VuUMKcQIttCJ1/Nyec/MoogWYYRwjj/mQIy2Vw0yeaa9aB
 H8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=moikFXOUhYzWQlP6dimVGVbv0r7k/XVQZmJnqhWPu4c=;
 b=cQgudnubOPolyq9wWyhEwpo81meTQmbVnje8MFZBis5lg3yAJ7BH8ew/xrHpsaxmmG
 P87GozeT9+Ivql1/WML0WucAoO5E+PQ/2XgwWZeye+uorWZy+i/Jr1jDTqWNZNekkRmK
 zogHw1R/V5RMr/kIhYDAzG8dTAY0oNFAJTUSO8vIpmM1wMjc1VMNaQI1N5QQC2ThnGdR
 o9KfWsLOe4x5tDrG7ViLuCx/ir8i21EjxvhlIaobqmm6vvPnrfBcI10YtwQBJ5lxf0g2
 6+CHMADPNiQXVwdEZitTjO+6se70S6lVNuBKafMEyL65u4MQW8YSbW/R/1gw0+9sI0CV
 Y42w==
X-Gm-Message-State: AOAM532seCoIjb4PObAlY0rh+CvMET6xo7T7cq+v42q3ttkvCF0ifabD
 Sq7P/Bsu96f5rRs5Q14FBABr4bKV8C8mWkz+b052FQ==
X-Google-Smtp-Source: ABdhPJxgGwQiirTo7V3+QPgor1qpMTPdnHo64FohB/ciOJ00m6eNoCx0X1DpNkYULLtapgHJO4VXPmiFoDfmrWbHKas=
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr4970880wmh.39.1596562556894; 
 Tue, 04 Aug 2020 10:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAP+8YyHwMPPTiPAEs0CV+K+NSWtQmKQ-1hL0CmoGvUjA=P_1+Q@mail.gmail.com>
 <6964a9dc-00dc-6e72-f3ad-b4c80c49ec68@daenzer.net>
In-Reply-To: <6964a9dc-00dc-6e72-f3ad-b4c80c49ec68@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 Aug 2020 13:35:46 -0400
Message-ID: <CADnq5_OzAfTyufz0qzOQYqMbkYYGx6FaFLi-nvRvvzLcYrFQcQ@mail.gmail.com>
Subject: Re: Enabling AMDGPU by default for SI & CIK
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, "Koenig,
 Christian" <christian.koenig@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNCwgMjAyMCBhdCA0OjM4IEFNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFl
bnplci5uZXQ+IHdyb3RlOgo+Cj4gT24gMjAyMC0wOC0wMyAxOjQ1IGEubS4sIEJhcyBOaWV1d2Vu
aHVpemVuIHdyb3RlOgo+ID4gSGkgYWxsLAo+ID4KPiA+IE5vdyB0aGF0IHdlIGhhdmUgcmVjZW50
bHkgbWFkZSBzb21lIHByb2dyZXNzIG9uIGdldHRpbmcgZmVhdHVyZSBwYXJpdHkKPiA+IHdpdGgg
dGhlIFJhZGVvbiBkcml2ZXIgZm9yIFNJLCBJJ20gd29uZGVyaW5nIHdoYXQgaXQgd291bGQgdGFr
ZSB0bwo+ID4gbWFrZSBBTURHUFUgdGhlIGRlZmF1bHQgZHJpdmVyIGZvciB0aGVzZSBnZW5lcmF0
aW9ucy4KPiA+Cj4gPiBBcyBmYXIgYXMgSSB1bmRlcnN0YW5kIEFNREdQVSBoYXMgaGFkIHRoZXNl
IGZlYXR1cmVzIGZvciBDSUsgZm9yIGEKPiA+IHdoaWxlIGFscmVhZHkgYnV0IGl0IGlzIHN0aWxs
IG5vdCB0aGUgZGVmYXVsdCBkcml2ZXIuIFdoYXQgd291bGQgaXQKPiA+IHRha2UgdG8gbWFrZSBp
dCB0aGUgZGVmYXVsdD8gV2hhdCBpcyBtaXNzaW5nIGFuZC9vciBicm9rZW4/Cj4KPiBUaGUgbWFp
biBibG9ja2VycyBJJ20gYXdhcmUgb2YgZm9yIENJSyBhcmU6Cj4KPiAxKSBMYWNrIG9mIGFuYWxv
Z3VlIGNvbm5lY3RvciBzdXBwb3J0IHdpdGggREMKPiAyKSBMYWNrIG9mIEhETUkvRFAgYXVkaW8g
c3VwcG9ydCB3aXRob3V0IERDCj4KPgo+IDEpIG1heSBhcHBseSB0byBTSSBhcyB3ZWxsLgoKQWxz
bywgSUlSQywgdGhlcmUgYXJlIHN1c3BlbmQgYW5kIHJlc3VtZSBwcm9ibGVtcyB3aXRoIHNvbWUg
Q0lLIHBhcnRzCnVzaW5nIGFtZGdwdS4KCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cg==
