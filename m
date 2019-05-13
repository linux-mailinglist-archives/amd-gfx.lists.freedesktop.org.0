Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112471B991
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 17:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AE989FC8;
	Mon, 13 May 2019 15:10:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2018C89FC8
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 15:10:28 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id n17so18086287edb.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 08:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=4ss32JgU9JDPulCVT/Q8Bkdh5NJh1QTi0J8W0yRxriY=;
 b=qjGA/qXjen2LYhXDOxBAhq80KT31V6IcRTIN+79pgGci01inJRJyZ9kSHTpbIygUuq
 979PRqg72xudO1PFePwZ6AW76Ty8bl3adyWGidinH1aKI7eN2PetDtwiuFZbEsYTM90+
 kZe0F/8v6dmihYmPazeZ6vNrfy2jUe6aW79djcjf5BClSH7F5I7py0DkDE/bU2nt8J4V
 15KQ9NtH86aHzzahPSvTFOzpkc6CJrbjPNl/5ZjoiYUJALffEQdqCvKQwTu+/1GezygT
 5NX9dGZCrtG+wLRUU/1h2wKbXyYbA1oojeOnvNAO2s2NAPqbjlVBc3/qwvteh5lze5WJ
 bxGA==
X-Gm-Message-State: APjAAAVpKnQ/YunsrdF2HjYz4eBWE3qA0cmuSz0zYXokiF8+HC+qddyZ
 KsUhBpFJKJhG2cs5EHHhNo4E4Q==
X-Google-Smtp-Source: APXvYqx5/YxBRFLIRa8u4qxoG88hs4XFG5w7LiUMSIJS+T1x3h3umvHJ3/FBJ0LyytRqGKJHmE2UPQ==
X-Received: by 2002:a17:906:6050:: with SMTP id
 p16mr22771616ejj.173.1557760226759; 
 Mon, 13 May 2019 08:10:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id l50sm540160edd.46.2019.05.13.08.10.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 08:10:26 -0700 (PDT)
Date: Mon, 13 May 2019 17:10:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
Message-ID: <20190513151022.GU17751@phenom.ffwll.local>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <f63c8d6b-92a4-2977-d062-7e0b7036834e@gmail.com>
 <CAOWid-fpHqvq35C+gfHmLnuHM9Lj+iiHFXE=3RPrkAiFL2=wvQ@mail.gmail.com>
 <1ca1363e-b39c-c299-1d24-098b1059f7ff@amd.com>
 <CAOWid-eVz4w-hN=4tPZ1AOu54xMH_2ztDDZaMEKRCAeBgt9Dyw@mail.gmail.com>
 <64d12227-a0b9-acee-518c-8c97c5da4136@amd.com>
 <CAOWid-es+C_iStQUkM52mO3TeP8eS9MX+emZDQNH2PyZCf=RHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-es+C_iStQUkM52mO3TeP8eS9MX+emZDQNH2PyZCf=RHQ@mail.gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4ss32JgU9JDPulCVT/Q8Bkdh5NJh1QTi0J8W0yRxriY=;
 b=Mh0wCOY6EaThV+62KOziiRmjlazWjTKIQN5KVPkWwtOgFIKq1TJyIWfUSYxqgx/XTV
 i4g7DcyOQP5J8xgMcY+Ki7XHSiX8JR5wM5224ALR0T7Vto7lODvPL/6pTptf8Uw0oQSI
 0fx8d/VMPs6/Ov/aeI7eZS4Uq6VVzcd4wK8v8=
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
Cc: "sunnanyong@huawei.com" <sunnanyong@huawei.com>, "Ho,
 Kenny" <Kenny.Ho@amd.com>, Brian Welty <brian.welty@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Tejun Heo <tj@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDI6NTA6MzlQTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gT24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMTo0OCBQTSBLb2VuaWcsIENocmlzdGlhbgo+IDxD
aHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4gV2VsbCBhbm90aGVyIHF1ZXN0aW9u
IGlzIHdoeSBkbyB3ZSB3YW50IHRvIHByZXZlbnQgdGhhdCBpbiB0aGUgZmlyc3QgcGxhY2U/Cj4g
Pgo+ID4gSSBtZWFuIHRoZSB3b3JzdCB0aGluZyB0aGF0IGNhbiBoYXBwZW4gaXMgdGhhdCB3ZSBh
Y2NvdW50IGEgQk8gbXVsdGlwbGUKPiA+IHRpbWVzLgo+IFRoYXQncyBvbmUgb2YgdGhlIHByb2Js
ZW1zLiAgVGhlIG90aGVyIG9uZSBpcyB0aGUgQk8gb3V0bGl2aW5nIHRoZQo+IGxpZmV0aW1lIG9m
IGEgY2dyb3VwIGFuZCB0aGVyZSdzIG5vIGdvb2Qgd2F5IHRvIHVuLWNoYXJnZSB0aGUgdXNhZ2UK
PiB3aGVuIHRoZSBCTyBpcyBmcmVlIHNvIHRoZSBjb3VudCB3b24ndCBiZSBhY2N1cmF0ZS4KPiAK
PiBJIGhhdmUgbG9va2VkIGludG8gdHdvIHBvc3NpYmxlIHNvbHV0aW9ucy4gIE9uZSBpcyB0byBw
cmV2ZW50IGNncm91cAo+IGZyb20gYmVpbmcgcmVtb3ZlZCB3aGVuIHRoZXJlIGFyZSBCT3Mgb3du
ZWQgYnkgdGhlIGNncm91cCBzdGlsbCBhbGl2ZQo+IChzaW1pbGFyIHRvIGhvdyBjZ3JvdXAgcmVt
b3ZhbCB3aWxsIGZhaWwgaWYgaXQgc3RpbGwgaGFzIHByb2Nlc3Nlcwo+IGF0dGFjaGVkIHRvIGl0
LikgIE15IGNvbmNlcm4gaGVyZSBpcyB0aGUgcG9zc2liaWxpdHkgb2Ygbm90IGFibGUgdG8KPiBy
ZW1vdmUgYSBjZ3JvdXAgZm9yZXZlciBkdWUgdG8gdGhlIGxpZmV0aW1lIG9mIGEgQk8gKGNvbnRp
bnVvdXNseQo+IGJlaW5nIHNoYXJlZCBhbmQgcmV1c2UgYW5kIG5ldmVyIGRpZS4pICBQZXJoYXBz
IHlvdSBjYW4gc2hlZCBzb21lCj4gbGlnaHQgb24gdGhpcyBwb3NzaWJpbGl0eS4KPiAKPiBUaGUg
b3RoZXIgb25lIGlzIHRvIGtlZXAgdHJhY2sgb2YgYWxsIHRoZSBidWZmZXJzIGFuZCBtaWdyYXRl
IHRoZW0gdG8KPiB0aGUgcGFyZW50IGlmIGEgY2dyb3VwIGlzIGNsb3NlZC4gIE15IGNvbmNlcm4g
aGVyZSBpcyB0aGUgcGVyZm9ybWFuY2UKPiBvdmVyaGVhZCBvbiB0cmFja2luZyBhbGwgdGhlIGJ1
ZmZlcnMuCgpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgb3RoZXIgY2dyb3VwcyBhbHJlYWR5IHVz
ZSByZWZlcmVuY2UgY291bnRpbmcgdG8KbWFrZSBzdXJlIHRoZSBkYXRhIHN0cnVjdHVyZSBpbiB0
aGUga2VybmVsIGRvZXNuJ3QgZGlzYXBwZWFyIHRvbyBlYXJseS4gU28KeW91IGNhbiBkZWxldGUg
dGhlIGNncm91cCwgYnV0IGl0IG1pZ2h0IG5vdCBnZXQgZnJlZWQgY29tcGxldGVseSB1bnRpbCBh
bGwKdGhlIEJPIGFsbG9jYXRlZCBmcm9tIHRoYXQgY2dyb3VwIGFyZSByZWxlYXNlZC4gVGhlcmUn
cyBhIHJlY2VudCBsd24KYXJ0aWNsZSBvbiBob3cgdGhhdCdzIG5vdCBhbGwgdGhhdCBhd2Vzb21l
IGZvciB0aGUgbWVtb3J5IGNncm91cApjb250cm9sbGVyLCBhbmQgd2hhdCB0byBkbyBhYm91dCBp
dDoKCmh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy83ODc2MTQvCgpXZSBwcm9iYWJseSB3YW50IHRv
IGFsaWduIHdpdGggd2hhdGV2ZXIgdGhlIG1lbSBjZ3JvdXAgZm9sa3MgY29tZSB1cCB3aXRoCihz
byBfbm90XyBwcmV2ZW50IGRlbGV0aW9uIG9mIHRoZSBjZ3JvdXAsIHNpbmNlIHRoYXQncyBkaWZm
ZXJlbnQKYmVoYXZpb3VyKS4KCj4gPiBBbmQgZ29pbmcgaW50byB0aGUgc2FtZSBkaXJlY3Rpb24g
d2hlcmUgaXMgdGhlIGNvZGUgdG8gaGFuZGxlIGFuIG9wZW4KPiA+IGRldmljZSBmaWxlIGRlc2Ny
aXB0b3Igd2hpY2ggaXMgc2VuZCBmcm9tIG9uZSBjZ3JvdXAgdG8gYW5vdGhlcj8KPiBJIGxvb2tl
ZCBpbnRvIHRoaXMgYmVmb3JlIGJ1dCBJIGZvcmdvdCB3aGF0IEkgZm91bmQuICBQZXJoYXBzIGZv
bGtzCj4gZmFtaWxpYXIgd2l0aCBkZXZpY2UgY2dyb3VwIGNhbiBjaGltZSBpbi4KPiAKPiBBY3R1
YWxseSwganVzdCBkaWQgYW5vdGhlciBxdWljayBzZWFyY2ggcmlnaHQgbm93LiAgTG9va3MgbGlr
ZSB0aGUKPiBhY2Nlc3MgaXMgZW5mb3JjZWQgYXQgdGhlIGlub2RlIGxldmVsIChfX2RldmNncm91
cF9jaGVja19wZXJtaXNzaW9uKQo+IHNvIHRoZSBmZCBzZW50IHRvIGFub3RoZXIgY2dyb3VwIHRo
YXQgZG9lcyBub3QgaGF2ZSBhY2Nlc3MgdG8gdGhlCj4gZGV2aWNlIHNob3VsZCBzdGlsbCBub3Qg
aGF2ZSBhY2Nlc3MuCgpUaGF0J3MgdGhlIGRldmljZSBjZ3JvdXAsIG5vdCB0aGUgbWVtb3J5IGFj
Y291bnRpbmcgc3R1ZmYuCgpJbW8gZm9yIG1lbW9yeSBhbGxvY2F0aW9ucyB3ZSBzaG91bGQgbG9v
ayBhdCB3aGF0IGhhcHBlbnMgd2hlbiB5b3UgcGFzcyBhCnRlbXBmcyBmaWxlIGFyb3VuZCB0byBh
bm90aGVyIGNncm91cCBhbmQgdGhlbiBleHRlbmQgaXQgdGhlcmUuIEkgdGhpbmsKdGhvc2UgYWxs
b2NhdGlvbnMgYXJlIGNoYXJnZWQgYWdhaW5zdCB0aGUgY2dyb3VwIHdoaWNoIGFjdHVhbGx5IGFs
bG9jYXRlcwpzdHVmZi4KClNvIGZvciBkcm0sIGlmIHlvdSBwYXNzIGFyb3VuZCBhIGRldmljZSBm
ZCwgdGhlbiB3ZSBhbHdheXMgY2hhcmdlIGlvY3RsCmNhbGxzIHRvIGNyZWF0ZSBhIEJPIGFnYWlu
c3QgdGhlIHByb2Nlc3MgZG9pbmcgdGhlIGlvY3RsIGNhbGwsIG5vdCBhZ2FpbnN0CnRoZSBwcm9j
ZXNzIHdoaWNoIG9yaWdpbmFsbHkgb3BlbmVkIHRoZSBkZXZpY2UgZmQuIEZvciBlLmcuIERSSTMg
dGhhdCdzCmFjdHVhbGx5IHRoZSBvbmx5IHJlYXNvbmFibGUgdGhpbmcgdG8gZG8sIHNpbmNlIG90
aGVyd2lzZSB3ZSdkIGNoYXJnZQpldmVyeXRoaW5nIGFnYWluc3QgdGhlIFhzZXJ2ZXIuCi1EYW5p
ZWwKCj4gCj4gUmVnYXJkcywKPiBLZW5ueQo+IAo+IAo+ID4gUmVnYXJkcywKPiA+IENocmlzdGlh
bi4KPiA+Cj4gPiA+Cj4gPiA+IFJlZ2FyZHMsCj4gPiA+IEtlbm55Cj4gPiA+Cj4gPiA+Pj4gT24g
dGhlIG90aGVyIGhhbmQsIGlmIHRoZXJlIGFyZSBleHBlY3RhdGlvbnMgZm9yIHJlc291cmNlIG1h
bmFnZW1lbnQKPiA+ID4+PiBiZXR3ZWVuIGNvbnRhaW5lcnMsIEkgd291bGQgbGlrZSB0byBrbm93
IHdobyBpcyB0aGUgZXhwZWN0ZWQgbWFuYWdlcgo+ID4gPj4+IGFuZCBob3cgZG9lcyBpdCBmaXQg
aW50byB0aGUgY29uY2VwdCBvZiBjb250YWluZXIgKHdoaWNoIGVuZm9yY2Ugc29tZQo+ID4gPj4+
IGxldmVsIG9mIGlzb2xhdGlvbi4pICBPbmUgcG9zc2libGUgbWFuYWdlciBtYXkgYmUgdGhlIGRp
c3BsYXkgc2VydmVyLgo+ID4gPj4+IEJ1dCBhcyBsb25nIGFzIHRoZSBkaXNwbGF5IHNlcnZlciBp
cyBpbiBhIHBhcmVudCBjZ3JvdXAgb2YgdGhlIGFwcHMnCj4gPiA+Pj4gY2dyb3VwLCB0aGUgYXBw
cyBjYW4gc3RpbGwgaW1wb3J0IGhhbmRsZXMgZnJvbSB0aGUgZGlzcGxheSBzZXJ2ZXIKPiA+ID4+
PiB1bmRlciB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbi4gIE15IHVuZGVyc3RhbmRpbmcgaXMg
dGhhdCB0aGlzIGlzCj4gPiA+Pj4gbW9zdCBsaWtlbHkgdGhlIGNhc2UsIHdpdGggdGhlIGRpc3Bs
YXkgc2VydmVyIHNpbXBseSBzaXR0aW5nIGF0IHRoZQo+ID4gPj4+IGRlZmF1bHQvcm9vdCBjZ3Jv
dXAuICBCdXQgSSBjZXJ0YWlubHkgd2FudCB0byBoZWFyIG1vcmUgYWJvdXQgb3RoZXIKPiA+ID4+
PiB1c2UgY2FzZXMgKGZvciBleGFtcGxlLCBpcyBydW5uaW5nIG11bHRpcGxlIGRpc3BsYXkgc2Vy
dmVycyBvbiBhCj4gPiA+Pj4gc2luZ2xlIGhvc3QgYSByZWFsaXN0aWMgcG9zc2liaWxpdHk/ICBB
cmUgdGhlcmUgcGVvcGxlIHJ1bm5pbmcKPiA+ID4+PiBtdWx0aXBsZSBkaXNwbGF5IHNlcnZlcnMg
aW5zaWRlIHBlZXIgY29udGFpbmVycz8gIElmIHNvLCBob3cgZG8gdGhleQo+ID4gPj4+IGNvb3Jk
aW5hdGUgcmVzb3VyY2VzPykKPiA+ID4+IFdlIGRlZmluaXRlbHkgaGF2ZSBzaXR1YXRpb25zIHdp
dGggbXVsdGlwbGUgZGlzcGxheSBzZXJ2ZXJzIHJ1bm5pbmcKPiA+ID4+IChqdXN0IHRoaW5rIG9m
IFZSKS4KPiA+ID4+Cj4gPiA+PiBJIGp1c3QgY2FuJ3Qgc2F5IGlmIHRoZXkgY3VycmVudGx5IHVz
ZSBjZ3JvdXBzIGluIGFueSB3YXkuCj4gPiA+Pgo+ID4gPj4gVGhhbmtzLAo+ID4gPj4gQ2hyaXN0
aWFuLgo+ID4gPj4KPiA+ID4+PiBJIHNob3VsZCBwcm9iYWJseSBzdW1tYXJpemUgc29tZSBvZiB0
aGVzZSBpbnRvIHRoZSBjb21taXQgbWVzc2FnZS4KPiA+ID4+Pgo+ID4gPj4+IFJlZ2FyZHMsCj4g
PiA+Pj4gS2VubnkKPiA+ID4+Pgo+ID4gPj4+Cj4gPiA+Pj4KPiA+ID4+Pj4gQ2hyaXN0aWFuLgo+
ID4gPj4+Pgo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
