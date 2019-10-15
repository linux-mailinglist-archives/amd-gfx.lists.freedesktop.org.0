Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7D4D80D9
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 22:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A4B6E3E7;
	Tue, 15 Oct 2019 20:18:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6B86E3D0
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 20:16:09 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id p12so3481731pgn.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 13:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T6wGmR3qIig/wVR5vsFEQByfOvdwbfZeNFvYpJXRBa8=;
 b=A2hqRV16S096HC3vNfJIvhy2xmrYX2xjKu5xDsPMXlGtrcykyKJ0yNUPCRavjrR/1c
 E0QhSUwQBWGd9W7QSpVPwcBqKOUP9Y3LQbsy2QC3XzyhNZHNbxS3ddys87vQ0twIGQmY
 XoooTNcAvprzDSVShUS9TEAwZSrusFUBn4T1WKBamVFcoc/eg3LGBwxszLrkDyHhysNz
 5RuA4lFNt//TMQWKruKqDnRt6O5X0j1Ili+Y/k9edqourm1P6ceYGFNnQvog52Tu/jrg
 mjQ/2FfARhHtrokyFaW0gSL3fcUbTm4UKfUjARJZhf88ijAV24Eu+QfNM6cuVvk9dzNq
 4CbQ==
X-Gm-Message-State: APjAAAXlXO5snGVJo8WQRwVcC73Nc0m/PvXw7u7+Bd4FFNw7a4fHn7uy
 tHmDMhJFHcf4dpNetOoprR2U7nHCTF6I34cQMGGO9w==
X-Google-Smtp-Source: APXvYqw7meAgMvqhoBX/JmtJARgYzLvgCyfPRVahL0fEM4fvkw+hKAvA0vpgplsq2FMo1H1eF/kDPG6m6XvNRSH+zXE=
X-Received: by 2002:a17:90a:aa81:: with SMTP id l1mr7575pjq.73.1571170568840; 
 Tue, 15 Oct 2019 13:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
 <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
 <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
 <CAKwvOdnLxm_tZ_qR1D-BE64Z3QaMC2h79ooobdRVAzmCD_2_Sg@mail.gmail.com>
 <CADnq5_P55aRJ-1VVz2uKA=xpddyi0BvDcXqPD=xVpw3aJZrzng@mail.gmail.com>
In-Reply-To: <CADnq5_P55aRJ-1VVz2uKA=xpddyi0BvDcXqPD=xVpw3aJZrzng@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Oct 2019 13:15:57 -0700
Message-ID: <CAKwvOdme6g7rr+AkJi6Do6Rzq7zYAJm+spQaBF3cwgKU1H2ThQ@mail.gmail.com>
Subject: Re: AMDGPU and 16B stack alignment
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Approved-At: Tue, 15 Oct 2019 20:18:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=T6wGmR3qIig/wVR5vsFEQByfOvdwbfZeNFvYpJXRBa8=;
 b=ZkUC2VvDYeB3kimGxCTRRiD6bzPRrvilRsSrHzdhRZReqGG/sMYHd0CtpUqzg+AYzz
 0/qxUZbei0laUxbaw9rodRBLy8qXWgm+ZoRg4PN4dyrgwyG8HVZXO3z4PjsXC3KdypNL
 wtxm1iWMXo5b1v00eON247x2iP9hOTCKPuYNDnSV6+FwovdrWx/tH18faL5Q9dLC0YkM
 dk4fJmPQ7jPZga/o3RCC8FC6wsGS0vnSN6X+J3hcWTFjD6m0Hx2TN739Gvh7KwrbZg4Q
 s1pimPih476jfM0Yyhiju2TgFAnzvERrrqBZvUA/w/0yiH7Q+GJG/m3Qdj5Kn70u5iDH
 zZoQ==
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Matthias Kaehlcke <mka@google.com>, "S,
 Shirish" <sshankar@amd.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "S, Shirish" <Shirish.S@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 "yshuiv7@gmail.com" <yshuiv7@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTE6MzAgQU0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hl
ckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMjowNyBQTSBO
aWNrIERlc2F1bG5pZXJzCj4gPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAxMjoxOSBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgOTowOCBB
TSBTLCBTaGlyaXNoIDxzc2hhbmthckBhbWQuY29tPiB3cm90ZToKPiA+ID4gPiBPbiAxMC8xNS8y
MDE5IDM6NTIgQU0sIE5pY2sgRGVzYXVsbmllcnMgd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gTXkgZ2Nj
IGJ1aWxkIGZhaWxzIHdpdGggYmVsb3cgZXJyb3JzOgo+ID4gPiA+Cj4gPiA+ID4gZGNuX2NhbGNz
LmM6MTowOiBlcnJvcjogLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9MyBpcyBub3QgYmV0d2Vl
biA0IGFuZCAxMgo+ID4gPiA+Cj4gPiA+ID4gZGNuX2NhbGNfbWF0aC5jOjE6MDogZXJyb3I6IC1t
cHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTMgaXMgbm90IGJldHdlZW4gNCBhbmQgMTIKPiA+Cj4g
PiBJIHdhcyBhYmxlIHRvIHJlcHJvZHVjZSB0aGlzIGZhaWx1cmUgb24gcHJlLTcuMSB2ZXJzaW9u
cyBvZiBHQ0MuICBJdAo+ID4gc2VlbXMgdGhhdCB3aGVuOgo+ID4gMS4gY29kZSBpcyB1c2luZyBk
b3VibGVzCj4gPiAyLiBzZXR0aW5nIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTMgLW1uby1z
c2UyLCBpZS4gOEIgc3RhY2sgYWxpZ25tZW50Cj4gPiB0aGFuIEdDQyBwcm9kdWNlcyB0aGF0IGVy
cm9yOgo+ID4gaHR0cHM6Ly9nb2Rib2x0Lm9yZy96LzdUOG5iSAo+ID4KPiA+IFRoYXQncyBhbHJl
YWR5IGEgdGFsbCBvcmRlciBvZiBjb25zdHJhaW50cywgc28gaXQncyB1bmRlcnN0YW5kYWJsZQo+
ID4gdGhhdCB0aGUgY29tcGlsZXIgd291bGQganVzdCBlcnJvciBsaWtlbHkgZHVyaW5nIGluc3Ry
dWN0aW9uCj4gPiBzZWxlY3Rpb24sIGJ1dCB3YXMgZXZlbnR1YWxseSB0YXVnaHQgaG93IHRvIHNv
bHZlIHN1Y2ggY29uc3RyYWludHMuCj4gPgo+ID4gPiA+Cj4gPiA+ID4gV2hpbGUgR1BGIG9ic2Vy
dmVkIG9uIGNsYW5nIGJ1aWxkcyBzZWVtIHRvIGJlIGZpeGVkLgo+ID4KPiA+IFRoYW5rcyBmb3Ig
dGhlIHJlcG9ydC4gIFlvdXIgdGVzdGluZyB0aGVzZSBwYXRjaGVzIGlzIGludmFsdWFibGUsIFNo
aXJpc2ghCj4gPgo+ID4gPgo+ID4gPiBPaywgc28gaXQgc2VlbXMgdGhhdCBnY2MgaW5zaXN0cyBv
biBoYXZpbmcgYXQgbGVhc3QgMl40IGJ5dGVzIHN0YWNrCj4gPiA+IGFsaWdubWVudCB3aGVuCj4g
PiA+IFNTRSBpcyBlbmFibGVkIG9uIHg4Ni02NCwgYnV0IGRvZXMgbm90IGFjdHVhbGx5IHJlbHkg
b24gdGhhdCBmb3IKPiA+ID4gY29ycmVjdCBvcGVyYXRpb24KPiA+ID4gdW5sZXNzIGl0J3MgdXNp
bmcgc3NlMi4gU28gLW1zc2UgYWx3YXlzIGhhcyB0byBiZSBwYWlyZWQgd2l0aAo+ID4gPiAgLW1w
cmVmZXJyZWQtc3RhY2stYm91bmRhcnk9My4KPiA+Cj4gPiBTZWVtaW5nbHkgb25seSBmb3Igb2xk
ZXIgdmVyc2lvbnMgb2YgR0NDLCBwcmUgNy4xLgo+ID4KPiA+ID4KPiA+ID4gRm9yIGNsYW5nLCBp
dCBzb3VuZHMgbGlrZSB0aGUgb3Bwb3NpdGUgaXMgdHJ1ZTogd2hlbiBwYXNzaW5nIDE2IGJ5dGUK
PiA+ID4gc3RhY2sgYWxpZ25tZW50Cj4gPiA+IGFuZCBoYXZpbmcgc3NlL3NzZTIgZW5hYmxlZCwg
aXQgcmVxdWlyZXMgdGhlIGluY29taW5nIHN0YWNrIHRvIGJlIDE2Cj4gPiA+IGJ5dGUgYWxpZ25l
ZCwKPiA+Cj4gPiBJIGRvbid0IHRoaW5rIGl0IHJlcXVpcmVzIHRoZSBpbmNvbWluZyBzdGFjayB0
byBiZSAxNkIgYWxpZ25lZCBmb3IKPiA+IHNzZTIsIEkgdGhpbmsgaXQgcmVxdWlyZXMgdGhlIGlu
Y29taW5nIGFuZCBjdXJyZW50IHN0YWNrIGFsaWdubWVudCB0bwo+ID4gbWF0Y2guIFRvZGF5IGl0
IGRvZXMgbm90LCB3aGljaCBpcyB3aHkgd2Ugb2JzZXJ2ZSBHUEZzLgo+ID4KPiA+ID4gYnV0IHBh
c3NpbmcgOCBieXRlIGFsaWdubWVudCBtYWtlcyBpdCBkbyB0aGUgcmlnaHQgdGhpbmcuCj4gPiA+
Cj4gPiA+IFNvLCBzaG91bGQgd2UganVzdCBhbHdheXMgcGFzcyAkKGNhbGwgY2Mtb3B0aW9uLCAt
bXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00KQo+ID4gPiB0byBnZXQgdGhlIGRlc2lyZWQgb3V0
Y29tZSBvbiBib3RoPwo+ID4KPiA+IEhtbW0uLi5JIHdvdWxkIGhhdmUgbGlrZWQgdG8gcmVtb3Zl
IGl0IG91dHJpZ2h0LCBhcyBpdCBpcyBhbiBBQkkKPiA+IG1pc21hdGNoIHRoYXQgaXMgbGlrZWx5
IHRvIHJlc3VsdCBpbiBpbnN0YWJpbGl0eSBhbmQgbm9uLWZ1bi10by1kZWJ1Zwo+ID4gcnVudGlt
ZSBpc3N1ZXMgaW4gdGhlIGZ1dHVyZS4gIEkgc3VzcGVjdCBteSBwYXRjaCBkb2VzIHdvcmsgZm9y
IEdDQwo+ID4gNy4xKy4gIFRoZSBxdWVzdGlvbiBpczogRG8gd2Ugd2FudCB0byBlaXRoZXI6Cj4g
PiAxLiBtYXJrIEFNREdQVSBicm9rZW4gZm9yIEdDQyA8IDcuMSwgb3IKPiA+IDIuIGNvbnRpbnVl
IHN1cHBvcnRpbmcgaXQgdmlhIHN0YWNrIGFsaWdubWVudCBtaXNtYXRjaD8KPiA+Cj4gPiAyIGlz
IGJyaXR0bGUsIGFuZCBtYXkgYnJlYWsgYXQgYW55IHBvaW50IGluIHRoZSBmdXR1cmUsIGJ1dCBp
ZiBpdCdzCj4gPiB3b3JraW5nIGZvciBzb21lb25lIGl0IGRvZXMgbWFrZSBtZSBmZWVsIGJhZCB0
byBvdXRyaWdodCBkaXNhYmxlIGl0Lgo+ID4gV2hhdCBJJ2QgaW1hZ2UgMiBsb29rcyBsaWtlIGlz
IChwc3VlZG8gY29kZSBpbiBhIE1ha2VmaWxlKToKPgo+IFdlbGwsIGl0J3MgYmVlbiB3b3JraW5n
IGFzIGlzIGZvciB5ZWFycyBub3csIGF0IGxlYXN0IHdpdGggZ2NjLCBzbyBJJ2QKPiBoYXRlIHRv
IGJyZWFrIHRoYXQuCgpPaywgSSdtIGhhcHB5IHRvIGxlYXZlIHRoYXQgYXMgaXMgZm9yIEdDQywg
dGhlbi4gIFdvdWxkIHlvdSBwcmVmZXIgSQptb2RpZnkgaXQgZm9yIEdDQyA+Ny4xIG9yIGp1c3Qg
bGVhdmUgaXQgYWxvbmUgKG1heWJlIEknbGwgYWRkIGEKY29tbWVudCBhYm91dCAqd2h5KiBpdCdz
IGRvbmUgZm9yIEdDQyk/IFdvdWxkIHlvdSBwcmVmZXIgMSBwYXRjaCBvciA0PwoKPgo+IEFsZXgK
Pgo+ID4KPiA+IGlmIENDX0lTX0dDQyAmJiBHQ0NfVkVSU0lPTiA8IDcuMToKPiA+ICAgc2V0IHN0
YWNrIGFsaWdubWVudCB0byAxNkIgYW5kIGhvcGUgZm9yIHRoZSBiZXN0CgpJZSwgdGhpcyBeCgo+
ID4KPiA+IFNvIG15IGRpZmYgd291bGQgYmUgYW1lbmRlZCB0byBrZWVwIHRoZSBzdGFjayBhbGln
bm1lbnQgZmxhZ3MsIGJ1dAo+ID4gb25seSB0byBzdXBwb3J0IEdDQyA8IDcuMS4gIEFuZCB0aGF0
IGFzc3VtZXMgbXkgY2hhbmdlIGNvbXBpbGVzIHdpdGgKPiA+IEdDQyA3LjErLiAoTG9va3MgbGlr
ZSBpdCBkb2VzIGZvciBtZSBsb2NhbGx5IHdpdGggR0NDIDguMywgYnV0IEkgd291bGQKPiA+IGZl
ZWwgZXZlbiBtb3JlIGNvbmZpZGVudCBpZiBzb21lb25lIHdpdGggaGFyZHdhcmUgdG8gdGVzdCBv
biBhbmQgR0NDCj4gPiA3LjErIGNvdWxkIGJvb3QgdGVzdCkuCgotLSAKVGhhbmtzLAp+TmljayBE
ZXNhdWxuaWVycwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
