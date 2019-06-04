Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF4348A2
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 15:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69C6898A3;
	Tue,  4 Jun 2019 13:28:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73296898A3
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 13:28:26 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w196so6033998oie.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 06:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wxn95cvMi6VK8Dxg2EJ7OQj/Dh4SRIR83A0MCmlPkz8=;
 b=nGdpSAMsnjI2nf9cZas8MgVJHMhJFNZ+RehgBBLLGns87iLvEXcizK4EEDk7dqL9Jg
 15hte/Nnfez9GLunDB5FedX9kwZFMIHx1AJLzaM+JtDy20DY4UMze/3uYeZm3nOqOGT2
 2XhoDR0H/q1aitF0EAX2ssOoqJ27Hs2mABmWiAWGlr3i1Z/xMXu3aGIBCTyVzhp4Wjnv
 dF4eWiu8fbruKr3D3IQw11rJbgcEGpY7t8EB8dmstDWDm4bm67r3vKzGPOtnu4jApyTG
 z/WohCo79UeM5mUzaN1W1US+18EKvnZqSodbq2fZzWOEnElXc78fKC+QBnA84bD2NZmo
 VVOg==
X-Gm-Message-State: APjAAAXnnzBuETtXK0zIbTpdnjmMGP+0QBcBfdQ0kgrljHzLxKATEYYs
 owvLcIfLZJaJRxX9gqtnaU0cIl5H3yuwY6blL2bPAQ==
X-Google-Smtp-Source: APXvYqyKfFED5gE7/1+9fEnZdCPjtuRi8+yr5jtF/dNlCPvtZk1H4giYgAscvbt2297cw+5YjfyE00tvMMyZFj9Qqa8=
X-Received: by 2002:aca:6208:: with SMTP id w8mr4466062oib.128.1559654905660; 
 Tue, 04 Jun 2019 06:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527132041.GP21222@phenom.ffwll.local>
 <20190527132607.GH15067@arch-x1c3>
 <0426fb3e-e7bc-2464-cb42-4d5753956d23@amd.com>
 <CAKMK7uE_pRro8PxTwUq+pC_1GVVT7nUxan1T-kqSYT=BMHTf2g@mail.gmail.com>
 <d12a7dd4-595b-d0aa-a87d-527392fb0384@amd.com>
 <CAKMK7uE1ZWjCeg3q7qDrbcj89+DuPQwfjMqC8hTjDAMU5bhh-w@mail.gmail.com>
 <98c3d891-6966-2043-9709-4e718dbc6bac@amd.com>
 <ee1b8980-3d78-aa6d-fe46-2c0d45c2bbdd@daenzer.net>
 <1b697f02-a6cf-0bc1-9149-3acd71eb4e30@amd.com>
