Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F003565BE
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Apr 2021 09:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517FB6E073;
	Wed,  7 Apr 2021 07:47:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84296E072
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Apr 2021 07:47:53 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r22so7141476edq.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Apr 2021 00:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtec.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=plCjkshfPYRJPx8mJ31yMaLutaXbhwBVGKKe4dKObKg=;
 b=SBNCdqNh5r5ZKz/pliBDgu/zjGwpff6X/nMMNlQmT7otug07Z6cKL91Q8eqijlggW1
 GIU4Zkpxf9PRcK+1jKgOYrph1WS/8B9detl2G+Zy0E3x6BQs3YQcuMZ3h8Zu+Od6FyDo
 yAaSC2CsjNIh8jstnXqh4/49PkqX+G1QvY9oi+8j8zsMHlhEmLHg3hDZptpOEOq98/WM
 5zXIMnL/POlJkAKeagAFrLAo3kNPu/xPJ7Pg8qS3ntuwMV7AH+qxamiHzrENUGdzIejJ
 kg8olDBaXWedrKL+0s0GV6BP57iWHHu0x2yQbfCclpx4iRguiHa770hQ4f9rXEQSPQXl
 p9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=plCjkshfPYRJPx8mJ31yMaLutaXbhwBVGKKe4dKObKg=;
 b=YmWd0DZ86enRapF75BZvcAGzPCD6mowLrHeoSiKVhxNU/4NOFcpE2tb8qD+35whRF7
 1Ed68ubEPFTsCcR5vo3lxsJNoBkM+n3B0svS2rUlAbmVPKsI3iY1Ec9S2ToHmd24ZaDZ
 fu3SHZEu4t6FPkN1SEqNmkFwek0Y7/Ph1JGGAjaPQXBH5WepoA/Nb7zmQwAcPEpnO5aP
 6DrE0iO/tIVPH9ikVbZRq5r9pvtl1wgZuC/kSDARhyXuQT0EqzdIPBpULjwxeC6KLE1k
 4vvbgXExWwSIcFEhfA8tSH5o7KZtQm8SIZQvnw065Nt90Ho12vIgFluLdFyfNglj2wM3
 MBEw==
X-Gm-Message-State: AOAM530uCKZQcTgWWMXgoM5fmthh/kCYbupyf+dbvku9OjpFWiCkB+wk
 1bsrm6u/o9/yr7g0zfu8RUpGnix1G6UUjU7yKZR1fcHcVoCs7w==
X-Google-Smtp-Source: ABdhPJwPE23Wtf/N+0juHMu9EwRg37dtZxIPr8lfT3fxHZ1SOMgqe8rN+97/ZzNABnWC5BIc4DkwMgO9e++sDpVmvu8=
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr2669994eds.375.1617781672421; 
 Wed, 07 Apr 2021 00:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210318083236.43578-1-daniel@qtec.com>
 <MN2PR12MB37755DAAB03FC0065E98EF1183699@MN2PR12MB3775.namprd12.prod.outlook.com>
 <CADnq5_MMTBXt50sqJvYmXWn0uBALz2fNvpSrCfjSuMa99VLa=w@mail.gmail.com>
 <375f0915-83b3-c729-b95f-939d828d24d0@amd.com>
 <CAH1Ww+TNMpk-LYYaM=SG9XGK4wcGY3+w8rJzihUw=4EpzVV9EQ@mail.gmail.com>
 <aae87a0a-d643-8ee9-d0f8-e983f8613a88@gmail.com>
 <CADnq5_NbGz3UaXeTybZBeCSUwxaV8bNxKkaVwtLoZQGSvkbYYg@mail.gmail.com>
In-Reply-To: <CADnq5_NbGz3UaXeTybZBeCSUwxaV8bNxKkaVwtLoZQGSvkbYYg@mail.gmail.com>
From: Daniel Gomez <daniel@qtec.com>
Date: Wed, 7 Apr 2021 09:47:41 +0200
Message-ID: <CAH1Ww+TSv3_LR_sf6hm_-i27=1Wb8Aay5FjOQq2Csh9jvKheCA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/ttm: Fix memory leak userptr pages
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "dagmcr@gmail.com" <dagmcr@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCA2IEFwciAyMDIxIGF0IDIyOjU2LCBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAyMiwgMjAyMSBhdCA2OjM0IEFNIENocmlz
dGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+
ID4KPiA+IEhpIERhbmllbCwKPiA+Cj4gPiBBbSAyMi4wMy4yMSB1bSAxMDozOCBzY2hyaWViIERh
bmllbCBHb21lejoKPiA+ID4gT24gRnJpLCAxOSBNYXIgMjAyMSBhdCAyMToyOSwgRmVsaXggS3Vl
aGxpbmcgPGZlbGl4Lmt1ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+ID4gPj4gVGhpcyBjYXVzZWQg
YSByZWdyZXNzaW9uIGluIGtmZHRlc3QgaW4gYSBsYXJnZS1idWZmZXIgc3RyZXNzIHRlc3QgYWZ0
ZXIKPiA+ID4+IG1lbW9yeSBhbGxvY2F0aW9uIGZvciB1c2VyIHBhZ2VzIGZhaWxzOgo+ID4gPiBJ
J20gc29ycnkgdG8gaGVhciB0aGF0LiBCVFcsIEkgZ3Vlc3MgeW91IG1lYW50IGFtZGdwdSBsZWFr
IHBhdGNoIGFuZAo+ID4gPiBub3QgdGhpcyBvbmUuCj4gPiA+IEp1c3Qgc29tZSBiYWNrZ3JvdW5k
IGZvciB0aGUgbWVtIGxlYWsgcGF0Y2ggaWYgaGVscHMgdG8gdW5kZXJzdGFuZCB0aGlzOgo+ID4g
PiBUaGUgbGVhayB3YXMgaW50cm9kdWNlIGhlcmU6Cj4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lk
PTBiOTg4Y2ExYzdjNGM3Mzk4M2I0ZWE5NmVmN2MyYWYyMjYzYzg3ZWIKPiA+ID4gd2hlcmUgdGhl
IGJvdW5kIHN0YXR1cyB3YXMgaW50cm9kdWNlZCBmb3IgYWxsIGRybSBkcml2ZXJzIGluY2x1ZGlu
Zwo+ID4gPiByYWRlb24gYW5kIGFtZGdwdS4gU28gdGhpcyBwYXRjaCBqdXN0IHJldmVydHMgdGhl
IGxvZ2ljIHRvIHRoZQo+ID4gPiBvcmlnaW5hbCBjb2RlIGJ1dCBrZWVwaW5nIHRoZSBib3VuZCBz
dGF0dXMuIEluIG15IGNhc2UsIHRoZSBiaW5kaW5nCj4gPiA+IGNvZGUgYWxsb2NhdGVzIHRoZSB1
c2VyIHBhZ2VzIG1lbW9yeSBhbmQgcmV0dXJucyB3aXRob3V0IGJvdW5kaW5nIChhdAo+ID4gPiBh
bWRncHVfZ3R0X21ncl9oYXNfZ2FydF9hZGRyKS4gU28sCj4gPiA+IHdoZW4gdGhlIHVuYmluZGlu
ZyBoYXBwZW5zLCB0aGUgbWVtb3J5IG5lZWRzIHRvIGJlIGNsZWFyZWQgdG8gcHJldmVudCB0aGUg
bGVhay4KPiA+Cj4gPiBBaCwgbm93IEkgdW5kZXJzdGFuZCB3aGF0J3MgaGFwcGVuaW5nIGhlcmUu
IERhbmllbCB5b3VyIHBhdGNoIGlzIG5vdAo+ID4gcmVhbGx5IGNvcnJlY3QuCj4gPgo+ID4gVGhl
IHByb2JsZW0gaXMgcmF0aGVyIHRoYXQgd2UgZG9uJ3Qgc2V0IHRoZSB0dCBvYmplY3QgdG8gYm91
bmQgaWYgaXQKPiA+IGRvZXNuJ3QgaGF2ZSBhIEdUVCBhZGRyZXNzLgo+ID4KPiA+IEdvaW5nIHRv
IHByb3ZpZGUgYSBwYXRjaCBmb3IgdGhpcy4KPgo+IERpZCB0aGlzIHBhdGNoIGV2ZXIgbGFuZD8K
CkkgZG9uJ3QgdGhpbmsgc28gYnV0IEkgbWlnaHQgc2VuZCBhIHYyIGZvbGxvd2luZyBDaHJpc3Rp
YW4ncyBjb21tZW50CmlmIHlvdSBndXlzIGFncmVlLgoKQWxzbywgdGhlIHBhdGNoIGhlcmUgaXMg
Zm9yIHJhZGVvbiBidXQgdGhlIHBhZ2VmYXVsdCBpc3N1ZSByZXBvcnRlZCBieQpGZWxpeCBpcyBh
ZmZlY3RlZCBieSB0aGUgYW1kZ3B1IG9uZToKCnJhZGVvbiBwYXRjaDogZHJtL3JhZGVvbi90dG06
IEZpeCBtZW1vcnkgbGVhayB1c2VycHRyIHBhZ2VzCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9kcmktZGV2ZWwvcGF0Y2gvMjAyMTAzMTgwODMyMzYuNDM1NzgtMS1kYW5pZWxA
cXRlYy5jb20vCgphbWRncHUgcGF0Y2g6IGRybS9hbWRncHUvdHRtOiBGaXggbWVtb3J5IGxlYWsg
dXNlcnB0ciBwYWdlcwpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvZHJpLWRl
dmVsL3BhdGNoLzIwMjEwMzE3MTYwODQwLjM2MDE5LTEtZGFuaWVsQHF0ZWMuY29tLwoKSSBhc3N1
bWUgYm90aCBuZWVkIHRvIGJlIGZpeGVkIHdpdGggdGhlIHNhbWUgYXBwcm9hY2guCgpEYW5pZWwK
Pgo+IEFsZXgKPgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBDaHJpc3RpYW4uCj4gPgo+ID4gPgo+ID4g
Pj4gWzE3MzU5LjUzNjMwM10gYW1kZ3B1OiBpbml0X3VzZXJfcGFnZXM6IEZhaWxlZCB0byBnZXQg
dXNlciBwYWdlczogLTE2Cj4gPiA+PiBbMTczNTkuNTQzNzQ2XSBCVUc6IGtlcm5lbCBOVUxMIHBv
aW50ZXIgZGVyZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAwMDAwMDAwMDAwMDAKPiA+ID4+IFsxNzM1
OS41NTE0OTRdICNQRjogc3VwZXJ2aXNvciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQo+ID4g
Pj4gWzE3MzU5LjU1NzM3NV0gI1BGOiBlcnJvcl9jb2RlKDB4MDAwMCkgLSBub3QtcHJlc2VudCBw
YWdlCj4gPiA+PiBbMTczNTkuNTYzMjQ3XSBQR0QgMCBQNEQgMAo+ID4gPj4gWzE3MzU5LjU2NjUx
NF0gT29wczogMDAwMCBbIzFdIFNNUCBQVEkKPiA+ID4+IFsxNzM1OS41NzA3MjhdIENQVTogOCBQ
SUQ6IDU5NDQgQ29tbToga2ZkdGVzdCBOb3QgdGFpbnRlZCA1LjExLjAta2ZkLWZrdWVobGluICMx
OTMKPiA+ID4+IFsxNzM1OS41Nzg3NjBdIEhhcmR3YXJlIG5hbWU6IEFTVVMgQWxsIFNlcmllcy9Y
OTktRSBXUy9VU0IgMy4xLCBCSU9TIDMyMDEgMDYvMTcvMjAxNgo+ID4gPj4gWzE3MzU5LjU4Njk3
MV0gUklQOiAwMDEwOmFtZGdwdV90dG1fYmFja2VuZF91bmJpbmQrMHg1Mi8weDExMCBbYW1kZ3B1
XQo+ID4gPj4gWzE3MzU5LjU5NDA3NV0gQ29kZTogNDggMzkgYzYgNzQgMWIgOGIgNTMgMGMgNDgg
OGQgYmQgODAgYTEgZmYgZmYgZTggMjQgNjIgMDAgMDAgODUgYzAgMGYgODUgYWIgMDAgMDAgMDAg
YzYgNDMgNTQgMDAgNWIgNWQgYzMgNDggOGIgNDYgMTAgOGIgNGUgNTAgPDQ4PiA4YiAzMCA0OCA4
NSBmNiA3NCBiYSA4YiA1MCAwYyA0OCA4YiBiZiA4MCBhMSBmZiBmZiA4MyBlMSAwMSA0NQo+ID4g
Pj4gWzE3MzU5LjYxNDM0MF0gUlNQOiAwMDE4OmZmZmZhNDc2NDk3MWZjOTggRUZMQUdTOiAwMDAx
MDIwNgo+ID4gPj4gWzE3MzU5LjYyMDMxNV0gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZm
Zjk1MGU4ZDRlZGYwMCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDAKPiA+ID4+IFsxNzM1OS42MjgyMDRd
IFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IGZmZmY5NTBlOGQ0ZWRmMDAgUkRJOiBmZmZmOTUw
ZWFkZWM1ZTgwCj4gPiA+PiBbMTczNTkuNjM2MDg0XSBSQlA6IGZmZmY5NTBlYWRlYzVlODAgUjA4
OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAwMDAwMDAwMDAwMAo+ID4gPj4gWzE3MzU5LjY0
Mzk1OF0gUjEwOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMTogMDAwMDAwMDAwMDAwMDAwMSBSMTI6IGZm
ZmY5NTBjMDMzNzc4MDAKPiA+ID4+IFsxNzM1OS42NTE4MzNdIFIxMzogZmZmZjk1MGVhZGVjNWU4
MCBSMTQ6IGZmZmY5NTBjMDMzNzc4NTggUjE1OiAwMDAwMDAwMDAwMDAwMDAwCj4gPiA+PiBbMTcz
NTkuNjU5NzAxXSBGUzogIDAwMDA3ZmViYjIwY2I3NDAoMDAwMCkgR1M6ZmZmZjk1MGViZmMwMDAw
MCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCj4gPiA+PiBbMTczNTkuNjY4NTI4XSBDUzog
IDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCj4gPiA+PiBbMTcz
NTkuNjc1MDEyXSBDUjI6IDAwMDAwMDAwMDAwMDAwMDAgQ1IzOiAwMDAwMDAwNmQ3MDBlMDA1IENS
NDogMDAwMDAwMDAwMDE3MDZlMAo+ID4gPj4gWzE3MzU5LjY4Mjg4M10gQ2FsbCBUcmFjZToKPiA+
ID4+IFsxNzM1OS42ODYwNjNdICBhbWRncHVfdHRtX2JhY2tlbmRfZGVzdHJveSsweDEyLzB4NzAg
W2FtZGdwdV0KPiA+ID4+IFsxNzM1OS42OTIzNDldICB0dG1fYm9fY2xlYW51cF9tZW10eXBlX3Vz
ZSsweDM3LzB4NjAgW3R0bV0KPiA+ID4+IFsxNzM1OS42OTgzMDddICB0dG1fYm9fcmVsZWFzZSsw
eDI3OC8weDVlMCBbdHRtXQo+ID4gPj4gWzE3MzU5LjcwMzM4NV0gIGFtZGdwdV9ib191bnJlZisw
eDFhLzB4MzAgW2FtZGdwdV0KPiA+ID4+IFsxNzM1OS43MDg3MDFdICBhbWRncHVfYW1ka2ZkX2dw
dXZtX2FsbG9jX21lbW9yeV9vZl9ncHUrMHg3ZTUvMHg5MTAgW2FtZGdwdV0KPiA+ID4+IFsxNzM1
OS43MTYzMDddICBrZmRfaW9jdGxfYWxsb2NfbWVtb3J5X29mX2dwdSsweDExYS8weDIyMCBbYW1k
Z3B1XQo+ID4gPj4gWzE3MzU5LjcyMzAzNl0gIGtmZF9pb2N0bCsweDIyMy8weDQwMCBbYW1kZ3B1
XQo+ID4gPj4gWzE3MzU5LjcyODAxN10gID8ga2ZkX2Rldl9pc19sYXJnZV9iYXIrMHg5MC8weDkw
IFthbWRncHVdCj4gPiA+PiBbMTczNTkuNzM0MTUyXSAgX194NjRfc3lzX2lvY3RsKzB4OGIvMHhk
MAo+ID4gPj4gWzE3MzU5LjczODc5Nl0gIGRvX3N5c2NhbGxfNjQrMHgyZC8weDQwCj4gPiA+PiBb
MTczNTkuNzQzMjU5XSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhOQo+
ID4gPj4gWzE3MzU5Ljc0OTIwNV0gUklQOiAwMDMzOjB4N2ZlYmIwODNiNmQ3Cj4gPiA+PiBbMTcz
NTkuNzUzNjgxXSBDb2RlOiBiMyA2NiA5MCA0OCA4YiAwNSBiMSA0NyAyZCAwMCA2NCBjNyAwMCAy
NiAwMCAwMCAwMCA0OCBjNyBjMCBmZiBmZiBmZiBmZiBjMyA2NiAyZSAwZiAxZiA4NCAwMCAwMCAw
MCAwMCAwMCBiOCAxMCAwMCAwMCAwMCAwZiAwNSA8NDg+IDNkIDAxIGYwIGZmIGZmIDczIDAxIGMz
IDQ4IDhiIDBkIDgxIDQ3IDJkIDAwIGY3IGQ4IDY0IDg5IDAxIDQ4Cj4gPiA+PiBbMTczNTkuNzc0
MzQwXSBSU1A6IDAwMmI6MDAwMDdmZmRiNTUyMmNkOCBFRkxBR1M6IDAwMDAwMjAyIE9SSUdfUkFY
OiAwMDAwMDAwMDAwMDAwMDEwCj4gPiA+PiBbMTczNTkuNzgyNjY4XSBSQVg6IGZmZmZmZmZmZmZm
ZmZmZGEgUkJYOiAwMDAwMDAwMDAwMDAwMDAxIFJDWDogMDAwMDdmZWJiMDgzYjZkNwo+ID4gPj4g
WzE3MzU5Ljc5MDU2Nl0gUkRYOiAwMDAwN2ZmZGI1NTIyZDYwIFJTSTogMDAwMDAwMDBjMDI4NGIx
NiBSREk6IDAwMDAwMDAwMDAwMDAwMDMKPiA+ID4+IFsxNzM1OS43OTg0NTldIFJCUDogMDAwMDdm
ZmRiNTUyMmQxMCBSMDg6IDAwMDA3ZmZkYjU1MjJkZDAgUjA5OiAwMDAwMDAwMGM0MDAwMDA0Cj4g
PiA+PiBbMTczNTkuODA2MzUyXSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAw
MDAwMjAyIFIxMjogMDAwMDU1OTQxNmU0ZTJhYQo+ID4gPj4gWzE3MzU5LjgxNDI1MV0gUjEzOiAw
MDAwMDAwMDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMDAyMSBSMTU6IDAwMDAwMDAwMDAwMDAw
MDAKPiA+ID4+IFsxNzM1OS44MjIxNDBdIE1vZHVsZXMgbGlua2VkIGluOiBpcDZ0YWJsZV9maWx0
ZXIgaXA2X3RhYmxlcyBpcHRhYmxlX2ZpbHRlciBhbWRncHUgeDg2X3BrZ190ZW1wX3RoZXJtYWwg
ZHJtX3R0bV9oZWxwZXIgdHRtIGlvbW11X3YyIGdwdV9zY2hlZCBpcF90YWJsZXMgeF90YWJsZXMK
PiA+ID4+IFsxNzM1OS44Mzc3NzZdIENSMjogMDAwMDAwMDAwMDAwMDAwMAo+ID4gPj4gWzE3MzU5
Ljg0MTg4OF0gLS0tWyBlbmQgdHJhY2UgYTZmMjdkNjQ0NzViMjhjOCBdLS0tCj4gPiA+PiBbMTcz
NTkuODQ3MzE4XSBSSVA6IDAwMTA6YW1kZ3B1X3R0bV9iYWNrZW5kX3VuYmluZCsweDUyLzB4MTEw
IFthbWRncHVdCj4gPiA+PiBbMTczNTkuODU0NDc5XSBDb2RlOiA0OCAzOSBjNiA3NCAxYiA4YiA1
MyAwYyA0OCA4ZCBiZCA4MCBhMSBmZiBmZiBlOCAyNCA2MiAwMCAwMCA4NSBjMCAwZiA4NSBhYiAw
MCAwMCAwMCBjNiA0MyA1NCAwMCA1YiA1ZCBjMyA0OCA4YiA0NiAxMCA4YiA0ZSA1MCA8NDg+IDhi
IDMwIDQ4IDg1IGY2IDc0IGJhIDhiIDUwIDBjIDQ4IDhiIGJmIDgwIGExIGZmIGZmIDgzIGUxIDAx
IDQ1Cj4gPiA+PiBbMTczNTkuODc0OTI5XSBSU1A6IDAwMTg6ZmZmZmE0NzY0OTcxZmM5OCBFRkxB
R1M6IDAwMDEwMjA2Cj4gPiA+PiBbMTczNTkuODgxMDE0XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAg
UkJYOiBmZmZmOTUwZThkNGVkZjAwIFJDWDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gPj4gWzE3MzU5
Ljg4OTAwN10gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogZmZmZjk1MGU4ZDRlZGYwMCBSREk6
IGZmZmY5NTBlYWRlYzVlODAKPiA+ID4+IFsxNzM1OS44OTcwMDhdIFJCUDogZmZmZjk1MGVhZGVj
NWU4MCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAwCj4gPiA+PiBb
MTczNTkuOTA1MDIwXSBSMTA6IDAwMDAwMDAwMDAwMDAyNDYgUjExOiAwMDAwMDAwMDAwMDAwMDAx
IFIxMjogZmZmZjk1MGMwMzM3NzgwMAo+ID4gPj4gWzE3MzU5LjkxMzAzNF0gUjEzOiBmZmZmOTUw
ZWFkZWM1ZTgwIFIxNDogZmZmZjk1MGMwMzM3Nzg1OCBSMTU6IDAwMDAwMDAwMDAwMDAwMDAKPiA+
ID4+IFsxNzM1OS45MjEwNTBdIEZTOiAgMDAwMDdmZWJiMjBjYjc0MCgwMDAwKSBHUzpmZmZmOTUw
ZWJmYzAwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPiA+ID4+IFsxNzM1OS45MzAw
NDddIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPiA+
ID4+IFsxNzM1OS45MzY2NzRdIENSMjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDA2ZDcw
MGUwMDUgQ1I0OiAwMDAwMDAwMDAwMTcwNmUwCj4gPiA+ICBGcm9tIHdoYXQgSSB1bmRlcnN0YW5k
LCB0aGUgaW5pdF91c2VyX3BhZ2VzIGZhaWxzIChyZXR1cm5zIEVCVVNZKSBhbmQKPiA+ID4gdGhl
IGNvZGUgZ29lcyB0byBhbGxvY2F0ZV9pbml0X3VzZXJfcGFnZXNfZmFpbGVkIHdoZXJlIHRoZSB1
bmJpbmQgYW5kCj4gPiA+IHRoZSB1c2VycHRyIGNsZWFyIG9jY3Vycy4KPiA+ID4gQ2FuIHdlIHBy
ZXZlbnQgdGhpcyBpZiB3ZSBzYXZlIHRoZSBib3VuZGluZyBzdGF0dXMgKyB1c2VycHRyIGFsbG9j
PyBzbwo+ID4gPiB0aGUgZnVuY3Rpb24gYW1kZ3B1X3R0bV9iYWNrZW5kX3VuYmluZCByZXR1cm5z
IHdpdGhvdXQgdHJ5aW5nIHRvIGNsZWFyCj4gPiA+IHRoZSB1c2VycHRyIG1lbW9yeT8KPiA+ID4K
PiA+ID4gU29tZXRoaW5nIGxpa2U6Cj4gPiA+Cj4gPiA+IGFtZGdwdV90dG1fYmFja2VuZF9iaW5k
Ogo+ID4gPiAgICAgIGlmIChndHQtPnVzZXJwdHIpIHsKPiA+ID4gICAgICAgICAgciA9IGFtZGdw
dV90dG1fdHRfcGluX3VzZXJwdHIoYmRldiwgdHRtKTsKPiA+ID4gICAgICAgICAgaWYgKHIpIC4u
Lgo+ID4gPiAgICAgICAgIGd0dC0+c2dfdGFibGUgPSB0cnVlOwo+ID4gPiAgICAgfQo+ID4gPgo+
ID4gPiBhbWRncHVfdHRtX2JhY2tlbmRfdW5iaW5kOgo+ID4gPiBpZiAoZ3R0LT5zZ190YWJsZSkg
ewo+ID4gPiAgICAgICAgICBpZiAoZ3R0LT51c2VyX3B0cikgLi4uCj4gPiA+IH0KPiA+ID4KPiA+
ID4gSWYgeW91IGFncmVlLCBJJ2xsIHNlbmQgYSB2MiBwYXRjaC4gT3RoZXJ3aXNlLCBtYXliZSB3
ZSBjb3VsZCByZXR1cm4KPiA+ID4gd2l0aGluIGFtZGdwdV90dG1fdHRfdW5waW5fdXNlcnB0ciBp
ZiBtZW1vcnkgaGFzbid0IGJlZW4gYWxsb2NhdGVkLgo+ID4gPgo+ID4gPiBBbnkgb3RoZXIgaWRl
YXM/Cj4gPiA+Cj4gPiA+IFJlZ2FyZHMsCj4gPiA+IERhbmllbAo+ID4gPgo+ID4gPj4gUmV2ZXJ0
aW5nIHRoaXMgcGF0Y2ggZml4ZXMgdGhlIHByb2JsZW0gZm9yIG1lLgo+ID4gPj4KPiA+ID4+IFJl
Z2FyZHMsCj4gPiA+PiAgICAgRmVsaXgKPiA+ID4+Cj4gPiA+PiBPbiAyMDIxLTAzLTE4IDEwOjU3
IHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToKPiA+ID4+PiBBcHBsaWVkLiAgVGhhbmtzIQo+ID4g
Pj4+Cj4gPiA+Pj4gQWxleAo+ID4gPj4+Cj4gPiA+Pj4gT24gVGh1LCBNYXIgMTgsIDIwMjEgYXQg
NTowMCBBTSBLb2VuaWcsIENocmlzdGlhbgo+ID4gPj4+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20+IHdyb3RlOgo+ID4gPj4+PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4gPj4+PiBWb246IERhbmllbCBHb21leiA8ZGFuaWVsQHF0ZWMuY29tPgo+ID4gPj4+
PiBHZXNlbmRldDogRG9ubmVyc3RhZywgMTguIE3DpHJ6IDIwMjEgMDk6MzIKPiA+ID4+Pj4gQ2M6
IGRhZ21jckBnbWFpbC5jb20gPGRhZ21jckBnbWFpbC5jb20+OyBEYW5pZWwgR29tZXogPGRhbmll
bEBxdGVjLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyA8bGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZz4KPiA+ID4+Pj4gQmV0cmVmZjogW1BBVENIXSBkcm0vcmFkZW9u
L3R0bTogRml4IG1lbW9yeSBsZWFrIHVzZXJwdHIgcGFnZXMKPiA+ID4+Pj4KPiA+ID4+Pj4gSWYg
dXNlcnB0ciBwYWdlcyBoYXZlIGJlZW4gcGlubmVkIGJ1dCBub3QgYm91bmRlZCwKPiA+ID4+Pj4g
dGhleSByZW1haW4gdW5jbGVhcmVkLgo+ID4gPj4+Pgo+ID4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgR29tZXogPGRhbmllbEBxdGVjLmNvbT4KPiA+ID4+Pj4gLS0tCj4gPiA+Pj4+ICAgIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIHwgNSArKystLQo+ID4gPj4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPj4+Pgo+
ID4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+ID4gPj4+PiBpbmRleCBlOGM2
NmQxMDQ3OGYuLmJiY2M2MjY0ZDQ4ZiAxMDA2NDQKPiA+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiA+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fdHRtLmMKPiA+ID4+Pj4gQEAgLTQ4NSwxMyArNDg1LDE0IEBAIHN0YXRpYyB2
b2lkIHJhZGVvbl90dG1fYmFja2VuZF91bmJpbmQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYs
IHN0cnVjdCB0dG1fdHQKPiA+ID4+Pj4gICAgICAgICAgICBzdHJ1Y3QgcmFkZW9uX3R0bV90dCAq
Z3R0ID0gKHZvaWQgKil0dG07Cj4gPiA+Pj4+ICAgICAgICAgICAgc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYgPSByYWRlb25fZ2V0X3JkZXYoYmRldik7Cj4gPiA+Pj4+Cj4gPiA+Pj4+ICsgICAg
ICAgaWYgKGd0dC0+dXNlcnB0cikKPiA+ID4+Pj4gKyAgICAgICAgICAgICAgIHJhZGVvbl90dG1f
dHRfdW5waW5fdXNlcnB0cihiZGV2LCB0dG0pOwo+ID4gPj4+PiArCj4gPiA+Pj4+ICAgICAgICAg
ICAgaWYgKCFndHQtPmJvdW5kKQo+ID4gPj4+PiAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+
ID4gPj4+Pgo+ID4gPj4+PiAgICAgICAgICAgIHJhZGVvbl9nYXJ0X3VuYmluZChyZGV2LCBndHQt
Pm9mZnNldCwgdHRtLT5udW1fcGFnZXMpOwo+ID4gPj4+Pgo+ID4gPj4+PiAtICAgICAgIGlmIChn
dHQtPnVzZXJwdHIpCj4gPiA+Pj4+IC0gICAgICAgICAgICAgICByYWRlb25fdHRtX3R0X3VucGlu
X3VzZXJwdHIoYmRldiwgdHRtKTsKPiA+ID4+Pj4gICAgICAgICAgICBndHQtPmJvdW5kID0gZmFs
c2U7Cj4gPiA+Pj4+ICAgIH0KPiA+ID4+Pj4KPiA+ID4+Pj4gLS0KPiA+ID4+Pj4gMi4zMC4yCj4g
PiA+Pj4+Cj4gPiA+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiA+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4+Pj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4gPj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+Pj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+ID4gPj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4+PiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+ID4gPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
ID4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngKPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
