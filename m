Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683645673F
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 12:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D0A6E386;
	Wed, 26 Jun 2019 10:57:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603AD6E382
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 10:57:22 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id b7so2019792otl.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 03:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wyMtevzzCvYeiqcXtC/dJ0tcFLcikpQwBjGnMIeecqg=;
 b=EO6RL/EXBvwL4RIALUhNS8YppKrm9wMrOoIRRnMeQfYftIDtQb9gXN3kRTmcAfnCWz
 4IVm1dTeK1XSdH3/vBfmvNJHgmMYiCg2qxU1GaOgmmpIdKYgnKWgGDH5BViRO9O2dEFz
 AbU6UxXFZ02fE2kKnxGNDDUl+UIVEyVr25koVy7LCUc9As42YJ4CvVgQPCXUaYJPymxq
 g5Ox7IOqppyrAUuLrwdcM3letdC+UQzMXmdWpG4f4aCHoPDBTlRCuSpzLnwfj10PJ9fw
 v3tI8Czbzasr2ZWXrBTVjl7MCvTGMVSrNjIkzRIgmLGrtm3Ig/k30iK8XGG4mUGfwEUx
 hD1A==
X-Gm-Message-State: APjAAAWih53IdEYBZ4jkFeVHLsSlXI3+T/0PQcpjM1BUg9crC2I+MUqN
 LVXBR5Sqa8VT5Rv/JjKJD6PpY2xWEFWDuIXRzV/5ZQ==
X-Google-Smtp-Source: APXvYqxCMQU0HT7NhdvJFtuKNWLiiapT+gZg92DzaQOGLLjL5971dQcnzOulSZ39t/hjlYTjOjUrGkXHqUL4evwde9E=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr2843886otk.204.1561546641529; 
 Wed, 26 Jun 2019 03:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190625124654.122364-1-christian.koenig@amd.com>
 <20190625160539.GB12905@phenom.ffwll.local>
 <819ef4bd-e862-6390-d2e3-60f9d6c9cab4@gmail.com>
 <20190626081711.GH12905@phenom.ffwll.local>
 <edcfb3ce-e13c-fe38-c34c-9933f777ffce@amd.com>
In-Reply-To: <edcfb3ce-e13c-fe38-c34c-9933f777ffce@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jun 2019 12:57:09 +0200
Message-ID: <CAKMK7uH9SmCw-pcRvMrf1OL=jYDOJ5WSR8U8hOK+Amm6bjhnkg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v12
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wyMtevzzCvYeiqcXtC/dJ0tcFLcikpQwBjGnMIeecqg=;
 b=ArIptYlxyNbco8JQixx09+m3Q9iAdISOp0nMQZDOxR9/EGFzWkE2gJJwfiix3Uh9MA
 b0V7vXQ59geKVc4fn1X0XC01Cj1+lcz0FM2NjI3OeK4W9B2lvCVsh7GinX6Gonwab1B4
 XfddPcuOSSdeQzGp7kHLEdU130vUDDVi/D4N8=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTE6MjggQU0gS29lbmlnLCBDaHJpc3RpYW4KPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBBbSAyNi4wNi4xOSB1bSAxMDoxNyBzY2hy
