Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922524E7AB
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Jun 2019 13:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84B86E87F;
	Fri, 21 Jun 2019 11:59:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1419B6E87F
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 11:59:33 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id r21so6043484otq.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 04:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EcWfpXa6N1ZC1vr0t73YCncf23YXneKPB/5wxRjyNk8=;
 b=uUrAyXDigraGCmLyd02OoAKmHb7GdnhVmeuSxux3LGGNgShpQnsvIqYPaT/XqWyfYw
 BLVl2h93SG6W6l1vfMs4YCWC3IHhk8Q/2dDMorNjfvm1e+aUSA7DBD+IK0DDB3hPd1rR
 1XOLjfNey2uHb+5L1ANpaGKUP5h8v1q8F0mUuSrOt3V2wYKs+jP8pTwanDYiVDWTQaiU
 3BOQ0ULGkPf/zgFQ6oqAeLlPObjxzbQei+MqX8sRiAM9VJ3Ad5NFFhzEmPz4ObH77P27
 0xbENaYmaFZ78sqVADvYIBKbQJ3XZdz3XIz8hL6DE9UepvaZdv/OvXGUp3kV81gFafDw
 AAQQ==
X-Gm-Message-State: APjAAAVgRUm43D4NQtb2CFZAJ3SMyMHci5+q6DiM2Hlo3G/m4ppBH3Dh
 sNWXmJWp3NycPYkpPaYf2RV3uN7wKTrAAh0D5lw/Ew==
X-Google-Smtp-Source: APXvYqyUvOnKbXBIZ+q6fmf3Igl9zlR2ZWq6SH17UEtcojIuJL9OQcUuJYv7eY5IqqqAbZccpOf8sV5WHKu3xhN11KU=
X-Received: by 2002:a9d:6e8d:: with SMTP id a13mr11423954otr.303.1561118372320; 
 Fri, 21 Jun 2019 04:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <CAKMK7uEVziNZJES9=JFBUu=LpmubS8=-A654cMN+QqhEmc8Fvw@mail.gmail.com>
 <c92dc683-6815-dc5a-dc2b-54517cc027de@gmail.com>
 <CAKMK7uHsv3HOXOQq=GGRkx6f+ssRg7dO7qEoBqRS9V_KiTN3Hg@mail.gmail.com>
In-Reply-To: <CAKMK7uHsv3HOXOQq=GGRkx6f+ssRg7dO7qEoBqRS9V_KiTN3Hg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 21 Jun 2019 13:59:16 +0200
Message-ID: <CAKMK7uG+EUhmZafFmjzSR=eq7543OELbHVaQnZZQGx0APSozwg@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EcWfpXa6N1ZC1vr0t73YCncf23YXneKPB/5wxRjyNk8=;
 b=ORaYWKL0kUPZ1j/KLQBBjFjHF00Ap8PqeoT88Ta64Q9TY/++JvQE6g+TTbq2mHQc+O
 2vmGRYAI2p/GHugoU3PKRdpH0/2C7vO6pw5+DdL3O7+mByp4Gi/G7TFYniddE0JnJknr
 0+otFUI9M4Yw0aeL70nBtKVBYs7WPxPYvbUmw=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTo1MCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTozNyBQTSBDaHJpc3Rp
YW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPiA+
Cj4gPiBBbSAyMS4wNi4xOSB1bSAxMzowMyBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiA+IE9u
IEZyaSwgSnVuIDIxLCAyMDE5IGF0IDEyOjMxIFBNIEtvZW5pZywgQ2hyaXN0aWFuCj4gPiA+IDxD
aHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4gPj4gQW0gMjEuMDYuMTkgdW0gMTI6
MjAgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gPiA+Pj4gSW4gcGFydGljdWxhciwgdGhhdCB1c2Vy
LXNwYWNlIHdpbGwgInJlbW92ZSIgcmVuZGVyIG5vZGVzLgo+ID4gPj4gWWVzLCB0aGF0IGlzIG15
IG1haW4gY29uY2VybiBoZXJlLiBZb3UgYmFzaWNhbGx5IG1ha2UgcmVuZGVyIG5vZGVzCj4gPiA+
PiBzdXBlcmZsdW91c2x5LiBUaGF0IGdpdmVzIHVzZXJzcGFjZSBhbGwgbGVnaXRpbWl6YXRpb24g
dG8gYWxzbyByZW1vdmUKPiA+ID4+IHN1cHBvcnQgZm9yIHRoZW0uIFRoYXQgaXMgbm90IHN0dXBp
ZCBvciBldmlsIG9yIHdoYXRldmVyLCB1c2Vyc3BhY2UKPiA+ID4+IHdvdWxkIGp1c3QgZm9sbG93
IHRoZSBrZXJuZWwgZGVzaWduLgo+ID4gPiBUaGlzIGFscmVhZHkgaGFwcGVuZWQuIEF0IGxlYXN0
IGZvciBrbXMtb25seSBkaXNwbGF5IHNvY3Mgd2UgaGFkIHRvCj4gPiA+IGhpZGUgdGhlIHNlcGFy
YXRlIHJlbmRlciBub2RlIChhbmQgdGhlcmUgeW91IHJlYWxseSBoYXZlIHRvIGRlYWwgd2l0aAo+
ID4gPiB0aGUgc2VwYXJhdGUgcmVuZGVyIG5vZGUsIGJlY2F1c2UgaXQncyBhIGRpc3RpbmN0IGRy
aXZlcikgZW50aXJlbHkKPiA+ID4gd2l0aGluIGdibS9tZXNhLgo+ID4KPiA+IE9rLCB0aGF0IGlz
IHNvbWV0aGluZyBJIGRpZG4ndCBrbmV3IGJlZm9yZSBhbmQgaXMgcmF0aGVyIGludGVyZXN0aW5n
Lgo+ID4KPiA+ID4gU28gaWYgeW91IHdhbnQgdG8gZGVwcmFjYXRlIHJlbmRlciBmdW5jdGlvbmFs
aXR5IG9uIHByaW1hcnkgbm9kZXMsIHlvdQo+ID4gPiBfaGF2ZV8gdG8gZG8gdGhhdCBoaWRpbmcg
aW4gdXNlcnNwYWNlLiBPciB5b3UnbGwgYnJlYWsgYSBsb3Qgb2YKPiA+ID4gY29tcG9zaXRvcnMg
ZXZlcnl3aGVyZS4gSnVzdCB0ZXN0aW5nIC1hbWRncHUgZG9lc24ndCByZWFsbHkgcHJvdmUKPiA+
ID4gYW55dGhpbmcgaGVyZS4gU28geW91IHdvbid0IG1vdmUgdGhlIGxhcmdlciBlY29zeXN0ZW0g
d2l0aCB0aGlzIGF0Cj4gPiA+IGFsbCwgdGhhdCBzaGlwIHNhaWxlZC4KPiA+Cj4gPiBTbyB3aGF0
IGVsc2UgY2FuIHdlIGRvPyBUaGF0IHNvdW5kcyBsaWtlIHlvdSBzdWdnZXN0IHdlIHNob3VsZAo+
ID4gY29tcGxldGVseSBkcm9wIHJlbmRlciBub2RlIGZ1bmN0aW9uYWxpdHkuCj4gPgo+ID4gSSBt
ZWFuIGl0J3Mgbm90IG15IHByZWZlcnJlZCBvcHRpb24sIGJ1dCBjZXJ0YWlubHkgc29tZXRoaW5n
IHRoYXQKPiA+IGV2ZXJ5Ym9keSBjb3VsZCBkby4KPiA+Cj4gPiBNeSBwcmltYXJ5IGNvbmNlcm4g
aXMgdGhhdCB3ZSBzb21laG93IG5lZWQgdG8gZ2V0IHJpZCBvZiB0aGlua3MgbGlrZSBHRU0KPiA+
IGZsaW5rIGFuZCBhbGwgdGhhdCBvdGhlciBjcnVmdHkgc3R1ZmYgd2Ugc3RpbGwgaGF2ZSBhcm91
bmQgb24gdGhlCj4gPiBwcmltYXJ5IG5vZGUgKHdlIHNob3VsZCBwcm9iYWJseSBtYWtlIGEgbGlz
dCBvZiB0aGF0KS4KPiA+Cj4gPiBTd2l0Y2hpbmcgZXZlcnl0aGluZyBvdmVyIHRvIHJlbmRlciBu
b2RlcyBqdXN0IHNvdW5kZWQgbGlrZSB0aGUgYmVzdAo+ID4gYWx0ZXJuYXRpdmUgc28gZmFyIHRv
IGFyY2hpdmUgdGhhdC4KPgo+IHRiaCBJIGRvIGxpa2UgdGhhdCBwbGFuIHRvbywgYnV0IGl0J3Mg
YSBsb3QgbW9yZSB3b3JrLiBBbmQgSSB0aGluayB0bwo+IGhhdmUgYW55IHB1c2ggd2hhdHNvZXZl
ciB3ZSBwcm9iYWJseSBuZWVkIHRvIHJvbGwgaXQgb3V0IGluIGdibSBhcyBhCj4gaGFjayB0byBr
ZWVwIHRoaW5ncyBnb2luZy4gQnV0IHByb2JhYmx5IG5vdCBlbm91Z2guCj4KPiBJIGFsc28gdGhp
bmsgdGhhdCBhdCBsZWFzdCBzb21lIGNvbXBvc2l0b3JzIHdpbGwgYm90aGVyIHRvIGRvIHRoZQo+
IHJpZ2h0IHRoaW5nLCBhbmQgYWN0dWFsbHkgYm90aGVyIHdpdGggcmVuZGVyIG5vZGVzIGFuZCBh
bGwgdGhhdAo+IGNvcnJlY3RseS4gSXQncyBqdXN0IHRoYXQgdGhlcmUncyB3YXkgbW9yZSB3aGlj
aCBkb250Lgo+Cj4gQWxzbyBmb3Igc2VydmVyIHJlbmRlcmluZyBpdCdsbCBiZSByZW5kZXIgbm9k
ZXMgYWxsIHRoZSB3YXkgZG93biBJCj4gaG9wZSAob3Igd2UgbmVlZCB0byBzZXJpb3VzbHkgZWR1
Y2F0ZSBjbG91ZCBwZW9wbGUgYWJvdXQgdGhlCj4gcGVybWlzc2lvbnMgdGhleSBzZXQgb24gdGhl
aXIgZGVmYXVsdCBpbWFnZXMsIGFuZCBkaXN0cm9zIG9uIGhvdyB0aGlzCj4gY2xvdWQgc3R1ZmYg
c2hvdWxkIHdvcmsuCj4KPiA+ID4gQXQgdGhhdCBwb2ludCB0aGlzIGFsbCBmZWVscyBsaWtlIGEg
YmlrZXNoZWQsIGFuZCBmb3IgYSBiaWtlc2hlZCBJCj4gPiA+IGRvbid0IGNhcmUgd2hhdCB0aGUg
Y29sb3IgaXMgd2UgcGljaywgYXMgbG9uZyBhcyB0aGV5J3JlIGFsbCBwYWludGVkCj4gPiA+IHRo
ZSBzYW1lLgo+ID4gPgo+ID4gPiBPbmNlIHdlIHBpY2tlZCBhIGNvbG9yIGl0J3MgYSBzaW1wbGUg
dGVjaG5pY2FsIG1hdHRlciBvZiBob3cgdG8gcm9sbAo+ID4gPiBpdCBvdXQsIHVzaW5nIEtjb25m
aWcgb3B0aW9ucywgb3Igb25seSBlbmFibGluZyBvbiBuZXcgaHcsIG9yICJtZXJnZQo+ID4gPiBh
bmQgZml4IHRoZSByZWdyZXNzaW9ucyBhcyB0aGV5IGNvbWUiIG9yIGFueSBvZiB0aGUgb3RoZXIg
d2VsbCBwcm92ZW4KPiA+ID4gcGF0aHMgZm9yd2FyZC4KPiA+Cj4gPiBZZWFoLCB0aGUgcHJvYmxl
bSBpcyBJIGRvbid0IHNlZSBhbiBvcHRpb24gd2hpY2ggY3VycmVudGx5IHdvcmtzIGZvcgo+ID4g
ZXZlcnlvbmUuCj4gPgo+ID4gSSBhYnNvbHV0ZWx5IG5lZWQgYSBncmFjZSB0aW1lIG9mIG11bHRp
cGxlIHllYXJzIHVudGlsIHdlIGNhbiBhcHBseSB0aGlzCj4gPiB0byBhbWRncHUvcmFkZW9uLgo+
Cj4gWWVhaCB0aGF0J3Mgd2hhdCBJIG1lYW50IHdpdGggInBpY2sgYSBjb2xvciwgcGljayBhIHdh
eSB0byByb2xsIGl0Cj4gb3V0Ii4gImVuYWJsZSBmb3IgbmV3IGh3LCByb2xsIG91dCB5ZWFycyBh
bmQgeWVhcnMgbGF0ZXIiIGlzIG9uZSBvZgo+IHRoZSBvcHRpb25zIGZvciByb2xsIG91dC4KPgo+
ID4gQW5kIHRoYXQgdW5kZXIgdGhlIHByZXJlcXVpc2l0ZSB0byBoYXZlIGEgcGxhbiB0byBzb21l
aG93IGVuYWJsZSB0aGF0Cj4gPiBmdW5jdGlvbmFsaXR5IG5vdyB0byBtYWtlIGl0IGF0IGxlYXN0
IHBhaW5mdWwgZm9yIHVzZXJzcGFjZSB0byByZWx5IG9uCj4gPiBoYWNrIGFyb3VuZCB0aGF0Lgo+
ID4KPiA+ID4gU28gaWYgeW91IHdhbnQgdG8gZG8gdGhpcywgcGxlYXNlIHN0YXJ0IHdpdGggdGhl
IG1lc2Egc2lkZSB3b3JrIChhcwo+ID4gPiB0aGUgYmlnZ2VzdCB1c2Vyc3BhY2UsIG5vdCBhbGwg
b2YgaXQpIHdpdGggcGF0Y2hlcyB0byByZWRpcmVjdCBhbGwKPiA+ID4gcHJpbWFyeSBub2RlIHJl
bmRlcmluZyB0byByZW5kZXIgbm9kZXMuIFRoZSBjb2RlIGlzIHRoZXJlIGFscmVhZHkgZm9yCj4g
PiA+IHNvY3MsIGp1c3QgbmVlZHMgdG8gYmUgcm9sbGVkIG91dCBtb3JlLiBPciB3ZSBnbyB3aXRo
IHRoZSBEUk1fQVVUSAo+ID4gPiBob3Jyb3JzLiBPciBhIDNyZCBvcHRpb24sIEkgcmVhbGx5IGRv
bid0IGNhcmUgd2hpY2ggaXQgaXMsIGFzIGxvbmcgYXMKPiA+ID4gaXRzIGNvbnNpc3RlbnQuCj4g
Pgo+ID4gSG93IGFib3V0IHRoaXM6Cj4gPiAxLiBXZSBrZWVwIERSTV9BVVRIIGFyb3VuZCBmb3Ig
YW1kZ3B1L3JhZGVvbiBmb3Igbm93Lgo+ID4gMi4gV2UgYWRkIGEgS2NvbmZpZyBvcHRpb24gdG8g
aWdub3JlIERSTV9BVVRILCBjdXJyZW50bHkgZGVmYXVsdCB0byBOLgo+ID4gVGhpcyBhbHNvIHdv
cmtzIGFzIGEgd29ya2Fyb3VuZCBmb3Igb2xkIFJBRFYuCj4gPiAzLiBXZSBzdGFydCB0byB3b3Jr
IG9uIGZ1cnRoZXIgcmVtb3Zpbmcgb2xkIGNydWZ0IGZyb20gdGhlIHByaW1hcnkgbm9kZS4KPiA+
IFBvc3NpYmxlIHRoZSBLY29uZmlnIG9wdGlvbiBJIHN1Z2dlc3RlZCB0byBkaXNhYmxlIEdFTSBm
bGluay4KPgo+IEhtIEknbSBub3Qgd29ycmllZCBhYm91dCBmbGluayByZWFsbHkuIEl0J3MgZ2Vt
X29wZW4gd2hpY2ggaXMgdGhlCj4gc2VjdXJpdHkgZ2FwLCBhbmQgdGhhdCBvbmUgaGFzIHRvIHN0
YXkgbWFzdGVyLW9ubHkgZm9yZXZlci4gSSBndWVzcyB3ZQo+IGNvdWxkIHRyeSB0byBkaXNhYmxl
IHRoYXQgc28gcGVvcGxlIGhhdmUgdG8gZGVhbCB3aXRoIGRtYS1idWYgKGFuZAo+IG9uY2UgeW91
IGhhdmUgdGhhdCByZW5kZXIgbm9kZXMgYmVjb21lIGEgbG90IGVhc2llciB0byB1c2UpLiBCdXQg
dGhlbgo+IEkgc3RpbGwgdGhpbmsgd2UgaGF2ZSBkcml2ZXJzIHdoaWNoIGRvbid0IGRvIGRtYS1i
dWYgc2VsZi1pbXBvcnQsIHNvCj4gYWdhaW4gd2UncmUgc3R1Y2suIFNvIG1heWJlIGZpcnN0IHN0
ZXAgaXMgdG8ganVzdCByb2xsIG91dCBhIGRlZmF1bHQKPiBzZWxmLWltcG9ydCBkbWEtYnVmIHN1
cHBvcnQgZm9yIGV2ZXJ5IGdlbSBkcml2ZXIuIFRoZW4gc3RhcnQgZGl0Y2hpbmcKPiBmbGluay9n
ZW1fb3Blbi4gVGhlbiBzdGFydCBkaXRjaGluZyByZW5kZXIgc3VwcG9ydCBvbiBwcmltYXJ5IG5v
ZGVzLgo+IEV2ZXJ5IHN0ZXAgaW4gdGhlIHdheSB0YWtpbmcgYSBmZXcgeWVhcnMgb2YgcHJvZGRp
bmcgdXNlcnNwYWNlIHBsdXMKPiBldmVuIG1vcmUgeWVhcnMgdG8gd2FpdCB1bnRpbCBpdCdzIGFs
bCBnb25lLgoKSSBmb3Jnb3Qgb25lIHN0ZXAgaGVyZTogSSB0aGluayB3ZSBldmVuIHN0aWxsIGhh
dmUgZHJpdmVycyB3aXRob3V0CnJlbmRlciBub2RlIHN1cHBvcnQuIEFzIGxvbmcgYXMgdGhvc2Ug
ZXhpc3RzIChhbmQgYXJlIHN0aWxsIHJlbGV2YW50KQp0aGVuIHVzZXJzcGFjZSBuZWVkcyBwcmlt
YXJ5IG5vZGUgcmVuZGVyaW5nICsgZmxpbmsgY29kZSBhbnl3YXkuIEFuZAp0aGV5J3JlIG5vdCBn
b2luZyB0byBiZSBoYXBweSBhYm91dCB1cyB0ZWxsaW5nIHRoZW0gdG8gYWRkIG1vcmUuIFNvIEkK
dGhpbmsgdGhhdCB3b3VsZCBuZWVkIHRvIGJlIGZpeGVkIGZpcnN0LiBIZW5jZSByb3VnaCBwbGFu
OgoKLSBNYWtlIHN1cmUgYWxsIGdlbSBkcml2ZXJzIHdpdGggcmVuZGVyaW5nIGhhdmUgcmVuZGVy
IG5vZGVzLgotIFJvbGwgb3V0IHNlbGYtaW1wb3J0IG9mIGRtYS1idWYgZm9yIGFsbCBnZW0gZHJp
dmVycyAod2UgY2FuIGRvIHRoYXQKd2l0aCAwIGRyaXZlciBzdXBwb3J0LCBpdCdzIGxpa2UgZmxp
bmspLgotIFJvbGwgb3V0IG1lc2EgZ2JtIGZvciBldmVyeW9uZSB0byBpZ25vcmUgcHJpbWFyeSBu
b2RlcyBmb3IgcmVuZGVyaW5nCmFzIG11Y2ggYXMgcG9zc2libGUuIE1heWJlIG5lZWRzIG1vcmUg
Z2JtIHdvcmsgc28gdGhhdCBjb21wb3NpdG9ycyBjYW4KYXNrIGZvciB0aGUgZGlzcGxheSBkcm1m
ZCBhbmQgdGhlIHJlbmRlciBkcm1mZC4KLSB3YWl0LiBsaWtlIHJlYWxseSBsb25nIHRpbWUgOi0v
Ci0gc2xvd2x5IGRlcHJlY2F0ZSBmbGluayBmb3IgbmV3IGh3IGFzIGFkZGl0aW9uYWwgZm9yY2lu
ZyBmdW5jdGlvbiB0bwpnZXQgcGVvcGxlIHRvIG1vdmUgdG8gZG1hLWJ1ZiBhbmQgcmVuZGVyIG5v
ZGVzCi0gd2FpdCBldmVuIGxvbmdlcgotIGRpdGNoIHJlbmRlcmluZyBvbiBwcmltYXJ5IG5vZGVz
LgoKTG90cyBvZiB3b3JrLCBhbmQgSSByZWFsbHkgbWVhbiBfbG90c18sIGJ1dCBJIHRoaW5rIHRo
aXMgaGFzIGEgY2hhbmNlCm9mIGFjdHVhbGx5IHdvcmtpbmcuCi1EYW5pZWwKCgo+IEFub3RoZXIg
b3B0aW9uIHdvdWxkIGJlIHRvIGV4dHJhY3QgdGhlIGttcyBzdHVmZiBmcm9tIHByaW1hcnkgbm9k
ZXMsCj4gYnV0IHdlJ3ZlIHRyaWVkIHRoYXQgd2l0aCBjb250cm9sIG5vZGVzLiBVbnRpbCBJIHJl
YWxpemVkIGEgZmV3IHllYXJzCj4gYmFjayB0aGF0IHdpdGggY29udHJvbCBub2RlcyBpdCdzIGlt
cG9zc2libGUgdG8gZ2V0IGFueSByZW5kZXJlZAo+IGJ1ZmZlciBpbiB0aGVyZSBhdCBhbGwsIHNv
IHVzZWxlc3MsIGFuZCBJIHJlbW92ZWQgaXQuIE5vIG9uZSBldmVyCj4gY29tcGxhaW5lZC4KPgo+
IFNvIHllYWggd291bGQgYmUgcmVhbGx5IG5pY2UgaWYgd2UgY291bGQgZml4IHRoaXMsIGJ1dCB0
aGUgdW5pdmVyc2UKPiBjb25zcGlyZXMgYWdhaW5zdCB1cyB0b28gbXVjaCBpdCBzZWVtcy4gSGVu
Y2UgdGhlIGZhbGxiYWNrIG9mICJwbGVhc2UKPiBhdCBsZWFzdCBsZXRzIGFpbSBmb3IgYSBjb25z
aXN0ZW50IGNvbG9yIGZvciB0aGlzIG1lc3MsIHdoYXRldmVyIGl0Cj4gaXMiLgo+Cj4gQ2hlZXJz
LCBEYW5pZWwKPiAtLQo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KPiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
CgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
