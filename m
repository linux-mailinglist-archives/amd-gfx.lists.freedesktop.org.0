Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C65241782
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Aug 2020 09:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2753E6E14D;
	Tue, 11 Aug 2020 07:44:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17F389AC2
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Aug 2020 07:44:23 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id z11so2437583oon.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Aug 2020 00:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e0Egx9ihzYqGahH2AUbnj0E3KucFqxJ6fZuHs38zTeY=;
 b=I+FAuDEhwzuuTBPEhkq2VNRHTcyCPy1/n8wvnooZXFm1RNt+KbkY5/EC9cbMDa34eU
 oNY8OjmTJSjQwyLFzKv7AoqGVpfq8c9ahMl32vLrLLav7lqCqdII2JPZHVCB9qgtxKlb
 s1lFT1KBa3oIzRgM7KSZfGwidNVbpYli3gBEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e0Egx9ihzYqGahH2AUbnj0E3KucFqxJ6fZuHs38zTeY=;
 b=qZ8PTCGTMhse7JfqRoWUkp+aOTFT0r9lu5ZOwW7moMISie2siJJZEFuDyFBpvPC49Y
 CPoc2GDU828Pz4DOS7SkDQm6iApObXZB9mgBKpd7eAkWelTfXnximnR4GQV/exTxC1SW
 wqTmA1+3aXgljdIbHeAV9frcMeHIrLXaQ/+UFBaCmpO0Z6X8UiO0polK3m5dSmO1UM1t
 XhLqD6s0s+aSWtkEh1MlBThCVXiFMQGcSYGwZwqDWd6EIOMH37+nCNwm9Hs+fl9PPJdE
 lWZOdbV2hL5BAu652NYKqZRLIi5tqb8xOpmYhuI7uvIocyBPKp5AsPgoOG0L361Xq0mV
 RG7w==
X-Gm-Message-State: AOAM532O0+Wo9YRFsUkw9t39x8b4pvrsMYOpBRPvYxGWQmZsPwLMOZvT
 +wyb5y04R1Bj8c1wm3yZz7ae5yHgbqUwcViRx+qLcQ==
X-Google-Smtp-Source: ABdhPJys3Grcu5recHC/Ogi6/tWGTgJ+7KJpECy54XS2LVbQmFcmnThTF4z1FeiBwYkQDRMEXBHkDS3FxJHNJJzDy0E=
X-Received: by 2002:a4a:9e05:: with SMTP id t5mr4029234ook.89.1597131862468;
 Tue, 11 Aug 2020 00:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200811021224.3688-1-Dennis.Li@amd.com>
 <fbb65b04-ff33-53dc-89ce-ddaed51185af@amd.com>
 <CY4PR12MB128703F619AEC3E1F718CCDEF1450@CY4PR12MB1287.namprd12.prod.outlook.com>
 <5bf4519f-5e5d-9bab-6afe-660ecfc755f5@amd.com>
