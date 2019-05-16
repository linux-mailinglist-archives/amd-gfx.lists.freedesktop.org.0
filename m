Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4BD20F7C
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 22:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3821A89781;
	Thu, 16 May 2019 20:07:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFCD89781
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 20:07:27 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id k128so101238ybf.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 13:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCAjTL2pcnv+JJwyBXmcEsVfy33Za+VGs4R+PzzEkko=;
 b=j17oJcad8V/i5n6Tl70sO7UigjhiXId4jUOIESLt6yOvaBzbYmCqcatjQfGUolVaD9
 b6jqvDGzqr/znx571DLFQlR1M7lspuekR6pX3St9m19Krm9EP6oYFqtZwhiD6SoDeHoa
 MMTp6peOzYJvzREuZQLz/f28w7tZTBsKZlJ39XEo0JxEmJfQ7PgX6rpdLrNrKtpBlWAK
 EVGAk+Grc8mZx2JTPrbJKgHlHEmY3ZOpKEqRnrkBAvB0F8wWDLAFa+r0HQGxyl5OZqrP
 lXGIUSGXMLHRhx4mnJgIUSH7JyE4HGb5FdgElZdYwQrIrstvVDhbf4aZfkXHiSwoGlBg
 kgSg==
X-Gm-Message-State: APjAAAVta86I4RcyPjUxasZTrf4s39nRzA9aqGuKYfk0vuSoCTiuYgRa
 ZUjEYU755GPrIXkP3S5PD9ONCUQeW9XBG2AWuL4YSw==
X-Google-Smtp-Source: APXvYqz3vLCaK8hPs98VEzk95pO3F1g3/LBjokEmWUV6tmsEGhhM+PJNVZtmVd53jkm7Ne37ntkMoPgdtdIRh0GNmeE=
X-Received: by 2002:a25:3609:: with SMTP id d9mr24111319yba.260.1558037246239; 
 Thu, 16 May 2019 13:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-EccO1ue5hTtJ8m4utQp+8dSsWm60JFA5YOT1gCODnYcFUog@mail.gmail.com>
 <CADnq5_N=-cWz99T4ma_=6-_bu-Ty2twsFt=KGtzTdWn1hcDSrA@mail.gmail.com>
