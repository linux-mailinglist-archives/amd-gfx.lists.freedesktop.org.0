Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A7F57BB2
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 08:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DECD6E3A2;
	Thu, 27 Jun 2019 06:01:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE17D6E3A2
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 06:01:18 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id s49so5897631edb.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 23:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=25Oe2d3WCzWTQdi4EmaWIZ1elA6XVFDY/UbbQcTZPgA=;
 b=Jg36efKgWYRUjKwGmCF0QFertGpPSIL5VmY4qD5sxTpv3OelEHG2FcOOa7E/IwjEN5
 B8pV54fNne47LOEHTvbOPoIP+ytbMImBZkHmXdJd+MwzlSZn6sv/6nkGOWWUuPmOJV5X
 u9F5REZFsjWKQ9hCPJ/XK0/mVK7+6rusSoJq2pCSM5ftdmlT1u0AF+eLB1EtWvxwMuR0
 /Khwhm5WGbyTh18HqZwEBu+hnePIQCMpe4loxvY1+zbLMGR6c2UUCaNjbeJD5zdjut4P
 PRAUR0XFpeD5RiiiN3tLRdimnMxS06HzbbiWQanKjD+7icKsFB+kGBbkOFktWtim7acB
 PL5A==
X-Gm-Message-State: APjAAAXsHsPGcE1L6tJj2BIDzUpMBvwKpFKcPGEJD/PVxqix3/gQ33Th
 i2O+TfpBjIxU9ABNmllX/uIYqw==
X-Google-Smtp-Source: APXvYqyERhsA6Z0GG7Jfi+y8iUQQTuScqGEt6KUNiq6nC8M0hV2GnIfWg1B8k2KCjGjx6Bk5Q7Uo/w==
X-Received: by 2002:a50:8dcb:: with SMTP id s11mr1908937edh.144.1561615277507; 
 Wed, 26 Jun 2019 23:01:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g16sm395021edc.76.2019.06.26.23.01.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 23:01:16 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:01:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC PATCH v3 07/11] drm, cgroup: Add TTM buffer allocation stats
Message-ID: <20190627060113.GC12905@phenom.ffwll.local>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-8-Kenny.Ho@amd.com>
 <20190626161254.GS12905@phenom.ffwll.local>
 <CAOWid-f3kKnM=4oC5Bba5WW5WNV2MH5PvVamrhO6LBr5ydPJQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-f3kKnM=4oC5Bba5WW5WNV2MH5PvVamrhO6LBr5ydPJQg@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=25Oe2d3WCzWTQdi4EmaWIZ1elA6XVFDY/UbbQcTZPgA=;
 b=irh7a2Lcdij9HgxBwi7J2xacmCC+ceo+cVADHaIq5ovmq5GjpHlsm027Nuoo/2+KhJ
 MIupYJ3mCZA1W1B0Xa0w81Lq8qGVFCZ0HKCjKrOes8SE74v0+TQYSK9+vkGIZnEQZPNe
 xqBcnsigt4UTFpODPW6hWjkpjTSj3LRD0MkOk=
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, joseph.greathouse@amd.com,
 Kenny Ho <Kenny.Ho@amd.com>, Brian Welty <brian.welty@intel.com>,
 jsparks@cray.com, dri-devel <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>, kraxel@redhat.com,
 Daniel Vetter <daniel@ffwll.ch>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTI6MDY6MTNBTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTI6MTIgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAxMTowNTox
