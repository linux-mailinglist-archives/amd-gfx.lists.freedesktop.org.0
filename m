Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674C46E884
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 18:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAB86E857;
	Fri, 19 Jul 2019 16:14:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9866E857
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 16:14:49 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p13so32774144wru.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 09:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ca2jN09d5AKVw8ubhL5sjxF1RtXIbWK5XEDPGVQ4jRc=;
 b=DD1/WYbEDvDxapHOKz0ZSVFWhTfhojXModGVC6Y6Nb7Z2E02nJb9w0kItzqsFxaMlP
 FyDZFNlvzZGLRgYkxKZX+ZWoeE5sqR7+pqtkq7DpxD80PcdE1SMR88rgF6+IwCYQzbyM
 q0s4qhLLzy4yRAHEl7QJkWzdNH71jQXfaaBsRRp88cK7eEifERhNBRoFHs3GlGjhpJnY
 8ZtIpX+fTRm9r/VO2RtrLiJKtmboNEWqyoGm1bq56pBRV29XgZ5Xw6MreS1PDSDzGUfp
 BtCAmNdpSJsQAofJ/zVcIlK2r5ybliDCWQe+6/aSyu7Py6Pi58thagZzTV+Ap2SgTs0P
 4ZKA==
X-Gm-Message-State: APjAAAWu3c2xzEURaYH3aE59fV5P8DwyI442emncj91E8ARVxYjbmhku
 fdDmUT5pp/sS2vET4kf8iKC9mNs5OVDCz1sPd9c=
X-Google-Smtp-Source: APXvYqzzK8bykPXSMY5XM+G6mKXtOUC/ofn9vdGjdzXYZaXt7SAY/LI5zqzwTw51QkFgS9SgQfvMimjpd5EEClxIwWw=
X-Received: by 2002:adf:f94a:: with SMTP id q10mr35567049wrr.341.1563552888478; 
 Fri, 19 Jul 2019 09:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190719112232.28485-1-kevin1.wang@amd.com>
 <CADnq5_P2UVmm4P1myih0UOQ2nvLDB01zdaFN9v7p423QeLASKg@mail.gmail.com>
 <MN2PR12MB329684D6E227BE0132F67A8EA2CB0@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB329684D6E227BE0132F67A8EA2CB0@MN2PR12MB3296.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Jul 2019 12:14:36 -0400
