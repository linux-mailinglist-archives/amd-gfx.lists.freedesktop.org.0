Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921DDABCA2
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Sep 2019 17:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA2B6E2F2;
	Fri,  6 Sep 2019 15:36:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423ED6E2F2
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Sep 2019 15:36:14 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 67so6117519oto.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 06 Sep 2019 08:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7uHQ4kMl6WZSyY7oAdRMYnb4CAlCS07EFriCepdN01o=;
 b=pGOwf7c9EQ7CBY0q2hdTSeFYSpZfPn6gnJpcvIelTgXZlocXKtEtYe0QeUDlHKwX9M
 VzzzPEHsO3A1e4ETCkiD5chNw1fRcZ/KVD0evP/yZbgX8YPh8oOKyxJDrLlH4jIqbThj
 Glg/G2wgSkxPtysWPJYQ/pdgMgNzmuy+xMQc6na3Tx0nxOaLcnHh8WntIRAIqJSqcakY
 V/WYNd3/Pvzwh1HfyQyFb2jIcF4ZEhYrCDO7sd53Hhb1IcgTZpPXle2G5J/8bmC8jkFX
 vBtv2qgaPNaDWZKqDX6NeTLiMkxdWGs42/JiA+EjLZ885q0d9gRhQVRRncmbvreRfIgx
 WY8g==
X-Gm-Message-State: APjAAAUyyn0njdRgehWWH+j1WFIHVq8wxZvQdYlzIOXD9Fsuq5Lfkudt
 hd7xOMd7Z0A9cnzVz69j8SNC4FWe90VjqWsjuIAFiA==
X-Google-Smtp-Source: APXvYqwZp3NJFwp6uzb8XlomfJTw7uMfJIW0JKdoayVi5f6h/5TyLqnw8Ny26XCTCP9zRkA67S0/sW80K2lE5ARGwMc=
X-Received: by 2002:a05:6830:1185:: with SMTP id
 u5mr7738954otq.106.1567784173479; 
 Fri, 06 Sep 2019 08:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-2-Kenny.Ho@amd.com>
 <20190903075719.GK2112@phenom.ffwll.local>
 <CAOWid-dxxDhyxP2+0R0oKAk29rR-1TbMyhshR1+gbcpGJCAW6g@mail.gmail.com>
 <CAKMK7uEofjdVURu+meonh_YdV5eX8vfNALkW3A_+kLapCV8j+w@mail.gmail.com>
 <CAOWid-eUVztW4hNVpznnJRcwHcjCirGL2aS75p4OY8XoGuJqUg@mail.gmail.com>
 <20190904085434.GF2112@phenom.ffwll.local>
 <20190906152925.GN2263813@devbig004.ftw2.facebook.com>
