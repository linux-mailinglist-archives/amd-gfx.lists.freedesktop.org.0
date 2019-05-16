Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8B21FDB4
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 04:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEFD89259;
	Thu, 16 May 2019 02:19:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AEE89259
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 02:19:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m3so1341914wrv.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 19:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yHyglIhbe5g9Qi9fKRSI1dnBRhXMCy8Gb+qV4Pa7Oks=;
 b=ijHKEk9bT7mIqMIOir3OAfkgWY7ruLVDr21fVXHeuivqM6FFF57ZH2syqp0JYP+aQS
 m/Lmko5fqoMuuenwI5XxKfAoT1a3NkBQVFrhrbizOZoKDFHNMXAnFF7VhwFPEnZgDlSw
 t77qi6MwXOs86aez54tPT8a+dssbWBhar2lRV7dAXK4ww8zlyGZ2LG4wruY0Oixtckmi
 cOyxSKpFhjYV9+Q2FEc/kUnuY/kZ8q1FFO4l3xCk8ZwQdtUmzeEUYFMXShphQ0Fo2B8L
 qhMhjIb3VVEb2QkMTC3oncbV+YpQzgrZ9GRygvicwT3kB6VQvTSUTEdMZ+oyRb/nO0sV
 qumA==
X-Gm-Message-State: APjAAAV31sBRl3pJcXJGhkMC5blGpPSpHn+mUQE/8JtZYGHTXWZbbe24
 M1TEbUfL7qzprwzUYYkUgl5Dzxqvgf505B6e8UQ=
X-Google-Smtp-Source: APXvYqyZ32ZLu/zmTjye+CVbO6YHjYF8fTgWFVqLQbPhN+LHmqFdCKIlcrWBY0E/CVZI5mvYzT8cBOeWcfkVKK99qfM=
X-Received: by 2002:adf:b641:: with SMTP id i1mr935813wre.288.1557973156678;
 Wed, 15 May 2019 19:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-EccO1ue5hTtJ8m4utQp+8dSsWm60JFA5YOT1gCODnYcFUog@mail.gmail.com>
In-Reply-To: <CAJ-EccO1ue5hTtJ8m4utQp+8dSsWm60JFA5YOT1gCODnYcFUog@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 May 2019 22:19:04 -0400
Message-ID: <CADnq5_N=-cWz99T4ma_=6-_bu-Ty2twsFt=KGtzTdWn1hcDSrA@mail.gmail.com>
Subject: Re: GPU passthrough support for Stoney [Radeon R2/R3/R4/R5 Graphics]?
To: Micah Morton <mortonm@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yHyglIhbe5g9Qi9fKRSI1dnBRhXMCy8Gb+qV4Pa7Oks=;
 b=HR4bombvrmglI/PbgivW8MEsUnLqEBfCO9560cCNxAqs8HI2Q6jKlljbsZ/4RKCMGo
 9SElZ1uyH/SENUDfVlfdUbDq05qhiqA62Ny0GmIxXce+c9fJ83vTx+DJ8j1m44UAxheq
 uuleSap+4ai+qZDj240x1MFUYx+7gM56WwlWNGtCLXeuHe71S3/L0tou+YVww+xaaF6Z
 /cA/mq04BoX2XQytjCZbiO8paJbUVFFriuvNpENt8GhVttrW3/VYwpfhLaj+Q4ufMT02
 tLVQBKBWml4oolNBzwpGxxChtfyNuWUzYIE4MwbBjpBtTgUkFb+iKCh4bl3cP3XRL8vP
 bAKQ==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMjoyNiBQTSBNaWNhaCBNb3J0b24gPG1vcnRvbm1AY2hy
