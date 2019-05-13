Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A311B99B
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 17:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF0B89FD4;
	Mon, 13 May 2019 15:11:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A81F89FCC
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 15:11:30 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e24so18053151edq.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 08:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=J5QWXq8SUDOV84x/ETfPywJAloYo/R8uw6vUDbE8R0Q=;
 b=gf1LrnDp+LA88KmFEAiKbBHAp4+Ff5vxQFFTMK8BihwNcgx0iordpIq9iv41Gp6tGw
 JJm8ARsI5gmOZU3lR5NLcRlb3UDqwPITYXC03OFuUykzDTd4sh2zwV8hl3IKt/6G6zeo
 njGqD7IxD25qA0kTrqzVrVFCTIRU6U7v10OsOsRgy4oWGDZJ2jP/ACMT07j+OhJf9Ktb
 JDtLv2XONd4ZTAx+ee3Li36+bbpc3f+IvPPYe0CErrXO2og7pAyXMkv+j3g4zPlM5ig7
 IXIutssU2g9OWrcwEVOt97gp63TPVhWxVZD3D2DdxfXwu5R9YmIg/48zrgjHDb0nzCD3
 fzwg==
X-Gm-Message-State: APjAAAXrN7m2BuKBIlCsbCkctdxTV7OtO6zPPo3+YeBGaFmY/NcNcKOe
 Wi5+l9tW6HbCddTgx8sVue1RbQ==
X-Google-Smtp-Source: APXvYqwDjTBdwUAYOEbvyqBBLKm9nvAQxfpPCGaKgMTzF378dr/1TfU+uMsDcTVYby2DQacIOdz9rg==
X-Received: by 2002:a50:b6b2:: with SMTP id d47mr30578108ede.169.1557760288994; 
 Mon, 13 May 2019 08:11:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y46sm3858574edd.29.2019.05.13.08.11.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 08:11:28 -0700 (PDT)