In-Reply-To: <1b697f02-a6cf-0bc1-9149-3acd71eb4e30@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 Jun 2019 15:28:14 +0200
Message-ID: <CAKMK7uGoSbtXVNthr6oUomc7EcYUheNDWHsZ4=F0QwsSN3y=CQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wxn95cvMi6VK8Dxg2EJ7OQj/Dh4SRIR83A0MCmlPkz8=;
 b=HFau3wq7pP0+D2h3sn567fc6rICVEIhDvUY8T7ASDZUPB4kPLkeRfxeOity9bpQ609
 lHjgBYND9/07iuhmFv43JVvFMA96XrbhAX0gr9jPW1p0WgcHUc5I+RonlfBQlRBpIkqD
 PCEyDk4ybMzy63/rW9HQrcNVAvEx2xXN/CZjg=
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCAxOjI0IFBNIEtvZW5pZywgQ2hyaXN0aWFuCjxDaHJpc3Rp
YW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDQuMDYuMTkgdW0gMTI6NTAgc2Nocmll
YiBNaWNoZWwgRMOkbnplcjoKPiA+IE9uIDIwMTktMDUtMjggMTA6MDMgYS5tLiwgS29lbmlnLCBD
aHJpc3RpYW4gd3JvdGU6Cj4gPj4gSSByYXRoZXIgdGhpbmsgdGhhdCB3ZSBzaG91bGQgZ28gZG93
biB0aGUgcm91dGUgb2YgY29tcGxldGVseSBkcm9wcGluZwo+ID4+IGNvbW1hbmQgc3VibWlzc2lv
biBhbmQgYnVmZmVyIGFsbG9jYXRpb24gdGhyb3VnaCB0aGUgcHJpbWFyeSBub2RlIGZvcgo+ID4+
IG5vbiBtYXN0ZXIgY2xpZW50cy4gQW5kIHRoZW4gYXMgbmV4dCBzdGVwIGF0IHNvbWUgcG9pbnQg
ZHJvcCBzdXBwb3J0IGZvcgo+ID4+IGF1dGhlbnRpY2F0aW9uL2ZsaW5rLgo+ID4gS2VlcCBpbiBt
aW5kIHRoYXQgZXZlbiBkaXNwbGF5IHNlcnZlcnMgYXJlbid0IERSTSBtYXN0ZXIgd2hpbGUgdGhl
aXIgVlQKPiA+IGlzbid0IGFjdGl2ZSwgc28gdGhpcyBtaWdodCBiZSBwcm9ibGVtYXRpYyBpZiBh
IGRpc3BsYXkgc2VydmVyIG5lZWRzIHRvCj4gPiBkbyBzb21lIGNvbW1hbmQgc3VibWlzc2lvbiAv
IGJ1ZmZlciBhbGxvY2F0aW9uIGR1cmluZyB0aGF0IHRpbWUuCj4KPiBJZiBJIHVuZGVyc3RhbmQg
aXQgY29ycmVjdGx5IHRoZSBEUk0gZmQgc3RheXMgbWFzdGVyIGV2ZW4gd2hlbiB0aGUgVlQgaXMK
PiBzd2l0Y2hlZCBhd2F5LCBpdCdzIGp1c3Qgbm90IHRoZSBjdXJyZW50IG1hc3RlciBhbnkgbW9y
ZS4KPgo+IFNvIGluIHRoaXMgY2FzZSBmcHJpdi0+aXNfbWFzdGVyIHN0YXlzIHRydWUsIGJ1dAo+
IGRybV9pc19jdXJyZW50X21hc3RlcihmcHJpdikgcmV0dXJucyBmYWxzZS4KPgo+IEFuZCB5ZXMg
d2UgbWl4ZWQgdGhhdCB1cCBpbiBhbWRncHUsIGk5MTUgYW5kIHZtd2dmeC4gU29tZWJvZHkgc2hv
dWxkCj4gcHJvYmFibHkgd3JpdGUgcGF0Y2hlcyB0byBmaXggdGhpcy4KCm1hc3RlciBzaG91bGQg
YWx3YXlzIGJlIGF1dGhlbnRpY2F0ZWQsIHNvIHNob3VsZCBiZSBhYmxlIHRvIGNvbnRpbnVlCnJl
bmRlcmluZy4gV2VsbCAuLi4gZXhjZXB0IG9uIGRyaXZlcnMgd2hvIGRvIHRha2UgaXNvbGF0aW9u
IHNvbWV3aGF0CnNlcmlvdXMsIGJ1dCBkb24ndCBoYXZlIGZ1bGwgcGVyLWNsaWVudCBpc29sYXRp
b24uIFRob3NlIGFjdHVhbGx5CnJlZnVzZSByZW5kZXJpbmcvZ3B1IGFjY2VzcyBmb3IgYW55IGF1
dGhlbnRpY2F0ZWQgY2xpZW50IGlmIHRoZWlyCmNvcnJlc3BvbmRpbmcgbWFzdGVyIGlzbid0IHRo
ZSBjdXJyZW50IG1hc3Rlci4gQnV0IEkgdGhpbmsgb25seSB2bXdnZngKZG9lcyB0aGF0LgoKUGVy
LWNsaWVudCBpc29sYXRpb24gaGFzIHRha2VuIG92ZXIgYW55d2F5LCBzbyBhbGwgYSBiaXQgbW9v
dCwgYXQKbGVhc3Qgb24gbW9kZXJuIGh3LgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