OEFNIC0wNDAwLCBLZW5ueSBIbyB3cm90ZToKPiA+ID4gZHJtLm1lbW9yeS5zdGF0cwo+ID4gPiAg
ICAgICAgIEEgcmVhZC1vbmx5IG5lc3RlZC1rZXllZCBmaWxlIHdoaWNoIGV4aXN0cyBvbiBhbGwg
Y2dyb3Vwcy4KPiA+ID4gICAgICAgICBFYWNoIGVudHJ5IGlzIGtleWVkIGJ5IHRoZSBkcm0gZGV2
aWNlJ3MgbWFqb3I6bWlub3IuICBUaGUKPiA+ID4gICAgICAgICBmb2xsb3dpbmcgbmVzdGVkIGtl
eXMgYXJlIGRlZmluZWQuCj4gPiA+Cj4gPiA+ICAgICAgICAgICA9PT09PT0gICAgICAgICA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ID4gICAgICAgICAg
IHN5c3RlbSAgICAgICAgIEhvc3Qvc3lzdGVtIG1lbW9yeQo+ID4KPiA+IFNob3VsZG4ndCB0aGF0
IGJlIGNvdmVyZWQgYnkgZ2VtIGJvIHN0YXRzIGFscmVhZHk/IEFsc28sIHN5c3RlbSBtZW1vcnkg
aXMKPiA+IGRlZmluaXRlbHkgc29tZXRoaW5nIGEgbG90IG9mIG5vbi10dG0gZHJpdmVycyB3YW50
IHRvIGJlIGFibGUgdG8gdHJhY2ssIHNvCj4gPiB0aGF0IG5lZWRzIHRvIGJlIHNlcGFyYXRlIGZy
b20gdHRtLgo+IFRoZSBnZW0gYm8gc3RhdHMgY292ZXJzIGFsbCBvZiB0aGVzZSB0eXBlLiAgSSBh
bSB0cmVhdCB0aGUgZ2VtIHN0YXRzCj4gYXMgbW9yZSBvZiB0aGUgZnJvbnQgZW5kIGFuZCBhIGhh
cmQgbGltaXQgYW5kIHRoaXMgc2V0IG9mIHN0YXRzIGFzIHRoZQo+IGJhY2tpbmcgc3RvcmUgd2hp
Y2ggY2FuIGJlIG9mIHZhcmlvdXMgdHlwZS4gIEhvdyBkb2VzIG5vbi10dG0gZHJpdmVycwo+IGlk
ZW50aWZ5IHZhcmlvdXMgbWVtb3J5IHR5cGVzPwoKTm90IGV4cGxpY2l0bHksIHRoZXkgZ2VuZXJh
bGx5IGp1c3QgaGF2ZSBvbmUuIEkgdGhpbmsgaTkxNSBjdXJyZW50bHkgaGFzCnR3bywgc3lzdGVt
IGFuZCBjYXJ2ZW91dCAod2l0aCB2cmFtIGdldHRpbmcgYWRkZWQpLgoKPiA+ID4gICAgICAgICAg
IHR0ICAgICAgICAgICAgIEhvc3QgbWVtb3J5IHVzZWQgYnkgdGhlIGRybSBkZXZpY2UgKEdUVC9H
QVJUKQo+ID4gPiAgICAgICAgICAgdnJhbSAgICAgICAgICAgVmlkZW8gUkFNIHVzZWQgYnkgdGhl
IGRybSBkZXZpY2UKPiA+ID4gICAgICAgICAgIHByaXYgICAgICAgICAgIE90aGVyIGRybSBkZXZp
Y2UsIHZlbmRvciBzcGVjaWZpYyBtZW1vcnkKPiA+Cj4gPiBTbyB3aGF0J3MgInByaXYiLiBJbiBn
ZW5lcmFsIEkgdGhpbmsgd2UgbmVlZCBzb21lIHdheSB0byByZWdpc3RlciB0aGUKPiA+IGRpZmZl
cmVudCBraW5kcyBvZiBtZW1vcnksIGUuZy4gc3R1ZmYgbm90IGluIHlvdXIgbGlzdDoKPiA+Cj4g
PiAtIG11bHRpcGxlIGtpbmRzIG9mIHZyYW0gKGxpa2UgbnVtYS1zdHlsZSBncHVzKQo+ID4gLSBj
bWEgKGZvciBhbGwgdGhvc2Ugbm9uLXR0bSBkcml2ZXJzIHRoYXQncyBhIGJpZyBvbmUsIGl0J3Mg
bGlrZSBzeXN0ZW0KPiA+ICAgbWVtb3J5IGJ1dCBhbHNvIHRvdGFsbHkgZGlmZmVyZW50KQo+ID4g
LSBhbnkgY2FydmVvdXRzIGFuZCBzdHVmZgo+IHByaXZzIGFyZSB2ZW5kb3Igc3BlY2lmaWMsIHdo
aWNoIGlzIHdoeSBJIGhhdmUgdHJ1bmNhdGVkIGl0LiAgRm9yCj4gZXhhbXBsZSwgQU1EIGhhcyBB
TURHUFVfUExfR0RTLCBHV1MsIE9BCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djUuMi1yYzYvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaCNM
MzAKPiAKPiBTaW5jZSB3ZSBhcmUgdXNpbmcga2V5ZWQgZmlsZSB0eXBlLCB3ZSBzaG91bGQgYmUg
YWJsZSB0byBzdXBwb3J0Cj4gdmVuZG9yIHNwZWNpZmljIG1lbW9yeSB0eXBlIGJ1dCBJIGFtIG5v
dCBzdXJlIGlmIHRoaXMgaXMgYWNjZXB0YWJsZSB0bwo+IGNncm91cCB1cHN0cmVhbS4gIFRoaXMg
aXMgd2h5IEkgc3RpY2sgdG8gdGhlIDMgbWVtb3J5IHR5cGUgdGhhdCBpcwo+IGNvbW1vbiBhY3Jv
c3MgYWxsIHR0bSBkcml2ZXJzLgoKSSB0aGluayB3ZSdsbCBuZWVkIGN1c3RvbSBtZW1vcnkgcG9v
bHMsIG5vdCBqdXN0IHByaXYsIGFuZCBJIGd1ZXNzIHNvbWUKbmFtaW5nIHNjaGVtZSBmb3IgdGhl
bS4gSSB0aGluayBqdXN0IGV4cG9zaW5nIHRoZW0gYXMgYW1kLWd3cywgYW1kLW9hLAphbWQtZ2Rz
IHdvdWxkIG1ha2Ugc2Vuc2UuCgpBbm90aGVyIHRoaW5nIEkgd29uZGVyIGFib3V0IGlzIG11bHRp
LWdwdSBjYXJkcywgd2l0aCBtdWx0aXBsZSBncHVzIGFuZAplYWNoIHRoZWlyIG93biB2cmFtIGFu
ZCBvdGhlciBkZXZpY2Utc3BlY2lmaWMgcmVzb3VyY2VzLiBGb3IgdGhvc2Ugd2UnZApoYXZlIG5v
ZGUwLnZyYW0gYW5kIG5vZGUxLnZyYW0gdG9vIChvbiB0b3Agb2YgbWF5YmUgYW4gb3ZlcmFsbCB2
cmFtIG5vZGUsCm5vdCBzdXJlKS4KCj4gPiBJIHRoaW5rIHdpdGggYWxsIHRoZSB0dG0gcmVmYWN0
b3JpbmcgZ29pbmcgb24gSSB0aGluayB3ZSBuZWVkIHRvIGRlLXR0bQo+ID4gdGhlIGludGVyZmFj
ZSBmdW5jdGlvbnMgaGVyZSBhIGJpdC4gV2l0aCBHZXJkIEhvZmZtYW5zIHNlcmllcyB5b3UgY2Fu
IGp1c3QKPiA+IHVzZSBhIGdlbV9ibyBwb2ludGVyIGhlcmUsIHNvIHdoYXQncyBsZWZ0IHRvIGRv
IGlzIGhhdmUgc29tZSBleHRyYWN0ZWQKPiA+IHN0cnVjdHVyZSBmb3IgdHJhY2tpbmcgbWVtb3J5
IHR5cGVzLiBJIHRoaW5rIEJyaWFuIFdlbHR5IGhhcyBzb21lIGlkZWFzCj4gPiBmb3IgdGhpcywg
ZXZlbiBpbiBwYXRjaCBmb3JtLiBXb3VsZCBiZSBnb29kIHRvIGtlZXAgaGltIG9uIGNjIGF0IGxl
YXN0IGZvcgo+ID4gdGhlIG5leHQgdmVyc2lvbi4gV2UnZCBuZWVkIHRvIGV4cGxpY2l0bHkgaGFu
ZCBpbiB0aGUgdHRtX21lbV9yZWcgKG9yCj4gPiB3aGF0ZXZlciB0aGUgc3BlY2lmaWMgdGhpbmcg
aXMgZ29pbmcgdG8gYmUpLgo+IAo+IEkgYXNzdW1lIEdlcmQgSG9mZm1hbidzIHNlcmllcyB5b3Ug
YXJlIHJlZmVycmluZyB0byBpcyB0aGlzIG9uZT8KPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9s
aXN0cy9kcmktZGV2ZWwvbXNnMjE1MDU2Lmh0bWwKClRoZXJlJ3MgYSBuZXdlciBvbmUsIG11Y2gg
bW9yZSBjb21wbGV0ZSwgYnV0IHllcyB0aGF0J3MgdGhlIHdvcmsuCgo+IEkgY2FuIGNlcnRhaW5s
eSBrZWVwIGFuIGV5ZSBvdXQgZm9yIEdlcmQncyByZWZhY3RvcmluZyB3aGlsZQo+IHJlZmFjdG9y
aW5nIG90aGVyIHBhcnRzIG9mIHRoaXMgUkZDLgo+IAo+IEkgaGF2ZSBhZGRlZCBCcmlhbiBhbmQg
R2VyZCB0byB0aGUgdGhyZWFkIGZvciBhd2FyZW5lc3MuCgpidHcganVzdCByZWFsaXplZCB0aGF0
IG1heWJlIGJ1aWxkaW5nIHRoZSBpbnRlcmZhY2VzIG9uIHRvcCBvZiB0dG1fbWVtX3JlZwppcyBt
YXliZSBub3QgdGhlIGJlc3QuIFRoYXQncyB3aGF0IHlvdSdyZSB1c2luZyByaWdodCBub3csIGJ1
dCBpbiBhIHdheQp0aGF0J3MganVzdCB0aGUgdHRtIGludGVybmFsIGRldGFpbCBvZiBob3cgdGhl
IGJhY2tpbmcgc3RvcmFnZSBpcwphbGxvY2F0ZWQuIEkgdGhpbmsgdGhlIHN0cnVjdHVyZSB3ZSBu
ZWVkIHRvIGFic3RyYWN0IGF3YXkgaXMKdHRtX21lbV90eXBlX21hbmFnZXIsIHdpdGhvdXQgYW55
IG9mIHRoZSBhY3R1YWwgbWFuYWdlbWVudCBkZXRhaWxzLgoKYnR3IHJlbWluZHMgbWU6IEkgZ3Vl
c3MgaXQgd291bGQgYmUgZ29vZCB0byBoYXZlIGEgcGVyLXR5cGUgLnRvdGFsCnJlYWQtb25seSBl
eHBvc2VkLCBzbyB0aGF0IHVzZXJzcGFjZSBoYXMgYW4gaWRlYSBvZiBob3cgbXVjaCB0aGVyZSBp
cz8KdHRtIGlzIHRyeWluZyB0byBiZSBhZ25vc3RpYyB0byB0aGUgYWxsb2NhdG9yIHRoYXQncyB1
c2VkIHRvIG1hbmFnZSBhCm1lbW9yeSB0eXBlL3Jlc291cmNlLCBzbyBkb2Vzbid0IGV2ZW4ga25v
dyB0aGF0LiBCdXQgSSB0aGluayBzb21ldGhpbmcgd2UKbmVlZCB0byBleHBvc2UgdG8gYWRtaW5z
LCBvdGhlcndpc2UgdGhleSBjYW4ndCBtZWFuaW5nZnVsbHkgc2V0IGxpbWl0cy4KLURhbmllbAot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
