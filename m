Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC085D0FD
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 15:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED22B89E1B;
	Tue,  2 Jul 2019 13:50:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE0589E33
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 13:50:54 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id a127so13076414oii.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 06:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WezeoBf/cfgIa0yzAvnJfeFq8JIZ8cgxj/5y5XlfjYQ=;
 b=W8B/G1BPIMq0mptPEFvco9n71SnxE3WZxQhH5bMgfG2Dta3lmx8f2+KRH1jOZbIGs5
 u3GUZNeFQtj0S3d8CdnvGcEImQtZJX3u9w5WW8v/6y3FF900WE9R9N1IV0YR0S7vi3jN
 eojoK4WOQCLId9XXBnPu3N4GmvnITxPwcl+r7W6Kng2egi04hP/v13nNMrg7mdHmpy6m
 +R6kN3dh2xqHHnn9StcYT/qTjqyVPM2tg/EIww2Z/D548MB5mpsEH7P+ekYyGkFF/H98
 c0OprEW0glP7lC6j356KU67z1SyR07LlNj4oCCRmzl88BYS92UXuSc71ydOwbUIfuIgC
 lglw==
X-Gm-Message-State: APjAAAXZQK/NoJif6Mh2p4ioOvIgd/Eu+A8wIvPm469TYYiuM6FHiOji
 aDdaBvbltcK5By4bsjy+YxLX6D+MTF4oup1RmJwM3rwZ
X-Google-Smtp-Source: APXvYqywVcwe7VgcoD890a0LI7/whdiVO68ghgOjHJMMY7WzurwPnY5Kj5hXBxMeGnSWARYDAIJLxBDxKEUNqnilQ6I=
X-Received: by 2002:aca:b2d5:: with SMTP id b204mr2718782oif.101.1562075453730; 
 Tue, 02 Jul 2019 06:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190627101813.61430-1-christian.koenig@amd.com>
 <20190627101813.61430-2-christian.koenig@amd.com>
 <CAKMK7uGtdSxVSUor8P_8XH+uf4_A-kRfY6h+XnJoizscWE4AOg@mail.gmail.com>
 <f1a792c2-87e0-9aba-c6f1-0374122d025b@gmail.com>
 <CAKMK7uFoeugD0ASHm4DRLzq6h3aAvNhE1ODh-bxoH7Lucf1m3w@mail.gmail.com>
 <5e182e5d-efcb-00bd-fa31-6e8bc9571ce6@amd.com>
 <20190627171053.GN12905@phenom.ffwll.local>
 <4844af2e-fbff-ceb9-c16e-32bb7012559f@amd.com>
 <CAKMK7uF2Wb_K9MqALs8o_2i+HDhv=JcnHj6t4VAUO80UVpszZQ@mail.gmail.com>
 <6e9b4005-e490-ab27-2051-1eab801dafd3@amd.com>
 <CAKMK7uFMZLemYkWTyOH_0akUbE53X44Xj7jky90G-jWtwSUicw@mail.gmail.com>
 <92ea4ca1-bb9d-e4d7-792a-33b74f25ccf8@gmail.com>
 <CAKMK7uG-5e_V1OmWJKyHLGLXhBbex1LCVV7cdWjAgLSk-kTozA@mail.gmail.com>
 <1031bb44-449a-f18b-d217-2cb5a4f820f7@amd.com>
 <CAKMK7uFDKDhJQ05b6yb8Srz5E=YkzL+PGTZTYZX-b5dmWrwBVQ@mail.gmail.com>
 <af333288-9804-30e4-28ef-fda4c18b4a5d@amd.com>
 <CAKMK7uEQA1CCWLynH3zFK4PtHdzsJ7c=eAyumuhT58Zw455DHg@mail.gmail.com>
 <060a49d3-7196-1440-db93-4a19c9170f1b@amd.com>