In-Reply-To: <20190906152925.GN2263813@devbig004.ftw2.facebook.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 6 Sep 2019 17:36:02 +0200
Message-ID: <CAKMK7uFQqAMB1DbiEy-o2bzr_F25My93imNcg1Qh9DHe=uWQug@mail.gmail.com>
Subject: Re: [PATCH RFC v4 01/16] drm: Add drm_minor_for_each
To: Tejun Heo <tj@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7uHQ4kMl6WZSyY7oAdRMYnb4CAlCS07EFriCepdN01o=;
 b=e9KDLutTmvRwTRVm/wqo5phcOLyAMasIS2Fn6cd3dKK1LPW9IM3AF2SPtYpxiSFu/l
 G6AT4dooGSXxZQEgT0pLtQlY0+CPzzw+pS+lFzqMZR1lZt/SZZ++MU2A88l5npA6/tPw
 7dPll1Sr6Kxh5j3AJIwimTv/PTXwXsTHrZ250=
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Kenny Ho <y2kenny@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgNiwgMjAxOSBhdCA1OjI5IFBNIFRlanVuIEhlbyA8dGpAa2VybmVsLm9yZz4g
d3JvdGU6Cj4KPiBIZWxsbywKPgo+IE9uIFdlZCwgU2VwIDA0LCAyMDE5IGF0IDEwOjU0OjM0QU0g
KzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBBbnl3YXksIEkgZG9uJ3QgdGhpbmsgcmV1
c2luZyB0aGUgZHJtX21pbm9yIHJlZ2lzdHJhdGlvbiBtYWtlcyBzZW5zZSwKPiA+IHNpbmNlIHdl
IHdhbnQgdG8gYmUgb24gdGhlIGRybV9kZXZpY2UsIG5vdCBvbiB0aGUgbWlub3IuIFdoaWNoIGlz
IGEgYml0Cj4gPiBhd2t3YXJkIGZvciBjZ3JvdXBzLCB3aGljaCB3YW50cyB0byBpZGVudGlmeSBk
ZXZpY2VzIHVzaW5nIG1ham9yLm1pbm9yCj4gPiBwYWlycy4gQnV0IEkgZ3Vlc3MgZHJtIGlzIHRo
ZSBmaXJzdCBzdWJzeXN0ZW0gd2hlcmUgMSBkZXZpY2UgY2FuIGJlCj4gPiBleHBvc2VkIHRocm91
Z2ggbXVsdGlwbGUgbWlub3JzIC4uLgo+ID4KPiA+IFRlanVuLCBhbnkgc3VnZ2VzdGlvbnMgb24g
dGhpcz8KPgo+IEknbSBub3QgZXh0cmVtZWx5IGF0dGFjaGVkIHRvIG1hajptaW4uICBJdCdzIG5p
Y2UgaW4gdGhhdCBpdCdkIGJlCj4gY29uc2lzdGVudCB3aXRoIGJsa2NnIGJ1dCBpdCBhbHJlYWR5
IGlzbid0IHRoZSBuaWNlc3Qgb2YgaWRlbnRpZmllcnMKPiBmb3IgYmxvY2sgZGV2aWNlcy4gIElm
IHVzaW5nIG1hajptaW4gaXMgcmVhc29uYWJseSBzdHJhaWdodCBmb3J3YXJkCj4gZm9yIGdwdXMg
ZXZlbiBpZiBub3QgcGVyZmVjdCwgSSdkIHByZWZlciBnb2luZyB3aXRoIG1hajptaW4uCj4gT3Ro
ZXJ3aXNlLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHVzZSB0aGUgSUQgYmVzdCBmb3IgR1BVcyAtIGhv
cGVmdWxseQo+IHNvbWV0aGluZyB3aGljaCBpcyBlYXN5IHRvIHVuZGVyc3RhbmQsIGNvbnNpc3Rl
bnQgd2l0aCBJRHMgdXNlZAo+IGVsc2V3aGVyZSBhbmQgZWFzeSB0byBidWlsZCB0b29saW5nIGFy
b3VuZC4KCkJsb2NrIGRldmljZXMgYXJlIGEgZ3JlYXQgZXhhbXBsZSBJIHRoaW5rLiBIb3cgZG8g
eW91IGhhbmRsZSB0aGUKcGFydGl0aW9ucyBvbiB0aGF0PyBGb3IgZHJtIHdlIGFsc28gaGF2ZSBh
IG1haW4gbWlub3IgaW50ZXJmYWNlLCBhbmQKdGhlbiB0aGUgcmVuZGVyLW9ubHkgaW50ZXJmYWNl
IG9uIGRyaXZlcnMgdGhhdCBzdXBwb3J0IGl0LiBTbyBpZiBibGtjZwpoYW5kbGVzIHRoYXQgYnkg
b25seSBleHBvc2luZyB0aGUgcHJpbWFyeSBtYWo6bWluIHBhaXIsIEkgdGhpbmsgd2UgY2FuCmdv
IHdpdGggdGhhdCBhbmQgaXQncyBhbGwgbmljZWx5IGNvbnNpc3RlbnQuCi1EYW5pZWwKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkg
NzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
