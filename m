Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D71A2EFBC0
	for <lists+amd-gfx@lfdr.de>; Sat,  9 Jan 2021 00:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EAD6E8CC;
	Fri,  8 Jan 2021 23:37:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DACA6E8CC
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Jan 2021 23:37:53 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id d9so11495430iob.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 08 Jan 2021 15:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=FSdyVAse6swItlK4svYToN7FUI3g0jQLTwgNs0iUz/w=;
 b=XDEZFO+WiTLV5XdJnmIq6UPmSm4qYGLKlz1TNGVvM1A7kMChgcEXsiUzRcM3oX2FSn
 /gNcUhgQZOOAVKv4yyRXLKVh0q1+EWb/IaPWZRBVeQpv3sO2UlwkSIDsJM86MS4Sct4I
 QB0HEesD+D1NoYWj4tEb8meOdUmjZuS2LZMlQOMRaEL886yp3jerd+ESzwy23DY3kOii
 jXq//uTpGwerHv7TLknQhxUaX2b/ny9wN7rmhgxhJivcXxVjM2OrudZxUgWD6+75X9xn
 oP5bupMTZnqRyJHMW2wSJsU6Hcd+UJ/1hcW1fLhWmPTatdBAYVuk2Pv4Q3jhM9fPpGp4
 220w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=FSdyVAse6swItlK4svYToN7FUI3g0jQLTwgNs0iUz/w=;
 b=TtNlbG2Y7Vqhz2QVP+Gl5e5MuNpv0PDEgeLNUANMzt5S9IfPj8keTe7YzFCWTXv2QS
 RlWIROQ9MG+OJ6Oe1g+zP38Y/13ZXUIM/nwFVcq8UBE+8IfzZbM3GBTO3s1WKK/u4Iue
 iD+gPnrIPRf6LhYNRD8UN47FE4tQW0JNd+rTrZKjnyx6EKpXXgQatEihiGz87q3PeZ74
 Q/aiNhytb4MtuWQcxKijCz0uy3kjyVLyYkAhLoGxXI8O5gCfQ0c7hTDdC3D9ZCxR3le8
 h6902vXN3hDc+ECu+pKZ6Y/BjoA1k4gVD6GFriULHdBZ9WLDUn/JeyQotdQGysnvD8zs
 tySA==
X-Gm-Message-State: AOAM533KfSZbuFfHDv1mFR1jLKk24nYo2y8cIZAhur12N7UInyCBiuFh
 9Ng/Lnat9/EsTq207gewB5c=
X-Google-Smtp-Source: ABdhPJxxwN5ch1lMMGUjCJxmjfzEcazxQaO87k6cGQgxyMjnOzQkxskVwREVSGktmLLD2Ag7UCl4Kw==
X-Received: by 2002:a02:aa83:: with SMTP id u3mr5530763jai.38.1610149072833;
 Fri, 08 Jan 2021 15:37:52 -0800 (PST)
Received: from [10.0.0.100] ([38.74.25.246])
 by smtp.gmail.com with ESMTPSA id d5sm8100170ilf.33.2021.01.08.15.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 15:37:52 -0800 (PST)
Message-ID: <8a7753f62808cba7f8b7355bc20da1aa5cfeebbd.camel@gmail.com>
Subject: Re: AMDGPU VCE 1: some info needed
From: Alexandre Demers <alexandre.f.demers@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 08 Jan 2021 18:37:51 -0500
In-Reply-To: <CADnq5_Pv9t1xKJeHdJKLX45=N9KWRsU-rskpRWkspaK7zBWCQg@mail.gmail.com>
References: <CAPEhTTFa_c3L8gpxT3=HOrQi9mQxhH2GaGo9_mfdc8gKpV2MXA@mail.gmail.com>
 <d06c8a25-d9db-3a96-064f-964382de73a6@gmail.com>
 <CADnq5_O6wCWT+Rig6Moaxs_7nbw6dE3fjBw45f99iW6q4945DA@mail.gmail.com>
 <bac03930a338caec9329a18a2467e4876984e69d.camel@gmail.com>
 <CADnq5_Pv9t1xKJeHdJKLX45=N9KWRsU-rskpRWkspaK7zBWCQg@mail.gmail.com>
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
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
Cc: Christian Koenig <christian.koenig@amd.com>,
 Freedesktop - AMD-gfx <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIEZyaSwgMjAyMS0wMS0wOCBhdCAxNTowMCAtMDUwMCwgQWxleCBEZXVjaGVyIHdyb3RlOgo+
