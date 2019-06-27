Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3242958D1E
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 23:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8366E83B;
	Thu, 27 Jun 2019 21:33:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EB06E839
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 21:33:22 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k8so8497072eds.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 14:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ymOdyMM4kE64/AUQiKyV50r6ZF407r2qw9+vaz2LbUI=;
 b=s2WaOfRQEUucKgPhSpA8J/VDPTRX706fhItab/Cj2ssjhGyYnDtfZJhhGll3oLGitr
 HyR8auP/9odKGae/4DI3pdipul34P9ecuVu8vzB51ACIOOynwYc7dQcE1IxipNFi/rLf
 8Eaw56s1N4KeV86K8lWgkAN3lYOTL137vLKY+K2Cn9aElJvD7F8kr37Wn+/L/lNRjK3B
 v5vu9y0BIOPzoctFZIasyiNS+FjO8/k1H/Gd/62+gpxRXsn9cgIzsrSPzXJFU2VOkKHM
 7hU0tgL7rkJ8KrlxizC0tw1cLp3uUAcJBO0hK76wPmNJEPkc3m61sAIfuhfnny0H7w8n
 oTEQ==
X-Gm-Message-State: APjAAAU2EzDYndBz7V6e7jjtMyAXR5uhXMOZ8KMpapKNN0OCMA551f+c
 A2C2Qv2BEQPIqxWM3a2ot19s/Q==
X-Google-Smtp-Source: APXvYqxjRbFKIe6IvjmJOpPred6Rdtl4vcg0lEYGA3qs82CKrGWrX1IF77bjtg7XJeyS5vyoT9pSfg==
X-Received: by 2002:a17:906:6a89:: with SMTP id
 p9mr5325560ejr.44.1561671201380; 
 Thu, 27 Jun 2019 14:33:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y18sm40743ejh.84.2019.06.27.14.33.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 14:33:20 -0700 (PDT)
Date: Thu, 27 Jun 2019 23:33:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC PATCH v3 07/11] drm, cgroup: Add TTM buffer allocation stats
Message-ID: <20190627213317.GP12905@phenom.ffwll.local>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-8-Kenny.Ho@amd.com>
 <20190626161254.GS12905@phenom.ffwll.local>
 <CAOWid-f3kKnM=4oC5Bba5WW5WNV2MH5PvVamrhO6LBr5ydPJQg@mail.gmail.com>
 <20190627060113.GC12905@phenom.ffwll.local>
 <CAOWid-e=M4Rf30s8ZoK5n2fOYNHhvpun0H=7URsKmsGc3Z0FDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-e=M4Rf30s8ZoK5n2fOYNHhvpun0H=7URsKmsGc3Z0FDQ@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ymOdyMM4kE64/AUQiKyV50r6ZF407r2qw9+vaz2LbUI=;
 b=MW1qpb3KrqbU/Ri52N56RHJJu7qB/KHN0qgpeEJFE+8Ms9Ugd0095JF4DfwKy7Egk9
 HiMg+Jc+1knkFL32tTiY098a490CCZrIQzEkunpROdZ5dxGhMm3TZgBXeLYDsR+gf+6f
 QRMptRQYM6W86dRG6gll7PSlfiGFvycyPyDHc=
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

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDQ6MTc6MDlQTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMjowMSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgo+ID4gYnR3IHJlbWluZHMgbWU6IEkgZ3Vlc3MgaXQgd291bGQgYmUg
Z29vZCB0byBoYXZlIGEgcGVyLXR5cGUgLnRvdGFsCj4gPiByZWFkLW9ubHkgZXhwb3NlZCwgc28g
dGhhdCB1c2Vyc3BhY2UgaGFzIGFuIGlkZWEgb2YgaG93IG11Y2ggdGhlcmUgaXM/Cj4gPiB0dG0g
aXMgdHJ5aW5nIHRvIGJlIGFnbm9zdGljIHRvIHRoZSBhbGxvY2F0b3IgdGhhdCdzIHVzZWQgdG8g
bWFuYWdlIGEKPiA+IG1lbW9yeSB0eXBlL3Jlc291cmNlLCBzbyBkb2Vzbid0IGV2ZW4ga25vdyB0
aGF0LiBCdXQgSSB0aGluayBzb21ldGhpbmcgd2UKPiA+IG5lZWQgdG8gZXhwb3NlIHRvIGFkbWlu
cywgb3RoZXJ3aXNlIHRoZXkgY2FuJ3QgbWVhbmluZ2Z1bGx5IHNldCBsaW1pdHMuCj4gCj4gSSBk
b24ndCB0aGluayBJIHVuZGVyc3RhbmQgdGhpcyBiaXQsIGRvIHlvdSBtZWFuIHRvdGFsIGFjcm9z
cyBtdWx0aXBsZQo+IEdQVSBvZiB0aGUgc2FtZSBtZW0gdHlwZT8gIE9yIGRvIHlvdSBtZWFuIHRo
ZSB0b3RhbCBhdmFpbGFibGUgcGVyIEdQVQo+IChvciBzb21ldGhpbmcgZWxzZT8pCgpUb3RhbCBm
b3IgYSBnaXZlbiB0eXBlIG9uIGEgZ2l2ZW4gY3B1LiBFLmcuIG1heWJlIHlvdSB3YW50IHRvIGdp
dmUgNTAlIG9mCnlvdXIgdnJhbSB0byBvbmUgY2dyb3VwLCBhbmQgdGhlIG90aGVyIDUwJSB0byB0
aGUgb3RoZXIgY2dyb3VwLiBGb3IgdGhhdAp5b3UgbmVlZCB0byBrbm93IGhvdyBtdWNoIHZyYW0g
eW91IGhhdmUuIEFuZCBleHBlY3RpbmcgcGVvcGxlIHRvIGxzcGNpIGFuZAp0aGVuIGxvb2sgYXQg
d2lraXBlZGlhIGZvciBob3cgbXVjaCB2cmFtIHRoYXQgY2hpcCBzaG91bGQgaGF2ZSAob3IKc29t
ZXRoaW5nIGxpa2UgdGhhdCkgaXNuJ3QgZ3JlYXQuIEhlbmNlIDAudnJhbS50b3RhbCwgMC50dC50
b3RhbCwgYW5kIHNvCm9uIChhbHNvIGZvciBhbGwgdGhlIG90aGVyIGdwdSBtaW5vcnMgb2ZjKS4g
IEZvciBzeXN0ZW0gbWVtb3J5IHdlIHByb2JhYmx5CmRvbid0IHdhbnQgdG8gcHJvdmlkZSBhIHRv
dGFsLCBzaW5jZSB0aGF0J3MgYWxyZWFkeSBhIHZhbHVlIHRoYXQncyBlYXN5IHRvCm9idGFpbiBm
cm9tIHZhcmlvdXMgc291cmNlcy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