In-Reply-To: <060a49d3-7196-1440-db93-4a19c9170f1b@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 2 Jul 2019 15:50:42 +0200
Message-ID: <CAKMK7uGst+Vs+GLgX4f78x-ZgxVGSwELR+y0=WZ4o7fF0Xqqxg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dma-buf: cleanup shared fence removal
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WezeoBf/cfgIa0yzAvnJfeFq8JIZ8cgxj/5y5XlfjYQ=;
 b=IhxRx9wkOx+cVhXQG/jsPbqlU0fRGF19yc8bQNMB3tcKJo382Kgunhmp5okXsVIE1I
 SQe5YC2UERFertwMhkQgYkbNsRNt2jWAjYjAaENNXo+Nd/WjajxtfeC0DGsyg5wq2Rwq
 9uBapP47jphp5Q5uQAxSNtkBbNeQmKNc6yUFQ=
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgNzozMiBQTSBLb2VuaWcsIENocmlzdGlhbgo8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDI4LjA2LjE5IHVtIDE4OjQwIHNjaHJp
ZWIgRGFuaWVsIFZldHRlcjoKPiA+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDU6MjEgUE0gS29l
bmlnLCBDaHJpc3RpYW4KPiA+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4+
IEFtIDI4LjA2LjE5IHVtIDE2OjM4IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+PiBbU05JUF0K
PiA+Pj4+Pj4+IC0gd2hlbiB5b3Ugc3VibWl0IGNvbW1hbmQgYnVmZmVycywgeW91IF9kb250XyBh
dHRhY2ggZmVuY2VzIHRvIGFsbAo+ID4+Pj4+Pj4gaW52b2x2ZWQgYnVmZmVycwo+ID4+Pj4+PiBU
aGF0J3Mgbm90IGdvaW5nIHRvIHdvcmsgYmVjYXVzZSB0aGVuIHRoZSBtZW1vcnkgbWFuYWdlbWVu
dCB0aGVuIHRoaW5rcwo+ID4+Pj4+PiB0aGF0IHRoZSBidWZmZXIgaXMgaW1tZWRpYXRlbHkgbW92
YWJsZSwgd2hpY2ggaXQgaXNuJ3QsCj4gPj4+Pj4gSSBndWVzcyB3ZSBuZWVkIHRvIGZpeCB0aGF0
IHRoZW4uIEkgcHJldHR5IG11Y2ggYXNzdW1lZCB0aGF0Cj4gPj4+Pj4gLT5ub3RpZnlfbW92ZSBj
b3VsZCBhZGQgd2hhdGV2ZXIgZmVuY2VzIHlvdSBtaWdodCB3YW50IHRvIGFkZC4gV2hpY2gKPiA+
Pj4+PiB3b3VsZCB2ZXJ5IG5lYXRseSBhbGxvdyB1cyB0byBzb2x2ZSB0aGlzIHByb2JsZW0gaGVy
ZSwgaW5zdGVhZCBvZgo+ID4+Pj4+IGNvbWluZyB1cCB3aXRoIGZha2UgZmVuY2VzIGFuZCBmdW4g
c3R1ZmYgbGlrZSB0aGF0Lgo+ID4+Pj4gQWRkaW5nIHRoZSBmZW5jZSBsYXRlciBvbiBpcyBub3Qg
YSBzb2x1dGlvbiBiZWNhdXNlIHdlIG5lZWQgc29tZXRoaW5nCj4gPj4+PiB3aGljaCBiZWZvcmVo
YW5kIGNhbiBjaGVjayBpZiBhIGJ1ZmZlciBpcyBtb3ZhYmxlIG9yIG5vdC4KPiA+Pj4+Cj4gPj4+
PiBJbiB0aGUgY2FzZSBvZiBhIG1vdmVfbm90aWZ5IHRoZSBkZWNpc2lvbiB0byBtb3ZlIGl0IGlz
IGFscmVhZHkgZG9uZSBhbmQKPiA+Pj4+IHlvdSBjYW4ndCBzYXkgb2ggc29ycnkgSSBoYXZlIHRv
IGV2aWN0IG15IHByb2Nlc3MgYW5kIHJlcHJvZ3JhbSB0aGUKPiA+Pj4+IGhhcmR3YXJlIG9yIHdo
YXRldmVyLgo+ID4+Pj4KPiA+Pj4+IEVzcGVjaWFsbHkgd2hlbiB5b3UgZG8gdGhpcyBpbiBhbiBP
T00gc2l0dWF0aW9uLgo+ID4+PiBXaHk/IEkgbWVhbiB3aGVuIHRoZSBmZW5jZSBmb3IgYSBDUyBp
cyB0aGVyZSBhbHJlYWR5LCBpdCBtaWdodCBhbHNvCj4gPj4+IHN0aWxsIGhhbmcgb3V0IGluIHRo
ZSBzY2hlZHVsZXIsIG9yIGJlIGJsb2NrZWQgb24gYSBmZW5jZSBmcm9tIGFub3RoZXIKPiA+Pj4g
ZHJpdmVyLCBvciBhbnl0aGluZyBsaWtlIHRoYXQuIEkgZG9uJ3Qgc2VlIGEgY29uY2VwdHVhbCBk
aWZmZXJlbmNlLgo+ID4+PiBQbHVzIHdpdGggZHluYW1pYyBkbWEtYnVmIHRoZSBlbnRpcmUgcG9p
bnQgaXMgdGhhdCBhbiBhdHRhY2hlZCBmZW5jZXMKPiA+Pj4gZG9lcyBfbm90XyBtZWFuIHRoZSBi
dWZmZXIgaXMgcGVybWFuZW50bHkgcGlubmVkLCBidXQgY2FuIGJlIG1vdmVkIGlmCj4gPj4+IHlv
dSBzeW5jIGNvcnJlY3RseS4gTWlnaHQgbmVlZCBhIGJpdCBvZiB0dW5pbmcgb3IgYSBmbGFnIHRv
IGluZGljYXRlCj4gPj4+IHRoYXQgc29tZSBidWZmZXJzIHNob3VsZCBhbHdhc3kgY29uc2lkZXJl
ZCB0byBiZSBidXN5LCBhbmQgdGhhdCB5b3UKPiA+Pj4gc2hvdWxkbid0IHN0YXJ0IGV2aWN0aW5n
IHRob3NlLiBCdXQgdGhhdCdzIGtpbmRhIGEgZGV0YWlsLgo+ID4+Pgo+ID4+PiAgIEZyb20gYSB2
ZXJ5IGhpZ2ggbGV2ZWwgdGhlcmUncyByZWFsbHkgbm8gZGlmZmVyZW5jZSBiZXR3ZW4KPiA+Pj4g
LT5ub3RpZnlfbW92ZSBhbmQgdGhlIGV2aWN0aW9uX2ZlbmNlLiBCb3RoIGdpdmUgeW91IGEgY2Fs
bGJhY2sgd2hlbgo+ID4+PiBzb21lb25lIGVsc2UgbmVlZHMgdG8gbW92ZSB0aGUgYnVmZmVyLCB0
aGF0J3MgYWxsLiBUaGUgb25seSBkaWZmZXJlbmNlCj4gPj4+IGlzIHRoYXQgdGhlIGV2aWN0aW9u
X2ZlbmNlIHRoaW5nIGp1bWJsZXMgdGhlIGNhbGxiYWNrIGFuZCB0aGUgZmVuY2UKPiA+Pj4gaW50
byBvbmUsIGJ5IHByZWF0dGFjaGluZyBhIGZlbmNlIGp1c3QgaW4gY2FzZS4gQnV0IGFnYWluIGZy
b20gYQo+ID4+PiBjb25jZXB0dWFsIHBvdiBpdCBkb2Vzbid0IG1hdHRlciB3aGV0aGVyIHRoZSBm
ZW5jZSBpcyBhbHdheXMgaGFuZ2luZwo+ID4+PiBhcm91bmQsIG9yIHdoZXRoZXIgeW91IGp1c3Qg
YXR0YWNoIGl0IHdoZW4gLT5ub3RpZnlfbW92ZSBpcyBjYWxsZWQuCj4gPj4gU3VyZSB0aGVyZSBp
cyBhIGRpZmZlcmVuY2UuIFNlZSB3aGVuIHlvdSBhdHRhY2ggdGhlIGZlbmNlIGJlZm9yZWhhbmQg
dGhlCj4gPj4gbWVtb3J5IG1hbmFnZW1lbnQgY2FuIGtub3cgdGhhdCB0aGUgYnVmZmVyIGlzIGJ1
c3kuCj4gPj4KPiA+PiBKdXN0IGltYWdpbmUgdGhlIGZvbGxvd2luZzogV2UgYXJlIGluIGFuIE9P
TSBzaXR1YXRpb24gYW5kIG5lZWQgdG8gc3dhcAo+ID4+IHRoaW5ncyBvdXQgdG8gZGlzayEKPiA+
Pgo+ID4+IFdoZW4gdGhlIGZlbmNlIGlzIGF0dGFjaGVkIGJlZm9yZWhhbmQgdGhlIGhhbmRsaW5n
IGNhbiBiZSBhcyBmb2xsb3dpbmc6Cj4gPj4gMS4gTU0gcGlja3MgYSBCTyBmcm9tIHRoZSBMUlUg
YW5kIHN0YXJ0cyB0byBldmljdCBpdC4KPiA+PiAyLiBUaGUgZXZpY3Rpb24gZmVuY2UgaXMgZW5h
YmxlZCBhbmQgd2Ugc3RvcCB0aGUgcHJvY2VzcyB1c2luZyB0aGlzIEJPLgo+ID4+IDMuIEFzIHNv
b24gYXMgdGhlIHByb2Nlc3MgaXMgc3RvcHBlZCB0aGUgZmVuY2UgaXMgc2V0IGludG8gdGhlIHNp
Z25hbGVkCj4gPj4gc3RhdGUuCj4gPj4gNC4gTU0gbmVlZHMgdG8gZXZpY3QgbW9yZSBCT3MgYW5k
IHNpbmNlIHRoZSBmZW5jZSBmb3IgdGhpcyBwcm9jZXNzIGlzCj4gPj4gbm93IGluIHRoZSBzaWdu
YWxlZCBzdGF0ZSBpdCBjYW4gaW50ZW50aW9uYWxseSBwaWNrIHRoZSBvbmVzIHVwIHdoaWNoCj4g
Pj4gYXJlIG5vdyBpZGxlLgo+ID4+Cj4gPj4gV2hlbiB3ZSBhdHRhY2ggdGhlIGZlbmNlIG9ubHkg
b24gZXZpY3Rpb24gdGhhdCBjYW4ndCBoYXBwZW4gYW5kIHRoZSBNTQo+ID4+IHdvdWxkIGp1c3Qg
cGljayB0aGUgbmV4dCByYW5kb20gQk8gYW5kIHBvdGVudGlhbGx5IHN0b3AgYW5vdGhlciBwcm9j
ZXNzLgo+ID4+Cj4gPj4gU28gSSB0aGluayB3ZSBjYW4gc3VtbWFyaXplIHRoYXQgdGhlIG1lbW9y
eSBtYW5hZ2VtZW50IGRlZmluaXRlbHkgbmVlZHMKPiA+PiB0byBrbm93IGJlZm9yZWhhbmQgaG93
IGNvc3RseSBpdCBpcyB0byBldmljdCBhIEJPLgo+ID4+Cj4gPj4gQW5kIG9mIGNvdXJzZSBpbXBs
ZW1lbnQgdGhpcyB3aXRoIGZsYWdzIG9yIHVzZSBjb3VudGVycyBvciB3aGF0ZXZlciwgYnV0Cj4g
Pj4gd2UgYWxyZWFkeSBoYXZlIHRoZSBmZW5jZSBpbmZyYXN0cnVjdHVyZSBhbmQgSSBkb24ndCBz
ZWUgYSByZWFzb24gbm90IHRvCj4gPj4gdXNlIGl0Lgo+ID4gT2ssIGZvciB0aGUgc2FrZSBvZiB0
aGUgYXJndW1lbnQgbGV0J3MgYnV5IHRoaXMuCj4gPgo+ID4gV2h5IGRvIHdlIG5lZWQgYSAtPm5v
dGlmeV9tb3ZlIGNhbGxiYWNrIHRoZW4/IFdlIGhhdmUgaXQgYWxyZWFkeSwgd2l0aAo+ID4gdGhl
c2Ugc3BlY2lhbCBmZW5jZXMuCj4KPiBZZWFoLCB0aGF0IHNhbWUgdGhvdWdodCBjYW1lIHRvIG15
IG1pbmQgYXMgd2VsbC4KPgo+IE9uZSBkaWZmZXJlbmNlIGlzIHRoYXQgbm90aWZ5X21vdmUgaXMg
b25seSBjYWxsZWQgd2hlbiB0aGUgQk8gaXMKPiBhY3R1YWxseSBtb3ZlZCwgd2hpbGUgdGhlIGZl
bmNlIGNhbiBiZSBjYWxsZWQgZm9yIG90aGVyIHN5bmNocm9uaXphdGlvbgo+IHJlYXNvbnMgYXMg
d2VsbC4KClllYWggSSB0aGluayB0aGF0J3MgdGhlIG9ubHkgY3J1eC4gWW91IGNhbiBlaXRoZXIg
dXNlIHRoZSByZXN2X29iaiBmb3IKdGhlIG1hZ2ljIGV2aWN0aW9uX2ZlbmNlLCBvciBmb3IgaW1w
bGljaXQgc3luYy4gQnV0IGlmIHlvdSB3YW50IHRvIGRvCmJvdGggYXQgdGhlIHNhbWUgdGltZSwg
aXQncyBnb2luZyB0byBiZSB0cm91YmxlLiBPciBhdCBsZWFzdCBJJ20gbm90CnNlZWluZyBob3cg
dGhhdCBjb3VsZCB3b3JrIC4uLgoKYXRtIG5vdCBhIHByb2JsZW0gd2l0aCBvbmx5IGFtZGtmZCB1
c2luZyB0aGF0IHN1Ym1pc3Npb24gbW9kZWwsIGJ1dCBJCmV4cGVjdCB0aGlzIG1vZGVsIG9mIGhh
dmluZyBhIHNlbWktc3RhdGljIHdvcmtpbmcgc2V0ICsgdXNlcnNwYWNlIGp1c3QKc3VibWl0dGlu
ZyBiYXRjaGVzIHRvIHNwcmVhZC4gQW5kIGl0J2xsIHByb2JhYmx5IHNwcmVhZCBmYXN0ZXIgdGhh
biB3ZQpjYW4gcmV0aXJlIGltcGxpY2l0IGZlbmNpbmcgLi4uCgo+ID4gT3RoZXIgc2lkZTogSWYg
YWxsIHlvdSB3YW50IHRvIGtub3cgaXMgd2hldGhlciB5b3UgY2FuIHVubWFwIGEgYnVmZmVyCj4g
PiBpbW1lZGlhdGVseSwgZm9yIHNvbWUgc2hvcnQgZW5vdWdoIHZhbHVlIG9mIGltbWVkaWF0ZWx5
IChJIGd1ZXNzIGEKPiA+IGJ1bmNoIG9mIHBhZ2V0YWJsZSB3cml0ZXMgc2hvdWxkIGJlIG9rKSwg
dGhlbiB3aHkgbm90IGFkZCB0aGF0PyBUaGUgIkkKPiA+IGRvbid0IHdhbnQgdG8gdG91Y2ggYWxs
IGJ1ZmZlcnMgZm9yIGV2ZXJ5IENTLCBidXQganVzdCBoYXZlIGEgcGlubmVkCj4gPiB3b3JraW5n
IHNldCIgY29tbWFuZCBzdWJtaXNzaW9uIG1vZGVsIGlzIHF1aXRlIGRpZmZlcmVudCBhZnRlciBh
bGwsCj4gPiBoYXZpbmcgZGVkaWNhdGVkIGluZnJhc3RydWN0dXJlIHRoYXQgZml0cyB3ZWxsIHNv
dW5kcyBsaWtlIGEgZ29vZCBpZGVhCj4gPiB0byBtZS4KPgo+IE9rLCB3ZWxsIEkgdGhpbmsgSSBj
YW4gYWdyZWUgb24gdGhhdC4KPgo+IE9uZSBvZiB0aGUgbWFpbiBwdXJwb3NlcyB1c2luZyB0aGUg
ZmVuY2Ugd2FzIGVzc2VudGlhbGx5IHRvIGF2b2lkCj4gY3JlYXRpbmcgZHVwbGljYXRlZCBpbmZy
YXN0cnVjdHVyZS4gQW5kIEkgc3RpbGwgdGhpbmsgdGhhdCB0aGlzIGlzIGEKPiBnb29kIGlkZWEu
IFNvIEkgdGhpbmsgd2Ugc2hvdWxkIGVzc2VudGlhbGx5IGFpbSBmb3Igc29tZXRoaW5nIHdoaWNo
Cj4gd29ya3MgZm9yIGJvdGggdXNlIGNhc2VzLgo+Cj4gTWF5YmUgd2Ugc2VlIHRoaXMgZnJvbSB0
aGUgd3Jvbmcgc2lkZT8gRmVuY2VzIHN0YXJ0ZWQgb2YgYXMgZXZlbnQgc3lzdGVtCj4gdG8gbm90
ZSBhYm91dCBjb21wbGV0aW9uIG9mIG9wZXJhdGlvbnMuCj4KPiBCdXQgd2hhdCB3ZSBlc3NlbnRp
YWxseSBuZWVkIGZvciBtZW1vcnkgbWFuYWdlbWVudCBpcyBhKSBrbm93IGlmIHRoZSBCTwo+IGlz
IHVzZWQsIGIpIHNvbWUgZm9ybSBvZiBldmVudC9jYWxsYmFjayB0byBzdG9wIHVzaW5nIGl0IGMp
IGFuCj4gZXZlbnQvY2FsbGJhY2sgYmFjayB0byBsZXQgdGhlIE1NIGtub3cgdGhhdCBpdCBpcyBu
b3QgdXNlZCBhbnkgbW9yZS4KPgo+IFNvIHRha2luZyBhIHN0ZXAgYmFjayB3aGF0IHNob3VsZCB0
aGUgaWRlYWwgc29sdXRpb24gbG9vayBsaWtlPwoKRGlkIHNvbWUgcG9uZGVyaW5nIG92ZXIgdGhl
IHcvZS4gQnV0IGJyYWluIHdhcyBhbGwgbXVzaGVkIHVwIGFuZCBpbgpub24td29ya2luZyBjb25k
aXRpb24gYmVjYXVzZSBldmVyeXRoaW5nIGlzIHRvbyBob3QgaGVyZSA6LS8gSXQncwpnZXR0aW5n
IGJldHRlciBhdCBsZWFzdC4KCkFub3RoZXIgdGhpbmcgSSBsb29rZWQgYSBiaXQgaW50byBpcyB0
aGUgYW1kZ3B1IHVzZXJwdHIgc3R1ZmYsIGFuZAp3b25kZXJlZCB3aGV0aGVyIHdlIGNvdWxkL3No
b3VsZCBtYWtlIGR5bmFtaWMgZG1hLWJ1ZiBhbHNvIHdvcmsgZm9yCnRoYXQgY2FzZS4gSW4gYSB3
YXlzIHVzZXJwdHIgaXMgdGhlIG1vc3Qgb3Zlci10aGUtdG9wIGR5bmFtaWMga2luZCBvZgptZW1v
cnkgLi4uIEJ1dCBJIGRvbid0IHRoaW5rIHRoYXQncyBwb3NzaWJsZSBkdWUgdG8gYWxsIHRoZSBs
b2NrcwppbnZvbHZlZCBpbiBobW1fbWlycm9yIGFuZCBnZXRfdXNlcl9wYWdlcy9obW1fZmF1bHQu
CgpPbmUgdGhpbmcgdGhhdCdzIGJlY29tZSBjbGVhciBhdCBsZWFzdCBpcyB0aGF0IGV2ZXJ5b25l
IGV4cGVjdHMgdG8gYmUKYWJsZSB0byB3YWl0IG9uIGZlbmNlcyBpbiB0aGVpciBobW0vc2hyaW5r
ZXIvd2hhdGV2ZXIgY29yZSAtbW0KY2FsbGJhY2tzLiBXaGljaCBtZWFucyB0aGUgY29tbWVudCBh
cm91bmQgdGhlIGFtZGdwdSB1c2VycHRyIG1uIGxvY2sKaXMgYWN0dWFsbHkgbm90IHBhcmFub2lk
IGVub3VnaDoKCiAgICAvKiBObyBtZW1vcnkgYWxsb2NhdGlvbiBpcyBhbGxvd2VkIHdoaWxlIGhv
bGRpbmcgdGhlIG1uIGxvY2suCiAgICAgKiBwLT5tbiBpcyBob2xkIHVudGlsIGFtZGdwdV9jc19z
dWJtaXQgaXMgZmluaXNoZWQgYW5kIGZlbmNlIGlzIGFkZGVkCiAgICAgKiB0byBCT3MuCiAgICAg
Ki8KICAgIGFtZGdwdV9tbl9sb2NrKHAtPm1uKTsKClRoZSBydWxlIGlzIGFjdHVhbGx5IGEgbG90
IHN0cmljdGVyIEkgdGhpbms6IEFueXRpbWUgeW91IHB1Ymxpc2ggYQpmZW5jZSB5b3UncmUgbm90
IGFsbG93ZWQgdG8gYWxsb2NhdGUgbWVtb3J5IHVudGlsIHlvdSd2ZSBzaWduYWxsZWQKdGhhdCBm
ZW5jZSwgaW4gX2FueV8gcGF0aCBsZWFkaW5nIHVwIHRvIHRoYXQgZG1hX2ZlbmNlX3NpZ25hbC4K
YW1kZ3B1X21uX2xvY2soKSBpcyBqdXN0IGFub3RoZXIgd2F5IHRvIHB1Ymxpc2ggZmVuY2VzLiBP
ZmMgdGhlcmUncwphbHNvIHRoZSBsb2NraW5nIGludmVyc2lvbiBwcm9ibGVtIG9uIHRoZSBtbl9s
b2NrIGl0c2VsZiwgYnV0IHRoZSAieW91CmNhbid0IGFsbG9jYXRlIGFueSBtZW1vcnksIGFueXdo
ZXJlLCBpbiBhbnkgZHJpdmVyIHRvIHNpZ25hbCBhIGZlbmNlIgppcyBzY2FyeS4gSSdsbCB0cnkg
dG8gYmFrZSB0aGlzIGludG8gZG9jdW1lbnRhdGlvbiBwYXRjaCBzb21laG93LgoKQXNpZGU6IFRo
ZSBjcm9zcy1yZWxlYXNlIGxvY2tkZXAgc3R1ZmYgd291bGQgaGVscCB1cyB2YWxpZGF0ZSB0aGVz
ZQptb3JlIGluZGlyZWN0IGxvY2sgZGVwZW5kZW5jaWVzIGFnYWluc3QgdGhlIGZzX3JlY2xhaW0g
Y29udGV4dC4gQnV0IGl0Cmxvb2tzIGxpa2UgY3Jvc3MtcmVsZWFzZSBsb2NrZGVwIGlzIHN0YWxs
ZWQgaW5kZWZpbml0ZWx5IDotKAoKQXNpZGUgZnJvbSB0aGF0IHNpZGV0cmFjaywgbm8gcmVhbCBw
cm9ncmVzcyBvbiBwb25kZXJpbmcgdGhpcyB0b3BpYyBoZXJlLgotRGFuaWVsCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2
NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