Date: Mon, 13 May 2019 17:11:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] Revert "vgaarb: Keep adding VGA device in queue"
Message-ID: <20190513151124.GV17751@phenom.ffwll.local>
References: <20190510142958.28017-1-alexander.deucher@amd.com>
 <20190510154208.GL17751@phenom.ffwll.local>
 <58ea5dae-be17-af97-0066-48feab80497e@daenzer.net>
 <1946afdf-f87f-c6bb-e492-be5c73707995@canonical.com>
 <75236873-7a53-9106-cba5-b0353aae2eef@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75236873-7a53-9106-cba5-b0353aae2eef@daenzer.net>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=J5QWXq8SUDOV84x/ETfPywJAloYo/R8uw6vUDbE8R0Q=;
 b=dcjIGxc6+jy5mKRgNl1Ry9zksgNlxqw6Nb7pQVA/s3m09B9iawFHyqOPM4AVJgVrSQ
 k383ltfaRjcGqWHx2uXnDPVerD17gqvbKE05nho858ov6qvV7oJwUyBahBd6eSDa8LBt
 +P+P7nuDAJR2iEi31Zl8AvcpmHl0iamJDDjKw=
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
Cc: dri-devel@lists.freedesktop.org, Alex Deucher <alexdeucher@gmail.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Aaron Ma <aaron.ma@canonical.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTI6MTQ6MjlQTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj4gT24gMjAxOS0wNS0xMCA4OjAxIHAubS4sIEFhcm9uIE1hIHdyb3RlOgo+ID4gT24g
NS8xMC8xOSAxMTo0NiBQTSwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4gPj4+IEdpdmVuIHRoYXQg
dGhlIGJ1ZyBpcyBhIGJpdCBhIG1lc3MgSSB0aGluayB3ZSBuZWVkIHRvIGFkZCBhIGJpdCBtb3Jl
Cj4gPj4+IGNvbnRleHQgaGVyZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIE15IHVuZGVyc3RhbmRp
bmc6Cj4gPj4+Cj4gPj4+IEdvYWwgb2YgdGhlIHJldmVydCBjb21taXQgd2FzIHRvIG1ha2UgdGhl
IGludGVncmF0ZWQgYm9vdCBkZXZpY2UgdGhlCj4gPj4+IHByaW1hcnkgb25lLCBpZiB3ZSBjYW4n
dCBkZXRlY3Qgd2hpY2ggb25lIGlzIHRoZSBib290IGRldmljZSwgaW5zdGVhZCBvZgo+ID4+PiB0
aGUgbGFzdCBvbmUuIFdoaWNoIG1ha2VzIHNvbWUgc2Vuc2UuCj4gPj4+Cj4gPj4+IE5vdyBwZW9w
bGUgaGF2ZSByZWxpZWQgb24gdGhlIGtlcm5lbCBwaWNraW5nIHRoZSBsYXN0IG9uZSwgd2hpY2gg
dXN1YWxseQo+ID4+PiBpcyBhbiBhZGQtb24gY2FyZCwgYW5kIHRoZXJlZm9yZSBzaW1wbHkgcGx1
Z2dpbmcgaW4gYW4gYWRkLW9uIGNhcmQgYWxsb3dzCj4gPj4+IHRoZW0gdG8gb3ZlcndyaXRlIHRo
ZSBkZWZhdWx0IGNob2ljZS4gV2hpY2ggYWxzbyBtYWtlcyBzZW5zZSwgYW5kIHNpbmNlCj4gPj4+
IGl0J3MgdGhlIG9sZGVyIGJlaGF2aW91ciwgd2lucy4KPiA+Pj4KPiA+Pj4gSSB0aGluayBpdCdk
IGJlIGdvb2QgdG8gYWRkIGEgY29tbWVudCBoZXJlIHRoYXQgdGhpcyBiZWhhdmlvdXIgaGFzIGJl
Y29tZQo+ID4+PiB1YXBpLCBlLmcuCj4gPj4+Cj4gPj4+IAkvKiBBZGQgYXQgdGhlIGZyb250IHNv
IHRoYXQgd2UgcGljayB0aGUgbGFzdCBkZXZpY2UgYXMgZmFsbGJhY2sKPiA+Pj4gCSAqIGRlZmF1
bHQsIHdpdGggdGhlIHVzdWFsIHJlc3VsdCB0aGF0IHBsdWcgaW4gY2FyZHMgYXJlIHByZWZlcnJl
ZAo+ID4+PiAJICogb3ZlciBpbnRlZ3JhdGVkIGdyYXBoaWNzLiAqLwo+ID4+Pgo+ID4+PiBXaXRo
IHRoYXQgKG9yIHNpbWlsYXIpIGFuZCBtb3JlIGNvbW1pdCBtZXNzYWdlIGNvbnRleHQ6Cj4gPj4g
VGhlIGJ1ZyByZXBvcnRlcidzIHN5c3RlbSBkb2Vzbid0IGhhdmUgaW50ZWdyYXRlZCBncmFwaGlj
cyB0aG91Z2gsIGp1c3QKPiA+PiB0d28gcGx1Zy1pbiBjYXJkcy4gSXQncyBub3QgY2xlYXIgdG8g
bWUgeWV0IHRoYXQgdGhlaXIgZXhwZWN0YXRpb24gb2YKPiA+PiBYb3JnIHRvIHBpY2sgYW55IHBh
cnRpY3VsYXIgb25lIG9mIHRoZW0gd2l0aG91dCBjb25maWd1cmF0aW9uIHdhcyBqdXN0aWZpZWQu
Cj4gPiAKPiA+IAo+ID4gVGhpcyBjb2RlIGlzIGtpbmQgb2YgZmFpbCBzYWZlLgo+ID4gCj4gPiBX
aGVuIGluIGh5YnJpZCBncmFwaGljIG1vZGUuCj4gPiBJdCBzaG91bGQgZmFsbGJhY2sgdG8gaW50
ZWdyYXRlZCBHUFUsIHdoaWNoIHNob3VsZCBhbHdheXMgYmUgcHJpbWFyeSBmYi4KPiA+IFNvIHBp
Y2tpbmcgMXN0IChtaW5vciBQQ0kgSUQgbnVtYmVyKSBHUFUgc2hvdWxkIG1ha2UgbW9yZSBzZW5z
ZS4KPiA+IAo+ID4gV2hlbiB3aXRoIG11bHRpcGxlIGQtR1BVcywgd2UgY2FuJ3Qgc2F5IHdoaWNo
IGNhcmQgc2hvdWxkIGJlIHRoZSByaWdodAo+ID4gb25lIGZvciB1c2VycyB3aGVuIG5vIFhvcmcg
Y29uZiBzZXQuCj4gPiBVc3VhbGx5IEJJT1Mgd2lsbCBzZXQgdGhlIDFzdCAobWlub3IgUENJIElE
IG51bWJlcikgZC1HUFUgYXMgcHJpbWFyeS4KPiA+IFNvIGFsaWduaW5nIHdpdGggQklPUyBzZXR0
aW5nIHdpbGwgYmUgYmV0dGVyIEkgdGhpbmsuCj4gCj4gUmlnaHQuIFRoZSBidWcgZGVzY3JpcHRp
b24gZXZlbiBzYXlzIHRoYXQgdGhlIGNhcmQgdGhlIHJlcG9ydGVyIGV4cGVjdGVkCj4gWG9yZyB0
byBjb21lIHVwIG9uIGlzIHRoZSAic2Vjb25kYXJ5IiBjYXJkIGluIGEgUENJZSAxeCBzbG90ICh3
aGVyZWFzCj4gdGhlIHByaW1hcnkgaXMgaW4gUENJZSAxNngpLiBJdCBzZWVtcyBwcmV0dHkgY2xl
YXIgdGhhdCB5b3VyIGNoYW5nZQo+IGFjdHVhbGx5IG1hZGUgdGhpbmdzIGJldHRlciwgYW5kIHRo
ZSByZXBvcnRlciB3YXMganVzdCByZWx5aW5nIG9uIHRoZQo+IHByZXZpb3VzIHdyb25nIGJlaGF2
aW91ci4gVGhlcmVmb3JlIEkgcmVzb2x2ZWQgdGhlIHJlcG9ydCBhcyBub3QgYSBidWcsCj4gYW5k
IHRoaXMgcGF0Y2ggc2hvdWxkIGJlIGRyb3BwZWQuCgpIbSBJIG1pc3NlZCB0aGF0IHRoaXMgaXMg
YWJvdXQgMiBleHRlcm5hbCBwY2kgc2xvdHMuIEFncmVlaW5nIHdpdGggeW91CnJlYXNvbmluZyBo
ZXJlIG5vdywgcmV0cmFjdGluZyBteSByLWIuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
