Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DB119EBBE
	for <lists+amd-gfx@lfdr.de>; Sun,  5 Apr 2020 15:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834A06E23F;
	Sun,  5 Apr 2020 13:54:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F0A6E177
 for <amd-gfx@lists.freedesktop.org>; Sat,  4 Apr 2020 17:47:58 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id n1so5338339qvz.4
 for <amd-gfx@lists.freedesktop.org>; Sat, 04 Apr 2020 10:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Gp8A21M9co1Wrfg+dpxrWLW8fB04eqMFGxHjZaALidM=;
 b=LtlTRbpOBKHmy3HszgPVl1vUauawEZDef6CoHM6HP9lFqrwSJlcKdu+0/H4E1vtsOh
 9cxILap+OhoWQQGrN1bd3soG+wgO2Xp4EJU1FReqjufp5xSkTXysYHeoT4NofZ1YEDFr
 nGRtZQS1iqkFQ3768vHXN00FVgXg8GFbU0bvAGmdbdAS9gST/izzxn/XujjyL7HGkwoY
 4ZUlIbrT6bxpH+AIkpF3gIfjrsKaZNNH9WazgYyP7mHMNag3NdZMo1YJE/wjFPUrmY/Y
 6epc/fa1nStCKMnwXsB/MV4uSAg5F5oDzpviD39yYdHf9K1xTAdESwJEcE+o4Lgifk63
 Z70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Gp8A21M9co1Wrfg+dpxrWLW8fB04eqMFGxHjZaALidM=;
 b=DdTl0/GPJHijqPxwGycvylSsU6lmFsBMoY5FVC2PmT1FQa+eP+onX/BfG7+/IA/Uq0
 7d1sq2/XnLTMXCTiDbWDId7ILYEsMOpD6N9tSOcDb9qskDa0NJVEHjGYZBY3Ceuv6KCi
 M9dJuiLi2yMZem4KR74ra94GcZSw/pxxP4jYLfd3Ncre6M0vgNriFHf0Ln4tVbLuDOsc
 8IXjWjyJeowcVfd0JQ8N+S/a0BJ8Zen8z4acX9CFn1pAAsKJNJVrxYwIiOKxQgzzj6ru
 Up6uM8H+R2cZo2HhoywCoUx+S1RH6u56aRTLUhjm/4/6Z50ds8XOy1PgV/K5vLKqipwv
 /9wQ==
X-Gm-Message-State: AGi0PubHeO8FsplkvTFn/erUvBcNYL/cCVQFeytU9y/8DNFk7lD4ZqLs
 lPNoMAA6rbzu6G5Jl/8mBmUh3g==
X-Google-Smtp-Source: APiQypK3+LR2/7/2n1voE+NaOiL2DcMvLblA5hSmACUKKbp8+wnP54+P7oPjsfvK43U0gi1CJBrwyA==
X-Received: by 2002:a0c:bd99:: with SMTP id n25mr13945300qvg.149.1586022477193; 
 Sat, 04 Apr 2020 10:47:57 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
 by smtp.gmail.com with ESMTPSA id c6sm10097011qtd.4.2020.04.04.10.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2020 10:47:56 -0700 (PDT)
Message-ID: <3e5bc9f9416c3f8b2ec52436b40b82cafb717586.camel@ndufresne.ca>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and
 impact on services
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Rob Clark <robdclark@gmail.com>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel@daenzer.net>
Date: Sat, 04 Apr 2020 13:47:54 -0400
In-Reply-To: <CAF6AEGuNTtHfNm_nRhPFX5wPRmKkjnFEKqTdTSBDjpLkaiN8Fw@mail.gmail.com>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <ece8ebe3-40ec-2457-02da-4fef19cbe8f6@intel.com>
 <6d2ec570f957b4504fb70e0b1f0632712a99dc0c.camel@collabora.com>
 <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
 <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
 <d0ef47e45c83b342494e6781b808b4831a008836.camel@ndufresne.ca>
 <d9dca12759fd6a549dc4cd71b5f210a4dced01cd.camel@gmail.com>
 <CAOFGe96WqRTagf=Lhp6j9aMnB6hxwog7t93t=4r6QE_4f+HpeQ@mail.gmail.com>
 <5551426acf99f73d3ce8234c14c176c1c7a1fe44.camel@ndufresne.ca>
 <CAAxE2A5zSy7Rh6xyPW8NCqj3q0_8F7yw8tAXx=_z8+mJ-u2uWw@mail.gmail.com>
 <3cddf1aa-5072-af7c-c51e-c16039176f6c@daenzer.net>
 <CAF6AEGuNTtHfNm_nRhPFX5wPRmKkjnFEKqTdTSBDjpLkaiN8Fw@mail.gmail.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 Apr 2020 13:54:42 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Marek =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TGUgc2FtZWRpIDA0IGF2cmlsIDIwMjAgw6AgMDg6MTEgLTA3MDAsIFJvYiBDbGFyayBhIMOpY3Jp
