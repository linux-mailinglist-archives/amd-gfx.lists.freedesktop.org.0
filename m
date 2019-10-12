Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E2D4C15
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 04:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1DF6E40A;
	Sat, 12 Oct 2019 02:21:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8219B6E40A
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Oct 2019 02:21:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y21so11778705wmi.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5YunCvki591bnetx+Xi2zd4yKfZ8VDRtdk02EZlhgI=;
 b=LGfN8aBnj/7wnho5rReKgxiDTpDohMfHyuQ60tLgOPvJTUgM6z/wwzzS5Ph35LXVV0
 QlRuDsZA4STGVcz59+OfhpKYVV9y4+HTrJfe9x7Lwe0mXlZ4t+/ElO6at4qctDZYSIFe
 jTVu5k8SQYqcTY11D1WN3a6qtT6ac0vGh3t9xPSch6/SJLbwxVCAqTHl8nW8uDBj0O7K
 PHz5ufdwpfouXOPiulH3S0umQPru7qdR0DDRZqL/PlPUFKy1Fn8onDhvp1rIyYzZ/kXW
 cg9u534jIsbY24elZP6KLoD7LCDd9cp2fUetp58UCW9CL7hfbllcAqC9/gYfarX0lKH+
 245A==
X-Gm-Message-State: APjAAAU/hBOG1wsjOUZgzNh7gOcI+pe6LrMDQH4aumB60Qj+agBvpP5Y
 BDzz682vsA57Lbjeq0hfkFlnyEW3oaR5UF7n4N7SeQ==
X-Google-Smtp-Source: APXvYqxTM1+sc944Ss8s28gFZeMpP2UBonp5K/rMa2/EUpi6jaxF7mYaFM7Bmduz7UW78/c0hXkqGHoPAr+OTreyPXA=
X-Received: by 2002:a1c:d0:: with SMTP id 199mr5718285wma.67.1570846905957;
 Fri, 11 Oct 2019 19:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191011035033.24935-1-tianci.yin@amd.com>
 <20191011035033.24935-4-tianci.yin@amd.com>
 <155db3ea-82ba-e3d7-8e2f-96df99772871@amd.com>
In-Reply-To: <155db3ea-82ba-e3d7-8e2f-96df99772871@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 11 Oct 2019 22:21:31 -0400
Message-ID: <CADnq5_MNmBxi--4u=ca=wCDTX8r2=zMKH354qFojnP4w2qXmSA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/amdgpu: update atomfirmware header with memory
 training related members
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=U5YunCvki591bnetx+Xi2zd4yKfZ8VDRtdk02EZlhgI=;
 b=hUawZMLF85eCTRf87RjyxpZZ1Lw+seP0UVOUwWRue1745S1CtJRqRK5MoPPVTXXz3g
 hs7p0jaA1A/Z0J3UWBPznkagt4iNH7BOcvyWgQEXjPfoUfW2uSWBiLGv9QgummA0ze3U
 s5wwonuHjC9kXPNRRcxqXmn7z9CyZ1UqrC/Suwb735d+3qT+VTgz+7vMyIGtS1Cn66EE
 FQkOC2E/F17iH/NK+divpxizWwYr17fMtI/hcHQ3ZCBr1TS++7z5Xjd0Ig9aI86Js4kq
 32ejbNI6ohXmY6HWQ4aWkZLKO6KJSUDcfVt6p6cdlaUL/b/5HjvrP+CavyIYBU7WW/DI
 JFow==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgNjo1MyBQTSBUdWlrb3YsIEx1YmVuIDxMdWJlbi5UdWlr