In-Reply-To: <CADnq5_N=-cWz99T4ma_=6-_bu-Ty2twsFt=KGtzTdWn1hcDSrA@mail.gmail.com>
From: Micah Morton <mortonm@chromium.org>
Date: Thu, 16 May 2019 13:07:15 -0700
Message-ID: <CAJ-EccOH2dXPD+XeHQcqZYD+xa2eB6SVp6oFk4AD0vy=H+9+0w@mail.gmail.com>
Subject: Re: GPU passthrough support for Stoney [Radeon R2/R3/R4/R5 Graphics]?
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OCAjTL2pcnv+JJwyBXmcEsVfy33Za+VGs4R+PzzEkko=;
 b=atpay45Joru4Jt9ROk3P3ASWT4vDzqH9kO9PfNQngZqZHkO8ZRwzz0UMrlydCMmyl7
 Z5cWaqL2SBchcVsLojf8UbemYg+yRM3/QzyfCuEwy270TFawMhnBDLKUwu3ZBl3nZ0DP
 T5e5//YGogg94PcCZb1pJGKu0w6h7XwkHh16U=
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

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgNzoxOSBQTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAyOjI2IFBNIE1p
Y2FoIE1vcnRvbiA8bW9ydG9ubUBjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIGZvbGtz
LAo+ID4KPiA+IEknbSBpbnRlcmVzdGVkIGluIHJ1bm5pbmcgYSBWTSBvbiBhIHN5c3RlbSB3aXRo
IGFuIGludGVncmF0ZWQgU3RvbmV5Cj4gPiBbUmFkZW9uIFIyL1IzL1I0L1I1IEdyYXBoaWNzXSBj
YXJkIGFuZCBwYXNzaW5nIHRocm91Z2ggdGhlIGdyYXBoaWNzCj4gPiBjYXJkIHRvIHRoZSBWTSB1
c2luZyB0aGUgSU9NTVUuIEknbSB3b25kZXJpbmcgd2hldGhlciB0aGlzIGlzIGZlYXNpYmxlCj4g
PiBhbmQgc3VwcG9zZWQgdG8gYmUgZG9hYmxlIHdpdGggdGhlIHJpZ2h0IHNldHVwIChhcyBvcHBv
c2VkIHRvIHBhc3NpbmcKPiA+IGEgZGlzY3JldGUgR1BVIHRvIHRoZSBWTSwgd2hpY2ggSSB0aGlu
ayBpcyBkZWZpbml0ZWx5IGRvYWJsZT8pLgo+ID4KPiA+IFNvIGZhciwgSSBjYW4gZG8gYWxsIHRo
ZSBxZW11L2t2bS92ZmlvL2lvbW11IHN0dWZmIHRvIHJ1biB0aGUgVk0gYW5kCj4gPiBwYXNzIHRo
ZSBpbnRlZ3JhdGVkIEdQVSB0byBpdCwgYnV0IHRoZSBkcm0gZHJpdmVyIGluIHRoZSBWTSBmYWls
cwo+ID4gZHVyaW5nIGFtZGdwdV9kZXZpY2VfaW5pdCgpLiBTcGVjaWZpY2FsbHksIHRoZSBsb2dz
IHNob3cgdGhlIFNNVSBiZWluZwo+ID4gdW5yZXNwb25zaXZlLCB3aGljaCBsZWFkcyB0byBhICdT
TVUgZmlybXdhcmUgbG9hZCBmYWlsZWQnIGVycm9yCj4gPiBtZXNzYWdlIGFuZCBrZXJuZWwgcGFu
aWMuIEkgY2FuIHNoYXJlIFZNIGxvZ3MgYW5kIHRoZSBpbnZvY2F0aW9uIG9mCj4gPiBxZW11IGFu
ZCBzdWNoIGlmIGhlbHBmdWwsIGJ1dCBmaXJzdCB3YW50ZWQgdG8ga25vdyBhdCBhIGhpZ2ggbGV2
ZWwgaWYKPiA+IHRoaXMgc2hvdWxkIGJlIGZlYXNpYmxlPwo+ID4KPiA+IFAuUy46IEknbSBub3Qg
aW5pdGlhbGl6aW5nIHRoZSBHUFUgaW4gdGhlIGhvc3QgYmlvcyBvciBob3N0IGtlcm5lbCBhdAo+
ID4gYWxsLCBzbyBJIHNob3VsZCBiZSBwYXNzaW5nIGEgZnJlc2ggR1BVIHRvIHRoZSBWTS4gQWxz
bywgSSdtIHByZXR0eQo+ID4gc3VyZSBJJ20gcnVubmluZyB0aGUgY29ycmVjdCBWR0EgYmlvcyBm
b3IgdGhpcyBHUFUgaW4gdGhlIGd1ZXN0IFZNCj4gPiBiaW9zIGJlZm9yZSBndWVzdCBib290Lgo+
ID4KPiA+IEFueSBjb21tZW50cy9zdWdnZXN0aW9ucyB3b3VsZCBiZSBhcHByZWNpYXRlZCEKPgo+
IEl0IHNob3VsZCB3b3JrIGluIGF0IGxlYXN0IG9uY2UgYXMgbG9uZyBhcyB5b3VyIHZtIGlzIHBy
b3Blcmx5IHNldCB1cC4KCklzIHRoZXJlIGFueSByZWFzb24gcnVubmluZyBjb3JlYm9vdCB2cyBV
RUZJIGF0IGhvc3QgYm9vdCB3b3VsZCBtYWtlIGEKZGlmZmVyZW5jZT8gSSB3YXMgcnVubmluZyBh
IG1vZGlmaWVkIHZlcnNpb24gb2YgY29yZWJvb3QgdGhhdCBhdm9pZHMKZG9pbmcgYW55IEdQVSBp
bml0aWFsaXphdGlvbiBpbiBmaXJtd2FyZSAtLSBzbyB0aGUgZmlyc3QgUE9TVCBoYXBwZW5zCmlu
c2lkZSB0aGUgZ3Vlc3QuCgo+IE5vdGUgdGhhdCB0aGUgZHJpdmVyIG5lZWRzIGFjY2VzcyB0byB0
aGUgdmJpb3MgaW1hZ2UgaW4gdGhlIGd1ZXN0IHRvCj4gZ2V0IGRldmljZSBzcGVjaWZpYyBjb25m
aWd1cmF0aW9uIGRldGFpbHMgKGNsb2NrcywgZGlzcGxheSBjb25uZWN0b3IKPiBjb25maWd1cmF0
aW9uLCBldGMuKS4KCklzIHRoZXJlIGFueXRoaW5nIEkgbmVlZCB0byBkbyB0byBlbnN1cmUgdGhp
cyBiZXNpZGVzIHBhc3NpbmcgJy1kZXZpY2UKdmZpby1wY2ksLi4uLHJvbWZpbGU9L3BhdGgvdG8v
dmdhcm9tJyB0byBxZW11PwoKPgo+IEFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
