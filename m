Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED487BE7C
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 12:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900D189C03;
	Wed, 31 Jul 2019 10:40:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EF689C09
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:40:04 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id l12so50377917oil.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 03:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FT8BCnReTVWsK1Zw6d0KAMxCTssZr1l4jCPk+ZBTblc=;
 b=QxJe0Q4DVSVEUJ4dO6vMMbZZRcokraTCTzlx/JIMxxXohd+Qh59UXeKcs9fJO8MbRw
 aRJbyJWAgfuvZLWoEcV0lUcr0VR7BvKMRiq2SfmcgliWaAFec5N9VQoXqxqEuHpADkJM
 ItOaLTRJB9QrOdM6dPtPRBPXdCf+zEL/wx98l9ZNqRPQD53qG1ZpmEGiv90RYJsW6qYl
 bZFNfRq4QVcIeQz1pzlYBMw1V5b/a5cblM2Ja46h8l4CdRdvIfLuPptDm+q4ccEL/izF
 SV/KHXv5k9QIftaOgxWNsYiRiBoVpexeuSy5J0Qw1JDhMG1tPv0vn+rW4Js/2/UjlViT
 z+SA==
X-Gm-Message-State: APjAAAVHrMgIB1H65kfK6p8AOgnEAv9NcmipOap81O7R3+zFm/eqMJlg
 SqEbKcodpm1+nImTnOzgVfOiVBC6VyU2oj8grJ4PpIF3
X-Google-Smtp-Source: APXvYqwEDVlKPyKbVvSm6m7YDESLXD3NSOyX7G7pZ0K2EJsiD8iiImBKA4YJlemiOABe9W8dlfDxZOGDwb2K7uMMxXM=
X-Received: by 2002:aca:b2d5:: with SMTP id
 b204mr53111384oif.101.1564569603172; 
 Wed, 31 Jul 2019 03:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122310.1498-1-christian.koenig@amd.com>
 <20190731091231.GI7444@phenom.ffwll.local>
 <25a20ce9-2013-07b6-1e4d-f40698a653ae@gmail.com>