b3ZAYW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTEwLTEwIDExOjUwIHAubS4sIFRpYW5jaSBZ
aW4gd3JvdGU6Cj4gPiBGcm9tOiAiVGlhbmNpLllpbiIgPHRpYW5jaS55aW5AYW1kLmNvbT4KPiA+
Cj4gPiBhZGQgbmV3IHZyYW1fcmVzZXJ2ZV9ibG9jayBzdHJ1Y3R1cmUgYW5kIGF0b21maXJtd2Fy
ZV9pbnRlcm5hbF9jb25zdGFudHMgZW51bWVyYXRpb24KPiA+Cj4gPiBDaGFuZ2UtSWQ6IEk2YmE2
NDJlY2Q3YWQ5NDI1MDE2MmFlNWMzMjJlZDhkODVkZTljMzVhCj4gPiBSZXZpZXdlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
VGlhbmNpLllpbiA8dGlhbmNpLnlpbkBhbWQuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9pbmNsdWRlL2F0b21maXJtd2FyZS5oIHwgMjggKysrKysrKysrKysrKysrKystLS0t
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13
YXJlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13YXJlLmgKPiA+IGlu
ZGV4IGU4ODU0MWQ2N2FhMC4uNDYzYzE4ZTk5ZDc4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL2F0b21maXJtd2FyZS5oCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13YXJlLmgKPiA+IEBAIC00OTIsMTIgKzQ5MiwxMyBAQCBz
dHJ1Y3QgYXRvbV9maXJtd2FyZV9pbmZvX3YzXzEKPiA+ICAvKiBUb3RhbCAzMmJpdCBjYXAgaW5k
aWNhdGlvbiAqLwo+ID4gIGVudW0gYXRvbWJpb3NfZmlybXdhcmVfY2FwYWJpbGl0eQo+ID4gIHsK
PiA+IC0gIEFUT01fRklSTVdBUkVfQ0FQX0ZJUk1XQVJFX1BPU1RFRCA9IDB4MDAwMDAwMDEsCj4g
PiAtICBBVE9NX0ZJUk1XQVJFX0NBUF9HUFVfVklSVFVBTElaQVRJT04gID0gMHgwMDAwMDAwMiwK
PiA+IC0gIEFUT01fRklSTVdBUkVfQ0FQX1dNSV9TVVBQT1JUICA9IDB4MDAwMDAwNDAsCj4gPiAt
ICBBVE9NX0ZJUk1XQVJFX0NBUF9IV0VNVV9FTkFCTEUgID0gMHgwMDAwMDA4MCwKPiA+IC0gIEFU
T01fRklSTVdBUkVfQ0FQX0hXRU1VX1VNQ19DRkcgPSAweDAwMDAwMTAwLAo+ID4gLSAgQVRPTV9G
SVJNV0FSRV9DQVBfU1JBTV9FQ0MgICAgICA9IDB4MDAwMDAyMDAsCj4gPiArICAgICBBVE9NX0ZJ
Uk1XQVJFX0NBUF9GSVJNV0FSRV9QT1NURUQgPSAweDAwMDAwMDAxLAo+ID4gKyAgICAgQVRPTV9G
SVJNV0FSRV9DQVBfR1BVX1ZJUlRVQUxJWkFUSU9OICA9IDB4MDAwMDAwMDIsCj4gPiArICAgICBB
VE9NX0ZJUk1XQVJFX0NBUF9XTUlfU1VQUE9SVCAgPSAweDAwMDAwMDQwLAo+ID4gKyAgICAgQVRP
TV9GSVJNV0FSRV9DQVBfSFdFTVVfRU5BQkxFICA9IDB4MDAwMDAwODAsCj4gPiArICAgICBBVE9N
X0ZJUk1XQVJFX0NBUF9IV0VNVV9VTUNfQ0ZHID0gMHgwMDAwMDEwMCwKPiA+ICsgICAgIEFUT01f
RklSTVdBUkVfQ0FQX1NSQU1fRUNDICAgICAgPSAweDAwMDAwMjAwLAo+ID4gKyAgICAgQVRPTV9G
SVJNV0FSRV9DQVBfRU5BQkxFXzJTVEFHRV9CSVNUX1RSQUlOSU5HICA9IDB4MDAwMDA0MDAsCj4g
PiAgfTsKPiA+Cj4gPiAgZW51bSBhdG9tX2Nvb2xpbmdfc29sdXRpb25faWR7Cj4gPiBAQCAtNjcx
LDYgKzY3MiwyMSBAQCBzdHJ1Y3QgdnJhbV91c2FnZWJ5ZmlybXdhcmVfdjJfMQo+ID4gICAgdWlu
dDE2X3QgIHVzZWRfYnlfZHJpdmVyX2luX2tiOwo+ID4gIH07Cj4gPgo+ID4gKy8qIFRoaXMgaXMg
cGFydCBvZiB2cmFtX3VzYWdlYnlmaXJtd2FyZV92Ml8xICovCj4gPiArc3RydWN0IHZyYW1fcmVz
ZXJ2ZV9ibG9jawo+ID4gK3sKPiA+ICsgICAgIHVpbnQzMl90IHN0YXJ0X2FkZHJlc3NfaW5fa2I7
Cj4gPiArICAgICB1aW50MTZfdCB1c2VkX2J5X2Zpcm13YXJlX2luX2tiOwo+ID4gKyAgICAgdWlu
dDE2X3QgdXNlZF9ieV9kcml2ZXJfaW5fa2I7Cj4gPiArfTsKPiA+ICsKPiA+ICsvKiBEZWZpbml0
aW9ucyBmb3IgY29uc3RhbmNlICovCj4gPiArZW51bSBhdG9tZmlybXdhcmVfaW50ZXJuYWxfY29u
c3RhbnRzCj4gPiArewo+ID4gKyAgICAgT05FX0sgICA9IDB4NDAwLAo+ID4gKyAgICAgT05FX01F
RyA9IDB4MTAwMDAwLAo+ID4gKyAgICAgT05FX0cgICA9IDB4NDAwMDAwMDAsCj4KPiBTby4uLiB0
aGlzIGlzIHByb25vdW5jZWQgaW4gRW5nbGlzaCBhcyAiT25lIEdlZSIsIGFuZCBldmVuIHRob3Vn
aAo+IEkgbGlrZSBpdCBtdWNoIG11Y2ggYmV0dGVyIGR1ZSB0byB3aGF0IGlzIGFjdHVhbGx5IHNh
eXMgKG5vLCBpdCBpcyBub3QKPiAib25lIGdpZ2FieXRlIiksIEknZCByYXRoZXIgeW91IGNhbGxl
ZCB0aGlzICJPTkVfR2lCIi4KPgo+IFlvdSBkbyBub3QgaGF2ZSAiT25lIEciIGFueXdoZXJlIGlu
IHRoaXMgY29kZS4gOi0pCj4KPiBUbyBmaXQgaW50ZXJuYXRpb25hbCBzdGFuZGFyZGl6YXRpb24g
YW5kIHRoZSBtb3ZlIExpbnV4IGNvbnN0YW50cwo+IGhhdmUgYmVlbiBnb2luZyB0bywgbmFtZSB0
aGVtIHRoaXM6Cj4KPiBPTkVfS2lCCj4gT05FX01pQgo+IE9ORV9HaUIKPgo+IFRoaXMgbWVhbnMg
d2hhdCBpdCBzYXlzIGFuZCBhbHNvIHRoYXQgdGhleSBhcmUgcG93ZXIgb2YgMi4KPgo+IE9ORV9H
QiAoMTBeOSkgaXMgbGVzcyB0aGFuIE9ORV9HaUIgKDJeMzApLgo+CgpUaGlzIGZpbGUgaXNuJ3Qg
b3duZWQgYnkgdXMuICBXZSBhcmUganVzdCBzeW5jaW5nIHdpdGggdGhlaXIgbGF0ZXN0CnVwZGF0
ZXMuICBXZSB0cnkgYW5kIHN0aWNrIHRvIHdoYXQgdGhleSBoYXZlIHByZXR0eSBjbG9zZWx5IHRv
IGF2b2lkCmNvbmZsaWN0cyBpbiBmdXR1cmUgdXBkYXRlcy4KCkFsZXgKCj4gUmVnYXJkcywKPiBM
dWJlbgo+Cj4gPiArfTsKPiA+Cj4gPiAgLyoKPiA+ICAgICoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ID4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1k
LWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