b21pdW0ub3JnPiB3cm90ZToKPgo+IEhpIGZvbGtzLAo+Cj4gSSdtIGludGVyZXN0ZWQgaW4gcnVu
bmluZyBhIFZNIG9uIGEgc3lzdGVtIHdpdGggYW4gaW50ZWdyYXRlZCBTdG9uZXkKPiBbUmFkZW9u
IFIyL1IzL1I0L1I1IEdyYXBoaWNzXSBjYXJkIGFuZCBwYXNzaW5nIHRocm91Z2ggdGhlIGdyYXBo
aWNzCj4gY2FyZCB0byB0aGUgVk0gdXNpbmcgdGhlIElPTU1VLiBJJ20gd29uZGVyaW5nIHdoZXRo
ZXIgdGhpcyBpcyBmZWFzaWJsZQo+IGFuZCBzdXBwb3NlZCB0byBiZSBkb2FibGUgd2l0aCB0aGUg
cmlnaHQgc2V0dXAgKGFzIG9wcG9zZWQgdG8gcGFzc2luZwo+IGEgZGlzY3JldGUgR1BVIHRvIHRo
ZSBWTSwgd2hpY2ggSSB0aGluayBpcyBkZWZpbml0ZWx5IGRvYWJsZT8pLgo+Cj4gU28gZmFyLCBJ
IGNhbiBkbyBhbGwgdGhlIHFlbXUva3ZtL3ZmaW8vaW9tbXUgc3R1ZmYgdG8gcnVuIHRoZSBWTSBh
bmQKPiBwYXNzIHRoZSBpbnRlZ3JhdGVkIEdQVSB0byBpdCwgYnV0IHRoZSBkcm0gZHJpdmVyIGlu
IHRoZSBWTSBmYWlscwo+IGR1cmluZyBhbWRncHVfZGV2aWNlX2luaXQoKS4gU3BlY2lmaWNhbGx5
LCB0aGUgbG9ncyBzaG93IHRoZSBTTVUgYmVpbmcKPiB1bnJlc3BvbnNpdmUsIHdoaWNoIGxlYWRz
IHRvIGEgJ1NNVSBmaXJtd2FyZSBsb2FkIGZhaWxlZCcgZXJyb3IKPiBtZXNzYWdlIGFuZCBrZXJu
ZWwgcGFuaWMuIEkgY2FuIHNoYXJlIFZNIGxvZ3MgYW5kIHRoZSBpbnZvY2F0aW9uIG9mCj4gcWVt
dSBhbmQgc3VjaCBpZiBoZWxwZnVsLCBidXQgZmlyc3Qgd2FudGVkIHRvIGtub3cgYXQgYSBoaWdo
IGxldmVsIGlmCj4gdGhpcyBzaG91bGQgYmUgZmVhc2libGU/Cj4KPiBQLlMuOiBJJ20gbm90IGlu
aXRpYWxpemluZyB0aGUgR1BVIGluIHRoZSBob3N0IGJpb3Mgb3IgaG9zdCBrZXJuZWwgYXQKPiBh
bGwsIHNvIEkgc2hvdWxkIGJlIHBhc3NpbmcgYSBmcmVzaCBHUFUgdG8gdGhlIFZNLiBBbHNvLCBJ
J20gcHJldHR5Cj4gc3VyZSBJJ20gcnVubmluZyB0aGUgY29ycmVjdCBWR0EgYmlvcyBmb3IgdGhp
cyBHUFUgaW4gdGhlIGd1ZXN0IFZNCj4gYmlvcyBiZWZvcmUgZ3Vlc3QgYm9vdC4KPgo+IEFueSBj
b21tZW50cy9zdWdnZXN0aW9ucyB3b3VsZCBiZSBhcHByZWNpYXRlZCEKCkl0IHNob3VsZCB3b3Jr
IGluIGF0IGxlYXN0IG9uY2UgYXMgbG9uZyBhcyB5b3VyIHZtIGlzIHByb3Blcmx5IHNldCB1cC4K
Tm90ZSB0aGF0IHRoZSBkcml2ZXIgbmVlZHMgYWNjZXNzIHRvIHRoZSB2YmlvcyBpbWFnZSBpbiB0
aGUgZ3Vlc3QgdG8KZ2V0IGRldmljZSBzcGVjaWZpYyBjb25maWd1cmF0aW9uIGRldGFpbHMgKGNs
b2NrcywgZGlzcGxheSBjb25uZWN0b3IKY29uZmlndXJhdGlvbiwgZXRjLikuCgpBbGV4Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
