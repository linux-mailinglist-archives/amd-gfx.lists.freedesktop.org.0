Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E607A6504
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 11:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85B388FAD;
	Tue,  3 Sep 2019 09:20:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72CC88FA8
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 09:20:03 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id o101so15999092ota.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Sep 2019 02:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MPVnzREP3ak+3OrsLXWpxXegn9wVGjxpNj/HB4Mr+oc=;
 b=a/8sy1mdZujlJUKx1Vo6ay8a6P/CL6qQ56+xx8Xgn17vF2xo1VPc74jbV35GEWAGOd
 MY/jG8o7CsYbbWGeUoPgwxy6sEMuo08eWeVRA8ARe3cNhHedN7OkkOKLsHd7YS3bJ2/u
 f3GaQgzSISsX5VN7MKhkJZbCCKkNBcx1PXgcgeuWg8kBe36yAHebQGJ7KIRQDittIYuQ
 0QrPyHI4yaAxq/FDbKErrY5MK5pUl/7OgBOxAhyORP9r57zvpN9Uj0Ae9TY8S4MvnXqx
 JY1Y4yaFxv9BDMvNeJrB+VlBtZRCyUGIEZhlVtDGhOJOeGD6HUM8gErgLCCMZBinOTRC
 5gSA==
X-Gm-Message-State: APjAAAX0oNJdsf8YGyOyhEBn3QcfPs2A2BUgF5NyO+yv4xmx04krY3K3
 TUAspx4EFfmBi9MUSbTLGDCb+S2NTiWmTfkKDwcgfQ==
X-Google-Smtp-Source: APXvYqzfa9yqZzXt8AoNBLuwwhbav2QmhjRyTobhHa40mOgLT9i1W4lWDC8Wfaio/Lw/XBVOZy/1Llx8+cJftJ5clAU=
X-Received: by 2002:a05:6830:1594:: with SMTP id
 i20mr1554563otr.188.1567502402779; 
 Tue, 03 Sep 2019 02:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190903080217.GL2112@phenom.ffwll.local>
 <f8d561b9-091e-2f74-944f-38230195eea8@amd.com>
In-Reply-To: <f8d561b9-091e-2f74-944f-38230195eea8@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 3 Sep 2019 11:19:50 +0200
Message-ID: <CAKMK7uGDs1fznj7PQytc7fAtBoSQ4VmW6D6UDqTgPxzgHOsC+Q@mail.gmail.com>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MPVnzREP3ak+3OrsLXWpxXegn9wVGjxpNj/HB4Mr+oc=;
 b=Q2rqaguGGXXxSqEaZCIj929iKZ5scGUqCkPsmIBsJjxFwsALEtT5l7HeW8OO8AVHkv
 XQvBe5uyGRHxrT4EdctxYyml1rgtv4SixvFn7roK6V4eCga6u80FCcH8HfhDkR/WQEtE
 HNi6krBeR4XtFiKGIu+sJeF4a6bfcZsaIj06w=
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
Cc: "Ho, Kenny" <Kenny.Ho@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "jsparks@cray.com" <jsparks@cray.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "lkaplan@cray.com" <lkaplan@cray.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "y2kenny@gmail.com" <y2kenny@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Greathouse, Joseph" <Joseph.Greathouse@amd.com>,
 "tj@kernel.org" <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCAxMDoyNCBBTSBLb2VuaWcsIENocmlzdGlhbgo8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDAzLjA5LjE5IHVtIDEwOjAyIHNjaHJp
