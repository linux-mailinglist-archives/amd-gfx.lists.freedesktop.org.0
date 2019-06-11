Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EF83C60D
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 10:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F8A8918D;
	Tue, 11 Jun 2019 08:39:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1948918D
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 08:39:15 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w13so18835816eds.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 01:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=iyP0Dd56eJWbH772fJmDqrdN7DkdyR2aKpHX3eqXmsM=;
 b=GrIWUXpsJpwv2HPAPJ1UjtsMK7h5/NnZahENLvZVPSF/4SY30+sAQiV2DFYUClk6OA
 ioqjvFYumUksFSZL6F0BGyh970GYDU9R8Q2yTmxkYvt9zc/wesaLtYx4ctOVv/lVYvam
 CX4FkO2fSKQCZlpYzAHrOnzYHhOL1lOO5HDdtaKAINC5Vq9xXRLhKJr4fVUT1MJLctjP
 D+BPnfV4QaWce1ruvUDX1cJA8OfI14kazlm+mv7t7I0x1dqomTgaBh4Ih1mZVBRC4UME
 LcdgTgZHS3zBEF5EQWulYOkUZZaSvk1KSQ5h5mK8VALJWlfq+nKG0PxRYAnTZk0GYaST
 xvcA==
X-Gm-Message-State: APjAAAV3xyBEyAj0Sv9crsZXf8WaJJs2V8e/Pj47sW3VTFI+NcAEkPtF
 H6nNa9lhRq9N01KTq8B+fxps+g==
X-Google-Smtp-Source: APXvYqxADzCQawO3nAAa16qms8BPbp5vj6wMQ8LWvFelYB0QVvID/C10a3iYKK2oO1v9XVcaIYdjKw==
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr78768352edc.294.1560242354194; 
 Tue, 11 Jun 2019 01:39:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id o93sm296935edd.46.2019.06.11.01.39.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 01:39:13 -0700 (PDT)
Date: Tue, 11 Jun 2019 10:39:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 01/10] drm: fix build errors with drm_print.h
Message-ID: <20190611083911.GT21222@phenom.ffwll.local>
References: <20190609220757.10862-1-sam@ravnborg.org>
 <20190609220757.10862-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190609220757.10862-2-sam@ravnborg.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iyP0Dd56eJWbH772fJmDqrdN7DkdyR2aKpHX3eqXmsM=;
 b=OfmPm765hfEI4uTDxs7UNXAAjGRVr4vOS7chZV+7XK7RlCdIpPQ3uX/3/9Oh7Ku7HK
 WE8TF+BR26GvnyKA/E3QfPm8JUvNjvV/SSGsyKiNSwhCOaPKqsdqFFWuXRdjFgtWtfLM
 10N6ywAJvaicuCmApSNJUi6JBiWKCuOI6ZSdo=
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMTI6MDc6NDhBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IGRybV9wcmludC5oIHJlcXVpcmVzIDxkcm0vZHJtLmg+IHRvIGZpeCBidWlsZCB3aGVu
IG1hY3JvcyBhcmUgdXNlZC4KPiBQdWxsIGluIHRoZSBoZWFkZXIgZmlsZSBpbiBkcm1fcHJpbnQu
aCBzbyB1c2VycyBkbyBub3QgaGF2ZSB0byBkbyBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+
IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggfCAyICsr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vZHJtX3ByaW50LmggYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+IGluZGV4IDNh
NDI0NzMxOWU2My4uYTVkNmYyZjNlNDMwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9w
cmludC5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKPiBAQCAtMzIsNiArMzIsOCBA
QAo+ICAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2Zz
Lmg+Cj4gIAo+ICsjaW5jbHVkZSA8ZHJtL2RybS5oPgoKV2hhdCBnb2VzIGJvb20gd2l0aG91dCB0
aGlzPyBPbmx5IGRybS9kcm0uaCB0aGF0IEkgY291bGQgZmluZCB3YXMgdGhlIG9uZQppbiB1YXBp
L2RybS9kcm0uaCwgYW5kIHRoYXQgb25lIGxvb2tzIHZlcnkgZmlzaHkgdG8gaW5jbHVkZSBmcm9t
IGFuCmludGVybmFsIGhlbHBlciBoZWFkZXIgbGlrZSBwcmludC5oLgotRGFuaWVsCgo+ICsKPiAg
LyoqCj4gICAqIERPQzogcHJpbnQKPiAgICoKPiAtLSAKPiAyLjIwLjEKPiAKCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