Message-ID: <CADnq5_PDRyxDNn3TK40L0w2KGDUcahrZge7+q_Z06DX3q-xFWw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: change smu_read_sensor sequence in smu
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ca2jN09d5AKVw8ubhL5sjxF1RtXIbWK5XEDPGVQ4jRc=;
 b=K1LuBh6nuLKiZOtotKTQb96bioWY44235bRzFGhEwdgzAOoEtbQHfYX9+BRmxeIvPI
 sO07+DijpfUOf6Wn1EwP07HQUdAybnXDJu/+2u45AJilDXldAm2odzaqN96TUoRcCAkM
 9qrvdlVxdGrIjkkVbWs/j/9z5+cgEo1hjdgm8Vgxz80VKXLovWBIo/LMmCSgZv2T39YN
 /7RbdPO8LsKxCBbESe4zlO0jkbof3FmfGoiojDZ8IPdZbWh6bO5Y26PD5COKZLy7lBxJ
 rhgPlm2vUhraJUyAHYjgu/oRg6wgHpech16C8WbgWQsvJQVuXQcfzISVZt8I6BN6sVV6
 EG7A==
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMTI6MDEgUE0gV2FuZywgS2V2aW4oWWFuZykgPEtldmlu
MS5XYW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IEZyb206IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPgo+IFNlbnQ6
IEZyaWRheSwgSnVseSAxOSwgMjAxOSAxMToxNyBQTQo+IFRvOiBXYW5nLCBLZXZpbihZYW5nKSA8
S2V2aW4xLldhbmdAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcg
PGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFt
ZC5jb20+OyBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT4KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogY2hhbmdlIHNtdV9yZWFkX3NlbnNvciBzZXF1
ZW5jZSBpbiBzbXUKPgo+IE9uIEZyaSwgSnVsIDE5LCAyMDE5IGF0IDc6MjMgQU0gV2FuZywgS2V2
aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+IHdyb3RlOgo+ID4KPiA+IGVhY2ggYXNpYyBt
YXliZSBoYXMgZGlmZmVyZW50IHJlYWQgc2Vuc29yIG1ldGhvZC4KPiA+IHNvIGNoYW5nZSByZWFk
IHNlbnNvciBzZXF1ZW5jZSBpbiBzbXUuCj4gPgo+ID4gcmVhZCBzZW5zb3Igc2VxdWVuY2U6Cj4g
PiBhc2ljIHNlbnNvciAtLT4gc21jIHNlbnNvciAoc211IDExLi4uKSAtLT4gZGVmYXVsdF9zZW5z
b3IgKGNvbW1vbikKPgo+IEkgdGhpbmsgdGhpcyBtYWtlcyBzZW5zZS4gIFRoYXQgc2FpZCwgdGhl
IGN1cnJlbnQgc3dTTVUgY2FsbGJhY2sKPiBzdHJ1Y3R1cmVzIGFyZSByZWFsbHkgY29uZnVzaW5n
LiAgSSB0aGluayB3ZSBzaG91bGQgc3dpdGNoIHRvIGEgc2luZ2xlCj4gc2V0IG9mIHBlciBhc2lj
IGNhbGxiYWNrcyBhbmQgdGhlbiBhZGQgY29tbW9uIGhlbHBlcnMuICBUaGVuIGZvciBhc2ljcwo+
IHdoZXJlIGl0IG1ha2VzIHNlbnNlIHdlIGNhbiBqdXN0IHVzZSB0aGUgaGVscGVyIGFzIHRoZSBj
YWxsYmFjayBmb3IKPiBhbGwgcmVsZXZhbnQgYXNpY3MuICBJZiB0aGV5IG5lZWQgc29tZXRoaW5n
IGFzaWMgc3BlY2lmaWMsIHVzZSB0aGUKPiBhc2ljIHNwZWNpZmljIGZ1bmN0aW9uLiAgVGhhdCBz
aG91bGQgYXZvaWQgdGhlIGN1cnJlbnQgbWl4IG9mCj4gY2FsbGJhY2tzIGFuZCBtYWtlIGl0IGNs
ZWFyZXIgd2hhdCBjb2RlIGdldHMgdXNlZCB3aGVuLgo+Cj4gQWxleAo+Cj4gW2tldmluXToKPgo+
IHRoYW5rcyByZXZpZXcsIGluIGN1cnJlbnQgY29kZSwgdGhlIHJlYWQgc2Vuc29yIHJlbGF0ZWQg
ZnVuY3Rpb24gaXMgbm90IHZlcnkgY2xlYXIsIHNvIGkgd2FudCB0byByZWZpbmUgdGhlbS4KPiBi
dXQgSSdtIG5vdCBzdXJlIHdoaWNoIHdheSB0byB3cml0ZSBnb29kIGNvZGUgbG9naWMuCj4KPiB3
YXkgMToKPgo+IHByb3ZpZGUgYSBwdWlibGljIGZ1bmN0aW9uIG5hbWVkIHNtdV9yZWFkX3NlbnNv
ciBhcyBwdWJsaWMgc211IGFwaSBmb3Igb3RoZXIga2VuZWwgbW9kdWxlLCBsaWtlIHRoaXMgcGF0
Y2guCj4gdGhpcyBmdW5jdGlvbiB3aWxsIHRyeSB0byBnZXQgdmFsdWUgZnJvbSBhc2ljIG9yIHNt
dSBpcCBsZXZlbCBvciBjb21tb24sIGNhbGwgdGhlbSBpbiB0dXJuIGFjY29yZGluZyB0byB0aGUg
cnVsZXMuCj4KPiB3YXkgMjoKPgo+IGRlZmluZSBhIG1hY28gbmFtZWQgc211X3JlYWRfc2Vuc29y
IGFzIHB1YmxpYyBhcGksIGltcGxlbWVudCBpdCBpbiB4eHhfcHB0LmMgZmlsZSwKPiBpZiBjYW4n
dCBoYW5kbGUgc2Vuc29yIHR5cGUgaW4geHh4X3BwdC5jLCB0aGVuIGNhbGwgaGVscGVyIGluIHNt
dV92MTFfMC5jLCAgdGhlbiBjYWxsIGFtZGdwdV9zbXUuYyBoZWxwZXIuCj4KPiBpbiB0aGlzIHdh
eSwgaXQgbWVhbnMgd2UgbXVzdCBpbXBsZW1lbnQgdGhpcyBjYWxsYmFjayBmdW5jdGlvbiBpbiB4
eHhfcHB0LmMuCj4gaWYgbmVlZCB0byBzdXBwb3J0IG5ldyBhc2ljLCB3ZSBzaG91bGQgYWRkIHNv
bWUgZHVsaWNhdGVkIGNvZGUgaW4geHh4X3BwdC5jLCBpZiBub3QgdGhlIHNtdV9yZWFkX3NlbnNv
ciBhcGkgaXMgbm90IHdvcmsgd2VsbC4KPiBpbiBzbXUgbW9kdWxlLCB1c2UgbWFueSBtYWNyb3Mg
YXMgbW9kdWxlIHB1YmxpYyBhcGksIGl0IGlzIGltcG9zc2libGUgdG8gdGVsbCBhdCB3aGF0IGxl
dmVsIHRoZXNlIG1hY3JvcyBpbXBsZW1lbnQgc3BlY2lmaWMgY29kZSBsb2dpYy4KPiBzbyBpIHdh
bnQgdG8gcmVmaW5lIHRoZW0uCj4KPiBkbyB5b3UgdGhpbmsgd2hpY2ggd2F5IGlzIGdvb2QgZm9y
IHRoaXMgY2FzZT8KCkkgcGVyc29uYWxseSBwcmVmZXIgd2F5IDIuICBXaXRoIHdheSAxLCB0aGUg
Y29tbW9uIGZ1bmN0aW9ucyB3b3VsZApqdXN0IGJlIGEgd3JhcHBlciBhcm91bmQgdGhlIGFzaWMg
c3BlY2lmaWMgY2FsbGJhY2tzLiAgVGhlIG9sZGVyCnBvd2VycGxheSBjb2RlIHdvcmtlZCB0aGF0
IHdheS4gIElmIHRoZXJlIGlzIHNvbWV0aGluZyBjb21tb24gdGhhdApuZWVkcyB0byBiZSBkb25l
IGZvciBhbGwgYXNpY3MsIEkgdGhpbmsgdGhhdCB3b3VsZCBtYWtlIHNlbnNlLCBidXQgSQpkb24n
dCBrbm93IHRoYXQgd2UgaGF2ZSBhbnkgY2FzZXMgbGlrZSB0aGF0LiAgSWYgd2UgZG8gZW5kIHVw
IG5lZWRpbmcKc29tZXRoaW5nIGxpa2UgdGhhdCwgd2UgY2FuIGFsd2F5cyByZXZpc2l0IHRoaXMu
CgpJIHdhcyB0aGlua2luZyBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nOgoKc3RydWN0IHNt
dV9hc2ljX2Z1bmNzIHsKICAgIGludCAoKmdldF9jdXJyZW50X2Nsb2NrX2ZyZXEpKCk7CiAgICBp
bnQgKCpnZXRfZmFuX3NwZWVkX3JwbSkoKTsKICAgIC4uLgp9CgpUaGVuIGZvciBjYXNlcyB3aGVy
ZSB0d28gYXNpY3MgdXNlIHRoZSBzYW1lIFNNVSBpbnRlcmZhY2UsIHlvdSBjYW4KY3JlYXRlIGEg
Y29tbW9uIGZ1bmN0aW9uLiAgU28gZm9yIHZlZ2EyMCwgaXQgbWlnaHQgbG9vayBsaWtlOgoKc3Rh
dGljIGNvbnN0IHN0cnVjdCBzbXVfYXNpY19mdW5jcyB2ZWdhMjBfc211X2FzaWNfZnVuY3MgPQp7
CiAgICAuZ2V0X2N1cnJlbnRfY2xvY2tfZnJlcSA9IHNtdV92MTFfMF9nZXRfY3VycmVudF9jbG9j
a19mcmVxLAogICAgLmdldF9mYW5fc3BlZWRfcnBtID0gdmVnYTIwX2dldF9mYW5fc3BlZWRfcnBt
LAogICAgLi4uCn07CgphbmQgbmF2aTEwIHdvdWxkIGxvb2sgbGlrZToKCnN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc211X2FzaWNfZnVuY3MgbmF2aTEwX3NtdV9hc2ljX2Z1bmNzID0KewogICAgLmdldF9j
dXJyZW50X2Nsb2NrX2ZyZXEgPSBzbXVfdjExXzBfZ2V0X2N1cnJlbnRfY2xvY2tfZnJlcSwKICAg
IC5nZXRfZmFuX3NwZWVkX3JwbSA9IG5hdmkxMF9nZXRfZmFuX3NwZWVkX3JwbSwKICAgIC4uLgp9
OwoKQWxleAoKCj4gdGhhbmtzLgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8
a2V2aW4xLndhbmdAYW1kLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICB8IDI2ICsrKysrKysrKysrKysrKysrLS0KPiA+ICAuLi4v
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAgOSArKysrLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jICAgIHwgIDMgKysr
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgICAgIHwgMTAg
KysrLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyAg
ICB8ICAzICsrKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYwo+ID4gaW5kZXggMDViOTFiYzUwNTRjLi44NTI2OWY4NmNhZTIgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+ID4gQEAgLTI4NCwxMSAr
Mjg0LDE0IEBAIGludCBzbXVfZ2V0X3Bvd2VyX251bV9zdGF0ZXMoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsCj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiAtaW50IHNtdV9jb21t
b25fcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gYW1kX3BwX3NlbnNv
cnMgc2Vuc29yLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSwgdWlu
dDMyX3QgKnNpemUpCj4gPiAraW50IHNtdV9kZWZhdWx0X3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LCBlbnVtIGFtZF9wcF9zZW5zb3JzIHNlbnNvciwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2b2lkICpkYXRhLCB1aW50MzJfdCAqc2l6ZSkKPiA+ICB7Cj4gPiAg
ICAgICAgIGludCByZXQgPSAwOwo+ID4KPiA+ICsgICAgICAgaWYgKCFkYXRhIHx8ICFzaXplKQo+
ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gICAgICAgICBzd2l0
Y2ggKHNlbnNvcikgewo+ID4gICAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1JfU1RBQkxFX1BT
VEFURV9TQ0xLOgo+ID4gICAgICAgICAgICAgICAgICooKHVpbnQzMl90ICopZGF0YSkgPSBzbXUt
PnBzdGF0ZV9zY2xrOwo+ID4gQEAgLTMyMSw2ICszMjQsMjUgQEAgaW50IHNtdV9jb21tb25fcmVh
ZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vu
c29yLAo+ID4gICAgICAgICByZXR1cm4gcmV0Owo+ID4gIH0KPiA+Cj4gPiAraW50IHNtdV9yZWFk
X3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5z
b3IsCj4gPiArICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEsIHVpbnQzMl90ICpzaXplKQo+
ID4gK3sKPiA+ICsgICAgICAgaW50IHJldCA9IDA7Cj4gPiArCj4gPiArICAgICAgIGlmICghZGF0
YSB8fCAhc2l6ZSkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsKPiA+
ICsgICAgICAgLyogaGFuZGxlIHNlbnNvciBzZXF1ZW5jZTogYXNpYyAtLT4gaXAgbGV2ZWwgLS0+
ICBkZWZhdWx0ICovCj4gPiArICAgICAgIHJldCA9IHNtdV9hc2ljX3JlYWRfc2Vuc29yKHNtdSwg
c2Vuc29yLCBkYXRhLCBzaXplKTsKPiA+ICsgICAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAg
ICAgICAgIHJldCA9IHNtdV9zbWNfcmVhZF9zZW5zb3Ioc211LCBzZW5zb3IsIGRhdGEsIHNpemUp
Owo+ID4gKyAgICAgICAgICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICByZXQgPSBzbXVfZGVmYXVsdF9yZWFkX3NlbnNvcihzbXUsIHNlbnNvciwgZGF0YSwgc2l6ZSk7
Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIHJldDsKPiA+ICt9Cj4gPiAr
Cj4gPiAgaW50IHNtdV91cGRhdGVfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0g
c211X3RhYmxlX2lkIHRhYmxlX2luZGV4LCBpbnQgYXJndW1lbnQsCj4gPiAgICAgICAgICAgICAg
ICAgICAgICB2b2lkICp0YWJsZV9kYXRhLCBib29sIGRydjJzbXUpCj4gPiAgewo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCj4gPiBpbmRleCAz
NDA5M2RkY2ExMDUuLjQ2MmJhZThkNjJhYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKPiA+IEBAIC04MjAsMTAgKzgyMCwxMCBA
QCBzdHJ1Y3Qgc211X2Z1bmNzCj4gPiAgICAgICAgICgoc211KS0+cHB0X2Z1bmNzLT5zZXRfdGhl
cm1hbF9mYW5fdGFibGUgPyAoc211KS0+cHB0X2Z1bmNzLT5zZXRfdGhlcm1hbF9mYW5fdGFibGUo
KHNtdSkpIDogMCkKPiA+ICAjZGVmaW5lIHNtdV9zdGFydF90aGVybWFsX2NvbnRyb2woc211KSBc
Cj4gPiAgICAgICAgICgoc211KS0+ZnVuY3MtPnN0YXJ0X3RoZXJtYWxfY29udHJvbD8gKHNtdSkt
PmZ1bmNzLT5zdGFydF90aGVybWFsX2NvbnRyb2woKHNtdSkpIDogMCkKPiA+IC0jZGVmaW5lIHNt
dV9yZWFkX3NlbnNvcihzbXUsIHNlbnNvciwgZGF0YSwgc2l6ZSkgXAo+ID4gLSAgICAgICAoKHNt
dSktPmZ1bmNzLT5yZWFkX3NlbnNvcj8gKHNtdSktPmZ1bmNzLT5yZWFkX3NlbnNvcigoc211KSwg
KHNlbnNvciksIChkYXRhKSwgKHNpemUpKSA6IDApCj4gPiArI2RlZmluZSBzbXVfc21jX3JlYWRf
c2Vuc29yKHNtdSwgc2Vuc29yLCBkYXRhLCBzaXplKSBcCj4gPiArICAgICAgICgoc211KS0+ZnVu
Y3MtPnJlYWRfc2Vuc29yPyAoc211KS0+ZnVuY3MtPnJlYWRfc2Vuc29yKChzbXUpLCAoc2Vuc29y
KSwgKGRhdGEpLCAoc2l6ZSkpIDogLUVJTlZBTCkKPiA+ICAjZGVmaW5lIHNtdV9hc2ljX3JlYWRf
c2Vuc29yKHNtdSwgc2Vuc29yLCBkYXRhLCBzaXplKSBcCj4gPiAtICAgICAgICgoc211KS0+cHB0
X2Z1bmNzLT5yZWFkX3NlbnNvcj8gKHNtdSktPnBwdF9mdW5jcy0+cmVhZF9zZW5zb3IoKHNtdSks
IChzZW5zb3IpLCAoZGF0YSksIChzaXplKSkgOiAwKQo+ID4gKyAgICAgICAoKHNtdSktPnBwdF9m
dW5jcy0+cmVhZF9zZW5zb3I/IChzbXUpLT5wcHRfZnVuY3MtPnJlYWRfc2Vuc29yKChzbXUpLCAo
c2Vuc29yKSwgKGRhdGEpLCAoc2l6ZSkpIDogLUVJTlZBTCkKPiA+ICAjZGVmaW5lIHNtdV9nZXRf
cG93ZXJfcHJvZmlsZV9tb2RlKHNtdSwgYnVmKSBcCj4gPiAgICAgICAgICgoc211KS0+cHB0X2Z1
bmNzLT5nZXRfcG93ZXJfcHJvZmlsZV9tb2RlID8gKHNtdSktPnBwdF9mdW5jcy0+Z2V0X3Bvd2Vy
X3Byb2ZpbGVfbW9kZSgoc211KSwgYnVmKSA6IDApCj4gPiAgI2RlZmluZSBzbXVfc2V0X3Bvd2Vy
X3Byb2ZpbGVfbW9kZShzbXUsIHBhcmFtLCBwYXJhbV9zaXplKSBcCj4gPiBAQCAtOTg5LDUgKzk4
OSw2IEBAIGVudW0gYW1kX2RwbV9mb3JjZWRfbGV2ZWwgc211X2dldF9wZXJmb3JtYW5jZV9sZXZl
bChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7Cj4gPiAgaW50IHNtdV9mb3JjZV9wZXJmb3JtYW5j
ZV9sZXZlbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZl
bCBsZXZlbCk7Cj4gPiAgaW50IHNtdV9zZXRfZGlzcGxheV9jb3VudChzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgdWludDMyX3QgY291bnQpOwo+ID4gIGJvb2wgc211X2Nsa19kcG1faXNfZW5hYmxl
ZChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUpOwo+
ID4gLQo+ID4gK2ludCBzbXVfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVu
dW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29yLAo+ID4gKyAgICAgICAgICAgICAgICAgICB2b2lkICpk
YXRhLCB1aW50MzJfdCAqc2l6ZSk7Cj4gPiAgI2VuZGlmCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gPiBpbmRleCA0NmUyOTEzZTRhZjQuLjBhNTM2OTU3
ODViNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jCj4gPiBAQCAtMTM2NSw2ICsxMzY1LDkgQEAgc3RhdGljIGludCBuYXZpMTBfcmVhZF9zZW5z
b3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gPiAgICAgICAgIHN0cnVjdCBzbXVfdGFibGVf
Y29udGV4dCAqdGFibGVfY29udGV4dCA9ICZzbXUtPnNtdV90YWJsZTsKPiA+ICAgICAgICAgUFBU
YWJsZV90ICpwcHRhYmxlID0gdGFibGVfY29udGV4dC0+ZHJpdmVyX3BwdGFibGU7Cj4gPgo+ID4g
KyAgICAgICBpZiAoIWRhdGEgfHwgIXNpemUpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gPiArCj4gPiAgICAgICAgIHN3aXRjaCAoc2Vuc29yKSB7Cj4gPiAgICAgICAgIGNh
c2UgQU1ER1BVX1BQX1NFTlNPUl9NQVhfRkFOX1JQTToKPiA+ICAgICAgICAgICAgICAgICAqKHVp
bnQzMl90ICopZGF0YSA9IHBwdGFibGUtPkZhbk1heGltdW1ScG07Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwo+ID4gaW5kZXggNzZiYzE1NzUyNWQwLi4yNjc5
YjZmZjZjYTMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9z
bXVfdjExXzAuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3Yx
MV8wLmMKPiA+IEBAIC0xMjY3LDYgKzEyNjcsMTAgQEAgc3RhdGljIGludCBzbXVfdjExXzBfcmVh
ZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2b2lkICpkYXRhLCB1aW50MzJfdCAqc2l6ZSkKPiA+ICB7Cj4gPiAgICAg
ICAgIGludCByZXQgPSAwOwo+ID4gKwo+ID4gKyAgICAgICBpZiAoIWRhdGEgfHwgIXNpemUpCj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArCj4gPiAgICAgICAgIHN3aXRj
aCAoc2Vuc29yKSB7Cj4gPiAgICAgICAgIGNhc2UgQU1ER1BVX1BQX1NFTlNPUl9HRlhfTUNMSzoK
PiA+ICAgICAgICAgICAgICAgICByZXQgPSBzbXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBT
TVVfVUNMSywgKHVpbnQzMl90ICopZGF0YSk7Cj4gPiBAQCAtMTI4NSwxNCArMTI4OSwxMCBAQCBz
dGF0aWMgaW50IHNtdV92MTFfMF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwK
PiA+ICAgICAgICAgICAgICAgICAqc2l6ZSA9IDQ7Cj4gPiAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gPiAgICAgICAgIGRlZmF1bHQ6Cj4gPiAtICAgICAgICAgICAgICAgcmV0ID0gc211X2NvbW1v
bl9yZWFkX3NlbnNvcihzbXUsIHNlbnNvciwgZGF0YSwgc2l6ZSk7Cj4gPiArICAgICAgICAgICAg
ICAgcmV0ID0gLUVJTlZBTDsKPiA+ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAg
fQo+ID4KPiA+IC0gICAgICAgLyogdHJ5IGdldCBzZW5zb3IgZGF0YSBieSBhc2ljICovCj4gPiAt
ICAgICAgIGlmIChyZXQpCj4gPiAtICAgICAgICAgICAgICAgcmV0ID0gc211X2FzaWNfcmVhZF9z
ZW5zb3Ioc211LCBzZW5zb3IsIGRhdGEsIHNpemUpOwo+ID4gLQo+ID4gICAgICAgICBpZiAocmV0
KQo+ID4gICAgICAgICAgICAgICAgICpzaXplID0gMDsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCj4gPiBpbmRleCBiY2QwZWZhZjdiYmQuLmI0NGVj
N2M2NzBjNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Zl
Z2EyMF9wcHQuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIw
X3BwdC5jCj4gPiBAQCAtMzE0Niw2ICszMTQ2LDkgQEAgc3RhdGljIGludCB2ZWdhMjBfcmVhZF9z
ZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gPiAgICAgICAgIHN0cnVjdCBzbXVfdGFi
bGVfY29udGV4dCAqdGFibGVfY29udGV4dCA9ICZzbXUtPnNtdV90YWJsZTsKPiA+ICAgICAgICAg
UFBUYWJsZV90ICpwcHRhYmxlID0gdGFibGVfY29udGV4dC0+ZHJpdmVyX3BwdGFibGU7Cj4gPgo+
ID4gKyAgICAgICBpZiAoIWRhdGEgfHwgIXNpemUpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gPiArCj4gPiAgICAgICAgIHN3aXRjaCAoc2Vuc29yKSB7Cj4gPiAgICAgICAg
IGNhc2UgQU1ER1BVX1BQX1NFTlNPUl9NQVhfRkFOX1JQTToKPiA+ICAgICAgICAgICAgICAgICAq
KHVpbnQzMl90ICopZGF0YSA9IHBwdGFibGUtPkZhbk1heGltdW1ScG07Cj4gPiAtLQo+ID4gMi4y
Mi4wCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiA+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