aWViIERhbmllbCBWZXR0ZXI6Cj4gPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwOTo0OTowM0FN
ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4+IEFtIDI1LjA2LjE5IHVtIDE4OjA1
IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+Pj4gT24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDI6
NDY6NDlQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+Pj4+IE9uIHRoZSBleHBv
cnRlciBzaWRlIHdlIGFkZCBvcHRpb25hbCBleHBsaWNpdCBwaW5uaW5nIGNhbGxiYWNrcy4gSWYg
dGhvc2UKPiA+Pj4+IGNhbGxiYWNrcyBhcmUgaW1wbGVtZW50ZWQgdGhlIGZyYW1ld29yayBubyBs
b25nZXIgY2FjaGVzIHNnIHRhYmxlcyBhbmQgdGhlCj4gPj4+PiBtYXAvdW5tYXAgY2FsbGJhY2tz
IGFyZSBhbHdheXMgY2FsbGVkIHdpdGggdGhlIGxvY2sgb2YgdGhlIHJlc2VydmF0aW9uIG9iamVj
dAo+ID4+Pj4gaGVsZC4KPiA+Pj4+Cj4gPj4+PiBPbiB0aGUgaW1wb3J0ZXIgc2lkZSB3ZSBhZGQg
YW4gb3B0aW9uYWwgaW52YWxpZGF0ZSBjYWxsYmFjay4gVGhpcyBjYWxsYmFjayBpcwo+ID4+Pj4g
dXNlZCBieSB0aGUgZXhwb3J0ZXIgdG8gaW5mb3JtIHRoZSBpbXBvcnRlcnMgdGhhdCB0aGVpciBt
YXBwaW5ncyBzaG91bGQgYmUKPiA+Pj4+IGRlc3Ryb3llZCBhcyBzb29uIGFzIHBvc3NpYmxlLgo+
ID4+Pj4KPiA+Pj4+IFRoaXMgYWxsb3dzIHRoZSBleHBvcnRlciB0byBwcm92aWRlIHRoZSBtYXBw
aW5ncyB3aXRob3V0IHRoZSBuZWVkIHRvIHBpbgo+ID4+Pj4gdGhlIGJhY2tpbmcgc3RvcmUuCj4g
Pj4+Pgo+ID4+Pj4gdjI6IGRvbid0IHRyeSB0byBpbnZhbGlkYXRlIG1hcHBpbmdzIHdoZW4gdGhl
IGNhbGxiYWNrIGlzIE5VTEwsCj4gPj4+PiAgICAgICBsb2NrIHRoZSByZXNlcnZhdGlvbiBvYmog
d2hpbGUgdXNpbmcgdGhlIGF0dGFjaG1lbnRzLAo+ID4+Pj4gICAgICAgYWRkIGhlbHBlciB0byBz
ZXQgdGhlIGNhbGxiYWNrCj4gPj4+PiB2MzogbW92ZSBmbGFnIGZvciBpbnZhbGlkYXRpb24gc3Vw
cG9ydCBpbnRvIHRoZSBETUEtYnVmLAo+ID4+Pj4gICAgICAgdXNlIG5ldyBhdHRhY2hfaW5mbyBz
dHJ1Y3R1cmUgdG8gc2V0IHRoZSBjYWxsYmFjawo+ID4+Pj4gdjQ6IHVzZSBpbXBvcnRlcl9wcml2
IGZpZWxkIGluc3RlYWQgb2YgbWFuZ2xpbmcgZXhwb3J0ZXIgcHJpdi4KPiA+Pj4+IHY1OiBkcm9w
IGludmFsaWRhdGlvbl9zdXBwb3J0ZWQgZmxhZwo+ID4+Pj4gdjY6IHNxdWFzaCB0b2dldGhlciB3
aXRoIHBpbi91bnBpbiBjaGFuZ2VzCj4gPj4+PiB2NzogcGluL3VucGluIHRha2VzIGFuIGF0dGFj
aG1lbnQgbm93Cj4gPj4+PiB2ODogbnVrZSBkbWFfYnVmX2F0dGFjaG1lbnRfKG1hcHx1bm1hcClf
bG9ja2VkLAo+ID4+Pj4gICAgICAgZXZlcnl0aGluZyBpcyBub3cgaGFuZGxlZCBiYWNrd2FyZCBj
b21wYXRpYmxlCj4gPj4+PiB2OTogYWx3YXlzIGNhY2hlIHdoZW4gZXhwb3J0L2ltcG9ydGVyIGRv
bid0IGFncmVlIG9uIGR5bmFtaWMgaGFuZGxpbmcKPiA+Pj4+IHYxMDogbWluaW1hbCBzdHlsZSBj
bGVhbnVwCj4gPj4+PiB2MTE6IGRyb3AgYXV0b21hdGljYWxseSByZS1lbnRyeSBhdm9pZGFuY2UK
PiA+Pj4+IHYxMjogcmVuYW1lIGNhbGxiYWNrIHRvIG1vdmVfbm90aWZ5Cj4gPj4+Pgo+ID4+Pj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+ID4+PiBPbmUgdGhpbmcgSSd2ZSBmb3Jnb3R0ZW4sIGp1c3Qgc3R1bWJsZWQgb3ZlciB0dG1f
Ym8tPm1vdmluZy4gRm9yIHBpbm5lZAo+ID4+PiBidWZmZXIgc2hhcmluZyB0aGF0J3Mgbm90IG5l
ZWRlZCwgYW5kIEkgdGhpbmsgZm9yIGR5bmFtaWMgYnVmZmVyIHNoYXJpbmcKPiA+Pj4gaXQncyBh
bHNvIG5vdCBnb2luZyB0byBiZSB0aGUgcHJpbWFyeSByZXF1aXJlbWVudC4gQnV0IEkgdGhpbmsg
dGhlcmUncyB0d28KPiA+Pj4gcmVhc29ucyB3ZSBzaG91bGQgbWF5YmUgbG9vayBpbnRvIG1vdmlu
ZyB0aGF0IGZyb20gdHRtX2JvIHRvIHJlc3Zfb2JqOgo+ID4+IFRoYXQgaXMgYWxyZWFkeSBwYXJ0
IG9mIHRoZSByZXN2X29iai4gVGhlIGRpZmZlcmVuY2UgaXMgdGhhdCByYWRlb24gaXMKPiA+PiBv
dmVyd3JpdGluZyB0aGUgb25lIGluIHRoZSByZXN2X29iaiBkdXJpbmcgQ1Mgd2hpbGUgYW1kZ3B1
IGlzbid0Lgo+ID4gSSdtIGNvbmZ1c2VkIGhlcmU6IEF0bSAtPm1vdmluZyBpc24ndCBpbiByZXN2
X29iaiwgdGhlcmUncyBvbmx5IG9uZQo+ID4gZXhjbHVzaXZlIGZlbmNlLiBBbmQgeWVzIHlvdSBu
ZWVkIHRvIHNldCB0aGF0IGV2ZXJ5IHRpbWUgeW91IGRvIGEgbW92ZQo+ID4gKGJlY2F1c2UgYSBt
b3ZlIG5lZWRzIHRvIGJlIHByZXR0eSBleGNsdXNpdmUgYWNjZXNzKS4gQnV0IEknbSBub3Qgc2Vl
aW5nIGEKPiA+IHNlcGFyYXRlIG5vdF9xdWl0ZV9leGNsdXNpdmUgZmVuY2Ugc2xvdCBmb3IgbW92
ZXMuCj4KPiBZZWFoLCBidXQgc2hvdWxkbid0IHRoYXQgYmUgc3VmZmljaWVudD8gSSBtZWFuIHdo
eSBkb2VzIHNvbWVib2R5IGVsc2UKPiB0aGFuIHRoZSBleHBvcnRlciBuZWVkcyB0byBrbm93IHdo
ZW4gYSBCTyBpcyBtb3Zpbmc/CgpJIHRoaW5rIGZvciBidWZmZXIgc2hhcmluZyB0aGVyZSdzIG5v
dCBtdWNoIHVzZSBmb3IgdGhpcywgYnV0IGl0CnNvdW5kZWQgbGlrZSB5b3Ugd2FudCB0byB1c2Ug
LT5tb3ZlX25vdGlmeSBhbHNvIG1vcmUgaW50ZXJuYWxseS4gQW5kCmluIHRoYXQgY2FzZSwgZm9y
IHZrLCB5b3Ugd2FudCB0byBiZSBhYmxlIHRvIGlnbm9yZSB0aGUgaW1wbGljaXQKZmVuY2VzIGFz
IG11Y2ggYXMgcG9zc2libGUuIEJ1dCB5b3UgY2FuJ3QgaWdub3JlIHRoZSBidWZmZXIgbW92ZXMg
b2ZjLgpIZW5jZSB0cmFja2luZyB0aG9zZSBzZXBhcmF0ZSBjb3VsZCBiZSB1c2VmdWwuCgphbWRn
cHUgc2VlbXMgdG8gYmUgc29sdmluZyB0aGlzIGludGVybmFsbHkgYnkgbmV2ZXIgYXR0YWNoaW5n
IGFuCmV4Y2x1c2l2ZSBmZW5jZSBmb3IgaW1wbGljaXQgc3R1ZmYsIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQsIGV4Y2VwdAp3aGVuIGl0J3Mgc2hhcmVkLiBCdXQgaW4gZ2VuZXJhbCB5b3UgbmVlZCB0
byBhc3N1bWUgYSBmdW5reSBtaXggb2YKaW1wbGljaXQgYW5kIGV4cGxpY2l0IHN5bmMnZWQgd29y
a2xvYWRzLCBhbmQgZm9yIHRob3NlIHRyYWNraW5nIHRoZQptb3ZlcyBzZXBhcmF0ZWx5IHdvdWxk
IGJlIGdvb2QuCgo+ID4+IFNvIGZvciBhbWRncHUgd2Uga2VlcCBhbiBleHRyYSBjb3B5IGluIHR0
bV9iby0+bW92aW5nIHRvIGtlZXAgdGhlIHBhZ2UgZmF1bHQKPiA+PiBoYW5kbGVyIGZyb20gdW5u
ZWNlc3Nhcnkgd2FpdGluZyBmb3IgYSBmZW5jZSBpbiByYWRlb24uCj4gPiBZZWFoIHRoYXQncyB0
aGUgbWFpbiBvbmUuIFRoZSBvdGhlciBpcyBpbiBDUyAoYXQgbGVhc3QgZm9yIGk5MTUpIHdlIGNv
dWxkCj4gPiBydW4gcGlwZWxpbmUgdGV4dHVyZSB1cGxvYWRzIGluIHBhcmFsbGVsIHdpdGggb3Ro
ZXIgcmVuZGVyaW5nIGFuZCBzdHVmZgo+ID4gbGlrZSB0aGF0ICh3aXRoIG11bHRpcGxlIGVuZ2lu
ZXMsIHdoaWNoIGF0bSBpcyBhbHNvIG5vdCB0aGVyZSB5ZXQpLiBJCj4gPiB0aGluayB0aGF0IGNv
dWxkIGJlIHNvbWV3aGF0IHVzZWZ1bCBmb3IgdmsgZHJpdmVycy4KPiA+Cj4gPiBBbnl3YXksIHRv
dGFsbHkgbm90IHVuZGVyc3RhbmQgd2hhdCB5b3Ugd2FudGVkIHRvIHRlbGwgbWUgaGVyZSBpbiB0
aGVzZQo+ID4gdHdvIGxpbmVzLgo+Cj4gU29ycnkgaXQncyAzM0MgaW4gbXkgaG9tZSBvZmZpY2Ug
aGVyZSBhbmQgSSBtaXhlZCB1cCByYWRlb24vYW1kZ3B1IGluCj4gdGhlIHNlbnRlbmNlIGFib3Zl
LgoKU2FtZSBoZXJlLCBhbmQgeWVhaCBtYWtlcyBtb3JlIHNlbnNlLgoKPiA+Pj4gLSBZb3Ugc291
bmQgbGlrZSB5b3Ugd2FudCB0byB1c2UgdGhpcyBhIGxvdCBtb3JlLCBldmVuIGludGVybmFsbHkg
aW4KPiA+Pj4gICAgIGFtZGdwdS4gRm9yIHRoYXQgSSBkbyB0aGluayB0aGUgc2VwZWFyYXRlIGRt
YV9mZW5jZSBqdXN0IHRvIG1ha2Ugc3VyZQo+ID4+PiAgICAgdGhlIGJ1ZmZlciBpcyBhY2Nlc3Np
YmxlIHdpbGwgYmUgbmVlZGVkIGluIHJlc3Zfb2JqLgo+ID4+Pgo+ID4+PiAtIE9uY2Ugd2UgaGF2
ZSAtPm1vdmluZyBJIHRoaW5rIHRoZXJlJ3Mgc29tZSBnb29kIGNoYW5jZXMgdG8gZXh0cmFjdCBh
IGJpdAo+ID4+PiAgICAgb2YgdGhlIGV2aWN0aW9uL3BpcGVsaW5lIGJvIG1vdmUgYm9pbGVycGxh
dGUgZnJvbSB0dG0sIGFuZCBtYXliZSB1c2UgaXQKPiA+Pj4gICAgIGluIG90aGVyIGRyaXZlcnMu
IGk5MTUgY291bGQgYWxyZWFkeSBtYWtlIHVzZSBvZiB0aGlzIGluIHVwc3RyZWFtLCBzaW5jZQo+
ID4+PiAgICAgd2UgYWxyZWFkeSBwaXBlbGluZSBnZXRfcGFnZXMgYW5kIGNsZmx1c2ggb2YgYnVm
ZmVycy4gT2ZjIG9uY2Ugd2UgaGF2ZQo+ID4+PiAgICAgdnJhbSBzdXBwb3J0LCBldmVuIG1vcmUg
dXNlZnVsLgo+ID4+IEkgYWN0dWFsbHkgaW5kZWVkIHdhbnRlZCB0byBhZGQgbW9yZSBzdHVmZiB0
byB0aGUgcmVzZXJ2YXRpb24gb2JqZWN0Cj4gPj4gaW1wbGVtZW50YXRpb24sIGxpa2UgZmluYWxs
eSBjbGVhbmluZyB1cCB0aGUgZGlzdGluY3Rpb24gb2YgcmVhZGVycy93cml0ZXJzLgo+ID4gSG0s
IG1vcmUgZGV0YWlscz8gTm90IHJpbmdpbmcgYSBiZWxsIC4uLgo+Cj4gSSdtIG5vdCB5ZXQgc3Vy
ZSBhYm91dCB0aGUgZGV0YWlscyBlaXRoZXIsIHNvIHBsZWFzZSBqdXN0IHdhaXQgdW50aWwgSQo+
IHNvbHZlZCB0aGF0IGFsbCB1cCBmb3IgbWUgZmlyc3QuCgpBaCBpcyB0aGlzIGFib3V0IGFtZGdw
dSBkb2luZyBzb21ldGhpbmcgZWxzZSBmb3IgaW1wbGljaXQgc3luYyB0aGFuCndoYXQncyBzdXBw
b3NlZCB0byBiZSBkb25lLCBhbmQgYSBiaXQgYSBtaXNtYXRjaCB3aGVuIHlvdSBkZWFsIHdpdGgK
c2hhcmVkIGJ1ZmZlcnM/Cgo+ID4+IEFuZCBjbGVhbmluZyB1cCB0aGUgZmVuY2UgcmVtb3ZhbCBo
YWNrIHdlIGhhdmUgaW4gdGhlIEtGRCBmb3IgZnJlZWQgdXAgQk9zLgo+ID4+IFRoYXQgd291bGQg
YWxzbyBhbGxvdyBmb3IgZ2V0dGluZyByaWQgb2YgdGhpcyBpbiB0aGUgbG9uZyB0ZXJtLgo+ID4g
SG0sIHdoYXQncyB0aGF0IGZvcj8KPgo+IFdoZW4gdGhlIEtGRCBmcmVlcyB1cCBtZW1vcnkgaXQg
cmVtb3ZlcyB0aGVpciBldmljdGlvbiBmZW5jZSBmcm9tIHRoZQo+IHJlc2VydmF0aW9uIG9iamVj
dCBpbnN0ZWFkIG9mIHNldHRpbmcgaXQgYXMgc2lnbmFsZWQgYW5kIGFkZGluZyBhIG5ldwo+IG9u
ZSB0byBhbGwgb3RoZXIgdXNlZCByZXNlcnZhdGlvbiBvYmplY3RzLgoKT2ggc28ganVzdCBhIGZh
c3QtcGF0aCBmb3IgZGVzdHJ5b2luZyBtZW1vcnkgdGhhdCdzIGluLWZsaWdodCBpbiBzb21lIG1v
dmU/Ci1EYW5pZWwKCj4KPiBDaHJpc3RpYW4uCj4KPiA+IC1EYW5pZWwKPiA+Cj4gPj4gQ2hyaXN0
aWFuLgo+ID4+Cj4gPj4+IEFuZCBkb2luZyB0aGF0IHNsaWdodCBzZW1hbnRpYyBjaGFuZ2UgaXMg
bXVjaCBlYXNpZXIgb25jZSB3ZSBvbmx5IGhhdmUgYQo+ID4+PiBmZXcgZHluYW1pYyBleHBvcnRl
cnMvaW1wb3J0ZXJzLiBBbmQgc2luY2UgaXQncyBhIHB1cmUgb3B0LWluIG9wdGltaXphdGlvbgo+
ID4+PiAoeW91IGNhbiBhbHdheXMgZmFsbCBiYWNrIHRvIHRoZSBleGNsdXNpdmUgZmVuY2UpIGl0
IHNob3VsZCBiZSBlYXN5IHRvCj4gPj4+IHJvbGwgb3V0Lgo+ID4+Pgo+ID4+PiBUaG91Z2h0cyBh
Ym91dCBtb3ZpbmcgdHRtX2JvLT5tb3ZpbmcgdG8gcmVzdl9vYmo/IE9mYyBzdHJpY3RseSBvbmx5
IGFzIGEKPiA+Pj4gZm9sbG93IHVwLiBQbHVzIG1heWJlIHdpdGggYSBjbGVhcmVyIG5hbWUgOi0p
Cj4gPj4+Cj4gPj4+IENoZWVycywgRGFuaWVsCj4gPj4+Cj4KCgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDgg
LSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
