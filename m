Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0021267521
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 20:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416256E358;
	Fri, 12 Jul 2019 18:37:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BAA6E358
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 18:37:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x4so10911117wrt.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 11:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VqHEo2Uh56Hcpeu62lbf0hL+DzyYUkil0yQblamoc1Y=;
 b=LS8IxRm9HoRHGr83eI3TtR9RB/6DZocwLH0+JorId3jEtfBvuV7X1h2P07k4+Q8eqv
 lC/PA7pJOHzNYo0QYwJiqAOmxxau5gHLT3OqQefP4VNMpviOPFHUQn98Ivy0FkoH33q0
 wBlD0yvQ6SKMcsE+HTG98ERCg8zPduiUDeSUWTsvi3hW43Kr9V0o/21QbngA4AKOe9La
 nDBmAM57XzBbSt0OY2Zo57ZMWk44SImZrfi7oR3JOvP1CAsb6mQ54s9g4V1N7q3O6wyw
 SpqjGp4ExNjMXa5lzpkqf1JJOROTLUIEkyDY2h3WTPP3KpNp45q6s7qb+rOSFl6nbXdS
 CPUg==
X-Gm-Message-State: APjAAAXje/yNG4uYRuKUD6uNQtdp6wyhGLNqqY9zY2MqkmD/AyMKsoSH
 XGnCoj4jH+tw9ws2T+l3c/+0zSHUzYuQmwQ52Wos+g==
X-Google-Smtp-Source: APXvYqzpnCkRBnl3j03CePw9qxEt18UHQre4YH3E5baDXc5r/ZNRMc4uf3fEfXSd1Hgv47yy3jTRVPZOB9Mfweup5So=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr12625257wrw.323.1562956635845; 
 Fri, 12 Jul 2019 11:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190712134406.30374-1-tom.stdenis@amd.com>
 <20190712134406.30374-2-tom.stdenis@amd.com>
In-Reply-To: <20190712134406.30374-2-tom.stdenis@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Jul 2019 14:37:04 -0400
Message-ID: <CADnq5_Ng7hEK=PMDsB0AKUJpZiSRPeZVNsLvNEhb07agzV_ZcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/amdgpu: Add missing select_me_pipe_q() for
 gfx10
To: "StDenis, Tom" <Tom.StDenis@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VqHEo2Uh56Hcpeu62lbf0hL+DzyYUkil0yQblamoc1Y=;
 b=ZpkaIs6YVcNV495aJGezUJgsQzSptm1xR8s879+9nDu5N+aXMd0aYAU+T89BVhMNBe
 OoFmrfq/YF7XZsTZ+Pm0wUZyxKbuGWiWWkWqyZ1BNyxN/1U+OgIHoSt6Vhol2i0io7ik
 WbJjUdQpefAuqDIZgFw36Szwte49X4DHsnbA14qcinah0eCa9VbcgrakqaiawVzhS5mt
 EoeBxkCprmmh1HqZmHCmapBioAexdoK8a/rNlrmXzhDXinrCbINaYDetsltD+ZRDir0F
 J+rtNDoGN33BQIJ5GjItRofyYl2TsWGTr0ikUETj8SjCrQO84/grak2GFS29PbLE8CV3
 I0Nw==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgOTo0NCBBTSBTdERlbmlzLCBUb20gPFRvbS5TdERlbmlz
QGFtZC5jb20+IHdyb3RlOgo+Cj4gU2lnbmVkLW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3Rk
ZW5pc0BhbWQuY29tPgoKUGxlYXNlIGFkZCBhIHBhdGNoIGRlc2NyaXB0aW9uLiAgV2l0aCB0aGF0
IGZpeGVkLCB0aGUgc2VyaWVzIGlzOgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92MTBfMC5jIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCj4gaW5kZXggMGQ5NGM4
MTJkZjFiLi43ZDUyMDdiYmUzODIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3YxMF8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYwo+IEBAIC0xMDYxLDYgKzEwNjEsMTIgQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3Jl
YWRfd2F2ZV92Z3BycyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgc2ltZCwK
PiAgICAgICAgICAgICAgICAgc3RhcnQgKyBTUUlORF9XQVZFX1ZHUFJTX09GRlNFVCwgc2l6ZSwg
ZHN0KTsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIGdmeF92MTBfMF9zZWxlY3RfbWVfcGlwZV9xKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIG1lLCB1MzIg
cGlwZSwgdTMyIHEsIHUzMiB2bSkKPiArIHsKPiArICAgICAgIG52X2dyYm1fc2VsZWN0KGFkZXYs
IG1lLCBwaXBlLCBxLCB2bSk7Cj4gKyB9Cj4gKwo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1k
Z3B1X2dmeF9mdW5jcyBnZnhfdjEwXzBfZ2Z4X2Z1bmNzID0gewo+ICAgICAgICAgLmdldF9ncHVf
Y2xvY2tfY291bnRlciA9ICZnZnhfdjEwXzBfZ2V0X2dwdV9jbG9ja19jb3VudGVyLAo+IEBAIC0x
MDY4LDYgKzEwNzQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nZnhfZnVuY3MgZ2Z4
X3YxMF8wX2dmeF9mdW5jcyA9IHsKPiAgICAgICAgIC5yZWFkX3dhdmVfZGF0YSA9ICZnZnhfdjEw
XzBfcmVhZF93YXZlX2RhdGEsCj4gICAgICAgICAucmVhZF93YXZlX3NncHJzID0gJmdmeF92MTBf
MF9yZWFkX3dhdmVfc2dwcnMsCj4gICAgICAgICAucmVhZF93YXZlX3ZncHJzID0gJmdmeF92MTBf
MF9yZWFkX3dhdmVfdmdwcnMsCj4gKyAgICAgICAuc2VsZWN0X21lX3BpcGVfcSA9ICZnZnhfdjEw
XzBfc2VsZWN0X21lX3BpcGVfcSwKPiAgfTsKPgo+ICBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfZ3B1
X2Vhcmx5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gLS0KPiAyLjIxLjAKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
