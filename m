Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 505A0218B6F
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Jul 2020 17:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C996B6E2AF;
	Wed,  8 Jul 2020 15:37:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139DF6E2CA
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jul 2020 15:37:32 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 95so26627619otw.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Jul 2020 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ON0pZjR7zqopX2oOyfp3wHLdGXSAlg8QuZXW+2SPrWA=;
 b=RLVajux7NPBRgq/CEWKAs1ZOFdwJRfzbZW49xTZotBAEZRLRbz2IfiOm6rQAFgocSt
 WPmDZSdy/EYaRLDWuQeJj0DGNh/+QLjstczXLNPBGkyR7OsQmQqxHMXKLptqq8AERAnu
 pfrib27Z8mSMo9TCatzDD4WOlw8rtCd/7CjfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ON0pZjR7zqopX2oOyfp3wHLdGXSAlg8QuZXW+2SPrWA=;
 b=Gsb0IzxLJc1OrB9G/aPp+gvdOJioePmfM8R+3uAlpNAhkbBoGmzG2S6MzZGUrspdeD
 dYeIvNoO0VRc7xVLCMbR5nUnW9VMfP/HhRddG4cakVf0xxUQ/mC9Jc3gyRLym8I0xFyN
 nzqLzzoz10FM2iKamSZ2iuQLtBrwxlydHH1xziEa0VS20aQoQJWDBOJPdWiwe7V0XIrY
 4UP6QppQuiofTIUBPNVSsr44Q+jut3svgQ6AWQLH8uIkyC97dLwSvoNmWc7Ip3QfoeEp
 GsCv1cnI49PaA4P6Ki49pzeL5DJJBnPAc5hfVSilLj+zf2vR8fvhTLC9hZk0UhgkStsT
 ckBA==
X-Gm-Message-State: AOAM5326HTjfjAerBe8KJ7Xo30aDzYKYtTBDSrRgXpblWoYByu7wwpos
 0cIIWosPwA8Jn6tYl2xtdwXb/dm0iTcRn7NP7AFJEg==
X-Google-Smtp-Source: ABdhPJySm/nojfvcmZUnvqQCYgUbZc7W3ZA+HAfuqslN/zLMHts4zSYbFccnlsxJIPFXQC3nYqn3uUo/A/Aa1+V742A=
X-Received: by 2002:a05:6830:1613:: with SMTP id
 g19mr36809613otr.303.1594222651032; 
 Wed, 08 Jul 2020 08:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-2-daniel.vetter@ffwll.ch>
 <20c0a95b-8367-4f26-d058-1cb265255283@amd.com>
 <CAKMK7uFe7Pz4=UUkkunBms8vUrzwEpWJmScOMLO4KdADM43vnw@mail.gmail.com>
 <CADnq5_NcaU_mJpYUvi7DywbOfkb9+AceQ9JCbV-+tO1jVBVBFQ@mail.gmail.com>