In-Reply-To: <5bf4519f-5e5d-9bab-6afe-660ecfc755f5@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 11 Aug 2020 09:44:11 +0200
Message-ID: <CAKMK7uHdwyPe7mqoBES9-xeqSXNJVX1n-qcLoqQKWwy-DmuW6g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: annotate a false positive recursive locking
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTEsIDIwMjAgYXQgOTo0MCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMTEuMDguMjAgdW0gMDk6MzYgc2Nocmll
YiBDaGVuLCBHdWNodW46Cj4gPiBbQU1EIFB1YmxpYyBVc2VdCj4gPgo+ID4+IC0gICAgZG93bl93
cml0ZSgmYWRldi0+cmVzZXRfc2VtKTsKPiA+PiArICAgIGlmIChoaXZlKSB7Cj4gPj4gKyAgICAg
ICAgICAgIGRvd25fd3JpdGVfbmVzdF9sb2NrKCZhZGV2LT5yZXNldF9zZW0sICZoaXZlLT5oaXZl
X2xvY2spOwo+ID4+ICsgICAgfSBlbHNlCj4gPj4gKyAgICAgICAgICAgIGRvd25fd3JpdGUoJmFk
ZXYtPnJlc2V0X3NlbSk7Cj4gPiBDb2Rpbmcgc3R5bGUgbml0IHBpY2s6IFlvdSBzaG91bGQgZHJv
cCB0aGUge30gaGVyZS4KPiA+Cj4gPiB7fSBjb3VsZCBub3QgYmUgZHJvcHBlZCBoZXJlLCBhcyBk
b3duX3dyaXRlX25lc3RfbG9jayBJcyBvbmUgbWFjcm8gd2l0aCBtdWx0aXBsZSBsaW5lcywgb3Ro
ZXJ3aXNlLCBidWlsZCBlcnJvciB3b3VsZCBzYXkgJ2Vsc2UnIG1pc3NlZCBvbmUgcHJldmlvdXMg
J2lmJy4KPiA+IEluc3RlYWQgb2YgZHJvcHBpbmcsIGFub3RoZXIge30gc2hvdWxkIGJlIGFkZGVk
IHRvIGVsc2UgdG8gaW5jbHVkZSBkb3duX3dyaXRlKCZhZGV2LT5yZXNldF9zZW0pLCB3aGljaCBt
YWtlcyB0aGUgYnJhY2VzIGJlZW4gYmFsYW5jZWQuCj4KPiBJbnRlcmVzdGluZyBidWcsIHRoYXQg
aXMgc29tZXRoaW5nIHdoaWNoIHNob3VsZCBub3QgaGFwcGVuIHdpdGggbWFjcm9zCj4gaW4gdGhl
IExpbnV4IGtlcm5lbC4gVGhleSBwcm90ZWN0aW9uIGJ5ICJkbyB7IC4uLiB9IHdoaWxlKDApIiBp
cwo+IG1hbmRhdG9yeSBoZXJlLgoKUXVpY2sgZ3JlcCBzYXlzIGl0IGlzIHByb3RlY3RlZCBsaWtl
IHRoYXQgLi4uIGNhbiB5b3UgcGxzIHBhc3RlIHRoZQpmdWxsIGJ1aWxkIGVycm9yIHdpdGhvdXQg
e30/Ci1EYW5pZWwKCj4KPiBMZXQgbWUgdGFrZSBhIGxvb2ssCj4gQ2hyaXN0aWFuLgo+Cj4gPgo+
ID4gUmVnYXJkcywKPiA+IEd1Y2h1bgo+ID4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4gPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PiBPbiBCZWhhbGYgT2YgQ2hyaXN0aWFuIEvDtm5pZwo+ID4gU2VudDogVHVlc2RheSwgQXVndXN0
IDExLCAyMDIwIDI6NTMgUE0KPiA+IFRvOiBMaSwgRGVubmlzIDxEZW5uaXMuTGlAYW1kLmNvbT47
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhh
bmRlci5EZXVjaGVyQGFtZC5jb20+OyBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgZGFuaWVsQGZm
d2xsLmNoCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBkcm0vYW1kZ3B1OiBhbm5vdGF0ZSBh
IGZhbHNlIHBvc2l0aXZlIHJlY3Vyc2l2ZSBsb2NraW5nCj4gPgo+ID4gQW0gMTEuMDguMjAgdW0g
MDQ6MTIgc2NocmllYiBEZW5uaXMgTGk6Cj4gPj4gWyAgNTg0LjExMDMwNF0gPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+PiBbICA1ODQuMTEwNTkwXSBXQVJO
SU5HOiBwb3NzaWJsZSByZWN1cnNpdmUgbG9ja2luZyBkZXRlY3RlZAo+ID4+IFsgIDU4NC4xMTA4
NzZdIDUuNi4wLWRlbGktdjUuNi0yODQ4LWczZjMxMDliMGU3NWYgIzEgVGFpbnRlZDogRyAgICAg
ICAgICAgT0UKPiA+PiBbICA1ODQuMTExMTY0XSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ID4+IFsgIDU4NC4xMTE0NTZdIGt3b3JrZXIvMzg6MS81NTMgaXMg
dHJ5aW5nIHRvIGFjcXVpcmUgbG9jazoKPiA+PiBbICA1ODQuMTExNzIxXSBmZmZmOWIxNWZmMGE0
N2EwICgmYWRldi0+cmVzZXRfc2VtKXsrKysrfSwgYXQ6Cj4gPj4gYW1kZ3B1X2RldmljZV9ncHVf
cmVjb3ZlcisweDI2Mi8weDEwMzAgW2FtZGdwdV0gWyAgNTg0LjExMjExMl0KPiA+PiAgICAgICAg
ICAgICAgICAgIGJ1dCB0YXNrIGlzIGFscmVhZHkgaG9sZGluZyBsb2NrOgo+ID4+IFsgIDU4NC4x
MTI2NzNdIGZmZmY5YjE2MDNkMjQ3YTAgKCZhZGV2LT5yZXNldF9zZW0peysrKyt9LCBhdDoKPiA+
PiBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKzB4MjYyLzB4MTAzMCBbYW1kZ3B1XSBbICA1ODQu
MTEzMDY4XQo+ID4+ICAgICAgICAgICAgICAgICAgb3RoZXIgaW5mbyB0aGF0IG1pZ2h0IGhlbHAg
dXMgZGVidWcgdGhpczoKPiA+PiBbICA1ODQuMTEzNjg5XSAgUG9zc2libGUgdW5zYWZlIGxvY2tp
bmcgc2NlbmFyaW86Cj4gPj4KPiA+PiBbICA1ODQuMTE0MzUwXSAgICAgICAgQ1BVMAo+ID4+IFsg
IDU4NC4xMTQ2ODVdICAgICAgICAtLS0tCj4gPj4gWyAgNTg0LjExNTAxNF0gICBsb2NrKCZhZGV2
LT5yZXNldF9zZW0pOwo+ID4+IFsgIDU4NC4xMTUzNDldICAgbG9jaygmYWRldi0+cmVzZXRfc2Vt
KTsKPiA+PiBbICA1ODQuMTE1Njc4XQo+ID4+ICAgICAgICAgICAgICAgICAgICoqKiBERUFETE9D
SyAqKioKPiA+Pgo+ID4+IFsgIDU4NC4xMTY2MjRdICBNYXkgYmUgZHVlIHRvIG1pc3NpbmcgbG9j
ayBuZXN0aW5nIG5vdGF0aW9uCj4gPj4KPiA+PiBbICA1ODQuMTE3Mjg0XSA0IGxvY2tzIGhlbGQg
Ynkga3dvcmtlci8zODoxLzU1MzoKPiA+PiBbICA1ODQuMTE3NjE2XSAgIzA6IGZmZmY5YWQ2MzVj
MWQzNDggKCh3cV9jb21wbGV0aW9uKWV2ZW50cyl7Ky4rLn0sCj4gPj4gYXQ6IHByb2Nlc3Nfb25l
X3dvcmsrMHgyMWYvMHg2MzAgWyAgNTg0LjExNzk2N10gICMxOiBmZmZmYWM3MDhlMWMzZTU4Cj4g
Pj4gKCh3b3JrX2NvbXBsZXRpb24pKCZjb24tPnJlY292ZXJ5X3dvcmspKXsrLisufSwgYXQ6Cj4g
Pj4gcHJvY2Vzc19vbmVfd29yaysweDIxZi8weDYzMCBbICA1ODQuMTE4MzU4XSAgIzI6IGZmZmZm
ZmZmYzFjMmE1ZDAKPiA+PiAoJnRtcC0+aGl2ZV9sb2NrKXsrLisufSwgYXQ6IGFtZGdwdV9kZXZp
Y2VfZ3B1X3JlY292ZXIrMHhhZS8weDEwMzAgW2FtZGdwdV0gWyAgNTg0LjExODc4Nl0gICMzOiBm
ZmZmOWIxNjAzZDI0N2EwICgmYWRldi0+cmVzZXRfc2VtKXsrKysrfSwgYXQ6IGFtZGdwdV9kZXZp
Y2VfZ3B1X3JlY292ZXIrMHgyNjIvMHgxMDMwIFthbWRncHVdIFsgIDU4NC4xMTkyMjJdCj4gPj4g
ICAgICAgICAgICAgICAgICBzdGFjayBiYWNrdHJhY2U6Cj4gPj4gWyAgNTg0LjExOTk5MF0gQ1BV
OiAzOCBQSUQ6IDU1MyBDb21tOiBrd29ya2VyLzM4OjEgS2R1bXA6IGxvYWRlZCBUYWludGVkOiBH
ICAgICAgICAgICBPRSAgICAgNS42LjAtZGVsaS12NS42LTI4NDgtZzNmMzEwOWIwZTc1ZiAjMQo+
ID4+IFsgIDU4NC4xMjA3ODJdIEhhcmR3YXJlIG5hbWU6IFN1cGVybWljcm8gU1lTLTcwNDlHUC1U
UlQvWDExRFBHLVFULAo+ID4+IEJJT1MgMy4xIDA1LzIzLzIwMTkgWyAgNTg0LjEyMTIyM10gV29y
a3F1ZXVlOiBldmVudHMKPiA+PiBhbWRncHVfcmFzX2RvX3JlY292ZXJ5IFthbWRncHVdIFsgIDU4
NC4xMjE2MzhdIENhbGwgVHJhY2U6Cj4gPj4gWyAgNTg0LjEyMjA1MF0gIGR1bXBfc3RhY2srMHg5
OC8weGQ1Cj4gPj4gWyAgNTg0LjEyMjQ5OV0gIF9fbG9ja19hY3F1aXJlKzB4MTEzOS8weDE2ZTAg
WyAgNTg0LjEyMjkzMV0gID8KPiA+PiB0cmFjZV9oYXJkaXJxc19vbisweDNiLzB4ZjAgWyAgNTg0
LjEyMzM1OF0gID8KPiA+PiBjYW5jZWxfZGVsYXllZF93b3JrKzB4YTYvMHhjMCBbICA1ODQuMTIz
NzcxXSAgbG9ja19hY3F1aXJlKzB4YjgvMHgxYzAKPiA+PiBbICA1ODQuMTI0MTk3XSAgPyBhbWRn
cHVfZGV2aWNlX2dwdV9yZWNvdmVyKzB4MjYyLzB4MTAzMCBbYW1kZ3B1XSBbCj4gPj4gNTg0LjEy
NDU5OV0gIGRvd25fd3JpdGUrMHg0OS8weDEyMCBbICA1ODQuMTI1MDMyXSAgPwo+ID4+IGFtZGdw
dV9kZXZpY2VfZ3B1X3JlY292ZXIrMHgyNjIvMHgxMDMwIFthbWRncHVdIFsgIDU4NC4xMjU0NzJd
Cj4gPj4gYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcisweDI2Mi8weDEwMzAgW2FtZGdwdV0gWyAg
NTg0LjEyNTkxMF0gID8KPiA+PiBhbWRncHVfcmFzX2Vycm9yX3F1ZXJ5KzB4MWI4LzB4MmEwIFth
bWRncHVdIFsgIDU4NC4xMjYzNjddCj4gPj4gYW1kZ3B1X3Jhc19kb19yZWNvdmVyeSsweDE1OS8w
eDE5MCBbYW1kZ3B1XSBbICA1ODQuMTI2Nzg5XQo+ID4+IHByb2Nlc3Nfb25lX3dvcmsrMHgyOWUv
MHg2MzAgWyAgNTg0LjEyNzIwOF0gIHdvcmtlcl90aHJlYWQrMHgzYy8weDNmMAo+ID4+IFsgIDU4
NC4xMjc2MjFdICA/IF9fa3RocmVhZF9wYXJrbWUrMHg2MS8weDkwIFsgIDU4NC4xMjgwMTRdCj4g
Pj4ga3RocmVhZCsweDEyZi8weDE1MCBbICA1ODQuMTI4NDAyXSAgPyBwcm9jZXNzX29uZV93b3Jr
KzB4NjMwLzB4NjMwIFsKPiA+PiA1ODQuMTI4NzkwXSAgPyBrdGhyZWFkX3BhcmsrMHg5MC8weDkw
IFsgIDU4NC4xMjkxNzRdCj4gPj4gcmV0X2Zyb21fZm9yaysweDNhLzB4NTAKPiA+Pgo+ID4+IEVh
Y2ggYWRldiBoYXMgb3duZWQgbG9ja19jbGFzc19rZXkgdG8gYXZvaWQgZmFsc2UgcG9zaXRpdmUg
cmVjdXJzaXZlCj4gPj4gbG9ja2luZy4KPiA+Pgo+ID4+IHYyOgo+ID4+IDEuIHJlZ2lzdGVyIGFk
ZXYtPmxvY2tfa2V5IGludG8gbG9ja2RlcCwgb3RoZXJ3aXNlIGxvY2tkZXAgd2lsbCByZXBvcnQK
PiA+PiB0aGUgYmVsb3cgd2FybmluZwo+ID4+Cj4gPj4gWyAxMjE2LjcwNTgyMF0gQlVHOiBrZXkg
ZmZmZjg5MDE4M2I2NDdkMCBoYXMgbm90IGJlZW4gcmVnaXN0ZXJlZCEKPiA+PiBbIDEyMTYuNzA1
OTI0XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0gWyAxMjE2LjcwNTk3Ml0K
PiA+PiBERUJVR19MT0NLU19XQVJOX09OKDEpIFsgMTIxNi43MDU5OTddIFdBUk5JTkc6IENQVTog
MjAgUElEOiA1NDEgYXQKPiA+PiBrZXJuZWwvbG9ja2luZy9sb2NrZGVwLmM6Mzc0MyBsb2NrZGVw
X2luaXRfbWFwKzB4MTUwLzB4MjEwCj4gPj4KPiA+PiB2MzoKPiA+PiBjaGFuZ2UgdG8gdXNlIGRv
d25fd3JpdGVfbmVzdF9sb2NrIHRvIGFubm90YXRlIHRoZSBmYWxzZSBkZWFkLWxvY2sKPiA+PiB3
YXJuaW5nLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogRGVubmlzIExpIDxEZW5uaXMuTGlAYW1k
LmNvbT4KPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYwo+ID4+IGluZGV4IDYyZWNhYzk3ZmJkMi4uOGE1NWIwYmMwNDRhIDEwMDY0NAo+ID4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ID4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ID4+IEBAIC00
MTQ1LDEyICs0MTQ1LDE1IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RvX2FzaWNfcmVzZXQoc3RydWN0
IGFtZGdwdV9oaXZlX2luZm8gKmhpdmUsCj4gPj4gICAgICByZXR1cm4gcjsKPiA+PiAgICB9Cj4g
Pj4KPiA+PiAtc3RhdGljIGJvb2wgYW1kZ3B1X2RldmljZV9sb2NrX2FkZXYoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCj4gPj4gK3N0YXRpYyBib29sIGFtZGdwdV9kZXZpY2VfbG9ja19hZGV2
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ID4+ICtzdHJ1Y3QgYW1kZ3B1X2hpdmVfaW5m
byAqaGl2ZSkKPiA+PiAgICB7Cj4gPj4gICAgICBpZiAoYXRvbWljX2NtcHhjaGcoJmFkZXYtPmlu
X2dwdV9yZXNldCwgMCwgMSkgIT0gMCkKPiA+PiAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+
ID4+Cj4gPj4gLSAgICBkb3duX3dyaXRlKCZhZGV2LT5yZXNldF9zZW0pOwo+ID4+ICsgICAgaWYg
KGhpdmUpIHsKPiA+PiArICAgICAgICAgICAgZG93bl93cml0ZV9uZXN0X2xvY2soJmFkZXYtPnJl
c2V0X3NlbSwgJmhpdmUtPmhpdmVfbG9jayk7Cj4gPj4gKyAgICB9IGVsc2UKPiA+PiArICAgICAg
ICAgICAgZG93bl93cml0ZSgmYWRldi0+cmVzZXRfc2VtKTsKPiA+IENvZGluZyBzdHlsZSBuaXQg
cGljazogWW91IHNob3VsZCBkcm9wIHRoZSB7fSBoZXJlLgo+ID4KPiA+IEFwYXJ0IGZyb20gdGhh
dCB0aGUgcGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiA+Cj4gPj4KPiA+PiAgICAgIGF0b21pY19pbmMoJmFkZXYtPmdwdV9y
ZXNldF9jb3VudGVyKTsKPiA+PiAgICAgIHN3aXRjaCAoYW1kZ3B1X2FzaWNfcmVzZXRfbWV0aG9k
KGFkZXYpKSB7IEBAIC00MzEyLDcgKzQzMTUsNyBAQCBpbnQKPiA+PiBhbWRncHVfZGV2aWNlX2dw
dV9yZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ID4+Cj4gPj4gICAgICAvKiBi
bG9jayBhbGwgc2NoZWR1bGVycyBhbmQgcmVzZXQgZ2l2ZW4gam9iJ3MgcmluZyAqLwo+ID4+ICAg
ICAgbGlzdF9mb3JfZWFjaF9lbnRyeSh0bXBfYWRldiwgZGV2aWNlX2xpc3RfaGFuZGxlLCBnbWMu
eGdtaS5oZWFkKSB7Cj4gPj4gLSAgICAgICAgICAgIGlmICghYW1kZ3B1X2RldmljZV9sb2NrX2Fk
ZXYodG1wX2FkZXYpKSB7Cj4gPj4gKyAgICAgICAgICAgIGlmICghYW1kZ3B1X2RldmljZV9sb2Nr
X2FkZXYodG1wX2FkZXYsIGhpdmUpKSB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgRFJNX0lO
Rk8oIkJhaWxpbmcgb24gVERSIGZvciBzX2pvYjolbGx4LCBhcyBhbm90aGVyIGFscmVhZHkgaW4g
cHJvZ3Jlc3MiLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBqb2IgPyBqb2It
PmJhc2UuaWQgOiAtMSk7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgciA9IDA7Cj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYW1kLWdmeCBt
YWlsaW5nIGxpc3QKPiA+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczov
L25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYl
MkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFt
cDtkYXRhPTAyJTdDMDElN0NndWNodW4uY2hlbiU0MGFtZC5jb20lN0MwYTNmZDA2YzBlNzc0MDAy
YTBlOTA4ZDgzZGMzMzdhMCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3
QzAlN0M2MzczMjcyNTU5NTIwNjU1MTAmYW1wO3NkYXRhPXJKJTJCYldzV0o2TmZQVWlud1VIeG5S
ZlZ4WWklMkZ0NEpRQ1R0YW1NQVRyTHdzJTNEJmFtcDtyZXNlcnZlZD0wCj4KCgotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