dCA6Cj4gT24gRnJpLCBBcHIgMywgMjAyMCBhdCA3OjEyIEFNIE1pY2hlbCBEw6RuemVyIDxtaWNo
ZWxAZGFlbnplci5uZXQ+IHdyb3RlOgo+ID4gT24gMjAyMC0wMy0wMSA2OjQ2IGEubS4sIE1hcmVr
IE9sxaHDoWsgd3JvdGU6Cj4gPiA+IEZvciBNZXNhLCB3ZSBjb3VsZCBydW4gQ0kgb25seSB3aGVu
IE1hcmdlIHB1c2hlcywgc28gdGhhdCBpdCdzIGEgc3RyaWN0bHkKPiA+ID4gcHJlLW1lcmdlIENJ
Lgo+ID4gCj4gPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uISBJIGltcGxlbWVudGVkIHNvbWV0
aGluZyBsaWtlIHRoaXMgZm9yIE1lc2E6Cj4gPiAKPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy80NDMyCj4gPiAKPiAKPiBJIHdvdWxk
bid0IG1pbmQgbWFudWFsbHkgdHJpZ2dlcmluZyBwaXBlbGluZXMsIGJ1dCB1bmxlc3MgdGhlcmUg
aXMKPiBzb21lIHRyaWNrIEknbSBub3QgcmVhbGl6aW5nLCBpdCBpcyBzdXBlciBjdW1iZXJzb21l
LiAgSWUuIHlvdSBoYXZlIHRvCj4gY2xpY2sgZmlyc3QgdGhlIGNvbnRhaW5lciBqb2JzLi4gdGhl
biB3YWl0Li4gdGhlbiB0aGUgYnVpbGQgam9icy4uCj4gdGhlbiB3YWl0IHNvbWUgbW9yZS4uIGFu
ZCB0aGVuIGZpbmFsbHkgdGhlIGFjdHVhbCBydW5uZXJzLiAgVGhhdCB3b3VsZAo+IGJlIGEgcmVh
bCBzdGVwIGJhY2sgaW4gdGVybXMgb2YgdXNlZnVsbmVzcyBvZiBDSS4uIG9uZSBtaWdodCBjYWxs
IGl0IGEKPiByZWdyZXNzaW9uIDotKAoKT24gR1N0cmVhbWVyIHNpZGUgd2UgaGF2ZSBtb3ZlZCBz
b21lIGV4aXN0aW5nIHBpcGVsaW5lIHRvIG1hbnVhbCBtb2RlLgpBcyB3ZSB1c2UgbmVlZHM6IGJl
dHdlZW4gam9icywgd2UgY291bGQgc2ltcGx5IHNldCB0aGUgZmlyc3Qgam9iIHRvCm1hbnVhbCAo
aW4gb3VyIGNhc2UgaXQncyBhIHNpbmdsZSBqb2IgY2FsbGVkIG1hbmlmZXN0IGluIHlvdXIgY2Fz
ZSBpdAp3b3VsZCBiZSB0aGUgTiBjb250YWluZXIgam9icykuIFRoaXMgd2F5IHlvdSBjYW4gaGF2
ZSBhIG1hbnVhbCBwaXBlbGluZQp0aGF0IGlzIHRyaWdnZXJlZCBpbiBzaW5nbGUgKG9yIGZld2Vy
KSBjbGlja3MuIEhlcmUncyBhbiBleGFtcGxlOgoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2dzdHJlYW1lci9nc3RyZWFtZXIvcGlwZWxpbmVzLzEyODI5MgoKVGhhdCBvdXIgcG9zdC1t
ZXJnZSBwaXBlbGluZXMsIHdlIG9ubHkgdHJpZ2dlciB0aGVuIGlmIHdlIHN1c3BlY3QgYQpwcm9i
bGVtLgoKPiAKPiBJcyB0aGVyZSBhIHBvc3NpYmxlIG1pZGRsZSBncm91bmQgd2hlcmUgcHJlLW1h
cmdlIHBpcGVsaW5lcyB0aGF0IHRvdWNoCj4gYSBwYXJ0aWN1bGFyIGRyaXZlciB0cmlnZ2VyIHRo
YXQgZHJpdmVyJ3MgQ0kgam9icywgYnV0IE1ScyB0aGF0IGRvbid0Cj4gdG91Y2ggdGhhdCBkcml2
ZXIgYnV0IGRvIHRvdWNoIHNoYXJlZCBjb2RlIGRvbid0IHVudGlsIHRyaWdnZXJlZCBieQo+IG1h
cmdlPyAgSWUuIGlmIEkgaGF2ZSBhIE1SIHRoYXQgb25seSB0b3VjaGVzIG5pciwgaXQncyBwcm9i
YWJseSBvayB0bwo+IG5vdCBydW4gZnJlZWRyZW5vIGpvYnMgdW50aWwgbWFyZ2UgdHJpZ2dlcnMg
aXQuICBCdXQgaWYgSSBoYXZlIGEgTVIKPiB0aGF0IGlzIHRvdWNoaW5nIGZyZWVkcmVubywgSSdk
IHJlYWxseSByYXRoZXIgbm90IGhhdmUgdG8gd2FpdCB1bnRpbAo+IG1hcmdlIHRyaWdnZXJzIHRo
ZSBmcmVlZHJlbm8gQ0kgam9icy4KPiAKPiBCdHcsIEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9u
IChmcm9tIHBlcmlvZGljYWxseSBza2ltbWluZyB0aGUgbG9ncwo+IGluICNmcmVlZGVza3RvcCwg
c28gSSBjb3VsZCB3ZWxsIGJlIG1pc3Npbmcgb3IgbWlzdW5kZXJzdGFuZGluZwo+IHNvbWV0aGlu
ZykgdGhhdCBjYWNoaW5nL2V0YyBoYWQgYmVlbiBpbXByb3ZlZCBhbmQgbWVzYSdzIHBhcnQgb2Yg
dGhlCj4gZWdyZXNzIHdhc24ndCB0aGUgYmlnZ2VyIGlzc3VlIGF0IHRoaXMgcG9pbnQ/Cj4gCj4g
QlIsCj4gLVIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