IE9uIEZyaSwgSmFuIDgsIDIwMjEgYXQgMjozNyBQTSBBbGV4YW5kcmUgRGVtZXJzCj4gPGFsZXhh
bmRyZS5mLmRlbWVyc0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gCj4gPiAKPiA+IE9uIEZyaSwgMjAy
MS0wMS0wOCBhdCAxMDoyOCAtMDUwMCwgQWxleCBEZXVjaGVyIHdyb3RlOgo+ID4gPiBPbiBGcmks
IEphbiA4LCAyMDIxIGF0IDM6MTEgQU0gQ2hyaXN0aWFuIEvDtm5pZwo+ID4gPiA8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+IEhpIEFsZXhh
bmRyZSwKPiA+ID4gPiAKPiA+ID4gPiBBbSAwOC4wMS4yMSB1bSAwNToyMCBzY2hyaWViIEFsZXhh
bmRyZSBEZW1lcnM6Cj4gPiA+ID4gPiBIaSB0aGVyZSwKPiA+ID4gPiA+IAo+ID4gPiA+ID4gU29t
ZSBvZiB5b3UgbWF5IHJlbWVtYmVyIEkgd2FzIHdvcmtpbmcgb24gcG9ydGluZyBWQ0UgMSBmcm9t
Cj4gPiA+ID4gPiBSYWRlb24gdG8KPiA+ID4gPiA+IEFNREdQVSBhIGZldyB5ZWFycyBhZ28uLi4g
YWJvdXQgMyBhbmQgYSBoYWxmIHllYXJzLiBJIGhhZG4ndAo+ID4gPiA+ID4gaGFkCj4gPiA+ID4g
PiB0aW1lCj4gPiA+ID4gPiB0byB3b3JrIG9uIGl0IHVudGlsIGxhc3QgSG9saWRheXMuIEJ1dCB3
aHkgZG8gSSBwZXJzaXN0IGluCj4gPiA+ID4gPiB0aGlzCj4gPiA+ID4gPiB3b3JrPwo+ID4gPiA+
ID4gQmVjYXVzZSBHQ04gMXN0IGdlbiB3YXMgc3RpbGwgdXNlZCBpbiBzb21lIEdQVSBwcm9kdWNl
ZCA0Cj4gPiA+ID4gPiB5ZWFycwo+ID4gPiA+ID4gYWdvCj4gPiA+ID4gPiAoUmFkZW9uIDUyMCBh
bmQganVzdCBiZWZvcmUgUjUgYW5kIFI3IGluIHRoZSBlbnRyeSBsZXZlbCkuCj4gPiA+ID4gCj4g
PiA+ID4gWWVzIGFuZCB0aGF0IGlzIHJlYWxseSB2YWx1ZWQuCj4gPiA+ID4gCj4gPiA+ID4gSWYg
d2UgY2FuIGdldCB0aGF0IHdvcmtpbmcgYW5kIGFuZCBpdCBpcyBmZWF0dXJlIGVxdWl2YWxlbnQg
dG8KPiA+ID4gPiByYWRlb24KPiA+ID4gPiBJJ20gcGVyZmVjdGx5IGZpbmUgdG8gbWVyZ2UgdGhp
cy4KPiA+ID4gPiAKPiA+ID4gPiA+IEknbSBwcmV0dHkgaGFwcHkgd2l0aCB3aGVyZSB0aGUgY29k
ZSBpcyBzaXR0aW5nIG5vdywgaG93ZXZlcgo+ID4gPiA+ID4gSQo+ID4gPiA+ID4gaGF2ZQo+ID4g
PiA+ID4gc29tZSBxdWVzdGlvbnMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IDEtIHNob3VsZCB0aGUg
ZmlybXdhcmUgYmUgdmFsaWRhdGVkIGxpa2UgaXQgd2FzIHVuZGVyIFJhZGVvbgo+ID4gPiA+ID4g
YW5kCj4gPiA+ID4gPiBhcyBpdAo+ID4gPiA+ID4gaXMgZG9uZSBmb3IgdGhlIG5ld2x5IHBvcnRl
ZCBVVkQgMy4xIGNvZGU/IFRoaXMgd291bGQgbWVhbgo+ID4gPiA+ID4gaGF2aW5nCj4gPiA+ID4g
PiB0bwo+ID4gPiA+ID4gd29yayB3aXRoIGtleXNlbGVjdCwgaXNuJ3QgaXQ/Cj4gPiA+ID4gCj4g
PiA+ID4gTm8sIHRoYXQgc2hvdWxkIG9ubHkgYmUgbmVjZXNzYXJ5IGZvciBVVkQuCj4gPiA+ID4g
Cj4gPiA+ID4gPiAyLSBsYXN0IHRpbWUgSSB3b3JrZWQgb24gVkNFIDEuMCwgQ2hyaXN0aWFuIHdh
cyBzYXlpbmcgdGhhdAo+ID4gPiA+ID4gaXQKPiA+ID4gPiA+IHdhcwo+ID4gPiA+ID4gcG9zc2li
bGUgYSBuZXcgVkNFIGZpcm13YXJlIGNvdWxkIGJlIHByb3ZpZGVkIGZvciBBTURHUFUuCj4gPiA+
ID4gPiBUaGVuLAo+ID4gPiA+ID4gaXQKPiA+ID4gPiA+IHdhc24ndCB0aGF0IGNsZWFyLCBHQ04g
MS4wIChTSSkgYmVpbmcgaW4gdHJvdWJsZSBhbmQgaXQgd2FzCj4gPiA+ID4gPiBjb25zaWRlcmVk
Cj4gPiA+ID4gPiB0byBzdHJpcCBpdCBmcm9tIEFNREdQVS4gQW5kIGEgZmV3IG1vbnRocyBhZ28s
IFVWRCBhbmQgREMKPiA+ID4gPiA+IHdlcmUKPiA+ID4gPiA+IGFkZGVkCj4gPiA+ID4gPiBmb3Ig
U0kgdG8gQU1ER1BVIGFuZCBhIG5ldyBVVkQgZmlybXdhcmUgd2FzIHJlbGVhc2VkICh5ZWFoISku
Cj4gPiA+ID4gPiBTbywKPiA+ID4gPiA+IGlzCj4gPiA+ID4gPiBpdCBwb3NzaWJsZSB0byBoYXZl
IGEgbmV3IFZDRSBmaXJtd2FyZT8gSSBwcm9kdWNlZCBhbgo+ID4gPiA+ID4gInVwZGF0ZWQiCj4g
PiA+ID4gPiB0YWhpdGkKPiA+ID4gPiA+IFZDRSBmaWxlIHdoZXJlIGEgaGVhZGVyIGlzIGFkZGVk
IChzY3JpcHQgYXZhaWxhYmxlIG9uIG15Cj4gPiA+ID4gPiBhY2NvdW50Cj4gPiA+ID4gPiBvbgo+
ID4gPiA+ID4gR2l0SHViKS4gU3RpbGwsIGlmIHRoaXMgY2FuIGJlIHVzZWZ1bCwgSSdkIHByZWZl
ciBhbiBvZmZpY2lhbAo+ID4gPiA+ID4gZmlybXdhcmUuCj4gPiA+ID4gCj4gPiA+ID4gTGVvIGFu
ZCBJIGNhbiBwdXNoIG9uY2UgbW9yZSBvbiB0aGlzLCBidXQgbm8gZ3VhcmFudGVlIHRoYXQKPiA+
ID4gPiB0aGlzCj4gPiA+ID4gd2lsbAo+ID4gPiA+IGV2ZXIgc2VlIHRoZSBkYXkgb2YgbGlnaHQu
Cj4gPiA+ID4gCj4gPiA+ID4gSXQgd2FzIGEgcmVhbGx5IGxvbmcgYW5kIHRheGluZyBwcm9jZXNz
IG9mIGdldHRpbmcgVVZEIGZvciBTSQo+ID4gPiA+IG91dAo+ID4gPiA+IG9mIHRoZQo+ID4gPiA+
IGRvb3IuCj4gPiAKPiA+IFdlbGwsIGlmIHRoaXMgZG9lc24ndCBibG9jayBwb3J0aW5nIHRoZSBj
b2RlLCBsZXQncyBqdXN0IGxlYXZlCj4gPiB0aGluZ3MKPiA+IGFzIHRoZXkgYXJlIGZvciBub3cu
Cj4gPiAKPiA+ID4gPiAKPiA+ID4gPiA+IDMtIGlzIHRoZXJlIGFueSBkb2N1bWVudGF0aW9uIGFi
b3V0IFZDRSAxLjAgdGhhdCB3b3VsZCBoZWxwCj4gPiA+ID4gPiBtZQo+ID4gPiA+ID4gY29tcGxl
dGUgdGhpcyB3b3JrPwo+ID4gPiA+IAo+ID4gPiA+IFVuZm9ydHVuYXRlbHkgbm90LCB3ZSBvbmx5
IGhhdmUgd2hhdCB3YXMgZXhwb3NlZCB3aXRoIHRoZQo+ID4gPiA+IGluaXRpYWwKPiA+ID4gPiBj
b2RlIGRyb3AuCj4gPiA+ID4gCj4gPiA+ID4gPiAzLjEtIFNvbWUgdmFyaWFibGVzIHRoYXQgd2Vy
ZSBwcmV2aW91c2x5IGRlZmluZWQgYXJlIG5vdAo+ID4gPiA+ID4gYXZhaWxhYmxlCj4gPiA+ID4g
PiB1bmRlciBzaWQuYywgdmNlX3YxXzBfZC5oLCB2Y2VfdjFfMF9zaF9tYXNrLmggYW5kIG90aGVy
cy4KPiA+ID4gPiA+IFNpbmNlCj4gPiA+ID4gPiB0aGUKPiA+ID4gPiA+IG5ldyB2YWx1ZXMgKG1v
c3RseSBpbiB0aGUgcmFuZ2Ugb2YgMHg4eHh4KSBhcmUgY29tcGxldGVseQo+ID4gPiA+ID4gZGlm
ZmVyZW50Cj4gPiA+ID4gPiBmcm9tIHRoZSBvbmVzIGRlZmluZWQgdW5kZXIgUmFkZW9uIChpbiB0
aGUgcmFuZ2Ugb2YgMHgyeHh4eCksCj4gPiA+ID4gPiBJJ2QKPiA+ID4gPiA+IGxpa2UKPiA+ID4g
PiA+IHRvIGJlIHN1cmUgdG8gdXNlIHRoZSBnb29kIG9uZXMuIEkgd291bGQgYXNzdW1lIHRoZSBt
YXNrcyBhbmQKPiA+ID4gPiA+IHNoaWZ0cwo+ID4gPiA+ID4gYXJlIHN0aWxsIHZhbGlkIHRob3Vn
aC4KPiA+ID4gPiAKPiA+ID4gPiBEbyB5b3UgaGF2ZSBhbiBleGFtcGxlIG9mIHdoYXQgeW91IG5l
ZWQ/Cj4gPiA+IAo+ID4gPiBOb3RlIHRoYXQgcmFkZW9uIHVzZXMgYnl0ZSBhbGlnbmVkIHJlZ2lz
dGVyIGhlYWRlcnMgYW5kIGFtZGdwdQo+ID4gPiB1c2VzCj4gPiA+IGR3b3JkIGFsaWduZWQgcmVn
aXN0ZXJzIGhlYWRlcnMsIHNvIHlvdSdsbCBuZWVkIHRvIHNoaWZ0IHRoZQo+ID4gPiBkZWZpbml0
aW9ucyBhcHByb3ByaWF0ZWx5IGlmIHlvdSBuZWVkIHRvIGFkZCBhbnkgb2YgdGhlIG9mZnNldHMK
PiA+ID4gdG8KPiA+ID4gYW1kZ3B1LsKgIEkgdGhpbmsgdmNlXzFfMCBoZWFkZXJzIHNob3VsZCBi
ZSBmaW5lIHRvIHVzZSBhcyBpcyBpbgo+ID4gPiBhbWRncHUuCj4gPiA+IAo+ID4gPiBBbGV4Cj4g
PiA+IAo+ID4gCj4gPiBBaCBidW1tZXIhIFRoYXQncyB3aHkuIE9LLCBJJ2xsIGtlZXAgdGhhdCBp
biBtaW5kIHJldmlzaW5nIG15IHdvcmsKPiA+IHRoZW4uCj4gPiAKPiA+ID4gPiAKPiA+ID4gPiA+
IDMuMi0gU29tZSBzdGF0dXNlcyBhcmUgdW5kZWZpbmVkLCBzb21ldGltZXMgbWFnaWMgdmFsdWVz
Cj4gPiA+ID4gPiBhcHBlYXIKPiA+ID4gPiA+IGhlcmUKPiA+ID4gPiA+IGFuZCB0aGVyZSB3aXRo
b3V0IGJlaW5nIGV2ZXIgZGVmaW5lZCBvciBkb2N1bWVudGVkIChzdGF0dXMKPiA+ID4gPiA+IDB4
MzM3Zgo+ID4gPiA+ID4gYW55b25lPyksIGV2ZW4gdW5kZXIgQ0lLIG9yIHRoZXkgZG9uJ3Qgc2Vl
bSB0byBiZSBlYXNpbHkKPiA+ID4gPiA+IHBvcnRhYmxlCj4gPiA+ID4gPiBmcm9tCj4gPiA+ID4g
PiBvdGhlciBWQ0UgdmVyc2lvbnMuIEhhdmluZyBhIG5hbWUgZm9yIGEgdmFsdWUgaXMgcmVhbGx5
Cj4gPiA+ID4gPiBoZWxwZnVsCj4gPiA+ID4gPiB3aXRob3V0IGFuIG9mZmljaWFsIGRvY3VtZW50
YXRpb24sIHdoZW4gdGhlIGNvZGUgaXMgc3VwcG9zZWQKPiA+ID4gPiA+IHRvCj4gPiA+ID4gPiBi
ZQo+ID4gPiA+ID4gc2VsZi1kb2N1bWVudGVkLiBJJ3ZlIGJlZW4gYWJsZSB0byBpZGVudGlmeSBz
b21lIG9mIHRoZW0gYnkKPiA+ID4gPiA+IGxvb2tpbmcgYXQKPiA+ID4gPiA+IHZhcmlhYmxlcyB1
c2VkIHVuZGVyIFJhZGVvbiBvciB1bmRlciBBTURHUFUncyBVVkQgMy4xLgo+ID4gPiA+ID4gSW50
ZXJlc3RpbmdseSwKPiA+ID4gPiA+IHNvbWUgdmFyaWFibGVzIHdlcmUgcHJldmlvdXNseSBkZWZp
bmVkIHVuZGVyIFJhZGVvbiwgYnV0IHdlcmUKPiA+ID4gPiA+IGxlZnQKPiA+ID4gPiA+IGFzaWRl
IGluIEFNREdQVS4uLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAzLjMtIEJlaW5nIGFibGUgdG8ga25v
dyBob3cgdG8gcHJvcGVybHkgc2V0L3Jlc2V0IHdoaWNoIHBhcnQsCj4gPiA+ID4gPiBpbgo+ID4g
PiA+ID4gd2hhdAo+ID4gPiA+ID4gb3JkZXIsIGV0Yy4KPiA+ID4gPiAKPiA+ID4gPiBTb3JyeSwg
SSBkb24ndCB0aGluayB3ZSBjYW4gaGVscCB3aXRoIGRvY3VtZW50YXRpb24gaGVyZS4gV2hhdAo+
ID4gPiA+IEkKPiA+ID4gPiBjYW4gZG8KPiA+ID4gPiBpcyB0byB0ZXN0IHlvdXIgc3R1ZmYgb24g
U0kgaGFyZHdhcmUgaWYgeW91IGdldCBzdHVjayB3aXRoCj4gPiA+ID4gc29tZXRoaW5nIGFuZAo+
ID4gPiA+IHJlcG9ydCBiYWNrIHdoYXQgbWlnaHQgYmUgdGhlIGlzc3VlLgo+ID4gCj4gPiBJZiBJ
IGdldCB0aGlzIHdvcmtpbmcgb24gbXkgUjkgMjgwWCwgSSdsbCBnbGFkbHkgbGV0IHlvdSB0ZXN0
IGl0IG9uCj4gPiBvdGhlciBoYXJkd2FyZS4KPiA+IAo+ID4gPiA+IAo+ID4gPiA+ID4gNC0gQW55
IGlucHV0IGFib3V0IDQwIGJpdCBhZGRyZXNzIGxpbWl0YXRpb24gb24gVkNFIDEuMCBhbmQKPiA+
ID4gPiA+IGhvdwo+ID4gPiA+ID4gdG8KPiA+ID4gPiA+IGhhbmRsZSBpdCBpZiBpdCBhcHBsaWVz
Pwo+ID4gPiA+IAo+ID4gPiA+IFlvdSBtZWFuIHRoZSAyNCBiaXQgYWRkcmVzcyBsaW1pdGF0aW9u
IG9mIFVWRCwgZG9uJ3QgeW91PyBUaGF0Cj4gPiA+ID4gc2hvdWxkCj4gPiA+ID4gbm90IGFwcGx5
IHRvIFZDRSBpbiBnZW5lcmFsLgo+ID4gCj4gPiBXZWxsLCBhIGJpdCBvZiB0aGlzLCBhIGJpdCBv
ZiB0aGF0LiBJIGluZGVlZCBzZWUgdGhhdCBVVkQgaGFzIGFuCj4gPiBhZGRyZXNzIGxpbWl0YXRp
b24uIEhvd2V2ZXIsIFZDRSAyIGFuZCAzIGNhbGwgb24gNDBiaXQgQkFSIHdoaWNoCj4gPiB3YXMK
PiA+IG5vdCBkb25lIHRoZSBzYW1lIHVuZGVyIFJhZGVvbiAobm90IHRoYXQgSSd2ZSByZWFsaXpl
ZCkuIEJ1dCB3aXRoCj4gPiBBbGV4J3MgcHJldmlvdXMgY29tbWVudCBhbmQgdGhpcyBpbiBtaW5k
LCBJJ2xsIHJldmlzaXQgdGhpcyBwYXJ0Lgo+ID4gCj4gCj4gVkNFMSBpcyBjb25maWd1cmVkIHBy
ZXR0eSBtdWNoIHRoZSBzYW1lIGFzIFZDRTIuwqAgSXQgbG9va3MgbGlrZQo+IHJhZGVvbgo+IG5l
dmVyIHByb2dyYW1tZWQgdGhlIEJBUiByZWdpc3RlciwgYnV0IHlvdSBzaG91bGQgaW4gYW1kZ3B1
LsKgIFlvdXIKPiBiZXN0IGJldCB3b3VsZCBwcm9iYWJseSBiZSB0byBzdGFydCB3aXRoIHRoZSB2
Y2VfdjIgY29kZSBpbiBhbWRncHUKPiBhbmQKPiBjb3B5IGl0IHRvIGEgbmV3IHZjZV92MSBmaWxl
IGFuZCB0aGVuIHN0YXJ0IGZyb20gdGhlcmUuCj4gCj4gQWxleAo+IApUaGFua3MgZm9yIHRoZSBj
dWUsIFZDRSAyIChhbmQgVkNFIDMgaW4gc29tZSBwYXJ0IHRvIHZhbGlkYXRlKSBoYXMgYmVlbgph
IHBhcnQgb2YgbXkgImluc3BpcmF0aW9uIiwgdGhhdCdzIHRoZSBmZWVsaW5nIEkgaGFkLiBIb3dl
dmVyLCB5b3UgdGVsbAptZSB0aGlzIGVuZm9yY2UgdGhlIGZlZWxpbmcgSSBoYWQgYWJvdXQgaXQu
CgpIb3BlZnVsbHksIG15IEhvbGlkYXlzIHdvcmsgd2lsbCBjb21lIHRvIGZydWl0aW9uIHNvb24u
CgpBbGV4YW5kcmUKPiAKPiA+ID4gPiAKPiA+ID4gPiA+IDUtIEFueSBjaGFuY2UgdG8gaGF2ZSBz
b21lIGNvZGUgcmV2aWV3ZWQgZXZlbiBpZiBpdCBzdGlsbAo+ID4gPiA+ID4gZG9lc24ndAo+ID4g
PiA+ID4gd29yawo+ID4gPiA+ID4gaWYgSSBzZW5kIGl0IG9uIHRoaXMgbGlzdD8KPiA+ID4gPiAK
PiA+ID4gPiBMZXQncyB0cnkgdG8gZ2V0IGl0IHdvcmtpbmcgZmlyc3QuCj4gPiBPay4gSSdsbCBj
b21lIGJhY2sgaWYgSSBuZWVkIG1vcmUgaW5mby4KPiA+IAo+ID4gPiA+IAo+ID4gPiA+ID4gNi0g
SSBoYXZlIHNvbWUgcGF0Y2hlcyBvbiB0aGUgc2lkZSB0byBoZWxwIGRvY3VtZW50IHRoZSBjb2Rl
Cj4gPiA+ID4gPiBhbmQKPiA+ID4gPiA+IGRlZmluZSB2YXJpYWJsZXMgKGV2ZW4gZm9yIFJhZGVv
biksIGEgZmV3IHR5cG9zIGZpeGVkLCBldGMuCj4gPiA+ID4gPiBTaG91bGQgSQo+ID4gPiA+ID4g
c2VuZCB0aGVtIG9uIHRoaXMgbGlzdD8KPiA+ID4gPiAKPiA+ID4gPiBGb3IgcmFkZW9uIHdlIGFy
ZSBtb3JlIG9yIGxlc3MgaW4gYSBtYWludGVuYW5jZSBtb2RlLiBJZiBpdAo+ID4gPiA+IGp1c3QK
PiA+ID4gPiBhZGRzCj4gPiA+ID4gY29tbWVudHMgdGhlbiB3ZSBjYW4gY2VydGFpbmx5IGFkZCBp
dCwgYnV0IGlmIHlvdSBoYXZlIGFueQo+ID4gPiA+IGZ1bmN0aW9uYWwKPiA+ID4gPiBjaGFuZ2Ug
SSB3b3VsZCBiZSBhIGJpdCBoZXNpdGF0ZWQuCj4gPiBObywgYWVzdGhldGljIG9ubHkuIDspIEkn
bGwgc2VuZCB0aGVtIGF0IHNvbWUgcG9pbnQgdGhlbi4KPiA+IAo+ID4gVGhhbmtzIHRvIGJvdGgg
b2YgeW91Lgo+ID4gQWxleGFuZHJlCj4gPiAKPiA+ID4gPiAKPiA+ID4gPiBSZWdhcmRzLAo+ID4g
PiA+IENocmlzdGlhbi4KPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gQ2hlZXJzCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IEFsZXhhbmRyZSBEZW1lcnMKPiA+ID4gPiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gPiBhbWQtZ2Z4IG1haWxp
bmcgbGlzdAo+ID4gPiA+ID4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gPiA+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo+
ID4gPiA+IAo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiA+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+ID4gPiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+ID4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeAo+ID4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngK
