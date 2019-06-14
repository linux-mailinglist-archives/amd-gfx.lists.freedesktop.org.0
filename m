Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385A046379
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 17:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F65F89AEE;
	Fri, 14 Jun 2019 15:57:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D05589A86
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 15:57:08 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 65so2277857oid.13
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 08:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rr8QmmVDqm9g7vtLPQo76/1AeQyKO2Brlqd+/s/CNAk=;
 b=UhhbdrlEeGhAEBeoWsVaZAMDKMsXMsFMNrq0uUvH3ztdkGOOvDHPiT2262qe1mSUda
 0ukPK7HY1XbAatK5Gf2MOJ3ix0p7PGMQOo+ar3PlWaUxJ/Iy8rLsqz1+ttfXgPUtcXwC
 wTogMC7YDQPNiopsEoyOnI6338kTmWr0eICeZFWkNWUzIz8vhZpGLj2I2B1dVgvvv5nK
 DR/jLh9uzBTLxEr9ePL2NY9QZArmNxIa1iF6/bWrzWg4BPKfZ94G+uMIxCr+FezdQXj2
 piF6e0Vrfx6QE6ddZpeD9PghAmZEgP1iPblcWSX4ezPeMycnOYap3RUJ53poraDsq21l
 G7qQ==
X-Gm-Message-State: APjAAAURTyi/pB0TekqXkA9+nB7vmwmYNob67JZKDOLam27j6BbT05o9
 Ol3RCUCYuZE3CFEZKwXf2O4ukrd5KSruX+GlRNqcaQ==
X-Google-Smtp-Source: APXvYqzT1JjH8zQAgA+n7UWH/BJuUVpDrXEv/twamsRgKEc+SVqcRV+GVIVVoCgNo6kGViniNwjULXHFYqwXIZ46Ko0=
X-Received: by 2002:aca:6208:: with SMTP id w8mr2350122oib.128.1560527827419; 
 Fri, 14 Jun 2019 08:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190613021856.3307-1-alexander.deucher@amd.com>
 <20190614154909.GD23020@phenom.ffwll.local>
In-Reply-To: <20190614154909.GD23020@phenom.ffwll.local>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 14 Jun 2019 17:56:55 +0200
Message-ID: <CAKMK7uE6_k8jC+nLoG=zto4tuqM2JXzR3yOv1ccVSfm34h=79A@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-5.2
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rr8QmmVDqm9g7vtLPQo76/1AeQyKO2Brlqd+/s/CNAk=;
 b=FQrV2qrq/wPoLvySvROQJT50Vkvl4FFDoXZ/cHsYZWwBk9tBSUW4YR1Ik1/9CzJIAB
 UGL5iPrbBbLqZ45YQsF9Mhh+cCusKJrnwnAF89ZPROb+/gLemTTCIMiRH0bo78oRBNAU
 uIqKFnRWJdEbdYPVz3n2X8ADY+XkbussGz9Es=
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgNTo0OSBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDk6MTg6NTZQTSAtMDUw
MCwgQWxleCBEZXVjaGVyIHdyb3RlOgo+ID4gSGkgRGF2ZSwgRGFuaWVsLAo+ID4KPiA+IEZpeGVz
IGZvciA1LjI6Cj4gPiAtIEV4dGVuZCBwcmV2aW91cyB2Y2UgZml4IGZvciByZXN1bWUgdG8gdXZk
IGFuZCB2Y24KPiA+IC0gRml4IGJvdW5kcyBjaGVja2luZyBpbiByYXMgZGVidWdmcyBpbnRlcmZh
Y2UKPiA+IC0gRml4IGEgcmVncmVzc2lvbiBvbiBTSSB1c2luZyBhbWRncHUKPiA+Cj4gPiBUaGUg
Zm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDY3MWUyZWU1ZWUyMTI3MTc5Y2E4ODRiNDM5
YWI2MDAxYTYyM2VkZDY6Cj4gPgo+ID4gICBNZXJnZSBicmFuY2ggJ2xpbnV4LTUuMicgb2YgZ2l0
Oi8vZ2l0aHViLmNvbS9za2VnZ3NiL2xpbnV4IGludG8gZHJtLWZpeGVzICgyMDE5LTA2LTA3IDE3
OjE2OjAwICsxMDAwKQo+Cj4gU29tZWhvdyBtaXNzZWQgdGhpcyBvbmUsIGJ1dCBqdXN0IGZvdW5k
IGl0IGJlZm9yZSBJIHdhbnRlZCB0byBwdXNoIG91dCB0aGUKPiAtZml4ZXMgcHVsbCB0byBMaW51
cyAuLi4KPgo+ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gPgo+
ID4gICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCBkcm0tZml4ZXMt
NS4yCj4KPiBQdWxsZWQsIHRoYW5rcy4KCldhcyBhIGJpdCBhIGxpZSwgdGhlIHNjcmlwdCB3YXMg
c3RpbGwgcnVubmluZywgYW5kIGNvbXBsYWluZWQgdGhhdCBJCmRpZG4ndCBhZGQgYSBwcm9wZXIg
bWVyZ2UgY29tbWl0IG1lc3NhZ2UuIENhbiB5b3UgcGxzIHVzZSBhbm5vdGF0ZWQKdGFncywgdGhl
biB0aGUgdG9vbGluZyB3ZSB1c2UgbWFrZXMgdGhpcyBoYXBwZW4gYXV0b21hdGljYWxseT8gZGlt
CnB1bGwtcmVxdWVzdCBmb3IgY2hlYXRzaGVldCwgaWYgeW91IG5lZWQgb25lLgoKQ2hlZXJzLCBE
YW5pZWwKCj4gLURhbmllbAo+Cj4gPgo+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IGYzYTUyMzFjOGYxNGFjZDQyODQ1ZTllNjBmNTA2YjRlOTQ4ZjBlNjg6Cj4gPgo+ID4gICBkcm0v
YW1kZ3B1OiByZXR1cm4gMCBieSBkZWZhdWx0IGluIGFtZGdwdV9wbV9sb2FkX3NtdV9maXJtd2Fy
ZSAoMjAxOS0wNi0xMiAyMDozOTo0OSAtMDUwMCkKPiA+Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiBBbGV4IERl
dWNoZXIgKDEpOgo+ID4gICAgICAgZHJtL2FtZGdwdTogcmV0dXJuIDAgYnkgZGVmYXVsdCBpbiBh
bWRncHVfcG1fbG9hZF9zbXVfZmlybXdhcmUKPiA+Cj4gPiBEYW4gQ2FycGVudGVyICgxKToKPiA+
ICAgICAgIGRybS9hbWRncHU6IEZpeCBib3VuZHMgY2hlY2tpbmcgaW4gYW1kZ3B1X3Jhc19pc19z
dXBwb3J0ZWQoKQo+ID4KPiA+IFNoaXJpc2ggUyAoMSk6Cj4gPiAgICAgICBkcm0vYW1kZ3B1L3t1
dmQsdmNufTogZmV0Y2ggcmluZydzIHJlYWRfcHRyIGFmdGVyIGFsbG9jCj4gPgo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jICB8IDQgKystLQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8IDIgKysKPiA+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgfCA0ICsrKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91dmRfdjZfMC5jICAgfCA1ICsrKystCj4gPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdXZkX3Y3XzAuYyAgIHwgNSArKysrLQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNo
CgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