ZWIgRGFuaWVsIFZldHRlcjoKPiA+IE9uIFRodSwgQXVnIDI5LCAyMDE5IGF0IDAyOjA1OjE3QU0g
LTA0MDAsIEtlbm55IEhvIHdyb3RlOgo+ID4+IFRoaXMgaXMgYSBmb2xsb3cgdXAgdG8gdGhlIFJG
QyBJIG1hZGUgcHJldmlvdXNseSB0byBpbnRyb2R1Y2UgYSBjZ3JvdXAKPiA+PiBjb250cm9sbGVy
IGZvciB0aGUgR1BVL0RSTSBzdWJzeXN0ZW0gW3YxLHYyLHYzXS4gIFRoZSBnb2FsIGlzIHRvIGJl
IGFibGUgdG8KPiA+PiBwcm92aWRlIHJlc291cmNlIG1hbmFnZW1lbnQgdG8gR1BVIHJlc291cmNl
cyB1c2luZyB0aGluZ3MgbGlrZSBjb250YWluZXIuCj4gPj4KPiA+PiBXaXRoIHRoaXMgUkZDIHY0
LCBJIGFtIGhvcGluZyB0byBoYXZlIHNvbWUgY29uc2Vuc3VzIG9uIGEgbWVyZ2UgcGxhbi4gIEkg
YmVsaWV2ZQo+ID4+IHRoZSBHRU0gcmVsYXRlZCByZXNvdXJjZXMgKGRybS5idWZmZXIuKikgaW50
cm9kdWNlZCBpbiBwcmV2aW91cyBSRkMgYW5kLAo+ID4+IGhvcGVmdWxseSwgdGhlIGxvZ2ljYWwg
R1BVIGNvbmNlcHQgKGRybS5sZ3B1LiopIGludHJvZHVjZWQgaW4gdGhpcyBSRkMgYXJlCj4gPj4g
dW5jb250cm92ZXJzaWFsIGFuZCByZWFkeSB0byBtb3ZlIG91dCBvZiBSRkMgYW5kIGludG8gYSBt
b3JlIGZvcm1hbCByZXZpZXcuICBJCj4gPj4gd2lsbCBjb250aW51ZSB0byB3b3JrIG9uIHRoZSBt
ZW1vcnkgYmFja2VuZCByZXNvdXJjZXMgKGRybS5tZW1vcnkuKikuCj4gPj4KPiA+PiBUaGUgY292
ZXIgbGV0dGVyIGZyb20gdjEgaXMgY29waWVkIGJlbG93IGZvciByZWZlcmVuY2UuCj4gPj4KPiA+
PiBbdjFdOiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwv
MjAxOC1Ob3ZlbWJlci8xOTcxMDYuaHRtbAo+ID4+IFt2Ml06IGh0dHBzOi8vd3d3LnNwaW5pY3Mu
bmV0L2xpc3RzL2Nncm91cHMvbXNnMjIwNzQuaHRtbAo+ID4+IFt2M106IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2FtZC1nZngvMjAxOS1KdW5lLzAzNjAyNi5odG1sCj4g
PiBTbyBsb29raW5nIGF0IGFsbCB0aGlzIGRvZXNuJ3Qgc2VlbSB0byBoYXZlIGNoYW5nZWQgbXVj
aCwgYW5kIHRoZSBvbGQKPiA+IGRpc2N1c3Npb24gZGlkbid0IHJlYWxseSBjb25jbHVkZSBhbnl3
aGVyZSAoYXNpZGUgZnJvbSBzb21lIGRldGFpbHMpLgo+ID4KPiA+IE9uZSBtb3JlIG9wZW4gdGhv
dWdoIHRoYXQgY3Jvc3NlZCBteSBtaW5kLCBoYXZpbmcgcmVhZCBhIHRvbiBvZiB0dG0gYWdhaW4K
PiA+IHJlY2VudGx5OiBIb3cgZG9lcyB0aGlzIGFsbCBpbnRlcmFjdCB3aXRoIHR0bSBnbG9iYWwg
bGltaXRzPyBJJ2Qgc2F5IHRoZQo+ID4gdHRtIGdsb2JhbCBsaW1pdHMgaXMgdGhlIHVyLWNncm91
cHMgd2UgaGF2ZSBpbiBkcm0sIGFuZCBub3QgbG9va2luZyBhdAo+ID4gdGhhdCBzZWVtcyBraW5k
YSBiYWQuCj4KPiBBdCBsZWFzdCBteSBob3BlIHdhcyB0byBjb21wbGV0ZWx5IHJlcGxhY2UgdHRt
IGdsb2JhbHMgd2l0aCB0aG9zZQo+IGxpbWl0YXRpb25zIGhlcmUgd2hlbiBpdCBpcyByZWFkeS4K
CllvdSBuZWVkIG1vcmUsIGF0IGxlYXN0IHNvbWUga2luZCBvZiBzaHJpbmtlciB0byBjdXQgZG93
biBibyBwbGFjZWQgaW4Kc3lzdGVtIG1lbW9yeSB3aGVuIHdlJ3JlIHVuZGVyIG1lbW9yeSBwcmVz
c3VyZS4gV2hpY2ggZHJhZ3MgaW4gYQpwcmV0dHkgZXBpYyBhbW91bnQgb2YgbG9ja2luZyBsb2xz
IChzZWUgaTkxNSdzIHNocmlua2VyIGZ1biwgd2hlcmUgd2UKYXR0ZW1wdCB0aGF0KS4gUHJvYmFi
bHkgYW5vdGhlciBnb29kIGlkZWEgdG8gc2hhcmUgYXQgbGVhc3Qgc29tZQpjb25jZXB0cywgbWF5
YmUgZXZlbiBjb2RlLgotRGFuaWVsCgo+Cj4gQ2hyaXN0aWFuLgo+Cj4gPiAtRGFuaWVsCj4gPgo+
ID4+IHY0Ogo+ID4+IFVuY2hhbmdlZCAobm8gcmV2aWV3IG5lZWRlZCkKPiA+PiAqIGRybS5tZW1v
cnkuKi90dG0gcmVzb3VyY2VzIChQYXRjaCA5LTEzLCBJIGFtIHN0aWxsIHdvcmtpbmcgb24gbWVt
b3J5IGJhbmR3aWR0aAo+ID4+IGFuZCBzaHJpbmtlcikKPiA+PiBCYXNlIG9uIGZlZWRiYWNrcyBv
biB2MzoKPiA+PiAqIHVwZGF0ZSBub21pbmNsYXR1cmUgdG8gZHJtY2cKPiA+PiAqIGVtYmVkIHBl
ciBkZXZpY2UgZHJtY2cgcHJvcGVydGllcyBpbnRvIGRybV9kZXZpY2UKPiA+PiAqIHNwbGl0IEdF
TSBidWZmZXIgcmVsYXRlZCBjb21taXRzIGludG8gc3RhdHMgYW5kIGxpbWl0Cj4gPj4gKiByZW5h
bWUgZnVuY3Rpb24gbmFtZSB0byBhbGlnbiB3aXRoIGNvbnZlbnRpb24KPiA+PiAqIGNvbWJpbmVk
IGJ1ZmZlciBhY2NvdW50aW5nIGFuZCBjaGVjayBpbnRvIGEgdHJ5X2NoYXJnZSBmdW5jdGlvbgo+
ID4+ICogc3VwcG9ydCBidWZmZXIgc3RhdHMgd2l0aG91dCBsaW1pdCBlbmZvcmNlbWVudAo+ID4+
ICogcmVtb3ZlZCBHRU0gYnVmZmVyIHNoYXJpbmcgbGltaXRhdGlvbgo+ID4+ICogdXBkYXRlZCBk
b2N1bWVudGF0aW9ucwo+ID4+IE5ldyBmZWF0dXJlczoKPiA+PiAqIGludHJvZHVjaW5nIGxvZ2lj
YWwgR1BVIGNvbmNlcHQKPiA+PiAqIGV4YW1wbGUgaW1wbGVtZW50YXRpb24gd2l0aCBBTUQgS0ZE
Cj4gPj4KPiA+PiB2MzoKPiA+PiBCYXNlIG9uIGZlZWRiYWNrcyBvbiB2MjoKPiA+PiAqIHJlbW92
ZWQgLmhlbHAgdHlwZSBmaWxlIGZyb20gdjIKPiA+PiAqIGNvbmZvcm0gdG8gY2dyb3VwIGNvbnZl
bnRpb24gZm9yIGRlZmF1bHQgYW5kIG1heCBoYW5kbGluZwo+ID4+ICogY29uZm9ybSB0byBjZ3Jv
dXAgY29udmVudGlvbiBmb3IgYWRkcmVzc2luZyBkZXZpY2Ugc3BlY2lmaWMgbGltaXRzICh3aXRo
IG1ham9yOm1pbm9yKQo+ID4+IE5ldyBmdW5jdGlvbjoKPiA+PiAqIGFkb3B0ZWQgbWVtcGFyc2Ug
Zm9yIG1lbW9yeSBzaXplIHJlbGF0ZWQgYXR0cmlidXRlcwo+ID4+ICogYWRkZWQgbWFjcm8gdG8g
bWFyc2hhbGwgZHJtY2dycCBjZnR5cGUgcHJpdmF0ZSAgKERSTUNHX0NURl9QUklWLCBldGMuKQo+
ID4+ICogYWRkZWQgdHRtIGJ1ZmZlciB1c2FnZSBzdGF0cyAocGVyIGNncm91cCwgZm9yIHN5c3Rl
bSwgdHQsIHZyYW0uKQo+ID4+ICogYWRkZWQgdHRtIGJ1ZmZlciB1c2FnZSBsaW1pdCAocGVyIGNn
cm91cCwgZm9yIHZyYW0uKQo+ID4+ICogYWRkZWQgcGVyIGNncm91cCBiYW5kd2lkdGggc3RhdHMg
YW5kIGxpbWl0aW5nIChidXJzdCBhbmQgYXZlcmFnZSBiYW5kd2lkdGgpCj4gPj4KPiA+PiB2MjoK
PiA+PiAqIFJlbW92ZWQgdGhlIHZlbmRvcmluZyBjb25jZXB0cwo+ID4+ICogQWRkIGxpbWl0IHRv
IHRvdGFsIGJ1ZmZlciBhbGxvY2F0aW9uCj4gPj4gKiBBZGQgbGltaXQgdG8gdGhlIG1heGltdW0g
c2l6ZSBvZiBhIGJ1ZmZlciBhbGxvY2F0aW9uCj4gPj4KPiA+PiB2MTogY292ZXIgbGV0dGVyCj4g
Pj4KPiA+PiBUaGUgcHVycG9zZSBvZiB0aGlzIHBhdGNoIHNlcmllcyBpcyB0byBzdGFydCBhIGRp
c2N1c3Npb24gZm9yIGEgZ2VuZXJpYyBjZ3JvdXAKPiA+PiBjb250cm9sbGVyIGZvciB0aGUgZHJt
IHN1YnN5c3RlbS4gIFRoZSBkZXNpZ24gcHJvcG9zZWQgaGVyZSBpcyBhIHZlcnkgZWFybHkgb25l
Lgo+ID4+IFdlIGFyZSBob3BpbmcgdG8gZW5nYWdlIHRoZSBjb21tdW5pdHkgYXMgd2UgZGV2ZWxv
cCB0aGUgaWRlYS4KPiA+Pgo+ID4+Cj4gPj4gQmFja2dyb3VuZHMKPiA+PiA9PT09PT09PT09Cj4g
Pj4gQ29udHJvbCBHcm91cHMvY2dyb3VwIHByb3ZpZGUgYSBtZWNoYW5pc20gZm9yIGFnZ3JlZ2F0
aW5nL3BhcnRpdGlvbmluZyBzZXRzIG9mCj4gPj4gdGFza3MsIGFuZCBhbGwgdGhlaXIgZnV0dXJl
IGNoaWxkcmVuLCBpbnRvIGhpZXJhcmNoaWNhbCBncm91cHMgd2l0aCBzcGVjaWFsaXplZAo+ID4+
IGJlaGF2aW91ciwgc3VjaCBhcyBhY2NvdW50aW5nL2xpbWl0aW5nIHRoZSByZXNvdXJjZXMgd2hp
Y2ggcHJvY2Vzc2VzIGluIGEgY2dyb3VwCj4gPj4gY2FuIGFjY2Vzc1sxXS4gIFdlaWdodHMsIGxp
bWl0cywgcHJvdGVjdGlvbnMsIGFsbG9jYXRpb25zIGFyZSB0aGUgbWFpbiByZXNvdXJjZQo+ID4+
IGRpc3RyaWJ1dGlvbiBtb2RlbHMuICBFeGlzdGluZyBjZ3JvdXAgY29udHJvbGxlcnMgaW5jbHVk
ZXMgY3B1LCBtZW1vcnksIGlvLAo+ID4+IHJkbWEsIGFuZCBtb3JlLiAgY2dyb3VwIGlzIG9uZSBv
ZiB0aGUgZm91bmRhdGlvbmFsIHRlY2hub2xvZ2llcyB0aGF0IGVuYWJsZXMgdGhlCj4gPj4gcG9w
dWxhciBjb250YWluZXIgYXBwbGljYXRpb24gZGVwbG95bWVudCBhbmQgbWFuYWdlbWVudCBtZXRo
b2QuCj4gPj4KPiA+PiBEaXJlY3QgUmVuZGVyaW5nIE1hbmFnZXIvZHJtIGNvbnRhaW5zIGNvZGUg
aW50ZW5kZWQgdG8gc3VwcG9ydCB0aGUgbmVlZHMgb2YKPiA+PiBjb21wbGV4IGdyYXBoaWNzIGRl
dmljZXMuIEdyYXBoaWNzIGRyaXZlcnMgaW4gdGhlIGtlcm5lbCBtYXkgbWFrZSB1c2Ugb2YgRFJN
Cj4gPj4gZnVuY3Rpb25zIHRvIG1ha2UgdGFza3MgbGlrZSBtZW1vcnkgbWFuYWdlbWVudCwgaW50
ZXJydXB0IGhhbmRsaW5nIGFuZCBETUEKPiA+PiBlYXNpZXIsIGFuZCBwcm92aWRlIGEgdW5pZm9y
bSBpbnRlcmZhY2UgdG8gYXBwbGljYXRpb25zLiAgVGhlIERSTSBoYXMgYWxzbwo+ID4+IGRldmVs
b3BlZCBiZXlvbmQgdHJhZGl0aW9uYWwgZ3JhcGhpY3MgYXBwbGljYXRpb25zIHRvIHN1cHBvcnQg
Y29tcHV0ZS9HUEdQVQo+ID4+IGFwcGxpY2F0aW9ucy4KPiA+Pgo+ID4+Cj4gPj4gTW90aXZhdGlv
bnMKPiA+PiA9PT09PT09PT0KPiA+PiBBcyBHUFUgZ3JvdyBiZXlvbmQgdGhlIHJlYWxtIG9mIGRl
c2t0b3Avd29ya3N0YXRpb24gZ3JhcGhpY3MgaW50byBhcmVhcyBsaWtlCj4gPj4gZGF0YSBjZW50
ZXIgY2x1c3RlcnMgYW5kIElvVCwgdGhlcmUgYXJlIGluY3JlYXNpbmcgbmVlZHMgdG8gbW9uaXRv
ciBhbmQgcmVndWxhdGUKPiA+PiBHUFUgYXMgYSByZXNvdXJjZSBsaWtlIGNwdSwgbWVtb3J5IGFu
ZCBpby4KPiA+Pgo+ID4+IE1hdHQgUm9wZXIgZnJvbSBJbnRlbCBiZWdhbiB3b3JraW5nIG9uIHNp
bWlsYXIgaWRlYSBpbiBlYXJseSAyMDE4IFsyXSBmb3IgdGhlCj4gPj4gcHVycG9zZSBvZiBtYW5h
Z2luZyBHUFUgcHJpb3JpdHkgdXNpbmcgdGhlIGNncm91cCBoaWVyYXJjaHkuICBXaGlsZSB0aGF0
Cj4gPj4gcGFydGljdWxhciB1c2UgY2FzZSBtYXkgbm90IHdhcnJhbnQgYSBzdGFuZGFsb25lIGRy
bSBjZ3JvdXAgY29udHJvbGxlciwgdGhlcmUKPiA+PiBhcmUgb3RoZXIgdXNlIGNhc2VzIHdoZXJl
IGhhdmluZyBvbmUgY2FuIGJlIHVzZWZ1bCBbM10uICBNb25pdG9yaW5nIEdQVQo+ID4+IHJlc291
cmNlcyBzdWNoIGFzIFZSQU0gYW5kIGJ1ZmZlcnMsIENVIChjb21wdXRlIHVuaXQgW0FNRCdzIG5v
bWVuY2xhdHVyZV0pL0VVCj4gPj4gKGV4ZWN1dGlvbiB1bml0IFtJbnRlbCdzIG5vbWVuY2xhdHVy
ZV0pLCBHUFUgam9iIHNjaGVkdWxpbmcgWzRdIGNhbiBoZWxwCj4gPj4gc3lzYWRtaW5zIGdldCBh
IGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHRoZSBhcHBsaWNhdGlvbnMgdXNhZ2UgcHJvZmlsZS4g
IEZ1cnRoZXIKPiA+PiB1c2FnZSByZWd1bGF0aW9ucyBvZiB0aGUgYWZvcmVtZW50aW9uZWQgcmVz
b3VyY2VzIGNhbiBhbHNvIGhlbHAgc3lzYWRtaW5zCj4gPj4gb3B0aW1pemUgd29ya2xvYWQgZGVw
bG95bWVudCBvbiBsaW1pdGVkIEdQVSByZXNvdXJjZXMuCj4gPj4KPiA+PiBXaXRoIHRoZSBpbmNy
ZWFzZWQgaW1wb3J0YW5jZSBvZiBtYWNoaW5lIGxlYXJuaW5nLCBkYXRhIHNjaWVuY2UgYW5kIG90
aGVyCj4gPj4gY2xvdWQtYmFzZWQgYXBwbGljYXRpb25zLCBHUFVzIGFyZSBhbHJlYWR5IGluIHBy
b2R1Y3Rpb24gdXNlIGluIGRhdGEgY2VudGVycwo+ID4+IHRvZGF5IFs1LDYsN10uICBFeGlzdGlu
ZyBHUFUgcmVzb3VyY2UgbWFuYWdlbWVudCBpcyB2ZXJ5IGNvdXJzZSBncmFpbiwgaG93ZXZlciwK
PiA+PiBhcyBzeXNhZG1pbnMgYXJlIG9ubHkgYWJsZSB0byBkaXN0cmlidXRlIHdvcmtsb2FkIG9u
IGEgcGVyLUdQVSBiYXNpcyBbOF0uICBBbgo+ID4+IGFsdGVybmF0aXZlIGlzIHRvIHVzZSBHUFUg
dmlydHVhbGl6YXRpb24gKHdpdGggb3Igd2l0aG91dCBTUklPVikgYnV0IGl0Cj4gPj4gZ2VuZXJh
bGx5IGFjdHMgb24gdGhlIGVudGlyZSBHUFUgaW5zdGVhZCBvZiB0aGUgc3BlY2lmaWMgcmVzb3Vy
Y2VzIGluIGEgR1BVLgo+ID4+IFdpdGggYSBkcm0gY2dyb3VwIGNvbnRyb2xsZXIsIHdlIGNhbiBl
bmFibGUgYWx0ZXJuYXRlLCBmaW5lLWdyYWluLCBzdWItR1BVCj4gPj4gcmVzb3VyY2UgbWFuYWdl
bWVudCAoaW4gYWRkaXRpb24gdG8gd2hhdCBtYXkgYmUgYXZhaWxhYmxlIHZpYSBHUFUKPiA+PiB2
aXJ0dWFsaXphdGlvbi4pCj4gPj4KPiA+PiBJbiBhZGRpdGlvbiB0byBwcm9kdWN0aW9uIHVzZSwg
dGhlIERSTSBjZ3JvdXAgY2FuIGFsc28gaGVscCB3aXRoIHRlc3RpbmcKPiA+PiBncmFwaGljcyBh
cHBsaWNhdGlvbiByb2J1c3RuZXNzIGJ5IHByb3ZpZGluZyBhIG1lYW4gdG8gYXJ0aWZpY2lhbGx5
IGxpbWl0IERSTQo+ID4+IHJlc291cmNlcyBhdmFpbGJsZSB0byB0aGUgYXBwbGljYXRpb25zLgo+
ID4+Cj4gPj4KPiA+PiBDaGFsbGVuZ2VzCj4gPj4gPT09PT09PT0KPiA+PiBXaGlsZSB0aGVyZSBh
cmUgY29tbW9uIGluZnJhc3RydWN0dXJlIGluIERSTSB0aGF0IGlzIHNoYXJlZCBhY3Jvc3MgbWFu
eSB2ZW5kb3JzCj4gPj4gKHRoZSBzY2hlZHVsZXIgWzRdIGZvciBleGFtcGxlKSwgdGhlcmUgYXJl
IGFsc28gYXNwZWN0cyBvZiBEUk0gdGhhdCBhcmUgdmVuZG9yCj4gPj4gc3BlY2lmaWMuICBUbyBh
Y2NvbW1vZGF0ZSB0aGlzLCB3ZSBib3Jyb3dlZCB0aGUgbWVjaGFuaXNtIHVzZWQgYnkgdGhlIGNn
cm91cCB0bwo+ID4+IGhhbmRsZSBkaWZmZXJlbnQga2luZHMgb2YgY2dyb3VwIGNvbnRyb2xsZXIu
Cj4gPj4KPiA+PiBSZXNvdXJjZXMgZm9yIERSTSBhcmUgYWxzbyBvZnRlbiBkZXZpY2UgKEdQVSkg
c3BlY2lmaWMgaW5zdGVhZCBvZiBzeXN0ZW0KPiA+PiBzcGVjaWZpYyBhbmQgYSBzeXN0ZW0gbWF5
IGNvbnRhaW4gbW9yZSB0aGFuIG9uZSBHUFUuICBGb3IgdGhpcywgd2UgYm9ycm93ZWQgc29tZQo+
ID4+IG9mIHRoZSBpZGVhcyBmcm9tIFJETUEgY2dyb3VwIGNvbnRyb2xsZXIuCj4gPj4KPiA+PiBB
cHByb2FjaAo+ID4+ID09PT09PT0KPiA+PiBUbyBleHBlcmltZW50IHdpdGggdGhlIGlkZWEgb2Yg
YSBEUk0gY2dyb3VwLCB3ZSB3b3VsZCBsaWtlIHRvIHN0YXJ0IHdpdGggYmFzaWMKPiA+PiBhY2Nv
dW50aW5nIGFuZCBzdGF0aXN0aWNzLCB0aGVuIGNvbnRpbnVlIHRvIGl0ZXJhdGUgYW5kIGFkZCBy
ZWd1bGF0aW5nCj4gPj4gbWVjaGFuaXNtcyBpbnRvIHRoZSBkcml2ZXIuCj4gPj4KPiA+PiBbMV0g
aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9jZ3JvdXAtdjEvY2dyb3Vw
cy50eHQKPiA+PiBbMl0gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvaW50
ZWwtZ2Z4LzIwMTgtSmFudWFyeS8xNTMxNTYuaHRtbAo+ID4+IFszXSBodHRwczovL3d3dy5zcGlu
aWNzLm5ldC9saXN0cy9jZ3JvdXBzL21zZzIwNzIwLmh0bWwKPiA+PiBbNF0gaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyCj4gPj4gWzVdIGh0dHBzOi8va3ViZXJuZXRlcy5pby9kb2NzL3Rhc2tzL21hbmFnZS1ncHVz
L3NjaGVkdWxpbmctZ3B1cy8KPiA+PiBbNl0gaHR0cHM6Ly9ibG9nLm9wZW5zaGlmdC5jb20vZ3B1
LWFjY2VsZXJhdGVkLXNxbC1xdWVyaWVzLXdpdGgtcG9zdGdyZXNxbC1wZy1zdHJvbS1pbi1vcGVu
c2hpZnQtMy0xMC8KPiA+PiBbN10gaHR0cHM6Ly9naXRodWIuY29tL1JhZGVvbk9wZW5Db21wdXRl
L2s4cy1kZXZpY2UtcGx1Z2luCj4gPj4gWzhdIGh0dHBzOi8vZ2l0aHViLmNvbS9rdWJlcm5ldGVz
L2t1YmVybmV0ZXMvaXNzdWVzLzUyNzU3Cj4gPj4KPiA+PiBLZW5ueSBIbyAoMTYpOgo+ID4+ICAg
IGRybTogQWRkIGRybV9taW5vcl9mb3JfZWFjaAo+ID4+ICAgIGNncm91cDogSW50cm9kdWNlIGNn
cm91cCBmb3IgZHJtIHN1YnN5c3RlbQo+ID4+ICAgIGRybSwgY2dyb3VwOiBJbml0aWFsaXplIGRy
bWNnIHByb3BlcnRpZXMKPiA+PiAgICBkcm0sIGNncm91cDogQWRkIHRvdGFsIEdFTSBidWZmZXIg
YWxsb2NhdGlvbiBzdGF0cwo+ID4+ICAgIGRybSwgY2dyb3VwOiBBZGQgcGVhayBHRU0gYnVmZmVy
IGFsbG9jYXRpb24gc3RhdHMKPiA+PiAgICBkcm0sIGNncm91cDogQWRkIEdFTSBidWZmZXIgYWxs
b2NhdGlvbiBjb3VudCBzdGF0cwo+ID4+ICAgIGRybSwgY2dyb3VwOiBBZGQgdG90YWwgR0VNIGJ1
ZmZlciBhbGxvY2F0aW9uIGxpbWl0Cj4gPj4gICAgZHJtLCBjZ3JvdXA6IEFkZCBwZWFrIEdFTSBi
dWZmZXIgYWxsb2NhdGlvbiBsaW1pdAo+ID4+ICAgIGRybSwgY2dyb3VwOiBBZGQgVFRNIGJ1ZmZl
ciBhbGxvY2F0aW9uIHN0YXRzCj4gPj4gICAgZHJtLCBjZ3JvdXA6IEFkZCBUVE0gYnVmZmVyIHBl
YWsgdXNhZ2Ugc3RhdHMKPiA+PiAgICBkcm0sIGNncm91cDogQWRkIHBlciBjZ3JvdXAgYncgbWVh
c3VyZSBhbmQgY29udHJvbAo+ID4+ICAgIGRybSwgY2dyb3VwOiBBZGQgc29mdCBWUkFNIGxpbWl0
Cj4gPj4gICAgZHJtLCBjZ3JvdXA6IEFsbG93IG1vcmUgYWdncmVzc2l2ZSBtZW1vcnkgcmVjbGFp
bQo+ID4+ICAgIGRybSwgY2dyb3VwOiBJbnRyb2R1Y2UgbGdwdSBhcyBEUk0gY2dyb3VwIHJlc291
cmNlCj4gPj4gICAgZHJtLCBjZ3JvdXA6IGFkZCB1cGRhdGUgdHJpZ2dlciBhZnRlciBsaW1pdCBj
aGFuZ2UKPiA+PiAgICBkcm0vYW1kZ3B1OiBJbnRlZ3JhdGUgd2l0aCBEUk0gY2dyb3VwCj4gPj4K
PiA+PiAgIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2dyb3VwLXYyLnJzdCAgICAgICB8ICAx
NjMgKy0KPiA+PiAgIERvY3VtZW50YXRpb24vY2dyb3VwLXYxL2RybS5yc3QgICAgICAgICAgICAg
ICB8ICAgIDEgKwo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZC5oICAgIHwgICAgNCArCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMgICAgICAgfCAgIDI5ICsKPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9vYmplY3QuYyAgICB8ICAgIDYgKy0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYyAgICAgICB8ICAgIDMgKy0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgICAgICB8ICAgIDYgKwo+ID4+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICAgICAgIHwgICAgMyArCj4gPj4gICAuLi4vYW1k
L2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMgICAgfCAgMTQwICsrCj4gPj4gICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jICAgICAgICAgICAgICAgICAgICAgfCAgIDI2ICsKPiA+
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgICAgICAgICAgICAgICAgICAgICB8ICAgMTYg
Ky0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJuYWwuaCAgICAgICAgICAgICAgICB8
ICAgIDQgLQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICAgICAgICAgICAg
ICAgIHwgICA5MyArKwo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jICAg
ICAgICAgICAgIHwgICAgNCArCj4gPj4gICBpbmNsdWRlL2RybS9kcm1fY2dyb3VwLmggICAgICAg
ICAgICAgICAgICAgICAgfCAgMTIyICsrCj4gPj4gICBpbmNsdWRlL2RybS9kcm1fZGV2aWNlLmgg
ICAgICAgICAgICAgICAgICAgICAgfCAgICA3ICsKPiA+PiAgIGluY2x1ZGUvZHJtL2RybV9kcnYu
aCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMjMgKwo+ID4+ICAgaW5jbHVkZS9kcm0vZHJt
X2dlbS5oICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxMyArLQo+ID4+ICAgaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19hcGkuaCAgICAgICAgICAgICAgICAgIHwgICAgMiArCj4gPj4gICBpbmNs
dWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oICAgICAgICAgICAgICAgfCAgIDEwICsKPiA+PiAg
IGluY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oICAgICAgICAgICAgICAgICAgICB8ICAxNTEgKysK
PiA+PiAgIGluY2x1ZGUvbGludXgvY2dyb3VwX3N1YnN5cy5oICAgICAgICAgICAgICAgICB8ICAg
IDQgKwo+ID4+ICAgaW5pdC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAgNSArCj4gPj4gICBrZXJuZWwvY2dyb3VwL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgICAxICsKPiA+PiAgIGtlcm5lbC9jZ3JvdXAvZHJtLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDEzNjcgKysrKysrKysrKysrKysrKysKPiA+PiAgIDI1IGZpbGVzIGNoYW5n
ZWQsIDIxOTMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9jZ3JvdXAtdjEvZHJtLnJzdAo+ID4+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2RybV9jZ3JvdXAuaAo+ID4+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGluY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
a2VybmVsL2Nncm91cC9kcm0uYwo+ID4+Cj4gPj4gLS0KPiA+PiAyLjIyLjAKPiA+Pgo+CgoKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAo
MCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