In-Reply-To: <25a20ce9-2013-07b6-1e4d-f40698a653ae@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 31 Jul 2019 12:39:51 +0200
Message-ID: <CAKMK7uGp64yzpuW_QOJds_ZD=4+z9ymZtpwHT+u2zhD95z4Xnw@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v13
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FT8BCnReTVWsK1Zw6d0KAMxCTssZr1l4jCPk+ZBTblc=;
 b=VACX65fK4GThCHPnxeh2CdB+0Wqf71oLIaP8uwBy+gvs8dMyUoUBkePM8Nc8cqvG1g
 PWsKcCA2bSqGWPOItYg2TDdfcd8oIxi4Kor+0phTo4QgNGhKOk/03IX+uEB92qDf5lxy
 D+tZt10IYjhe0eNY217lIStDC6eklbUNzg1tI=
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTE6NDQgQU0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQW0gMzEuMDcuMTkgdW0gMTE6
MTIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+ID4gW1NOSVBdCj4gPiBJIHRoaW5rIEkgYnJvdWdo
dCB0aGlzIHVwIGJlZm9yZSwgYnV0IG5ldyB0b3AtcG9zdCBmb3IgYSBjbGVhbiBzdGFydC4KPiA+
Cj4gPiBVc2UtY2FzZSBJIGhhdmUgaW4gbWluZCBpcyBzb21ldGhpbmcgbGlrZSBhbWRrZmQncyBt
b2RlbCwgd2hlcmUgeW91IGhhdmUgYQo+ID4gbGlzdCBvZiBidWZmZXJzIChwZXIgY29udGV4dCBv
ciB3aGF0ZXZlcikgdGhhdCB5b3UgYWx3YXlzIG5lZWQgdG8gaGF2ZQo+ID4gcHJlc2VudC4gSWRl
YSBpcyB0byBhbHNvIHVzZSB0aGlzIGZvciB0cmFkaXRpb25hbCBDUyBmb3IgdmsvZ2wsIHRvIGN1
dAo+ID4gZG93biBvbiB0aGUgYnVmZmVyIG1hbmFnZW1lbnQgb3ZlcmhlYWQsIGJ1dCB3ZSdkIHN0
aWxsIGFsbG93IGFkZGl0aW9uYWwKPiA+IGJ1ZmZlcnMgdG8gYmUgbGlzdGVkIHBlci1DUyBvbiB0
b3Agb2YgdGhhdCBkZWZhdWx0IHdvcmtpbmcgc2V0Lgo+ID4KPiA+IFRoaXMgb2YgY291cnNlIG1l
YW5zIG5vIGltcGxpY2l0IHN5bmMgYW55bW9yZSBvbiB0aGVzZSBkZWZhdWx0IGJ1ZmZlcnMKPiA+
ICh0aGUgcG9pbnQgaXMgdG8gYXZvaWQgdG91Y2hpbmcgZXZlcnkgYnVmZmVyIG9uIGV2ZXJ5IENT
LCB1cGRhdGluZyBmZW5jZXMKPiA+IHdvdWxkIGRlZmVhdCB0aGF0KS4gVGhhdCdzIHdoeSB0aGUg
Q1MgY2FuIHN0aWxsIGxpc3QgYWRkaXRpb25hbCBidWZmZXJzLAo+ID4gdGhlIG9ubHkgcmVhc29u
IGZvciB0aGF0IGlzIHRvIGFkZCBpbXBsaWNpdCBzeW5jIGZlbmNlcy4gVGhvc2UgYnVmZmVycwo+
ID4gd291bGQgYmUgbW9zdCBsaWtlbHkgaW4gdGhlIGRlZmF1bHQgd29ya2luZyBzZXQgYWxyZWFk
eS4KPiA+Cj4gPiBDb25zZXF1ZW5jZSBpcyB0aGF0IEkgd2FudCB0aGUgYW1ka2ZkIG1vZGVsIG9m
ICJldmljdCB3aGVuIG5lZWRlZCwgYnV0Cj4gPiBrZWVwIHJlc2lkZW50IGJ5IGRlZmF1bHQiLCBi
dXQgYWxzbyB3b3JraW5nIGltcGxpY2l0IGZlbmNlcy4gQW5kIGl0IG11c3QKPiA+IGJlIGRvYWJs
ZSB3aXRob3V0IHRvdWNoaW5nIGV2ZXJ5IGJvIG9uIGV2ZXJ5IENTLiBMaXN0aW5nIHBvc3NpYmxl
Cj4gPiBpbXBsZW1lbnRhdGlvbiBvcHRpb25zOgo+ID4KPiA+IC0gdGhlIGFtZGtmZCB0cmljayBk
b2Vzbid0IHdvcmsgYmVjYXVzZSBpdCB3b3VsZCBicmVhayBpbXBsaWNpdCBmZW5jaW5nIC0KPiA+
ICAgIGFueSBpbXBsaWNpdCBzeW5jIHdvdWxkIGFsd2F5cyByZXN1bHQgaW4gdGhlIGNvbnRleHQg
Z2V0dGluZwo+ID4gICAgcHJlZW1wdGVkL2V2aWN0ZWQsIHdoaWNoIGlzbid0IGdyZWF0Lgo+Cj4g
SSdtIGFjdHVhbGx5IHdvcmtpbmcgb24gcmUtd29ya2luZyBpbXBsaWNpdCBmZW5jaW5nIHRvd2Fy
ZHMgYmV0dGVyCj4gc3VwcG9ydGluZyB0aGlzLgo+Cj4gQmFzaWMgaWRlYSBpcyB0aGF0IHlvdSBz
cGxpdCB1cCB0aGUgZmVuY2VzIGluIGEgcmVzZXJ2YXRpb24gb2JqZWN0IGludG8KPiB0aHJlZSBj
YXRlZ29yaWVzOgo+IDEuIEltcGxpY2l0IHN5bmMgb24gd3JpdGUuCj4gMi4gSW1wbGljaXQgc3lu
YyBvbiByZWFkLgo+IDMuIE5vIGltcGxpY2l0IHN5bmMgYXQgYWxsLgoKTm90IHJlYWxseSBzdXJl
IHdoYXQgeW91IHdhbnQgdG8gZG8gaGVyZSAuLi4gaW1wbGljaXQgc3luYyBpcyBvcHQtaW4KKG9y
IG9wdC1vdXQgZmxhZyBpZiB5b3UgbmVlZCB0byBrZWVwIENTIGJhY2t3YXJkcyBjb21wYXQpIHBl
ciBCTy9DUy4KQXQgbGVhc3Qgd2hlbiB3ZSBkaXNjdXNzZWQgdGhpcyBmb3JldmVyIGF0IHNvbWUg
WERDcyBjb25zZW5zdXMgd2FzCnRoYXQgc3RvcmluZyB0aGUgaW1wbGljaXQgc3luYyBtb2RlIG9u
IHRoZSBCTyBpcyBub3QgZ29pbmcgdG8gd29yay4KCj4gVGhpcyBzaG91bGQgbm90IG9ubHkgaGVs
cCB0aGUgS0ZELCBidXQgYWxzbyB3aXRoIGFtZGdwdSBjb21tYW5kCj4gc3VibWlzc2lvbiBhbmQg
dGhpbmdzIGxpa2UgcGFnZSB0YWJsZXMgdXBkYXRlcy4KPgo+IEUuZy4gd2UgbmVlZCB0byBmZW5j
ZXMgZm9yIHBhZ2UgdGFibGVzIHVwZGF0ZXMgYXJvdW5kIGluIHJlc2VydmF0aW9uCj4gb2JqZWN0
cyBhcyB3ZWxsLCBidXQgeW91IHJlYWxseSByZWFsbHkgcmVhbGx5IGRvbid0IHdhbnQgYW55IGlt
cGxpY2l0Cj4gc3luY2hyb25pemF0aW9uIHdpdGggdGhlbSA6KQoKV2h5IGRvIHlvdSBldmVuIHRy
eSB0byBkbyBpbXBsaWNpdCBzeW5jIHdpdGggeW91ciBwYWdldGFibGVzPyBIb3cgY2FuCnlvdXIg
cGFnZXRhYmxlcyBldmVuIGdldCBhbnl3aGVyZSBuZWFyIHdoZXJlIGltcGxpY2l0IHN5bmMgbWF0
dGVycz8KSSdtIGNvbmZ1c2VkIC4uLiBJZiBpdCdzIGJlY2F1c2UgdHRtIGRvZXNuJ3QgYWxsb3cg
eW91IHRvIG92ZXJyaWRlIHRoZQpldmljdGlvbiBvcmRlciBiZWNhdXNlIGl0J3MgYSBtaWRsYXll
ciBJIHRoaW5rIHRoZSBjb3JyZWN0IGZpeCBpcyB0bwpkZW1pZGxheWVyLgoKPiBJIHRoaW5rIHRo
YXQgaGF2aW5nIGEgY29uc2Vuc3VzIG9mIHRoZSBtZWFuaW5nIG9mIHRoZSBmZW5jZXMgaW4gYQo+
IHJlc2VydmF0aW9uIG9iamVjdCB3aWxsIGJlIHJhdGhlciBmdW5kYW1lbnRhbCBmb3Igd2hhdCB3
ZSBhcmUgcGxhbm5pbmcKPiB0byBkbyBoZXJlLgoKWWVhaCB0aGF0IEkgY2FuIGFncmVlIG9uLgoK
PiA+IC0gd2Ugc2hhcmUgdGhlIHJlc3Zfb2JqIGJldHdlZW4gYWxsIHRoZSBidWZmZXJzIGluIHRo
ZSBkZWZhdWx0IHdvcmtpbmcgc2V0Cj4gPiAgICBvZiBhIGNvbnRleHQsIHdpdGggdW5zaGFyaW5n
L3Jlc2hhcmluZyB0aGUgcmVzdl9vYmogaWYgdGhleSBlbnRlci9sZWF2ZQo+ID4gICAgdGhlIGRl
ZmF1bHQgd29ya2luZyBzZXQuIFRoYXQgd2F5IHRoZXJlJ3Mgb25seSBvbmUgcmVzdl9vYmogdG8g
dXBkYXRlIG9uCj4gPiAgICBlYWNoIENTLCBhbmQgd2UgY2FuIGF0dGFjaCBhIG5ldyBzaGFyZWQg
ZmVuY2UgZm9yIGV2ZXJ5IENTLiBUcm91YmxlIGlzCj4gPiAgICB0aGF0IHRoaXMgbWVhbnMgYSBn
aXZlbiBidWZmZXIgY2FuIG9ubHkgYmUgcGFydCBvZiBvbmUgZGVmYXVsdCB3b3JraW5nCj4gPiAg
ICBzZXQsIHNvIGFsbCBzaGFyZWQgYnVmZmVycyB3b3VsZCBuZWVkIHRvIGJlIGxpc3RlZCBhZ2Fp
biBzZXBhcmF0ZWx5LiBOb3QKPiA+ICAgIHNvIGdyZWF0IGlmIHVzZXJzcGFjZSBoYXMgdG8gZGVh
bCB3aXRoIHRoYXQgZmFpcmx5IGFyYml0cmFyeSBsaW1pdGF0aW9uLgo+Cj4gWWVhaCwgdGhhdCBp
cyBleGFjdGx5IHdoYXQgd2UgZG8gd2l0aCB0aGUgcGVyIFZNIEJPcyBpbiBhbWRncHUuCj4KPiBU
aGUgbGltaXRhdGlvbiB0aGF0IHlvdSBoYXZlIG9ubHkgb25lIHdvcmtpbmcgc2V0IGFjdHVhbGx5
IHR1cm5lZCBvdXQgdG8KPiBiZSBub3QgYSBsaW1pdGF0aW9uIGF0IGFsbCwgYnV0IHJhdGhlciBz
ZWVuIGFzIHNvbWV0aGluZyB3ZWxjb21lZCBieSBvdXIKPiBWdWxrYW4gZ3V5cy4KCldlIGhhdmUg
cGVyLWN0eCB2bXMgaW4gaTkxNSwgYnV0IEkgZ3Vlc3MgZXZlbiBmb3IgdGhvc2Ugc2hhcmluZyB3
aWxsIGJlIGxpbWl0ZWQuCgo+IEkgYWxzbyBkb24ndCByZWFsbHkgc2VlIGEgd2F5IHRvIGhhdmUg
YW4gaW1wbGVtZW50YXRpb24gd2l0aCBnb29kCj4gcGVyZm9ybWFuY2Ugd2hlcmUgQk9zIGNhbiBi
ZSBpbiBtdWx0aXBsZSB3b3JraW5nIHNldHMgYXQgdGhlIHNhbWUgdGltZS4KPgo+ID4gLSB3ZSBh
bGxvdyB0aGUgLT5tb3ZlX25vdGlmeSBjYWxsYmFjayB0byBhZGQgbmV3IGZlbmNlcywgd2hpY2gg
dGhlCj4gPiAgICBleHBvcnRlciBuZWVkcyB0byB3YWl0IG9uIGJlZm9yZSBpdCBzY2hlZHVsZXMg
dGhlIHBpcGVsaW5lZCBtb3ZlLiBUaGlzCj4gPiAgICBhbHNvIGF2b2lkcyB0aGUgcGVyLUJPIHVw
ZGF0ZSBvbiBldmVyeSBDUywgYW5kIGl0IHdvdWxkIGFsbG93IGJ1ZmZlcnMgdG8KPiA+ICAgIGJl
IHNoYXJlZCBhbmQgdG8gYmUgaW4gbXVsdGlwbGUgZGVmYXVsdCB3b3JraW5nIHNldHMuIFRoZSBk
b3duc2lkZSBpcwo+ID4gICAgdGhhdCAtPm1vdmVfbm90aWZ5IG5lZWRzIHRvIGJlIGFibGUgdG8g
Y29wZSB3aXRoIGFkZGVkIGZlbmNlcywgd2hpY2gKPiA+ICAgIG1lYW5zIHdlIG1pZ2h0IG5lZWQg
dG8gZ3JvdyB0aGUgc2hhcmVkIGZlbmNlcyBhcnJheSwgd2hpY2ggbWlnaHQgZmFpbAo+ID4gICAg
d2l0aCBFTk9NRU0uIE5vdCBncmVhdC4gV2UgY291bGQgZml4IHRoaXMgd2l0aCBzb21lIGtpbmQg
b2YgcGVybWFuZW50Cj4gPiAgICBzaGFyZWQgZmVuY2Ugc2xvdCByZXNlcnZhdGlvbnMgKGkuZS4g
YSByZXNlcnZlZCBzbG90IHdoaWNoIG91dGxpdmVzCj4gPiAgICBob2xkaW5nIHRoZSByZXNlcnZh
dGlvbiBsb2NrKSwgYnV0IHRoYXQgbWlnaHQgd2FzdGUgcXVpdGUgYSBiaXQgb2YKPiA+ICAgIG1l
bW9yeS4gUHJvYmFibHkgbm90IHJlYWwgcHJvYmxlbSBpbiB0aGUgZ3JhbmQgc2NoZW1lIG9mIHRo
aW5ncy4gSSB0aGluawo+ID4gICAgdGhlIGZlbmNlIGl0c2VsZiBjYW4gYmUgcHJlYWxsb2NhdGVk
IHBlciBjb250ZXh0LCBzbyB0aGF0IGlzbid0IHRoZQo+ID4gICAgcHJvYmxlbS4KPgo+IFdlbGwg
dGhlIEVOT01FTSBwcm9ibGVtIGlzIHRoZSBsZWFzdCBvZiB0aGUgcHJvYmxlbXMgd2l0aCB0aGlz
IGFwcHJvYWNoLgo+IFlvdSBjYW4gc3RpbGwgYmxvY2sgZm9yIHRoZSBmZW5jZSB3aGljaCB5b3Ug
d2FudGVkIHRvIGFkZC4KPgo+IFRoZSByZWFsIHByb2JsZW0gaXMgdGhhdCB5b3UgY2FuJ3QgdGVs
bCBpZiBhIEJPIGlzIGJ1c3kgb3Igbm90IGJ5IGp1c3QKPiBsb29raW5nIGF0IGl0cyBjdXJyZW50
IGZlbmNlcy4KPgo+IEluIG90aGVyIHdvcmRzIHdoZW4geW91IHN0b3AgYWRkaW5nIGZlbmNlcyB5
b3UgYWxzbyB3YW50IHRvIHN0b3AgbW92aW5nCj4gdGhlbSBpbmRpdmlkdWFsbHkgb24gdGhlIExS
VS4KCldlbGwgeWVhaCwgb3RoZXJ3aXNlIHlvdSdyZSBiYWNrIGEgcGVyIEJPIG92ZXJoZWFkIG9u
IENTLiBUaGF0J3Mga2luZGEKb2J2aW91cy4gQnV0IGFsc28gbm90IHN1cmUgd2h5IHRoaXMgbWF0
dGVycywgc2luY2UgYXRtIHdlIGRvbid0IGhhdmUKYW55IHByb3Bvc2VkIG1lYW5zIHRvIHBhc3Mg
TFJVIHVwZGF0ZXMgdGhyb3VnaCBkbWEtYnVmLiBTbyBleHBvcnRlcgooZXZlbiB3aXRoIGR5bmFt
aWMgZG1hLWJ1ZikgaGFzIHRvIHBlc3NpbWlzdGljYWxseSBhc3N1bWUgYWxyZWFkeSB0aGF0CnRo
ZSBleHBvcnRlZCBCTyBpcyBtb3JlIGJ1c3kgdGhhbiB3aGF0IHRoZSBMUlUgcG9zaXRpb24gc3Vn
Z2VzdHMsIGFuZApldmljdCB0aGVtIGxhdGVyIG9uLiBJZiB3ZSBhbHNvIG5lZWQgdG8gZnVubmVs
IExSVSB1cGRhdGVzIG92ZXIKZG1hLWJ1ZiwgdGhlbiB0aGF0J3MgYW5vdGhlciBiZWFzdCBlbnRp
cmVseSAoYW5kIHByb2JhYmx5IG5vdCB3aGF0IHdlCndhbnQgdG8gZG8gYXQgYWxsKS4KCkFsc28g
aWYgeW91IGRvbid0IHdhbnQgdG8gc3RhbGwsIHRoZW4ganVzdCByZWplY3QgYWZ0ZXIgLT5tb3Zl
X25vdGlmeQp3aGVyZXRoZXJlIHRoZSBibyBpcyBzdGlsbCBpZGxlLCBhbmQgZ2l2ZSB1cCBpZiBz
by4gT3Igd2UgY2FuIGFkZCBhCmNvdW50ZXIgdG8gaW5kaWNhdGUgYSBibyBuZWVkcyB0byBiZSBj
b25zaWRlcmVkIGJ1c3kuCgo+IFdoZW4gdGhlIG1lbW9yeSBtYW5hZ2VtZW50IGV2aWN0cyBvbmUg
Qk8geW91IGVzc2VudGlhbGx5IGtpY2sgb3V0IGEKPiB3aG9sZSBwcm9jZXNzL3dvcmtpbmcgc2V0
Lgo+Cj4gU28gd2hlbiB5b3Ugd2FudCB0byBraWNrIG91dCB0aGUgbmV4dCBCTyB5b3UgYWN0dWFs
bHkgd2FudCB0byBkbyB0aGlzCj4gZm9yIEJPcyB3aGljaCBub3cgYmVjYW1lIGF2YWlsYWJsZSBh
bnl3YXkuCj4KPiBUaGF0IGFwcHJvYWNoIHdvbid0IHdvcmsgd2l0aCB0aGUgbW92ZV9ub3RpZnkg
Y2FsbGJhY2suCgpTbyBlc3NlbnRpYWxseSB3ZSBkb24ndCBqdXN0IHdhbnQgbW92ZV9ub3RpZnks
IGJ1dCBhbHNvIGZ1bGwgTFJVIGluZm9ybWF0aW9uPwoKPiA+IC0gc2FtZSBhcyBhYm92ZSwgYnV0
IHRoZSBuZXcgZmVuY2UgZG9lc24ndCBnZXQgYWRkZWQsIGJ1dCByZXR1cm5lZCB0byB0aGUKPiA+
ICAgIGNhbGxlciwgYW5kIHRoZSBleHBvcnRlciBkZWFscyB3aXRoIHRoZSBFTk9NRU0gbWVzcy4g
TWlnaHQgbm90IHdvcmsKPiA+ICAgIHNpbmNlIGFuIGltcG9ydGVyIGNvdWxkIGhhdmUgYSBsb3Qg
b2YgY29udGV4dHMgdXNpbmcgYSBnaXZlbiBvYmplY3QsIGFuZAo+ID4gICAgc28gd291bGQgaGF2
ZSBhIGxvdCBvZiBmZW5jZXMgdG8gYWRkLgo+Cj4gSSBkb24ndCB0aGluayB0aGF0IHRoaXMgd2ls
bCB3b3JrLgo+Cj4gU2VlIHlvdSBub3Qgb25seSBuZWVkIHRvIGJlIGFibGUgdG8gYWRkIHRoZSBm
ZW5jZSB0byB0aGUgQk8gY3VycmVudGx5Cj4gZXZpY3RlZCwgYnV0IGFsc28gdG8gYWxsIG90aGVy
IEJPIGluIHlvdXIgcHJvY2Vzcy93b3JraW5nIHNldC4KPgo+IEFkZGl0aW9uYWwgdG8gdGhhdCBt
b3ZpbmcgdGhlIEVOT01FTSBoYW5kbGluZyBmcm9tIHRoZSBpbXBvcnRlciB0byB0aGUKPiBleHBv
cnRlciBzb3VuZHMgYXMgaGVscGZ1bCBhcyBhZGRpbmcgYW5vdGhlciBsYXllciBvZiBhYnN0cmFj
dGlvbiA6KQoKWW91IGNhbiBnbyBhbmQgcGljayBhIGRpZmZlcmVudCB2aWN0aW0gdG8gZXZpY3Qs
IG9yIGp1c3QgZ2l2ZSB1cAoodGhlcmUncyBub3QgbXVjaCB5b3UgY2FuIGRvIHdpdGggRU5PTUVN
KS4gSW5zdGVhZCBvZiBkYXRhIGNvcnJ1cHRpb24KYmVjYXVzZSB5b3UncmUgbm90IHdhaXRpbmcg
Zm9yIGEgZmVuY2UgeW91IHNob3VsZCBiZSB3YWl0aW5nIG9uLgotRGFuaWVsCgo+Cj4gUmVnYXJk
cywKPiBDaHJpc3RpYW4uCj4KPiA+Cj4gPiAtIHNvbWV0aGluZyBlbnRpcmVseSBkaWZmZXJlbnQ/
Cj4gPgo+ID4gVGhvdWdodHM/Cj4gPgo+ID4gQ2hlZXJzLCBEYW5pZWwKPiA+Cj4gPj4gLS0tCj4g
Pj4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMTgzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tCj4gPj4gICBpbmNsdWRlL2xpbnV4L2RtYS1idWYuaCAgIHwgMTA4
ICsrKysrKysrKysrKysrKysrKysrLS0KPiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMjc3IGluc2Vy
dGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
ZG1hLWJ1Zi9kbWEtYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gPj4gaW5kZXgg
NmMxNWRlYjVkNGFkLi5iZDg2MTFmYTJjZmEgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9kbWEt
YnVmL2RtYS1idWYuYwo+ID4+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiA+PiBA
QCAtNTMxLDYgKzUzMSw5IEBAIHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmX2V4cG9ydChjb25zdCBz
dHJ1Y3QgZG1hX2J1Zl9leHBvcnRfaW5mbyAqZXhwX2luZm8pCj4gPj4gICAgICAgICAgICAgIHJl
dHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+ID4+ICAgICAgfQo+ID4+Cj4gPj4gKyAgICBpZiAoV0FS
Tl9PTihleHBfaW5mby0+b3BzLT5jYWNoZV9zZ3RfbWFwcGluZyAmJiBleHBfaW5mby0+b3BzLT5w
aW4pKQo+ID4+ICsgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiA+PiArCj4g
Pj4gICAgICBpZiAoIXRyeV9tb2R1bGVfZ2V0KGV4cF9pbmZvLT5vd25lcikpCj4gPj4gICAgICAg
ICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9FTlQpOwo+ID4+Cj4gPj4gQEAgLTY1MSwxMCArNjU0
LDEyIEBAIHZvaWQgZG1hX2J1Zl9wdXQoc3RydWN0IGRtYV9idWYgKmRtYWJ1ZikKPiA+PiAgIEVY
UE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfcHV0KTsKPiA+Pgo+ID4+ICAgLyoqCj4gPj4gLSAqIGRt
YV9idWZfYXR0YWNoIC0gQWRkIHRoZSBkZXZpY2UgdG8gZG1hX2J1ZidzIGF0dGFjaG1lbnRzIGxp
c3Q7IG9wdGlvbmFsbHksCj4gPj4gKyAqIGRtYV9idWZfZHluYW1pY19hdHRhY2ggLSBBZGQgdGhl
IGRldmljZSB0byBkbWFfYnVmJ3MgYXR0YWNobWVudHMgbGlzdDsgb3B0aW9uYWxseSwKPiA+PiAg
ICAqIGNhbGxzIGF0dGFjaCgpIG9mIGRtYV9idWZfb3BzIHRvIGFsbG93IGRldmljZS1zcGVjaWZp
YyBhdHRhY2ggZnVuY3Rpb25hbGl0eQo+ID4+IC0gKiBAZG1hYnVmOiBbaW5dICAgIGJ1ZmZlciB0
byBhdHRhY2ggZGV2aWNlIHRvLgo+ID4+IC0gKiBAZGV2OiAgICBbaW5dICAgIGRldmljZSB0byBi
ZSBhdHRhY2hlZC4KPiA+PiArICogQGRtYWJ1ZjogICAgICAgICBbaW5dICAgIGJ1ZmZlciB0byBh
dHRhY2ggZGV2aWNlIHRvLgo+ID4+ICsgKiBAZGV2OiAgICAgICAgICAgIFtpbl0gICAgZGV2aWNl
IHRvIGJlIGF0dGFjaGVkLgo+ID4+ICsgKiBAaW1wb3J0ZXJfb3BzICAgIFtpbl0gICAgaW1wb3J0
ZXIgb3BlcmF0aW9ucyBmb3IgdGhlIGF0dGFjaG1lbnQKPiA+PiArICogQGltcG9ydGVyX3ByaXYg
ICBbaW5dICAgIGltcG9ydGVyIHByaXZhdGUgcG9pbnRlciBmb3IgdGhlIGF0dGFjaG1lbnQKPiA+
PiAgICAqCj4gPj4gICAgKiBSZXR1cm5zIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgcG9pbnRl
ciBmb3IgdGhpcyBhdHRhY2htZW50LiBBdHRhY2htZW50cwo+ID4+ICAgICogbXVzdCBiZSBjbGVh
bmVkIHVwIGJ5IGNhbGxpbmcgZG1hX2J1Zl9kZXRhY2goKS4KPiA+PiBAQCAtNjY4LDggKzY3Mywx
MCBAQCBFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVmX3B1dCk7Cj4gPj4gICAgKiBhY2Nlc3NpYmxl
IHRvIEBkZXYsIGFuZCBjYW5ub3QgYmUgbW92ZWQgdG8gYSBtb3JlIHN1aXRhYmxlIHBsYWNlLiBU
aGlzIGlzCj4gPj4gICAgKiBpbmRpY2F0ZWQgd2l0aCB0aGUgZXJyb3IgY29kZSAtRUJVU1kuCj4g
Pj4gICAgKi8KPiA+PiAtc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqZG1hX2J1Zl9hdHRhY2go
c3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPj4gK3N0cnVjdCBkbWFfYnVmX2F0dGFj
aG1lbnQgKgo+ID4+ICtkbWFfYnVmX2R5bmFtaWNfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFi
dWYsIHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+PiArICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCBkbWFfYnVmX2F0dGFjaF9vcHMgKmltcG9ydGVyX29wcywKPiA+PiArICAgICAgICAgICAg
ICAgICAgIHZvaWQgKmltcG9ydGVyX3ByaXYpCj4gPj4gICB7Cj4gPj4gICAgICBzdHJ1Y3QgZG1h
X2J1Zl9hdHRhY2htZW50ICphdHRhY2g7Cj4gPj4gICAgICBpbnQgcmV0Owo+ID4+IEBAIC02ODMs
NiArNjkwLDggQEAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqZG1hX2J1Zl9hdHRhY2goc3Ry
dWN0IGRtYV9idWYgKmRtYWJ1ZiwKPiA+Pgo+ID4+ICAgICAgYXR0YWNoLT5kZXYgPSBkZXY7Cj4g
Pj4gICAgICBhdHRhY2gtPmRtYWJ1ZiA9IGRtYWJ1ZjsKPiA+PiArICAgIGF0dGFjaC0+aW1wb3J0
ZXJfb3BzID0gaW1wb3J0ZXJfb3BzOwo+ID4+ICsgICAgYXR0YWNoLT5pbXBvcnRlcl9wcml2ID0g
aW1wb3J0ZXJfcHJpdjsKPiA+Pgo+ID4+ICAgICAgbXV0ZXhfbG9jaygmZG1hYnVmLT5sb2NrKTsK
PiA+Pgo+ID4+IEBAIC02OTEsMTYgKzcwMCw3MiBAQCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50
ICpkbWFfYnVmX2F0dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLAo+ID4+ICAgICAgICAgICAg
ICBpZiAocmV0KQo+ID4+ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX2F0dGFjaDsKPiA+
PiAgICAgIH0KPiA+PiArICAgIHJlc2VydmF0aW9uX29iamVjdF9sb2NrKGRtYWJ1Zi0+cmVzdiwg
TlVMTCk7Cj4gPj4gICAgICBsaXN0X2FkZCgmYXR0YWNoLT5ub2RlLCAmZG1hYnVmLT5hdHRhY2ht
ZW50cyk7Cj4gPj4gKyAgICByZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGRtYWJ1Zi0+cmVzdik7
Cj4gPj4KPiA+PiAgICAgIG11dGV4X3VubG9jaygmZG1hYnVmLT5sb2NrKTsKPiA+Pgo+ID4+ICsg
ICAgLyogV2hlbiBlaXRoZXIgdGhlIGltcG9ydGVyIG9yIHRoZSBleHBvcnRlciBjYW4ndCBoYW5k
bGUgZHluYW1pYwo+ID4+ICsgICAgICogbWFwcGluZ3Mgd2UgY2FjaGUgdGhlIG1hcHBpbmcgaGVy
ZSB0byBhdm9pZCBpc3N1ZXMgd2l0aCB0aGUKPiA+PiArICAgICAqIHJlc2VydmF0aW9uIG9iamVj
dCBsb2NrLgo+ID4+ICsgICAgICovCj4gPj4gKyAgICBpZiAoZG1hX2J1Zl9hdHRhY2htZW50X2lz
X2R5bmFtaWMoYXR0YWNoKSAhPQo+ID4+ICsgICAgICAgIGRtYV9idWZfaXNfZHluYW1pYyhkbWFi
dWYpKSB7Cj4gPj4gKyAgICAgICAgICAgIHN0cnVjdCBzZ190YWJsZSAqc2d0Owo+ID4+ICsKPiA+
PiArICAgICAgICAgICAgaWYgKGRtYV9idWZfaXNfZHluYW1pYyhhdHRhY2gtPmRtYWJ1ZikpIHsK
PiA+PiArICAgICAgICAgICAgICAgICAgICByZXNlcnZhdGlvbl9vYmplY3RfbG9jayhhdHRhY2gt
PmRtYWJ1Zi0+cmVzdiwgTlVMTCk7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgcmV0ID0gZG1h
X2J1Zl9waW4oYXR0YWNoKTsKPiA+PiArICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ID4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfdW5sb2NrOwo+ID4+ICsgICAg
ICAgICAgICB9Cj4gPj4gKwo+ID4+ICsgICAgICAgICAgICBzZ3QgPSBkbWFidWYtPm9wcy0+bWFw
X2RtYV9idWYoYXR0YWNoLCBETUFfQklESVJFQ1RJT05BTCk7Cj4gPj4gKyAgICAgICAgICAgIGlm
ICghc2d0KQo+ID4+ICsgICAgICAgICAgICAgICAgICAgIHNndCA9IEVSUl9QVFIoLUVOT01FTSk7
Cj4gPj4gKyAgICAgICAgICAgIGlmIChJU19FUlIoc2d0KSkgewo+ID4+ICsgICAgICAgICAgICAg
ICAgICAgIHJldCA9IFBUUl9FUlIoc2d0KTsKPiA+PiArICAgICAgICAgICAgICAgICAgICBnb3Rv
IGVycl91bnBpbjsKPiA+PiArICAgICAgICAgICAgfQo+ID4+ICsgICAgICAgICAgICBpZiAoZG1h
X2J1Zl9pc19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSkKPiA+PiArICAgICAgICAgICAgICAgICAg
ICByZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsKPiA+PiAr
ICAgICAgICAgICAgYXR0YWNoLT5zZ3QgPSBzZ3Q7Cj4gPj4gKyAgICAgICAgICAgIGF0dGFjaC0+
ZGlyID0gRE1BX0JJRElSRUNUSU9OQUw7Cj4gPj4gKyAgICB9Cj4gPj4gKwo+ID4+ICAgICAgcmV0
dXJuIGF0dGFjaDsKPiA+Pgo+ID4+ICAgZXJyX2F0dGFjaDoKPiA+PiAgICAgIGtmcmVlKGF0dGFj
aCk7Cj4gPj4gICAgICBtdXRleF91bmxvY2soJmRtYWJ1Zi0+bG9jayk7Cj4gPj4gICAgICByZXR1
cm4gRVJSX1BUUihyZXQpOwo+ID4+ICsKPiA+PiArZXJyX3VucGluOgo+ID4+ICsgICAgaWYgKGRt
YV9idWZfaXNfZHluYW1pYyhhdHRhY2gtPmRtYWJ1ZikpCj4gPj4gKyAgICAgICAgICAgIGRtYV9i
dWZfdW5waW4oYXR0YWNoKTsKPiA+PiArCj4gPj4gK2Vycl91bmxvY2s6Cj4gPj4gKyAgICBpZiAo
ZG1hX2J1Zl9pc19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSkKPiA+PiArICAgICAgICAgICAgcmVz
ZXJ2YXRpb25fb2JqZWN0X3VubG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdik7Cj4gPj4gKwo+ID4+
ICsgICAgZG1hX2J1Zl9kZXRhY2goZG1hYnVmLCBhdHRhY2gpOwo+ID4+ICsgICAgcmV0dXJuIEVS
Ul9QVFIocmV0KTsKPiA+PiArfQo+ID4+ICtFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVmX2R5bmFt
aWNfYXR0YWNoKTsKPiA+PiArCj4gPj4gKy8qKgo+ID4+ICsgKiBkbWFfYnVmX2F0dGFjaCAtIFdy
YXBwZXIgZm9yIGRtYV9idWZfZHluYW1pY19hdHRhY2gKPiA+PiArICogQGRtYWJ1ZjogW2luXSAg
ICBidWZmZXIgdG8gYXR0YWNoIGRldmljZSB0by4KPiA+PiArICogQGRldjogICAgW2luXSAgICBk
ZXZpY2UgdG8gYmUgYXR0YWNoZWQuCj4gPj4gKyAqCj4gPj4gKyAqIFdyYXBwZXIgdG8gY2FsbCBk
bWFfYnVmX2R5bmFtaWNfYXR0YWNoKCkgZm9yIGRyaXZlcnMgd2hpY2ggc3RpbGwgdXNlIGEgc3Rh
dGljCj4gPj4gKyAqIG1hcHBpbmcuCj4gPj4gKyAqLwo+ID4+ICtzdHJ1Y3QgZG1hX2J1Zl9hdHRh
Y2htZW50ICpkbWFfYnVmX2F0dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLAo+ID4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldikKPiA+
PiArewo+ID4+ICsgICAgcmV0dXJuIGRtYV9idWZfZHluYW1pY19hdHRhY2goZG1hYnVmLCBkZXYs
IE5VTEwsIE5VTEwpOwo+ID4+ICAgfQo+ID4+ICAgRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2J1Zl9h
dHRhY2gpOwo+ID4+Cj4gPj4gQEAgLTcxNywxMSArNzgyLDIyIEBAIHZvaWQgZG1hX2J1Zl9kZXRh
Y2goc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0
YWNoKQo+ID4+ICAgICAgaWYgKFdBUk5fT04oIWRtYWJ1ZiB8fCAhYXR0YWNoKSkKPiA+PiAgICAg
ICAgICAgICAgcmV0dXJuOwo+ID4+Cj4gPj4gLSAgICBpZiAoYXR0YWNoLT5zZ3QpCj4gPj4gKyAg
ICBpZiAoYXR0YWNoLT5zZ3QpIHsKPiA+PiArICAgICAgICAgICAgaWYgKGRtYV9idWZfaXNfZHlu
YW1pYyhhdHRhY2gtPmRtYWJ1ZikpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgcmVzZXJ2YXRp
b25fb2JqZWN0X2xvY2soYXR0YWNoLT5kbWFidWYtPnJlc3YsIE5VTEwpOwo+ID4+ICsKPiA+PiAg
ICAgICAgICAgICAgZG1hYnVmLT5vcHMtPnVubWFwX2RtYV9idWYoYXR0YWNoLCBhdHRhY2gtPnNn
dCwgYXR0YWNoLT5kaXIpOwo+ID4+Cj4gPj4gKyAgICAgICAgICAgIGlmIChkbWFfYnVmX2lzX2R5
bmFtaWMoYXR0YWNoLT5kbWFidWYpKSB7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgZG1hX2J1
Zl91bnBpbihhdHRhY2gpOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgIHJlc2VydmF0aW9uX29i
amVjdF91bmxvY2soYXR0YWNoLT5kbWFidWYtPnJlc3YpOwo+ID4+ICsgICAgICAgICAgICB9Cj4g
Pj4gKyAgICB9Cj4gPj4gKwo+ID4+ICAgICAgbXV0ZXhfbG9jaygmZG1hYnVmLT5sb2NrKTsKPiA+
PiArICAgIHJlc2VydmF0aW9uX29iamVjdF9sb2NrKGRtYWJ1Zi0+cmVzdiwgTlVMTCk7Cj4gPj4g
ICAgICBsaXN0X2RlbCgmYXR0YWNoLT5ub2RlKTsKPiA+PiArICAgIHJlc2VydmF0aW9uX29iamVj
dF91bmxvY2soZG1hYnVmLT5yZXN2KTsKPiA+PiAgICAgIGlmIChkbWFidWYtPm9wcy0+ZGV0YWNo
KQo+ID4+ICAgICAgICAgICAgICBkbWFidWYtPm9wcy0+ZGV0YWNoKGRtYWJ1ZiwgYXR0YWNoKTsK
PiA+Pgo+ID4+IEBAIC03MzAsNiArODA2LDQ0IEBAIHZvaWQgZG1hX2J1Zl9kZXRhY2goc3RydWN0
IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKQo+ID4+
ICAgfQo+ID4+ICAgRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2J1Zl9kZXRhY2gpOwo+ID4+Cj4gPj4g
Ky8qKgo+ID4+ICsgKiBkbWFfYnVmX3BpbiAtIExvY2sgZG93biB0aGUgRE1BLWJ1Zgo+ID4+ICsg
Kgo+ID4+ICsgKiBAYXR0YWNoOiBbaW5dICAgIGF0dGFjaG1lbnQgd2hpY2ggc2hvdWxkIGJlIHBp
bm5lZAo+ID4+ICsgKgo+ID4+ICsgKiBSZXR1cm5zOgo+ID4+ICsgKiAwIG9uIHN1Y2Nlc3MsIG5l
Z2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KPiA+PiArICovCj4gPj4gK2ludCBkbWFfYnVm
X3BpbihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpCj4gPj4gK3sKPiA+PiArICAg
IHN0cnVjdCBkbWFfYnVmICpkbWFidWYgPSBhdHRhY2gtPmRtYWJ1ZjsKPiA+PiArICAgIGludCBy
ZXQgPSAwOwo+ID4+ICsKPiA+PiArICAgIHJlc2VydmF0aW9uX29iamVjdF9hc3NlcnRfaGVsZChk
bWFidWYtPnJlc3YpOwo+ID4+ICsKPiA+PiArICAgIGlmIChkbWFidWYtPm9wcy0+cGluKQo+ID4+
ICsgICAgICAgICAgICByZXQgPSBkbWFidWYtPm9wcy0+cGluKGF0dGFjaCk7Cj4gPj4gKwo+ID4+
ICsgICAgcmV0dXJuIHJldDsKPiA+PiArfQo+ID4+ICtFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVm
X3Bpbik7Cj4gPj4gKwo+ID4+ICsvKioKPiA+PiArICogZG1hX2J1Zl91bnBpbiAtIFJlbW92ZSBs
b2NrIGZyb20gRE1BLWJ1Zgo+ID4+ICsgKgo+ID4+ICsgKiBAYXR0YWNoOiBbaW5dICAgIGF0dGFj
aG1lbnQgd2hpY2ggc2hvdWxkIGJlIHVucGlubmVkCj4gPj4gKyAqLwo+ID4+ICt2b2lkIGRtYV9i
dWZfdW5waW4oc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKQo+ID4+ICt7Cj4gPj4g
KyAgICBzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmID0gYXR0YWNoLT5kbWFidWY7Cj4gPj4gKwo+ID4+
ICsgICAgcmVzZXJ2YXRpb25fb2JqZWN0X2Fzc2VydF9oZWxkKGRtYWJ1Zi0+cmVzdik7Cj4gPj4g
Kwo+ID4+ICsgICAgaWYgKGRtYWJ1Zi0+b3BzLT51bnBpbikKPiA+PiArICAgICAgICAgICAgZG1h
YnVmLT5vcHMtPnVucGluKGF0dGFjaCk7Cj4gPj4gK30KPiA+PiArRVhQT1JUX1NZTUJPTF9HUEwo
ZG1hX2J1Zl91bnBpbik7Cj4gPj4gKwo+ID4+ICAgLyoqCj4gPj4gICAgKiBkbWFfYnVmX21hcF9h
dHRhY2htZW50IC0gUmV0dXJucyB0aGUgc2NhdHRlcmxpc3QgdGFibGUgb2YgdGhlIGF0dGFjaG1l
bnQ7Cj4gPj4gICAgKiBtYXBwZWQgaW50byBfZGV2aWNlXyBhZGRyZXNzIHNwYWNlLiBJcyBhIHdy
YXBwZXIgZm9yIG1hcF9kbWFfYnVmKCkgb2YgdGhlCj4gPj4gQEAgLTc0OSw2ICs4NjMsNyBAQCBz
dHJ1Y3Qgc2dfdGFibGUgKmRtYV9idWZfbWFwX2F0dGFjaG1lbnQoc3RydWN0IGRtYV9idWZfYXR0
YWNobWVudCAqYXR0YWNoLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24pCj4gPj4gICB7Cj4gPj4gICAgICBz
dHJ1Y3Qgc2dfdGFibGUgKnNnX3RhYmxlOwo+ID4+ICsgICAgaW50IHI7Cj4gPj4KPiA+PiAgICAg
IG1pZ2h0X3NsZWVwKCk7Cj4gPj4KPiA+PiBAQCAtNzY3LDEwICs4ODIsMzEgQEAgc3RydWN0IHNn
X3RhYmxlICpkbWFfYnVmX21hcF9hdHRhY2htZW50KHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQg
KmF0dGFjaCwKPiA+PiAgICAgICAgICAgICAgcmV0dXJuIGF0dGFjaC0+c2d0Owo+ID4+ICAgICAg
fQo+ID4+Cj4gPj4gKyAgICBpZiAoZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFtaWMoYXR0YWNo
KSkgewo+ID4+ICsgICAgICAgICAgICByZXNlcnZhdGlvbl9vYmplY3RfYXNzZXJ0X2hlbGQoYXR0
YWNoLT5kbWFidWYtPnJlc3YpOwo+ID4+ICsKPiA+PiArICAgIH0gZWxzZSBpZiAoZG1hX2J1Zl9p
c19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSkgewo+ID4+ICsgICAgICAgICAgICByZXNlcnZhdGlv
bl9vYmplY3RfbG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdiwgTlVMTCk7Cj4gPj4gKyAgICAgICAg
ICAgIHIgPSBkbWFfYnVmX3BpbihhdHRhY2gpOwo+ID4+ICsgICAgICAgICAgICBpZiAocikgewo+
ID4+ICsgICAgICAgICAgICAgICAgICAgIHJlc2VydmF0aW9uX29iamVjdF91bmxvY2soYXR0YWNo
LT5kbWFidWYtPnJlc3YpOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRS
KHIpOwo+ID4+ICsgICAgICAgICAgICB9Cj4gPj4gKyAgICB9IGVsc2Ugewo+ID4+ICsgICAgICAg
ICAgICBtaWdodF9sb2NrKCZhdHRhY2gtPmRtYWJ1Zi0+cmVzdi0+bG9jay5iYXNlKTsKPiA+PiAr
ICAgIH0KPiA+PiArCj4gPj4gICAgICBzZ190YWJsZSA9IGF0dGFjaC0+ZG1hYnVmLT5vcHMtPm1h
cF9kbWFfYnVmKGF0dGFjaCwgZGlyZWN0aW9uKTsKPiA+PiAgICAgIGlmICghc2dfdGFibGUpCj4g
Pj4gICAgICAgICAgICAgIHNnX3RhYmxlID0gRVJSX1BUUigtRU5PTUVNKTsKPiA+Pgo+ID4+ICsg
ICAgaWYgKCFkbWFfYnVmX2F0dGFjaG1lbnRfaXNfZHluYW1pYyhhdHRhY2gpICYmCj4gPj4gKyAg
ICAgICAgZG1hX2J1Zl9pc19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSkgewo+ID4+ICsgICAgICAg
ICAgICBpZiAoSVNfRVJSKHNnX3RhYmxlKSkKPiA+PiArICAgICAgICAgICAgICAgICAgICBkbWFf
YnVmX3VucGluKGF0dGFjaCk7Cj4gPj4gKyAgICAgICAgICAgIHJlc2VydmF0aW9uX29iamVjdF91
bmxvY2soYXR0YWNoLT5kbWFidWYtPnJlc3YpOwo+ID4+ICsgICAgfQo+ID4+ICsKPiA+PiAgICAg
IGlmICghSVNfRVJSKHNnX3RhYmxlKSAmJiBhdHRhY2gtPmRtYWJ1Zi0+b3BzLT5jYWNoZV9zZ3Rf
bWFwcGluZykgewo+ID4+ICAgICAgICAgICAgICBhdHRhY2gtPnNndCA9IHNnX3RhYmxlOwo+ID4+
ICAgICAgICAgICAgICBhdHRhY2gtPmRpciA9IGRpcmVjdGlvbjsKPiA+PiBAQCAtODAyLDEwICs5
MzgsNDMgQEAgdm9pZCBkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQoc3RydWN0IGRtYV9idWZfYXR0
YWNobWVudCAqYXR0YWNoLAo+ID4+ICAgICAgaWYgKGF0dGFjaC0+c2d0ID09IHNnX3RhYmxlKQo+
ID4+ICAgICAgICAgICAgICByZXR1cm47Cj4gPj4KPiA+PiArICAgIGlmIChkbWFfYnVmX2F0dGFj
aG1lbnRfaXNfZHluYW1pYyhhdHRhY2gpKQo+ID4+ICsgICAgICAgICAgICByZXNlcnZhdGlvbl9v
YmplY3RfYXNzZXJ0X2hlbGQoYXR0YWNoLT5kbWFidWYtPnJlc3YpOwo+ID4+ICsgICAgZWxzZSBp
ZiAoZG1hX2J1Zl9pc19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSkKPiA+PiArICAgICAgICAgICAg
cmVzZXJ2YXRpb25fb2JqZWN0X2xvY2soYXR0YWNoLT5kbWFidWYtPnJlc3YsIE5VTEwpOwo+ID4+
ICsgICAgZWxzZQo+ID4+ICsgICAgICAgICAgICBtaWdodF9sb2NrKCZhdHRhY2gtPmRtYWJ1Zi0+
cmVzdi0+bG9jay5iYXNlKTsKPiA+PiArCj4gPj4gICAgICBhdHRhY2gtPmRtYWJ1Zi0+b3BzLT51
bm1hcF9kbWFfYnVmKGF0dGFjaCwgc2dfdGFibGUsIGRpcmVjdGlvbik7Cj4gPj4gKwo+ID4+ICsg
ICAgaWYgKGRtYV9idWZfaXNfZHluYW1pYyhhdHRhY2gtPmRtYWJ1ZikgJiYKPiA+PiArICAgICAg
ICAhZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFtaWMoYXR0YWNoKSkgewo+ID4+ICsgICAgICAg
ICAgICBkbWFfYnVmX3VucGluKGF0dGFjaCk7Cj4gPj4gKyAgICAgICAgICAgIHJlc2VydmF0aW9u
X29iamVjdF91bmxvY2soYXR0YWNoLT5kbWFidWYtPnJlc3YpOwo+ID4+ICsgICAgfQo+ID4+ICAg
fQo+ID4+ICAgRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KTsKPiA+
Pgo+ID4+ICsvKioKPiA+PiArICogZG1hX2J1Zl9tb3ZlX25vdGlmeSAtIG5vdGlmeSBhdHRhY2ht
ZW50cyB0aGF0IERNQS1idWYgaXMgbW92aW5nCj4gPj4gKyAqCj4gPj4gKyAqIEBkbWFidWY6IFtp
bl0gICAgYnVmZmVyIHdoaWNoIGlzIG1vdmluZwo+ID4+ICsgKgo+ID4+ICsgKiBJbmZvcm1zIGFs
bCBhdHRhY2htZW5zdCB0aGF0IHRoZXkgbmVlZCB0byBkZXN0cm95IGFuZCByZWNyZWF0ZWQgYWxs
IHRoZWlyCj4gPj4gKyAqIG1hcHBpbmdzLgo+ID4+ICsgKi8KPiA+PiArdm9pZCBkbWFfYnVmX21v
dmVfbm90aWZ5KHN0cnVjdCBkbWFfYnVmICpkbWFidWYpCj4gPj4gK3sKPiA+PiArICAgIHN0cnVj
dCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaDsKPiA+PiArCj4gPj4gKyAgICByZXNlcnZhdGlv
bl9vYmplY3RfYXNzZXJ0X2hlbGQoZG1hYnVmLT5yZXN2KTsKPiA+PiArCj4gPj4gKyAgICBsaXN0
X2Zvcl9lYWNoX2VudHJ5KGF0dGFjaCwgJmRtYWJ1Zi0+YXR0YWNobWVudHMsIG5vZGUpCj4gPj4g
KyAgICAgICAgICAgIGlmIChhdHRhY2gtPmltcG9ydGVyX29wcyAmJiBhdHRhY2gtPmltcG9ydGVy
X29wcy0+bW92ZV9ub3RpZnkpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgYXR0YWNoLT5pbXBv
cnRlcl9vcHMtPm1vdmVfbm90aWZ5KGF0dGFjaCk7Cj4gPj4gK30KPiA+PiArRVhQT1JUX1NZTUJP
TF9HUEwoZG1hX2J1Zl9tb3ZlX25vdGlmeSk7Cj4gPj4gKwo+ID4+ICAgLyoqCj4gPj4gICAgKiBE
T0M6IGNwdSBhY2Nlc3MKPiA+PiAgICAqCj4gPj4gQEAgLTEyMjUsMTAgKzEzOTQsMTIgQEAgc3Rh
dGljIGludCBkbWFfYnVmX2RlYnVnX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICp1bnVz
ZWQpCj4gPj4gICAgICAgICAgICAgIHNlcV9wdXRzKHMsICJcdEF0dGFjaGVkIERldmljZXM6XG4i
KTsKPiA+PiAgICAgICAgICAgICAgYXR0YWNoX2NvdW50ID0gMDsKPiA+Pgo+ID4+ICsgICAgICAg
ICAgICByZXNlcnZhdGlvbl9vYmplY3RfbG9jayhidWZfb2JqLT5yZXN2LCBOVUxMKTsKPiA+PiAg
ICAgICAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShhdHRhY2hfb2JqLCAmYnVmX29iai0+YXR0
YWNobWVudHMsIG5vZGUpIHsKPiA+PiAgICAgICAgICAgICAgICAgICAgICBzZXFfcHJpbnRmKHMs
ICJcdCVzXG4iLCBkZXZfbmFtZShhdHRhY2hfb2JqLT5kZXYpKTsKPiA+PiAgICAgICAgICAgICAg
ICAgICAgICBhdHRhY2hfY291bnQrKzsKPiA+PiAgICAgICAgICAgICAgfQo+ID4+ICsgICAgICAg
ICAgICByZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGJ1Zl9vYmotPnJlc3YpOwo+ID4+Cj4gPj4g
ICAgICAgICAgICAgIHNlcV9wcmludGYocywgIlRvdGFsICVkIGRldmljZXMgYXR0YWNoZWRcblxu
IiwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGF0dGFjaF9jb3VudCk7Cj4gPj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oIGIvaW5jbHVkZS9saW51eC9kbWEt
YnVmLmgKPiA+PiBpbmRleCAwMWFkNWI5NDJhNmYuLmNjYWQyZmMxZjY0MCAxMDA2NDQKPiA+PiAt
LS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaAo+ID4+ICsrKyBiL2luY2x1ZGUvbGludXgvZG1h
LWJ1Zi5oCj4gPj4gQEAgLTkyLDE0ICs5Miw0MCBAQCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgewo+ID4+
ICAgICAgICovCj4gPj4gICAgICB2b2lkICgqZGV0YWNoKShzdHJ1Y3QgZG1hX2J1ZiAqLCBzdHJ1
Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICopOwo+ID4+Cj4gPj4gKyAgICAvKioKPiA+PiArICAgICAq
IEBwaW46Cj4gPj4gKyAgICAgKgo+ID4+ICsgICAgICogVGhpcyBpcyBjYWxsZWQgYnkgZG1hX2J1
Zl9waW4gYW5kIGxldHMgdGhlIGV4cG9ydGVyIGtub3cgdGhhdCB0aGUKPiA+PiArICAgICAqIERN
QS1idWYgY2FuJ3QgYmUgbW92ZWQgYW55IG1vcmUuCj4gPj4gKyAgICAgKgo+ID4+ICsgICAgICog
VGhpcyBpcyBjYWxsZWQgd2l0aCB0aGUgZG1hYnVmLT5yZXN2IG9iamVjdCBsb2NrZWQuCj4gPj4g
KyAgICAgKgo+ID4+ICsgICAgICogVGhpcyBjYWxsYmFjayBpcyBvcHRpb25hbC4KPiA+PiArICAg
ICAqCj4gPj4gKyAgICAgKiBSZXR1cm5zOgo+ID4+ICsgICAgICoKPiA+PiArICAgICAqIDAgb24g
c3VjY2VzcywgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgo+ID4+ICsgICAgICovCj4g
Pj4gKyAgICBpbnQgKCpwaW4pKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCk7Cj4g
Pj4gKwo+ID4+ICsgICAgLyoqCj4gPj4gKyAgICAgKiBAdW5waW46Cj4gPj4gKyAgICAgKgo+ID4+
ICsgICAgICogVGhpcyBpcyBjYWxsZWQgYnkgZG1hX2J1Zl91bnBpbiBhbmQgbGV0cyB0aGUgZXhw
b3J0ZXIga25vdyB0aGF0IHRoZQo+ID4+ICsgICAgICogRE1BLWJ1ZiBjYW4gYmUgbW92ZWQgYWdh
aW4uCj4gPj4gKyAgICAgKgo+ID4+ICsgICAgICogVGhpcyBpcyBjYWxsZWQgd2l0aCB0aGUgZG1h
YnVmLT5yZXN2IG9iamVjdCBsb2NrZWQuCj4gPj4gKyAgICAgKgo+ID4+ICsgICAgICogVGhpcyBj
YWxsYmFjayBpcyBvcHRpb25hbC4KPiA+PiArICAgICAqLwo+ID4+ICsgICAgdm9pZCAoKnVucGlu
KShzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpOwo+ID4+ICsKPiA+PiAgICAgIC8q
Kgo+ID4+ICAgICAgICogQG1hcF9kbWFfYnVmOgo+ID4+ICAgICAgICoKPiA+PiAgICAgICAqIFRo
aXMgaXMgY2FsbGVkIGJ5IGRtYV9idWZfbWFwX2F0dGFjaG1lbnQoKSBhbmQgaXMgdXNlZCB0byBt
YXAgYQo+ID4+ICAgICAgICogc2hhcmVkICZkbWFfYnVmIGludG8gZGV2aWNlIGFkZHJlc3Mgc3Bh
Y2UsIGFuZCBpdCBpcyBtYW5kYXRvcnkuIEl0Cj4gPj4gLSAgICAgKiBjYW4gb25seSBiZSBjYWxs
ZWQgaWYgQGF0dGFjaCBoYXMgYmVlbiBjYWxsZWQgc3VjY2Vzc2Z1bGx5LiBUaGlzCj4gPj4gLSAg
ICAgKiBlc3NlbnRpYWxseSBwaW5zIHRoZSBETUEgYnVmZmVyIGludG8gcGxhY2UsIGFuZCBpdCBj
YW5ub3QgYmUgbW92ZWQKPiA+PiAtICAgICAqIGFueSBtb3JlCj4gPj4gKyAgICAgKiBjYW4gb25s
eSBiZSBjYWxsZWQgaWYgQGF0dGFjaCBoYXMgYmVlbiBjYWxsZWQgc3VjY2Vzc2Z1bGx5Lgo+ID4+
ICAgICAgICoKPiA+PiAgICAgICAqIFRoaXMgY2FsbCBtYXkgc2xlZXAsIGUuZy4gd2hlbiB0aGUg
YmFja2luZyBzdG9yYWdlIGZpcnN0IG5lZWRzIHRvIGJlCj4gPj4gICAgICAgKiBhbGxvY2F0ZWQs
IG9yIG1vdmVkIHRvIGEgbG9jYXRpb24gc3VpdGFibGUgZm9yIGFsbCBjdXJyZW50bHkgYXR0YWNo
ZWQKPiA+PiBAQCAtMTIwLDYgKzE0Niw5IEBAIHN0cnVjdCBkbWFfYnVmX29wcyB7Cj4gPj4gICAg
ICAgKiBhbnkgb3RoZXIga2luZCBvZiBzaGFyaW5nIHRoYXQgdGhlIGV4cG9ydGVyIG1pZ2h0IHdp
c2ggdG8gbWFrZQo+ID4+ICAgICAgICogYXZhaWxhYmxlIHRvIGJ1ZmZlci11c2Vycy4KPiA+PiAg
ICAgICAqCj4gPj4gKyAgICAgKiBUaGlzIGlzIGFsd2F5cyBjYWxsZWQgd2l0aCB0aGUgZG1hYnVm
LT5yZXN2IG9iamVjdCBsb2NrZWQgd2hlbgo+ID4+ICsgICAgICogdGhlIHBpbi91bnBpbiBjYWxs
YmFja3MgYXJlIGltcGxlbWVudGVkLgo+ID4+ICsgICAgICoKPiA+PiAgICAgICAqIFJldHVybnM6
Cj4gPj4gICAgICAgKgo+ID4+ICAgICAgICogQSAmc2dfdGFibGUgc2NhdHRlciBsaXN0IG9mIG9y
IHRoZSBiYWNraW5nIHN0b3JhZ2Ugb2YgdGhlIERNQSBidWZmZXIsCj4gPj4gQEAgLTEzNyw5ICsx
NjYsNiBAQCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgewo+ID4+ICAgICAgICoKPiA+PiAgICAgICAqIFRo
aXMgaXMgY2FsbGVkIGJ5IGRtYV9idWZfdW5tYXBfYXR0YWNobWVudCgpIGFuZCBzaG91bGQgdW5t
YXAgYW5kCj4gPj4gICAgICAgKiByZWxlYXNlIHRoZSAmc2dfdGFibGUgYWxsb2NhdGVkIGluIEBt
YXBfZG1hX2J1ZiwgYW5kIGl0IGlzIG1hbmRhdG9yeS4KPiA+PiAtICAgICAqIEl0IHNob3VsZCBh
bHNvIHVucGluIHRoZSBiYWNraW5nIHN0b3JhZ2UgaWYgdGhpcyBpcyB0aGUgbGFzdCBtYXBwaW5n
Cj4gPj4gLSAgICAgKiBvZiB0aGUgRE1BIGJ1ZmZlciwgaXQgdGhlIGV4cG9ydGVyIHN1cHBvcnRz
IGJhY2tpbmcgc3RvcmFnZQo+ID4+IC0gICAgICogbWlncmF0aW9uLgo+ID4+ICAgICAgICovCj4g
Pj4gICAgICB2b2lkICgqdW5tYXBfZG1hX2J1Zikoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAq
LAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzZ190YWJsZSAqLAo+ID4+
IEBAIC0zMzAsNiArMzU2LDM0IEBAIHN0cnVjdCBkbWFfYnVmIHsKPiA+PiAgICAgIH0gY2JfZXhj
bCwgY2Jfc2hhcmVkOwo+ID4+ICAgfTsKPiA+Pgo+ID4+ICsvKioKPiA+PiArICogc3RydWN0IGRt
YV9idWZfYXR0YWNoX29wcyAtIGltcG9ydGVyIG9wZXJhdGlvbnMgZm9yIGFuIGF0dGFjaG1lbnQK
PiA+PiArICogQG1vdmVfbm90aWZ5OiBbb3B0aW9uYWxdIG5vdGlmaWNhdGlvbiB0aGF0IHRoZSBE
TUEtYnVmIGlzIG1vdmluZwo+ID4+ICsgKgo+ID4+ICsgKiBBdHRhY2htZW50IG9wZXJhdGlvbnMg
aW1wbGVtZW50ZWQgYnkgdGhlIGltcG9ydGVyLgo+ID4+ICsgKi8KPiA+PiArc3RydWN0IGRtYV9i
dWZfYXR0YWNoX29wcyB7Cj4gPj4gKyAgICAvKioKPiA+PiArICAgICAqIEBtb3ZlX25vdGlmeQo+
ID4+ICsgICAgICoKPiA+PiArICAgICAqIElmIHRoaXMgY2FsbGJhY2sgaXMgcHJvdmlkZWQgdGhl
IGZyYW1ld29yayBjYW4gYXZvaWQgcGlubmluZyB0aGUKPiA+PiArICAgICAqIGJhY2tpbmcgc3Rv
cmUgd2hpbGUgbWFwcGluZ3MgZXhpc3RzLgo+ID4+ICsgICAgICoKPiA+PiArICAgICAqIFRoaXMg
Y2FsbGJhY2sgaXMgY2FsbGVkIHdpdGggdGhlIGxvY2sgb2YgdGhlIHJlc2VydmF0aW9uIG9iamVj
dAo+ID4+ICsgICAgICogYXNzb2NpYXRlZCB3aXRoIHRoZSBkbWFfYnVmIGhlbGQgYW5kIHRoZSBt
YXBwaW5nIGZ1bmN0aW9uIG11c3QgYmUKPiA+PiArICAgICAqIGNhbGxlZCB3aXRoIHRoaXMgbG9j
ayBoZWxkIGFzIHdlbGwuIFRoaXMgbWFrZXMgc3VyZSB0aGF0IG5vIG1hcHBpbmcKPiA+PiArICAg
ICAqIGlzIGNyZWF0ZWQgY29uY3VycmVudGx5IHdpdGggYW4gb25nb2luZyBtb3ZlIG9wZXJhdGlv
bi4KPiA+PiArICAgICAqCj4gPj4gKyAgICAgKiBNYXBwaW5ncyBzdGF5IHZhbGlkIGFuZCBhcmUg
bm90IGRpcmVjdGx5IGFmZmVjdGVkIGJ5IHRoaXMgY2FsbGJhY2suCj4gPj4gKyAgICAgKiBCdXQg
dGhlIERNQS1idWYgY2FuIG5vdyBiZSBpbiBhIGRpZmZlcmVudCBwaHlzaWNhbCBsb2NhdGlvbiwg
c28gYWxsCj4gPj4gKyAgICAgKiBtYXBwaW5ncyBzaG91bGQgYmUgZGVzdHJveWVkIGFuZCByZS1j
cmVhdGVkIGFzIHNvb24gYXMgcG9zc2libGUuCj4gPj4gKyAgICAgKgo+ID4+ICsgICAgICogTmV3
IG1hcHBpbmdzIGNhbiBiZSBjcmVhdGVkIGFmdGVyIHRoaXMgY2FsbGJhY2sgcmV0dXJucywgYW5k
IHdpbGwKPiA+PiArICAgICAqIHBvaW50IHRvIHRoZSBuZXcgbG9jYXRpb24gb2YgdGhlIERNQS1i
dWYuCj4gPj4gKyAgICAgKi8KPiA+PiArICAgIHZvaWQgKCptb3ZlX25vdGlmeSkoc3RydWN0IGRt
YV9idWZfYXR0YWNobWVudCAqYXR0YWNoKTsKPiA+PiArfTsKPiA+PiArCj4gPj4gICAvKioKPiA+
PiAgICAqIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgLSBob2xkcyBkZXZpY2UtYnVmZmVyIGF0
dGFjaG1lbnQgZGF0YQo+ID4+ICAgICogQGRtYWJ1ZjogYnVmZmVyIGZvciB0aGlzIGF0dGFjaG1l
bnQuCj4gPj4gQEAgLTMzOCw2ICszOTIsOCBAQCBzdHJ1Y3QgZG1hX2J1ZiB7Cj4gPj4gICAgKiBA
c2d0OiBjYWNoZWQgbWFwcGluZy4KPiA+PiAgICAqIEBkaXI6IGRpcmVjdGlvbiBvZiBjYWNoZWQg
bWFwcGluZy4KPiA+PiAgICAqIEBwcml2OiBleHBvcnRlciBzcGVjaWZpYyBhdHRhY2htZW50IGRh
dGEuCj4gPj4gKyAqIEBpbXBvcnRlcl9vcHM6IGltcG9ydGVyIG9wZXJhdGlvbnMgZm9yIHRoaXMg
YXR0YWNobWVudC4KPiA+PiArICogQGltcG9ydGVyX3ByaXY6IGltcG9ydGVyIHNwZWNpZmljIGF0
dGFjaG1lbnQgZGF0YS4KPiA+PiAgICAqCj4gPj4gICAgKiBUaGlzIHN0cnVjdHVyZSBob2xkcyB0
aGUgYXR0YWNobWVudCBpbmZvcm1hdGlvbiBiZXR3ZWVuIHRoZSBkbWFfYnVmIGJ1ZmZlcgo+ID4+
ICAgICogYW5kIGl0cyB1c2VyIGRldmljZShzKS4gVGhlIGxpc3QgY29udGFpbnMgb25lIGF0dGFj
aG1lbnQgc3RydWN0IHBlciBkZXZpY2UKPiA+PiBAQCAtMzU1LDYgKzQxMSw5IEBAIHN0cnVjdCBk
bWFfYnVmX2F0dGFjaG1lbnQgewo+ID4+ICAgICAgc3RydWN0IHNnX3RhYmxlICpzZ3Q7Cj4gPj4g
ICAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXI7Cj4gPj4gICAgICB2b2lkICpwcml2Owo+
ID4+ICsKPiA+PiArICAgIGNvbnN0IHN0cnVjdCBkbWFfYnVmX2F0dGFjaF9vcHMgKmltcG9ydGVy
X29wczsKPiA+PiArICAgIHZvaWQgKmltcG9ydGVyX3ByaXY7Cj4gPj4gICB9Owo+ID4+Cj4gPj4g
ICAvKioKPiA+PiBAQCAtNDA1LDEwICs0NjQsNDIgQEAgc3RhdGljIGlubGluZSB2b2lkIGdldF9k
bWFfYnVmKHN0cnVjdCBkbWFfYnVmICpkbWFidWYpCj4gPj4gICAgICBnZXRfZmlsZShkbWFidWYt
PmZpbGUpOwo+ID4+ICAgfQo+ID4+Cj4gPj4gKy8qKgo+ID4+ICsgKiBkbWFfYnVmX2lzX2R5bmFt
aWMgLSBjaGVjayBpZiBhIERNQS1idWYgdXNlcyBkeW5hbWljIG1hcHBpbmdzLgo+ID4+ICsgKiBA
ZG1hYnVmOiB0aGUgRE1BLWJ1ZiB0byBjaGVjawo+ID4+ICsgKgo+ID4+ICsgKiBSZXR1cm5zIHRy
dWUgaWYgYSBETUEtYnVmIGV4cG9ydGVyIHdhbnRzIHRvIGNyZWF0ZSBkeW5hbWljIHNnIHRhYmxl
IG1hcHBpbmdzCj4gPj4gKyAqIGZvciBlYWNoIGF0dGFjaG1lbnQuIEZhbHNlIGlmIG9ubHkgYSBz
aW5nbGUgc3RhdGljIHNnIHRhYmxlIHNob3VsZCBiZSB1c2VkLgo+ID4+ICsgKi8KPiA+PiArc3Rh
dGljIGlubGluZSBib29sIGRtYV9idWZfaXNfZHluYW1pYyhzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVm
KQo+ID4+ICt7Cj4gPj4gKyAgICByZXR1cm4gISFkbWFidWYtPm9wcy0+cGluOwo+ID4+ICt9Cj4g
Pj4gKwo+ID4+ICsvKioKPiA+PiArICogZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFtaWMgLSBj
aGVjayBpZiBhIERNQS1idWYgYXR0YWNobWVudCB1c2VzIGR5bmFtaWMKPiA+PiArICogbWFwcGlu
c2cKPiA+PiArICogQGF0dGFjaDogdGhlIERNQS1idWYgYXR0YWNobWVudCB0byBjaGVjawo+ID4+
ICsgKgo+ID4+ICsgKiBSZXR1cm5zIHRydWUgaWYgYSBETUEtYnVmIGltcG9ydGVyIHdhbnRzIHRv
IHVzZSBkeW5hbWljIHNnIHRhYmxlIG1hcHBpbmdzIGFuZAo+ID4+ICsgKiBjYWxscyB0aGUgbWFw
L3VubWFwIGZ1bmN0aW9ucyB3aXRoIHRoZSByZXNlcnZhdGlvbiBvYmplY3QgbG9ja2VkLgo+ID4+
ICsgKi8KPiA+PiArc3RhdGljIGlubGluZSBib29sCj4gPj4gK2RtYV9idWZfYXR0YWNobWVudF9p
c19keW5hbWljKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCkKPiA+PiArewo+ID4+
ICsgICAgcmV0dXJuIGF0dGFjaC0+aW1wb3J0ZXJfb3BzICYmIGF0dGFjaC0+aW1wb3J0ZXJfb3Bz
LT5tb3ZlX25vdGlmeTsKPiA+PiArfQo+ID4+ICsKPiA+PiAgIHN0cnVjdCBkbWFfYnVmX2F0dGFj
aG1lbnQgKmRtYV9idWZfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsCj4gPj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXYpOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBkZXZpY2UgKmRldik7Cj4gPj4gK3N0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKgo+ID4+
ICtkbWFfYnVmX2R5bmFtaWNfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCBk
ZXZpY2UgKmRldiwKPiA+PiArICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkbWFfYnVm
X2F0dGFjaF9vcHMgKmltcG9ydGVyX29wcywKPiA+PiArICAgICAgICAgICAgICAgICAgIHZvaWQg
KmltcG9ydGVyX3ByaXYpOwo+ID4+ICAgdm9pZCBkbWFfYnVmX2RldGFjaChzdHJ1Y3QgZG1hX2J1
ZiAqZG1hYnVmLAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRtYV9i
dWZfYXR0YWNobWVudCAqZG1hYnVmX2F0dGFjaCk7Cj4gPj4gKyAgICAgICAgICAgICAgICBzdHJ1
Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpOwo+ID4+ICtpbnQgZG1hX2J1Zl9waW4oc3Ry
dWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKTsKPiA+PiArdm9pZCBkbWFfYnVmX3VucGlu
KHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCk7Cj4gPj4KPiA+PiAgIHN0cnVjdCBk
bWFfYnVmICpkbWFfYnVmX2V4cG9ydChjb25zdCBzdHJ1Y3QgZG1hX2J1Zl9leHBvcnRfaW5mbyAq
ZXhwX2luZm8pOwo+ID4+Cj4gPj4gQEAgLTQyMCw2ICs1MTEsNyBAQCBzdHJ1Y3Qgc2dfdGFibGUg
KmRtYV9idWZfbWFwX2F0dGFjaG1lbnQoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqLAo+ID4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGRtYV9kYXRhX2RpcmVj
dGlvbik7Cj4gPj4gICB2b2lkIGRtYV9idWZfdW5tYXBfYXR0YWNobWVudChzdHJ1Y3QgZG1hX2J1
Zl9hdHRhY2htZW50ICosIHN0cnVjdCBzZ190YWJsZSAqLAo+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24pOwo+ID4+ICt2b2lkIGRtYV9idWZf
bW92ZV9ub3RpZnkoc3RydWN0IGRtYV9idWYgKmRtYV9idWYpOwo+ID4+ICAgaW50IGRtYV9idWZf
YmVnaW5fY3B1X2FjY2VzcyhzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwKPiA+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcik7Cj4gPj4gICBpbnQg
ZG1hX2J1Zl9lbmRfY3B1X2FjY2VzcyhzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwKPiA+PiAtLQo+
ID4+IDIuMTcuMQo+ID4+Cj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiA+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