In-Reply-To: <CADnq5_NcaU_mJpYUvi7DywbOfkb9+AceQ9JCbV-+tO1jVBVBFQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 8 Jul 2020 17:37:19 +0200
Message-ID: <CAKMK7uHbS8-jXDhGnKaK_65Hs4EUrcfBUe-wcvfPt18weCN0hQ@mail.gmail.com>
Subject: Re: [PATCH 01/25] dma-fence: basic lockdep annotations
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgOCwgMjAyMCBhdCA1OjE5IFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDgsIDIwMjAgYXQgMTE6MTMgQU0gRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gV2Vk
LCBKdWwgOCwgMjAyMCBhdCA0OjU3IFBNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IENvdWxkIHdlIG1lcmdlIHRoaXMgY29udHJv
bGxlZCBieSBhIHNlcGFyYXRlIGNvbmZpZyBvcHRpb24/Cj4gPiA+Cj4gPiA+IFRoaXMgd2F5IHdl
IGNvdWxkIGhhdmUgdGhlIGNoZWNrcyB1cHN0cmVhbSB3aXRob3V0IGhhdmluZyB0byBmaXggYWxs
IHRoZQo+ID4gPiBzdHVmZiBiZWZvcmUgd2UgZG8gdGhpcz8KPiA+Cj4gPiBTaW5jZSBpdCdzIGZ1
bGx5IG9wdC1pbiBhbm5vdGF0aW9ucyBub3RoaW5nIGJsb3dzIHVwIGlmIHdlIGRvbid0IG1lcmdl
Cj4gPiBhbnkgYW5ub3RhdGlvbnMuIFNvIHdlIGNvdWxkIHN0YXJ0IG1lcmdpbmcgdGhlIGZpcnN0
IDMgcGF0Y2hlcy4gQWZ0ZXIKPiA+IHRoYXQgdGhlIGZ1biBzdGFydHMgLi4uCj4gPgo+ID4gTXkg
cm91Z2ggaWRlYSB3YXMgdGhhdCBmaXJzdCBJJ2QgdHJ5IHRvIHRhY2tsZSBkaXNwbGF5LCB0aHVz
IGZhcgo+ID4gdGhlcmUncyAyIGFjdHVhbCBpc3N1ZXMgaW4gZHJpdmVyczoKPiA+IC0gYW1kZ3B1
IGhhcyBzb21lIGRtYV9yZXN2X2xvY2sgaW4gY29tbWl0X3RhaWwsIHBsdXMgYSBrbWFsbG9jLiBJ
Cj4gPiB0aGluayB0aG9zZSBzaG91bGQgYmUgZmFpcmx5IGVhc3kgdG8gZml4IChJJ2QgdHJ5IGEg
c3RhYiBhdCB0aGVtIGV2ZW4pCj4gPiAtIHZtd2dmeCBoYXMgYSBmdWxsIG9uIGxvY2tpbmcgaW52
ZXJzaW9uIHdpdGggZG1hX3Jlc3ZfbG9jayBpbgo+ID4gY29tbWl0X3RhaWwsIGFuZCB0aGF0IG9u
ZSBpcyBmdW5jdGlvbmFsLiBOb3QganVzdCByZWFkaW5nIHNvbWV0aGluZwo+ID4gd2hpY2ggd2Ug
Y2FuIHNhZmVseSBhc3N1bWUgdG8gYmUgaW52YXJpYW50IGFueXdheSAobGlrZSB0aGUgdG16IGZs
YWcKPiA+IGZvciBhbWRncHUsIG9yIHdoYXRldmVyIGl0IHdhcykuCj4gPgo+ID4gSSd2ZSBkb25l
IGEgcGlsZSBtb3JlIGFubm90YXRpb25zIHBhdGNoZXMgZm9yIG90aGVyIGF0b21pYyBkcml2ZXJz
Cj4gPiBub3csIHNvIGhvcGVmdWxseSB0aGF0IGZsdXNoZXMgb3V0IGFueSByZW1haW5pbmcgb2Zm
ZW5kZXJzIGhlcmUuIFNpbmNlCj4gPiBzb21lIG9mIHRoZSBhbm5vdGF0aW9ucyBhcmUgaW4gaGVs
cGVyIGNvZGUgd29yc3QgY2FzZSB3ZSBtaWdodCBuZWVkIGEKPiA+IGRldi0+bW9kZV9jb25maWcu
YnJva2VuX2F0b21pY19jb21taXQgZmxhZyB0byBkaXNhYmxlIHRoZW0uIEF0IGxlYXN0Cj4gPiBm
b3Igbm93IEkgaGF2ZSAwIHBsYW5zIHRvIG1lcmdlIGFueSBvZiB0aGVzZSB3aGlsZSB0aGVyZSdz
IGtub3duCj4gPiB1bnNvbHZlZCBpc3N1ZXMuIE1heWJlIGlmIHNvbWUgZHJpdmVycyB0YWtlIGZv
cmV2ZXIgdG8gZ2V0IGZpeGVkIHdlCj4gPiBjYW4gdGhlbiBhcHBseSBzb21lIGR1Y3QtdGFwZSBm
b3IgdGhlIGF0b21pYyBoZWxwZXIgYW5ub3RhdGlvbiBwYXRjaC4KPiA+IEluc3RlYWQgb2YgYSBm
bGFnIHdlIGNhbiBhbHNvIGNvcHlwYXN0YSB0aGUgYXRvbWljX2NvbW1pdF90YWlsIGhvb2ssCj4g
PiBsZWF2aW5nIHRoZSBhbm5vdGF0aW9ucyBvdXQgYW5kIGFkZGluZyBhIGh1Z2Ugd2FybmluZyBh
Ym91dCB0aGF0Lgo+ID4KPiA+IE5leHQgYmlnIGNodW5rIGlzIHRoZSBkcm0vc2NoZWR1bGVyIGFu
bm90YXRpb25zOgo+ID4gLSBhbWRncHUgbmVlZHMgYSBmdWxsIHJld29yayBvZiBkaXNwbGF5IHJl
c2V0IChidXQgYXBwYXJlbnRseSBpbiB0aGUgd29ya3MpCj4KPiBJIHRoaW5rIHRoZSBkaXNwbGF5
IGRlYWRsb2NrIGlzc3VlcyBzaG91bGQgYmUgZml4ZWQgaW46Cj4gaHR0cHM6Ly9jZ2l0LmZyZWVk
ZXNrdG9wLm9yZy9kcm0vZHJtL2NvbW1pdC8/aWQ9Y2RhYWU4MzcxYWE5ZDRlYTE2NDhhMjk5YjFh
NzU5NDZiOTU1Njk0NAoKVGhhdCdzIHRoZSByZXNldC90ZHIgaW52ZXJzaW9uLCB0aGVyZSdzIHR3
byBtb3JlOgotIGttYWxsb2MsIHNlZSBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL35kYW52
ZXQvZHJtL2NvbW1pdC8/aWQ9ZDkzNTNjYzNiZjYxMTE0MzBhMjQxODhiOTI0MTJkYzQ5ZTdlYWQ3
OQotIHR0bV9ib19yZXNlcnZlIGluIHRoZSB3cm9uZyBwbGFjZQpodHRwczovL2NnaXQuZnJlZWRl
c2t0b3Aub3JnL35kYW52ZXQvZHJtL2NvbW1pdC8/aWQ9YTZjMDMxNzYxNTI2MjVhMmY5Y2YxZTQ5
OWFjZWI4YjIyMTdkYzJhMgotIGNvbnNvbGVfbG9jayBpbiB0aGUgd3Jvbmcgc3BvdApodHRwczov
L2NnaXQuZnJlZWRlc2t0b3Aub3JnL35kYW52ZXQvZHJtL2NvbW1pdC8/aWQ9YTZjMDMxNzYxNTI2
MjVhMmY5Y2YxZTQ5OWFjZWI4YjIyMTdkYzJhMgoKRXNwZWNpYWxseSB0aGUgbGFzdCBvbmUgSSBo
YXZlIG5vIGlkZWEgaG93IHRvIGFkZHJlc3MgcmVhbGx5LgotRGFuaWVsCgoKPgo+IEFsZXgKPgo+
ID4gLSBJIHJlYWQgYWxsIHRoZSBkcml2ZXJzLCB0aGV5IGFsbCBoYXZlIHRoZSBmYWlybHkgY29z
bWV0aWMgaXNzdWUgb2YKPiA+IGRvaW5nIHNtYWxsIGFsbG9jYXRpb25zIGluIHRoZWlyIGNhbGxi
YWNrcy4KPiA+Cj4gPiBJIG1pZ2h0IGVuZCB1cCB0eXBpbmcgdGhlIG1lbXBvb2wgd2UgbmVlZCBm
b3IgdGhlIGxhdHRlciBpc3N1ZSwgYnV0Cj4gPiBmaXJzdCBzdGlsbCBob3BpbmcgZm9yIHNvbWUg
YWN0dWFsIHRlc3QgZmVlZGJhY2sgZnJvbSBvdGhlciBkcml2ZXJzCj4gPiB1c2luZyBkcm0vc2No
ZWR1bGVyLiBBZ2FpbiBubyBpbnRlbnRpb25zIG9mIG1lcmdpbmcgdGhlc2UgYW5ub3RhdGlvbnMK
PiA+IHdpdGhvdXQgdGhlIGRyaXZlcnMgYmVpbmcgZml4ZWQgZmlyc3QsIG9yIGF0IGxlYXN0IHNv
bWUgZHVjdC1hdHBlCj4gPiBhcHBsaWVkLgo+ID4KPiA+IEFub3RoZXIgb3B0aW9uIEkndmUgYmVl
biB0aGlua2luZyBhYm91dCwgaWYgdGhlcmUncyBjYXNlcyB3aGVyZSBmaXhpbmcKPiA+IHRoaW5n
cyBwcm9wZXJseSBpcyBhIGxvdCBvZiBlZmZvcnQ6IFdlIGNvdWxkIGRvIGFubm90YXRpb25zIGZv
ciBicm9rZW4KPiA+IHNlY3Rpb25zIChqdXN0IHRoZSBicm9rZW4gcGFydCwgc28gd2Ugc3RpbGwg
Y2F0Y2ggYnVncyBldmVyeXdoZXJlCj4gPiBlbHNlKS4gVGhleSdkIHNpbXBseSBkcm9wJnJlYWNx
dWlyZSB0aGUgbG9jay4gV2UgY291bGQgdGhlbiBlLmcuIHVzZQo+ID4gdGhhdCBpbiB0aGUgYW1k
Z3B1IGRpc3BsYXkgcmVzZXQgY29kZSwgYW5kIHNvIHN0aWxsIG1ha2Ugc3VyZSB0aGF0Cj4gPiBl
dmVyeXRoaW5nIGVsc2UgaW4gcmVzZXQgZG9lc24ndCBnZXQgd29yc2UuIEJ1dCBJIHRoaW5rIGFk
ZGluZyB0aGF0Cj4gPiBzaG91bGRuJ3QgYmUgb3VyIGZpcnN0IG9wdGlvbi4KPiA+Cj4gPiBJJ20g
bm90IHBlcnNvbmFsbHkgYSBiaWcgZmFuIG9mIHRoZSBLY29uZmlnIG9yIHJ1bnRpbWUgb3B0aW9u
LCBvbmx5Cj4gPiB1cHNldHMgcGVvcGxlIHNpbmNlIGl0IGJyZWFrcyBsb2NrZGVwIGZvciB0aGVt
LiBPciB0aGV5IGlnbm9yZSBpdCwgYW5kCj4gPiB3ZSBkb24ndCBjYXRjaCBidWdzLCBtYWtpbmcg
aXQgZmFpcmx5IHBvaW50bGVzcyB0byBtZXJnZS4KPiA+Cj4gPiBDaGVlcnMsIERhbmllbAo+ID4K
PiA+Cj4gPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4gQ2hyaXN0aWFuLgo+ID4gPgo+ID4gPiBBbSAw
Ny4wNy4yMCB1bSAyMjoxMiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiA+ID4gRGVzaWduIGlz
IHNpbWlsYXIgdG8gdGhlIGxvY2tkZXAgYW5ub3RhdGlvbnMgZm9yIHdvcmtlcnMsIGJ1dCB3aXRo
Cj4gPiA+ID4gc29tZSB0d2lzdHM6Cj4gPiA+ID4KPiA+ID4gPiAtIFdlIHVzZSBhIHJlYWQtbG9j
ayBmb3IgdGhlIGV4ZWN1dGlvbi93b3JrZXIvY29tcGxldGlvbiBzaWRlLCBzbyB0aGF0Cj4gPiA+
ID4gICAgdGhpcyBleHBsaWNpdCBhbm5vdGF0aW9uIGNhbiBiZSBtb3JlIGxpYmVyYWxseSBzcHJp
bmtsZWQgYXJvdW5kLgo+ID4gPiA+ICAgIFdpdGggcmVhZCBsb2NrcyBsb2NrZGVwIGlzbid0IGdv
aW5nIHRvIGNvbXBsYWluIGlmIHRoZSByZWFkLXNpZGUKPiA+ID4gPiAgICBpc24ndCBuZXN0ZWQg
dGhlIHNhbWUgd2F5IHVuZGVyIGFsbCBjaXJjdW1zdGFuY2VzLCBzbyBBQkJBIGRlYWRsb2Nrcwo+
ID4gPiA+ICAgIGFyZSBvay4gV2hpY2ggdGhleSBhcmUsIHNpbmNlIHRoaXMgaXMgYW4gYW5ub3Rh
dGlvbiBvbmx5Lgo+ID4gPiA+Cj4gPiA+ID4gLSBXZSdyZSB1c2luZyBub24tcmVjdXJzaXZlIGxv
Y2tkZXAgcmVhZCBsb2NrIG1vZGUsIHNpbmNlIGluIHJlY3Vyc2l2ZQo+ID4gPiA+ICAgIHJlYWQg
bG9jayBtb2RlIGxvY2tkZXAgZG9lcyBub3QgY2F0Y2ggcmVhZCBzaWRlIGhhemFyZHMuIEFuZCB3
ZQo+ID4gPiA+ICAgIF92ZXJ5XyBtdWNoIHdhbnQgcmVhZCBzaWRlIGhhemFyZHMgdG8gYmUgY2F1
Z2h0LiBGb3IgZnVsbCBkZXRhaWxzIG9mCj4gPiA+ID4gICAgdGhpcyBsaW1pdGF0aW9uIHNlZQo+
ID4gPiA+Cj4gPiA+ID4gICAgY29tbWl0IGU5MTQ5ODU4OTc0NjA2NWUzYWU5NWQ5YTAwYjA2OGU1
MjVlZWMzNGYKPiA+ID4gPiAgICBBdXRob3I6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFk
ZWFkLm9yZz4KPiA+ID4gPiAgICBEYXRlOiAgIFdlZCBBdWcgMjMgMTM6MTM6MTEgMjAxNyArMDIw
MAo+ID4gPiA+Cj4gPiA+ID4gICAgICAgIGxvY2tpbmcvbG9ja2RlcC9zZWxmdGVzdHM6IEFkZCBt
aXhlZCByZWFkLXdyaXRlIEFCQkEgdGVzdHMKPiA+ID4gPgo+ID4gPiA+IC0gVG8gYWxsb3cgbmVz
dGluZyBvZiB0aGUgcmVhZC1zaWRlIGV4cGxpY2l0IGFubm90YXRpb25zIHdlIGV4cGxpY2l0bHkK
PiA+ID4gPiAgICBrZWVwIHRyYWNrIG9mIHRoZSBuZXN0aW5nLiBsb2NrX2lzX2hlbGQoKSBhbGxv
d3MgdXMgdG8gZG8gdGhhdC4KPiA+ID4gPgo+ID4gPiA+IC0gVGhlIHdhaXQtc2lkZSBhbm5vdGF0
aW9uIGlzIGEgd3JpdGUgbG9jaywgYW5kIGVudGlyZWx5IGRvbmUgd2l0aGluCj4gPiA+ID4gICAg
ZG1hX2ZlbmNlX3dhaXQoKSBmb3IgZXZlcnlvbmUgYnkgZGVmYXVsdC4KPiA+ID4gPgo+ID4gPiA+
IC0gVG8gYmUgYWJsZSB0byBmcmVlbHkgYW5ub3RhdGUgaGVscGVyIGZ1bmN0aW9ucyBJIHdhbnQg
dG8gbWFrZSBpdCBvawo+ID4gPiA+ICAgIHRvIGNhbGwgZG1hX2ZlbmNlX2JlZ2luL2VuZF9zaWdu
YWxsaW5nIGZyb20gc29mdC9oYXJkaXJxIGNvbnRleHQuCj4gPiA+ID4gICAgRmlyc3QgYXR0ZW1w
dCB3YXMgdXNpbmcgdGhlIGhhcmRpcnEgbG9ja2luZyBjb250ZXh0IGZvciB0aGUgd3JpdGUKPiA+
ID4gPiAgICBzaWRlIGluIGxvY2tkZXAsIGJ1dCB0aGlzIGZvcmNlcyBhbGwgbm9ybWFsIHNwaW5s
b2NrcyBuZXN0ZWQgd2l0aGluCj4gPiA+ID4gICAgZG1hX2ZlbmNlX2JlZ2luL2VuZF9zaWduYWxs
aW5nIHRvIGJlIHNwaW5sb2Nrcy4gVGhhdCBib2xsb2Nrcy4KPiA+ID4gPgo+ID4gPiA+ICAgIFRo
ZSBhcHByb2FjaCBub3cgaXMgdG8gc2ltcGxlIGNoZWNrIGluX2F0b21pYygpLCBhbmQgZm9yIHRo
ZXNlIGNhc2VzCj4gPiA+ID4gICAgZW50aXJlbHkgcmVseSBvbiB0aGUgbWlnaHRfc2xlZXAoKSBj
aGVjayBpbiBkbWFfZmVuY2Vfd2FpdCgpLiBUaGF0Cj4gPiA+ID4gICAgd2lsbCBjYXRjaCBhbnkg
d3JvbmcgbmVzdGluZyBhZ2FpbnN0IHNwaW5sb2NrcyBmcm9tIHNvZnQvaGFyZGlycQo+ID4gPiA+
ICAgIGNvbnRleHRzLgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGlkZWEgaGVyZSBpcyB0aGF0IGV2ZXJ5
IGNvZGUgcGF0aCB0aGF0J3MgY3JpdGljYWwgZm9yIGV2ZW50dWFsbHkKPiA+ID4gPiBzaWduYWxs
aW5nIGEgZG1hX2ZlbmNlIHNob3VsZCBiZSBhbm5vdGF0ZWQgd2l0aAo+ID4gPiA+IGRtYV9mZW5j
ZV9iZWdpbi9lbmRfc2lnbmFsbGluZy4gVGhlIGFubm90YXRpb24gaWRlYWxseSBzdGFydHMgcmln
aHQKPiA+ID4gPiBhZnRlciBhIGRtYV9mZW5jZSBpcyBwdWJsaXNoZWQgKGFkZGVkIHRvIGEgZG1h
X3Jlc3YsIGV4cG9zZWQgYXMgYQo+ID4gPiA+IHN5bmNfZmlsZSBmZCwgYXR0YWNoZWQgdG8gYSBk
cm1fc3luY29iaiBmZCwgb3IgYW55dGhpbmcgZWxzZSB0aGF0Cj4gPiA+ID4gbWFrZXMgdGhlIGRt
YV9mZW5jZSB2aXNpYmxlIHRvIG90aGVyIGtlcm5lbCB0aHJlYWRzKSwgdXAgdG8gYW5kCj4gPiA+
ID4gaW5jbHVkaW5nIHRoZSBkbWFfZmVuY2Vfd2FpdCgpLiBFeGFtcGxlcyBhcmUgaXJxIGhhbmRs
ZXJzLCB0aGUKPiA+ID4gPiBzY2hlZHVsZXIgcnQgdGhyZWFkcywgdGhlIHRhaWwgb2YgZXhlY2J1
ZiAoYWZ0ZXIgdGhlIGNvcnJlc3BvbmRpbmcKPiA+ID4gPiBmZW5jZXMgYXJlIHZpc2libGUpLCBh
bnkgd29ya2VycyB0aGF0IGVuZCB1cCBzaWduYWxsaW5nIGRtYV9mZW5jZXMgYW5kCj4gPiA+ID4g
cmVhbGx5IGFueXRoaW5nIGVsc2UuIE5vdCBhbm5vdGF0ZWQgc2hvdWxkIGJlIGNvZGUgcGF0aHMg
dGhhdCBvbmx5Cj4gPiA+ID4gY29tcGxldGUgZmVuY2VzIG9wcG9ydHVuaXN0aWNhbGx5IGFzIHRo
ZSBncHUgcHJvZ3Jlc3NlcywgbGlrZSBlLmcuCj4gPiA+ID4gc2hyaW5rZXIvZXZpY3Rpb24gY29k
ZS4KPiA+ID4gPgo+ID4gPiA+IFRoZSBtYWluIGNsYXNzIG9mIGRlYWRsb2NrcyB0aGlzIGlzIHN1
cHBvc2VkIHRvIGNhdGNoIGFyZToKPiA+ID4gPgo+ID4gPiA+IFRocmVhZCBBOgo+ID4gPiA+Cj4g
PiA+ID4gICAgICAgbXV0ZXhfbG9jayhBKTsKPiA+ID4gPiAgICAgICBtdXRleF91bmxvY2soQSk7
Cj4gPiA+ID4KPiA+ID4gPiAgICAgICBkbWFfZmVuY2Vfc2lnbmFsKCk7Cj4gPiA+ID4KPiA+ID4g
PiBUaHJlYWQgQjoKPiA+ID4gPgo+ID4gPiA+ICAgICAgIG11dGV4X2xvY2soQSk7Cj4gPiA+ID4g
ICAgICAgZG1hX2ZlbmNlX3dhaXQoKTsKPiA+ID4gPiAgICAgICBtdXRleF91bmxvY2soQSk7Cj4g
PiA+ID4KPiA+ID4gPiBUaHJlYWQgQiBpcyBibG9ja2VkIG9uIEEgc2lnbmFsbGluZyB0aGUgZmVu
Y2UsIGJ1dCBBIG5ldmVyIGdldHMgYXJvdW5kCj4gPiA+ID4gdG8gdGhhdCBiZWNhdXNlIGl0IGNh
bm5vdCBhY3F1aXJlIHRoZSBsb2NrIEEuCj4gPiA+ID4KPiA+ID4gPiBOb3RlIHRoYXQgZG1hX2Zl
bmNlX3dhaXQoKSBpcyBhbGxvd2VkIHRvIGJlIG5lc3RlZCB3aXRoaW4KPiA+ID4gPiBkbWFfZmVu
Y2VfYmVnaW4vZW5kX3NpZ25hbGxpbmcgc2VjdGlvbnMuIFRvIGFsbG93IHRoaXMgdG8gaGFwcGVu
IHRoZQo+ID4gPiA+IHJlYWQgbG9jayBuZWVkcyB0byBiZSB1cGdyYWRlZCB0byBhIHdyaXRlIGxv
Y2ssIHdoaWNoIG1lYW5zIHRoYXQgYW55Cj4gPiA+ID4gb3RoZXIgbG9jayBpcyBhY3F1aXJlZCBi
ZXR3ZWVuIHRoZSBkbWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZygpIGNhbGwgYW5kCj4gPiA+ID4g
dGhlIGNhbGwgdG8gZG1hX2ZlbmNlX3dhaXQoKSwgYW5kIHN0aWxsIGhlbGQsIHRoaXMgd2lsbCBy
ZXN1bHQgaW4gYW4KPiA+ID4gPiBpbW1lZGlhdGUgbG9ja2RlcCBjb21wbGFpbnQuIFRoZSBvbmx5
IG90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBub3QKPiA+ID4gPiBhbm5vdGF0ZSBzdWNoIGNhbGxz
LCBkZWZlYXRpbmcgdGhlIHBvaW50LiBUaGVyZWZvcmUgdGhlc2UgYW5ub3RhdGlvbnMKPiA+ID4g
PiBjYW5ub3QgYmUgc3ByaW5rbGVkIG92ZXIgdGhlIGNvZGUgZW50aXJlbHkgbWluZGxlc3MgdG8g
YXZvaWQgZmFsc2UKPiA+ID4gPiBwb3NpdGl2ZXMuCj4gPiA+ID4KPiA+ID4gPiBPcmlnaW5hbGx5
IEkgaG9wZSB0aGF0IHRoZSBjcm9zcy1yZWxlYXNlIGxvY2tkZXAgZXh0ZW5zaW9ucyB3b3VsZAo+
ID4gPiA+IGFsbGV2aWF0ZSB0aGUgbmVlZCBmb3IgZXhwbGljaXQgYW5ub3RhdGlvbnM6Cj4gPiA+
ID4KPiA+ID4gPiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Lz91cmw9aHR0cHMlM0ElMkYlMkZsd24ubmV0JTJGQXJ0aWNsZXMlMkY3MDk4NDklMkYmYW1wO2Rh
dGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDZmYxYTlkZDE3YzU0NDUz
NGVlYjgwOGQ4MjJiMjFiYTIlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAl
N0MwJTdDNjM3Mjk3NDk1NjQ5NjIxNTY2JmFtcDtzZGF0YT1wYkR3ZiUyQkFHMVVaNWJMWmVlcDdW
ZUdWUU1ubFFoWDBUS0cxZDZPazhHZlElM0QmYW1wO3Jlc2VydmVkPTAKPiA+ID4gPgo+ID4gPiA+
IEJ1dCB0aGVyZSdzIGEgZmV3IHJlYXNvbnMgd2h5IHRoYXQncyBub3QgYW4gb3B0aW9uOgo+ID4g
PiA+Cj4gPiA+ID4gLSBJdCdzIG5vdCBoYXBwZW5pbmcgaW4gdXBzdHJlYW0sIHNpbmNlIGl0IGdv
dCByZXZlcnRlZCBkdWUgdG8gdG9vCj4gPiA+ID4gICAgbWFueSBmYWxzZSBwb3NpdGl2ZXM6Cj4g
PiA+ID4KPiA+ID4gPiAgICAgICBjb21taXQgZTk2NmVhZWViNjIzZjA5OTc1ZWYzNjJjMjg2NmZh
ZTZmODY4NDRmOQo+ID4gPiA+ICAgICAgIEF1dGhvcjogSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5l
bC5vcmc+Cj4gPiA+ID4gICAgICAgRGF0ZTogICBUdWUgRGVjIDEyIDEyOjMxOjE2IDIwMTcgKzAx
MDAKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgICBsb2NraW5nL2xvY2tkZXA6IFJlbW92ZSB0aGUg
Y3Jvc3MtcmVsZWFzZSBsb2NraW5nIGNoZWNrcwo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICAgIFRo
aXMgY29kZSAoQ09ORklHX0xPQ0tERVBfQ1JPU1NSRUxFQVNFPXkgYW5kIENPTkZJR19MT0NLREVQ
X0NPTVBMRVRJT05TPXkpLAo+ID4gPiA+ICAgICAgICAgICB3aGlsZSBpdCBmb3VuZCBhIG51bWJl
ciBvZiBvbGQgYnVncyBpbml0aWFsbHksIHdhcyBhbHNvIGNhdXNpbmcgdG9vIG1hbnkKPiA+ID4g
PiAgICAgICAgICAgZmFsc2UgcG9zaXRpdmVzIHRoYXQgY2F1c2VkIHBlb3BsZSB0byBkaXNhYmxl
IGxvY2tkZXAgLSB3aGljaCBpcyBhcmd1YWJseQo+ID4gPiA+ICAgICAgICAgICBhIHdvcnNlIG92
ZXJhbGwgb3V0Y29tZS4KPiA+ID4gPgo+ID4gPiA+IC0gY3Jvc3MtcmVsZWFzZSB1c2VzIHRoZSBj
b21wbGV0ZSgpIGNhbGwgdG8gYW5ub3RhdGUgdGhlIGVuZCBvZgo+ID4gPiA+ICAgIGNyaXRpY2Fs
IHNlY3Rpb25zLCBmb3IgZG1hX2ZlbmNlIHRoYXQgd291bGQgYmUgZG1hX2ZlbmNlX3NpZ25hbCgp
Lgo+ID4gPiA+ICAgIEJ1dCB3ZSBkbyBub3Qgd2FudCBhbGwgZG1hX2ZlbmNlX3NpZ25hbCgpIGNh
bGxzIHRvIGJlIHRyZWF0ZWQgYXMKPiA+ID4gPiAgICBjcml0aWNhbCwgc2luY2UgbWFueSBhcmUg
b3Bwb3J0dW5pc3RpYyBjbGVhbnVwIG9mIGdwdSByZXF1ZXN0cy4gSWYKPiA+ID4gPiAgICB0aGVz
ZSBnZXQgc3R1Y2sgdGhlcmUncyBzdGlsbCB0aGUgbWFpbiBjb21wbGV0aW9uIGludGVycnVwdCBh
bmQKPiA+ID4gPiAgICB3b3JrZXJzIHdobyBjYW4gdW5ibG9jayBldmVyeW9uZS4gQXV0b21hdGlj
YWxseSBhbm5vdGF0aW5nIGFsbAo+ID4gPiA+ICAgIGRtYV9mZW5jZV9zaWduYWwoKSBjYWxscyB3
b3VsZCBoZW5jZSBjYXVzZSBmYWxzZSBwb3NpdGl2ZXMuCj4gPiA+ID4KPiA+ID4gPiAtIGNyb3Nz
LXJlbGVhc2UgaGFkIHNvbWUgZWR1Y2F0ZWQgZ3Vlc3NlcyBmb3Igd2hlbiBhIGNyaXRpY2FsIHNl
Y3Rpb24KPiA+ID4gPiAgICBzdGFydHMsIGxpa2UgZnJlc2ggc3lzY2FsbCBvciBmcmVzaCB3b3Jr
IGNhbGxiYWNrLiBUaGlzIHdvdWxkIGFnYWluCj4gPiA+ID4gICAgY2F1c2UgZmFsc2UgcG9zaXRp
dmVzIHdpdGhvdXQgZXhwbGljaXQgYW5ub3RhdGlvbnMsIHNpbmNlIGZvcgo+ID4gPiA+ICAgIGRt
YV9mZW5jZSB0aGUgY3JpdGljYWwgc2VjdGlvbnMgb25seSBzdGFydHMgd2hlbiB3ZSBwdWJsaXNo
IGEgZmVuY2UuCj4gPiA+ID4KPiA+ID4gPiAtIEZ1cnRoZXJtb3JlIHRoZXJlIGNhbiBiZSBjYXNl
cyB3aGVyZSBhIHRocmVhZCBuZXZlciBkb2VzIGEKPiA+ID4gPiAgICBkbWFfZmVuY2Vfc2lnbmFs
LCBidXQgaXMgc3RpbGwgY3JpdGljYWwgZm9yIHJlYWNoaW5nIGNvbXBsZXRpb24gb2YKPiA+ID4g
PiAgICBmZW5jZXMuIE9uZSBleGFtcGxlIHdvdWxkIGJlIGEgc2NoZWR1bGVyIGt0aHJlYWQgd2hp
Y2ggcGlja3MgdXAgam9icwo+ID4gPiA+ICAgIGFuZCBwdXNoZXMgdGhlbSBpbnRvIGhhcmR3YXJl
LCB3aGVyZSB0aGUgaW50ZXJydXB0IGhhbmRsZXIgb3IKPiA+ID4gPiAgICBhbm90aGVyIGNvbXBs
ZXRpb24gdGhyZWFkIGNhbGxzIGRtYV9mZW5jZV9zaWduYWwoKS4gQnV0IGlmIHRoZQo+ID4gPiA+
ICAgIHNjaGVkdWxlciB0aHJlYWQgaGFuZ3MsIHRoZW4gYWxsIHRoZSBmZW5jZXMgaGFuZywgaGVu
Y2Ugd2UgbmVlZCB0bwo+ID4gPiA+ICAgIG1hbnVhbGx5IGFubm90YXRlIGl0LiBjcm9zcy1yZWxl
YXNlIGFpbWVkIHRvIHNvbHZlIHRoaXMgYnkgY2hhaW5pbmcKPiA+ID4gPiAgICBjcm9zcy1yZWxl
YXNlIGRlcGVuZGVuY2llcywgYnV0IHRoZSBkZXBlbmRlbmN5IGZyb20gc2NoZWR1bGVyIHRocmVh
ZAo+ID4gPiA+ICAgIHRvIHRoZSBjb21wbGV0aW9uIGludGVycnVwdCBoYW5kbGVyIGdvZXMgdGhy
b3VnaCBodyB3aGVyZQo+ID4gPiA+ICAgIGNyb3NzLXJlbGVhc2UgY29kZSBjYW4ndCBvYnNlcnZl
IGl0Lgo+ID4gPiA+Cj4gPiA+ID4gSW4gc2hvcnQsIHdpdGhvdXQgbWFudWFsIGFubm90YXRpb25z
IGFuZCBjYXJlZnVsIHJldmlldyBvZiB0aGUgc3RhcnQKPiA+ID4gPiBhbmQgZW5kIG9mIGNyaXRp
Y2FsIHNlY3Rpb25zLCBjcm9zcy1yZWxlc2UgZGVwZW5kZW5jeSB0cmFja2luZyBkb2Vzbid0Cj4g
PiA+ID4gd29yay4gV2UgbmVlZCBleHBsaWNpdCBhbm5vdGF0aW9ucy4KPiA+ID4gPgo+ID4gPiA+
IHYyOiBoYW5kbGUgc29mdC9oYXJkaXJxIGN0eCBiZXR0ZXIgYWdhaW5zdCB3cml0ZSBzaWRlIGFu
ZCBkb250IGZvcmdldAo+ID4gPiA+IEVYUE9SVF9TWU1CT0wsIGRyaXZlcnMgY2FuJ3QgdXNlIHRo
aXMgb3RoZXJ3aXNlLgo+ID4gPiA+Cj4gPiA+ID4gdjM6IEtlcm5lbGRvYy4KPiA+ID4gPgo+ID4g
PiA+IHY0OiBTb21lIHNwZWxsaW5nIGZpeGVzIGZyb20gTWlrYQo+ID4gPiA+Cj4gPiA+ID4gdjU6
IEFtZW5kIGNvbW1pdCBtZXNzYWdlIHRvIGV4cGxhaW4gaW4gZGV0YWlsIHdoeSBjcm9zcy1yZWxl
YXNlIGlzbid0Cj4gPiA+ID4gdGhlIHNvbHV0aW9uLgo+ID4gPiA+Cj4gPiA+ID4gdjY6IFB1bGwg
b3V0IG1pc3BsYWNlZCAucnN0IGh1bmsuCj4gPiA+ID4KPiA+ID4gPiBDYzogRmVsaXggS3VlaGxp
bmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFRob21hcyBI
ZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT4KPiA+ID4gPiBSZXZpZXdlZC1i
eTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
PiA+ID4gPiBDYzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBpbnRlbC5jb20+Cj4gPiA+
ID4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgo+ID4g
PiA+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gPiBDYzogbGluYXJvLW1t
LXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gPiA+ID4gQ2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwu
b3JnCj4gPiA+ID4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+ID4gQ2M6
IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gPiBDYzogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiA+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiA+ID4gQ2M6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+ID4gPiAtLS0KPiA+
ID4gPiAgIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdCB8ICAgNiArCj4gPiA+
ID4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgICAgICAgICAgfCAxNjEgKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gPiA+ID4gICBpbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oICAg
ICAgICAgICAgfCAgMTIgKysKPiA+ID4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTc5IGluc2VydGlv
bnMoKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1h
cGkvZG1hLWJ1Zi5yc3QgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZG1hLWJ1Zi5yc3QKPiA+
ID4gPiBpbmRleCA3ZmI3YjY2MWZlYmQuLjA1ZDg1NjEzMTE0MCAxMDA2NDQKPiA+ID4gPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZG1hLWJ1Zi5yc3QKPiA+ID4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RyaXZlci1hcGkvZG1hLWJ1Zi5yc3QKPiA+ID4gPiBAQCAtMTMzLDYgKzEzMywx
MiBAQCBETUEgRmVuY2VzCj4gPiA+ID4gICAuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9kbWEtYnVm
L2RtYS1mZW5jZS5jCj4gPiA+ID4gICAgICA6ZG9jOiBETUEgZmVuY2VzIG92ZXJ2aWV3Cj4gPiA+
ID4KPiA+ID4gPiArRE1BIEZlbmNlIFNpZ25hbGxpbmcgQW5ub3RhdGlvbnMKPiA+ID4gPiArfn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+ID4gPiArCj4gPiA+ID4gKy4uIGtlcm5l
bC1kb2M6OiBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiA+ID4gPiArICAgOmRvYzogZmVu
Y2Ugc2lnbmFsbGluZyBhbm5vdGF0aW9uCj4gPiA+ID4gKwo+ID4gPiA+ICAgRE1BIEZlbmNlcyBG
dW5jdGlvbnMgUmVmZXJlbmNlCj4gPiA+ID4gICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiA+ID4gPiBpbmRleCA2NTZlOWFjMmQw
MjguLjAwMDViYzAwMjUyOSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1h
LWZlbmNlLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiA+ID4g
PiBAQCAtMTEwLDYgKzExMCwxNjAgQEAgdTY0IGRtYV9mZW5jZV9jb250ZXh0X2FsbG9jKHVuc2ln
bmVkIG51bSkKPiA+ID4gPiAgIH0KPiA+ID4gPiAgIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2Nv
bnRleHRfYWxsb2MpOwo+ID4gPiA+Cj4gPiA+ID4gKy8qKgo+ID4gPiA+ICsgKiBET0M6IGZlbmNl
IHNpZ25hbGxpbmcgYW5ub3RhdGlvbgo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBQcm92aW5nIGNv
cnJlY3RuZXNzIG9mIGFsbCB0aGUga2VybmVsIGNvZGUgYXJvdW5kICZkbWFfZmVuY2UgdGhyb3Vn
aCBjb2RlCj4gPiA+ID4gKyAqIHJldmlldyBhbmQgdGVzdGluZyBpcyB0cmlja3kgZm9yIGEgZmV3
IHJlYXNvbnM6Cj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqICogSXQgaXMgYSBjcm9zcy1kcml2ZXIg
Y29udHJhY3QsIGFuZCB0aGVyZWZvcmUgYWxsIGRyaXZlcnMgbXVzdCBmb2xsb3cgdGhlCj4gPiA+
ID4gKyAqICAgc2FtZSBydWxlcyBmb3IgbG9jayBuZXN0aW5nIG9yZGVyLCBjYWxsaW5nIGNvbnRl
eHRzIGZvciB2YXJpb3VzIGZ1bmN0aW9ucwo+ID4gPiA+ICsgKiAgIGFuZCBhbnl0aGluZyBlbHNl
IHNpZ25pZmljYW50IGZvciBpbi1rZXJuZWwgaW50ZXJmYWNlcy4gQnV0IGl0IGlzIGFsc28KPiA+
ID4gPiArICogICBpbXBvc3NpYmxlIHRvIHRlc3QgYWxsIGRyaXZlcnMgaW4gYSBzaW5nbGUgbWFj
aGluZSwgaGVuY2UgYnJ1dGUtZm9yY2UgTiB2cy4KPiA+ID4gPiArICogICBOIHRlc3Rpbmcgb2Yg
YWxsIGNvbWJpbmF0aW9ucyBpcyBpbXBvc3NpYmxlLiBFdmVuIGp1c3QgbGltaXRpbmcgdG8gdGhl
Cj4gPiA+ID4gKyAqICAgcG9zc2libGUgY29tYmluYXRpb25zIGlzIGluZmVhc2libGUuCj4gPiA+
ID4gKyAqCj4gPiA+ID4gKyAqICogVGhlcmUgaXMgYW4gZW5vcm1vdXMgYW1vdW50IG9mIGRyaXZl
ciBjb2RlIGludm9sdmVkLiBGb3IgcmVuZGVyIGRyaXZlcnMKPiA+ID4gPiArICogICB0aGVyZSdz
IHRoZSB0YWlsIG9mIGNvbW1hbmQgc3VibWlzc2lvbiwgYWZ0ZXIgZmVuY2VzIGFyZSBwdWJsaXNo
ZWQsCj4gPiA+ID4gKyAqICAgc2NoZWR1bGVyIGNvZGUsIGludGVycnVwdCBhbmQgd29ya2VycyB0
byBwcm9jZXNzIGpvYiBjb21wbGV0aW9uLAo+ID4gPiA+ICsgKiAgIGFuZCB0aW1lb3V0LCBncHUg
cmVzZXQgYW5kIGdwdSBoYW5nIHJlY292ZXJ5IGNvZGUuIFBsdXMgZm9yIGludGVncmF0aW9uCj4g
PiA+ID4gKyAqICAgd2l0aCBjb3JlIG1tIHdpdGggaGF2ZSAmbW11X25vdGlmaWVyLCByZXNwZWN0
aXZlbHkgJm1tdV9pbnRlcnZhbF9ub3RpZmllciwKPiA+ID4gPiArICogICBhbmQgJnNocmlua2Vy
LiBGb3IgbW9kZXNldHRpbmcgZHJpdmVycyB0aGVyZSdzIHRoZSBjb21taXQgdGFpbCBmdW5jdGlv
bnMKPiA+ID4gPiArICogICBiZXR3ZWVuIHdoZW4gZmVuY2VzIGZvciBhbiBhdG9taWMgbW9kZXNl
dCBhcmUgcHVibGlzaGVkLCBhbmQgd2hlbiB0aGUKPiA+ID4gPiArICogICBjb3JyZXNwb25kaW5n
IHZibGFuayBjb21wbGV0ZXMsIGluY2x1ZGluZyBhbnkgaW50ZXJydXB0IHByb2Nlc3NpbmcgYW5k
Cj4gPiA+ID4gKyAqICAgcmVsYXRlZCB3b3JrZXJzLiBBdWRpdGluZyBhbGwgdGhhdCBjb2RlLCBh
Y3Jvc3MgYWxsIGRyaXZlcnMsIGlzIG5vdAo+ID4gPiA+ICsgKiAgIGZlYXNpYmxlLgo+ID4gPiA+
ICsgKgo+ID4gPiA+ICsgKiAqIER1ZSB0byBob3cgbWFueSBvdGhlciBzdWJzeXN0ZW1zIGFyZSBp
bnZvbHZlZCBhbmQgdGhlIGxvY2tpbmcgaGllcmFyY2hpZXMKPiA+ID4gPiArICogICB0aGlzIHB1
bGxzIGluIHRoZXJlIGlzIGV4dHJlbWVseSB0aGluIHdpZ2dsZS1yb29tIGZvciBkcml2ZXItc3Bl
Y2lmaWMKPiA+ID4gPiArICogICBkaWZmZXJlbmNlcy4gJmRtYV9mZW5jZSBpbnRlcmFjdHMgd2l0
aCBhbG1vc3QgYWxsIG9mIHRoZSBjb3JlIG1lbW9yeQo+ID4gPiA+ICsgKiAgIGhhbmRsaW5nIHRo
cm91Z2ggcGFnZSBmYXVsdCBoYW5kbGVycyB2aWEgJmRtYV9yZXN2LCBkbWFfcmVzdl9sb2NrKCkg
YW5kCj4gPiA+ID4gKyAqICAgZG1hX3Jlc3ZfdW5sb2NrKCkuIE9uIHRoZSBvdGhlciBzaWRlIGl0
IGFsc28gaW50ZXJhY3RzIHRocm91Z2ggYWxsCj4gPiA+ID4gKyAqICAgYWxsb2NhdGlvbiBzaXRl
cyB0aHJvdWdoICZtbXVfbm90aWZpZXIgYW5kICZzaHJpbmtlci4KPiA+ID4gPiArICoKPiA+ID4g
PiArICogRnVydGhlcm1vcmUgbG9ja2RlcCBkb2VzIG5vdCBoYW5kbGUgY3Jvc3MtcmVsZWFzZSBk
ZXBlbmRlbmNpZXMsIHdoaWNoIG1lYW5zCj4gPiA+ID4gKyAqIGFueSBkZWFkbG9ja3MgYmV0d2Vl
biBkbWFfZmVuY2Vfd2FpdCgpIGFuZCBkbWFfZmVuY2Vfc2lnbmFsKCkgY2FuJ3QgYmUgY2F1Z2h0
Cj4gPiA+ID4gKyAqIGF0IHJ1bnRpbWUgd2l0aCBzb21lIHF1aWNrIHRlc3RpbmcuIFRoZSBzaW1w
bGVzdCBleGFtcGxlIGlzIG9uZSB0aHJlYWQKPiA+ID4gPiArICogd2FpdGluZyBvbiBhICZkbWFf
ZmVuY2Ugd2hpbGUgaG9sZGluZyBhIGxvY2s6Ogo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiAgICAg
bG9jayhBKTsKPiA+ID4gPiArICogICAgIGRtYV9mZW5jZV93YWl0KEIpOwo+ID4gPiA+ICsgKiAg
ICAgdW5sb2NrKEEpOwo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiB3aGlsZSB0aGUgb3RoZXIgdGhy
ZWFkIGlzIHN0dWNrIHRyeWluZyB0byBhY3F1aXJlIHRoZSBzYW1lIGxvY2ssIHdoaWNoCj4gPiA+
ID4gKyAqIHByZXZlbnRzIGl0IGZyb20gc2lnbmFsbGluZyB0aGUgZmVuY2UgdGhlIHByZXZpb3Vz
IHRocmVhZCBpcyBzdHVjayB3YWl0aW5nCj4gPiA+ID4gKyAqIG9uOjoKPiA+ID4gPiArICoKPiA+
ID4gPiArICogICAgIGxvY2soQSk7Cj4gPiA+ID4gKyAqICAgICB1bmxvY2soQSk7Cj4gPiA+ID4g
KyAqICAgICBkbWFfZmVuY2Vfc2lnbmFsKEIpOwo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBCeSBt
YW51YWxseSBhbm5vdGF0aW5nIGFsbCBjb2RlIHJlbGV2YW50IHRvIHNpZ25hbGxpbmcgYSAmZG1h
X2ZlbmNlIHdlIGNhbgo+ID4gPiA+ICsgKiB0ZWFjaCBsb2NrZGVwIGFib3V0IHRoZXNlIGRlcGVu
ZGVuY2llcywgd2hpY2ggYWxzbyBoZWxwcyB3aXRoIHRoZSB2YWxpZGF0aW9uCj4gPiA+ID4gKyAq
IGhlYWRhY2hlIHNpbmNlIG5vdyBsb2NrZGVwIGNhbiBjaGVjayBhbGwgdGhlIHJ1bGVzIGZvciB1
czo6Cj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqICAgIGNvb2tpZSA9IGRtYV9mZW5jZV9iZWdpbl9z
aWduYWxsaW5nKCk7Cj4gPiA+ID4gKyAqICAgIGxvY2soQSk7Cj4gPiA+ID4gKyAqICAgIHVubG9j
ayhBKTsKPiA+ID4gPiArICogICAgZG1hX2ZlbmNlX3NpZ25hbChCKTsKPiA+ID4gPiArICogICAg
ZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGNvb2tpZSk7Cj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAq
IEZvciB1c2luZyBkbWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZygpIGFuZCBkbWFfZmVuY2VfZW5k
X3NpZ25hbGxpbmcoKSB0bwo+ID4gPiA+ICsgKiBhbm5vdGF0ZSBjcml0aWNhbCBzZWN0aW9ucyB0
aGUgZm9sbG93aW5nIHJ1bGVzIG5lZWQgdG8gYmUgb2JzZXJ2ZWQ6Cj4gPiA+ID4gKyAqCj4gPiA+
ID4gKyAqICogQWxsIGNvZGUgbmVjZXNzYXJ5IHRvIGNvbXBsZXRlIGEgJmRtYV9mZW5jZSBtdXN0
IGJlIGFubm90YXRlZCwgZnJvbSB0aGUKPiA+ID4gPiArICogICBwb2ludCB3aGVyZSBhIGZlbmNl
IGlzIGFjY2Vzc2libGUgdG8gb3RoZXIgdGhyZWFkcywgdG8gdGhlIHBvaW50IHdoZXJlCj4gPiA+
ID4gKyAqICAgZG1hX2ZlbmNlX3NpZ25hbCgpIGlzIGNhbGxlZC4gVW4tYW5ub3RhdGVkIGNvZGUg
Y2FuIGNvbnRhaW4gZGVhZGxvY2sgaXNzdWVzLAo+ID4gPiA+ICsgKiAgIGFuZCBkdWUgdG8gdGhl
IHZlcnkgc3RyaWN0IHJ1bGVzIGFuZCBtYW55IGNvcm5lciBjYXNlcyBpdCBpcyBpbmZlYXNpYmxl
IHRvCj4gPiA+ID4gKyAqICAgY2F0Y2ggdGhlc2UganVzdCB3aXRoIHJldmlldyBvciBub3JtYWwg
c3RyZXNzIHRlc3RpbmcuCj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqICogJnN0cnVjdCBkbWFfcmVz
diBkZXNlcnZlcyBhIHNwZWNpYWwgbm90ZSwgc2luY2UgdGhlIHJlYWRlcnMgYXJlIG9ubHkKPiA+
ID4gPiArICogICBwcm90ZWN0ZWQgYnkgcmN1LiBUaGlzIG1lYW5zIHRoZSBzaWduYWxsaW5nIGNy
aXRpY2FsIHNlY3Rpb24gc3RhcnRzIGFzIHNvb24KPiA+ID4gPiArICogICBhcyB0aGUgbmV3IGZl
bmNlcyBhcmUgaW5zdGFsbGVkLCBldmVuIGJlZm9yZSBkbWFfcmVzdl91bmxvY2soKSBpcyBjYWxs
ZWQuCj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqICogVGhlIG9ubHkgZXhjZXB0aW9uIGFyZSBmYXN0
IHBhdGhzIGFuZCBvcHBvcnR1bmlzdGljIHNpZ25hbGxpbmcgY29kZSwgd2hpY2gKPiA+ID4gPiAr
ICogICBjYWxscyBkbWFfZmVuY2Vfc2lnbmFsKCkgcHVyZWx5IGFzIGFuIG9wdGltaXphdGlvbiwg
YnV0IGlzIG5vdCByZXF1aXJlZCB0bwo+ID4gPiA+ICsgKiAgIGd1YXJhbnRlZSBjb21wbGV0aW9u
IG9mIGEgJmRtYV9mZW5jZS4gVGhlIHVzdWFsIGV4YW1wbGUgaXMgYSB3YWl0IElPQ1RMCj4gPiA+
ID4gKyAqICAgd2hpY2ggY2FsbHMgZG1hX2ZlbmNlX3NpZ25hbCgpLCB3aGlsZSB0aGUgbWFuZGF0
b3J5IGNvbXBsZXRpb24gcGF0aCBnb2VzCj4gPiA+ID4gKyAqICAgdGhyb3VnaCBhIGhhcmR3YXJl
IGludGVycnVwdCBhbmQgcG9zc2libGUgam9iIGNvbXBsZXRpb24gd29ya2VyLgo+ID4gPiA+ICsg
Kgo+ID4gPiA+ICsgKiAqIFRvIGFpZCBjb21wb3NhYmlsaXR5IG9mIGNvZGUsIHRoZSBhbm5vdGF0
aW9ucyBjYW4gYmUgZnJlZWx5IG5lc3RlZCwgYXMgbG9uZwo+ID4gPiA+ICsgKiAgIGFzIHRoZSBv
dmVyYWxsIGxvY2tpbmcgaGllcmFyY2h5IGlzIGNvbnNpc3RlbnQuIFRoZSBhbm5vdGF0aW9ucyBh
bHNvIHdvcmsKPiA+ID4gPiArICogICBib3RoIGluIGludGVycnVwdCBhbmQgcHJvY2VzcyBjb250
ZXh0LiBEdWUgdG8gaW1wbGVtZW50YXRpb24gZGV0YWlscyB0aGlzCj4gPiA+ID4gKyAqICAgcmVx
dWlyZXMgdGhhdCBjYWxsZXJzIHBhc3MgYW4gb3BhcXVlIGNvb2tpZSBmcm9tCj4gPiA+ID4gKyAq
ICAgZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmcoKSB0byBkbWFfZmVuY2VfZW5kX3NpZ25hbGxp
bmcoKS4KPiA+ID4gPiArICoKPiA+ID4gPiArICogKiBWYWxpZGF0aW9uIGFnYWluc3QgdGhlIGNy
b3NzIGRyaXZlciBjb250cmFjdCBpcyBpbXBsZW1lbnRlZCBieSBwcmltaW5nCj4gPiA+ID4gKyAq
ICAgbG9ja2RlcCB3aXRoIHRoZSByZWxldmFudCBoaWVyYXJjaHkgYXQgYm9vdC11cC4gVGhpcyBt
ZWFucyBldmVuIGp1c3QKPiA+ID4gPiArICogICB0ZXN0aW5nIHdpdGggYSBzaW5nbGUgZGV2aWNl
IGlzIGVub3VnaCB0byB2YWxpZGF0ZSBhIGRyaXZlciwgYXQgbGVhc3QgYXMKPiA+ID4gPiArICog
ICBmYXIgYXMgZGVhZGxvY2tzIHdpdGggZG1hX2ZlbmNlX3dhaXQoKSBhZ2FpbnN0IGRtYV9mZW5j
ZV9zaWduYWwoKSBhcmUKPiA+ID4gPiArICogICBjb25jZXJuZWQuCj4gPiA+ID4gKyAqLwo+ID4g
PiA+ICsjaWZkZWYgQ09ORklHX0xPQ0tERVAKPiA+ID4gPiArc3RydWN0IGxvY2tkZXBfbWFwICAg
ZG1hX2ZlbmNlX2xvY2tkZXBfbWFwID0gewo+ID4gPiA+ICsgICAgIC5uYW1lID0gImRtYV9mZW5j
ZV9tYXAiCj4gPiA+ID4gK307Cj4gPiA+ID4gKwo+ID4gPiA+ICsvKioKPiA+ID4gPiArICogZG1h
X2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmcgLSBiZWdpbiBhIGNyaXRpY2FsIERNQSBmZW5jZSBzaWdu
YWxsaW5nIHNlY3Rpb24KPiA+ID4gPiArICoKPiA+ID4gPiArICogRHJpdmVycyBzaG91bGQgdXNl
IHRoaXMgdG8gYW5ub3RhdGUgdGhlIGJlZ2lubmluZyBvZiBhbnkgY29kZSBzZWN0aW9uCj4gPiA+
ID4gKyAqIHJlcXVpcmVkIHRvIGV2ZW50dWFsbHkgY29tcGxldGUgJmRtYV9mZW5jZSBieSBjYWxs
aW5nIGRtYV9mZW5jZV9zaWduYWwoKS4KPiA+ID4gPiArICoKPiA+ID4gPiArICogVGhlIGVuZCBv
ZiB0aGVzZSBjcml0aWNhbCBzZWN0aW9ucyBhcmUgYW5ub3RhdGVkIHdpdGgKPiA+ID4gPiArICog
ZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKCkuCj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqIFJldHVy
bnM6Cj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqIE9wYXF1ZSBjb29raWUgbmVlZGVkIGJ5IHRoZSBp
bXBsZW1lbnRhdGlvbiwgd2hpY2ggbmVlZHMgdG8gYmUgcGFzc2VkIHRvCj4gPiA+ID4gKyAqIGRt
YV9mZW5jZV9lbmRfc2lnbmFsbGluZygpLgo+ID4gPiA+ICsgKi8KPiA+ID4gPiArYm9vbCBkbWFf
ZmVuY2VfYmVnaW5fc2lnbmFsbGluZyh2b2lkKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgLyog
ZXhwbGljaXRseSBuZXN0aW5nIC4uLiAqLwo+ID4gPiA+ICsgICAgIGlmIChsb2NrX2lzX2hlbGRf
dHlwZSgmZG1hX2ZlbmNlX2xvY2tkZXBfbWFwLCAxKSkKPiA+ID4gPiArICAgICAgICAgICAgIHJl
dHVybiB0cnVlOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAvKiByZWx5IG9uIG1pZ2h0X3NsZWVw
IGNoZWNrIGZvciBzb2Z0L2hhcmRpcnEgbG9ja3MgKi8KPiA+ID4gPiArICAgICBpZiAoaW5fYXRv
bWljKCkpCj4gPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4gPiArCj4gPiA+
ID4gKyAgICAgLyogLi4uIGFuZCBub24tcmVjdXJzaXZlIHJlYWRsb2NrICovCj4gPiA+ID4gKyAg
ICAgbG9ja19hY3F1aXJlKCZkbWFfZmVuY2VfbG9ja2RlcF9tYXAsIDAsIDAsIDEsIDEsIE5VTEws
IF9SRVRfSVBfKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiA+
ICt9Cj4gPiA+ID4gK0VYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmcpOwo+
ID4gPiA+ICsKPiA+ID4gPiArLyoqCj4gPiA+ID4gKyAqIGRtYV9mZW5jZV9lbmRfc2lnbmFsbGlu
ZyAtIGVuZCBhIGNyaXRpY2FsIERNQSBmZW5jZSBzaWduYWxsaW5nIHNlY3Rpb24KPiA+ID4gPiAr
ICoKPiA+ID4gPiArICogQ2xvc2VzIGEgY3JpdGljYWwgc2VjdGlvbiBhbm5vdGF0aW9uIG9wZW5l
ZCBieSBkbWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZygpLgo+ID4gPiA+ICsgKi8KPiA+ID4gPiAr
dm9pZCBkbWFfZmVuY2VfZW5kX3NpZ25hbGxpbmcoYm9vbCBjb29raWUpCj4gPiA+ID4gK3sKPiA+
ID4gPiArICAgICBpZiAoY29va2llKQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4g
PiA+ICsKPiA+ID4gPiArICAgICBsb2NrX3JlbGVhc2UoJmRtYV9mZW5jZV9sb2NrZGVwX21hcCwg
X1JFVF9JUF8pOwo+ID4gPiA+ICt9Cj4gPiA+ID4gK0VYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2Vu
ZF9zaWduYWxsaW5nKTsKPiA+ID4gPiArCj4gPiA+ID4gK3ZvaWQgX19kbWFfZmVuY2VfbWlnaHRf
d2FpdCh2b2lkKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgYm9vbCB0bXA7Cj4gPiA+ID4gKwo+
ID4gPiA+ICsgICAgIHRtcCA9IGxvY2tfaXNfaGVsZF90eXBlKCZkbWFfZmVuY2VfbG9ja2RlcF9t
YXAsIDEpOwo+ID4gPiA+ICsgICAgIGlmICh0bXApCj4gPiA+ID4gKyAgICAgICAgICAgICBsb2Nr
X3JlbGVhc2UoJmRtYV9mZW5jZV9sb2NrZGVwX21hcCwgX1RISVNfSVBfKTsKPiA+ID4gPiArICAg
ICBsb2NrX21hcF9hY3F1aXJlKCZkbWFfZmVuY2VfbG9ja2RlcF9tYXApOwo+ID4gPiA+ICsgICAg
IGxvY2tfbWFwX3JlbGVhc2UoJmRtYV9mZW5jZV9sb2NrZGVwX21hcCk7Cj4gPiA+ID4gKyAgICAg
aWYgKHRtcCkKPiA+ID4gPiArICAgICAgICAgICAgIGxvY2tfYWNxdWlyZSgmZG1hX2ZlbmNlX2xv
Y2tkZXBfbWFwLCAwLCAwLCAxLCAxLCBOVUxMLCBfVEhJU19JUF8pOwo+ID4gPiA+ICt9Cj4gPiA+
ID4gKyNlbmRpZgo+ID4gPiA+ICsKPiA+ID4gPiArCj4gPiA+ID4gICAvKioKPiA+ID4gPiAgICAq
IGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkIC0gc2lnbmFsIGNvbXBsZXRpb24gb2YgYSBmZW5jZQo+
ID4gPiA+ICAgICogQGZlbmNlOiB0aGUgZmVuY2UgdG8gc2lnbmFsCj4gPiA+ID4gQEAgLTE3MCwx
NCArMzI0LDE5IEBAIGludCBkbWFfZmVuY2Vfc2lnbmFsKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNl
KQo+ID4gPiA+ICAgewo+ID4gPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gPiA+ID4g
ICAgICAgaW50IHJldDsKPiA+ID4gPiArICAgICBib29sIHRtcDsKPiA+ID4gPgo+ID4gPiA+ICAg
ICAgIGlmICghZmVuY2UpCj4gPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+
ID4gPgo+ID4gPiA+ICsgICAgIHRtcCA9IGRtYV9mZW5jZV9iZWdpbl9zaWduYWxsaW5nKCk7Cj4g
PiA+ID4gKwo+ID4gPiA+ICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKGZlbmNlLT5sb2NrLCBmbGFn
cyk7Cj4gPiA+ID4gICAgICAgcmV0ID0gZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQoZmVuY2UpOwo+
ID4gPiA+ICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsK
PiA+ID4gPgo+ID4gPiA+ICsgICAgIGRtYV9mZW5jZV9lbmRfc2lnbmFsbGluZyh0bXApOwo+ID4g
PiA+ICsKPiA+ID4gPiAgICAgICByZXR1cm4gcmV0Owo+ID4gPiA+ICAgfQo+ID4gPiA+ICAgRVhQ
T1JUX1NZTUJPTChkbWFfZmVuY2Vfc2lnbmFsKTsKPiA+ID4gPiBAQCAtMjEwLDYgKzM2OSw4IEBA
IGRtYV9mZW5jZV93YWl0X3RpbWVvdXQoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UsIGJvb2wgaW50
ciwgc2lnbmVkIGxvbmcgdGltZW91dCkKPiA+ID4gPgo+ID4gPiA+ICAgICAgIG1pZ2h0X3NsZWVw
KCk7Cj4gPiA+ID4KPiA+ID4gPiArICAgICBfX2RtYV9mZW5jZV9taWdodF93YWl0KCk7Cj4gPiA+
ID4gKwo+ID4gPiA+ICAgICAgIHRyYWNlX2RtYV9mZW5jZV93YWl0X3N0YXJ0KGZlbmNlKTsKPiA+
ID4gPiAgICAgICBpZiAoZmVuY2UtPm9wcy0+d2FpdCkKPiA+ID4gPiAgICAgICAgICAgICAgIHJl
dCA9IGZlbmNlLT5vcHMtPndhaXQoZmVuY2UsIGludHIsIHRpbWVvdXQpOwo+ID4gPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oIGIvaW5jbHVkZS9saW51eC9kbWEtZmVu
Y2UuaAo+ID4gPiA+IGluZGV4IDMzNDdjNTRmM2E4Ny4uM2YyODhmN2RiMmVmIDEwMDY0NAo+ID4g
PiA+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmgKPiA+ID4gPiArKysgYi9pbmNsdWRl
L2xpbnV4L2RtYS1mZW5jZS5oCj4gPiA+ID4gQEAgLTM1Nyw2ICszNTcsMTggQEAgZG1hX2ZlbmNl
X2dldF9yY3Vfc2FmZShzdHJ1Y3QgZG1hX2ZlbmNlIF9fcmN1ICoqZmVuY2VwKQo+ID4gPiA+ICAg
ICAgIH0gd2hpbGUgKDEpOwo+ID4gPiA+ICAgfQo+ID4gPiA+Cj4gPiA+ID4gKyNpZmRlZiBDT05G
SUdfTE9DS0RFUAo+ID4gPiA+ICtib29sIGRtYV9mZW5jZV9iZWdpbl9zaWduYWxsaW5nKHZvaWQp
Owo+ID4gPiA+ICt2b2lkIGRtYV9mZW5jZV9lbmRfc2lnbmFsbGluZyhib29sIGNvb2tpZSk7Cj4g
PiA+ID4gKyNlbHNlCj4gPiA+ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCBkbWFfZmVuY2VfYmVnaW5f
c2lnbmFsbGluZyh2b2lkKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgcmV0dXJuIHRydWU7Cj4g
PiA+ID4gK30KPiA+ID4gPiArc3RhdGljIGlubGluZSB2b2lkIGRtYV9mZW5jZV9lbmRfc2lnbmFs
bGluZyhib29sIGNvb2tpZSkge30KPiA+ID4gPiArc3RhdGljIGlubGluZSB2b2lkIF9fZG1hX2Zl
bmNlX21pZ2h0X3dhaXQodm9pZCkge30KPiA+ID4gPiArI2VuZGlmCj4gPiA+ID4gKwo+ID4gPiA+
ICAgaW50IGRtYV9mZW5jZV9zaWduYWwoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpOwo+ID4gPiA+
ICAgaW50IGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKTsK
PiA+ID4gPiAgIHNpZ25lZCBsb25nIGRtYV9mZW5jZV9kZWZhdWx0X3dhaXQoc3RydWN0IGRtYV9m
ZW5jZSAqZmVuY2UsCj4gPiA+Cj4gPgo+ID4KPiA+IC0tCj4gPiBEYW5pZWwgVmV0dGVyCj4gPiBT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+IGh0dHA6Ly9ibG9nLmZmd2xs
LmNoCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeAo=
