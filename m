Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B93B6A4BD
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 11:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976ED6E0E2;
	Tue, 16 Jul 2019 09:20:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EC76E0E2
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 09:20:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p13so20062041wru.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 02:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5eqfWaxDuoq2L+H3LuQJoLY7qtCtUo8MG6Y0LMMzEl0=;
 b=Dv9i/jG/ergi5ONSjktqGzq1u57KU8zmrjqW4U6xGlBHIKnYdbbkjMVVv3JTXtF5XK
 dx6yJNlqPlJH1XVd4GpPiclQubTQZi+YXJaCyd5t0xABowC1nwMD/Y2brLf/OVEpjNhg
 DBVZwcSMqby+rVJ+KdrCtJPXd7M5ZmG6DO/QjoLsb6n9cKPh8IOtwFeQJuRq3i2+4GPB
 /z3drfdxoKg+azKHlTVQhqh17r++4Irm7I8xy0n4G6Jc/XfCBThW89dasl4CU5SBPeXX
 SrKlWwqA8wM9NJd/vbtChtnoc59b7JnuSmAycaASm97eIlzyVjgDoUJ+OCUnMyIfo1P6
 QZIA==
X-Gm-Message-State: APjAAAXB5av8uhowwervQxLboyGOmD0tErJ7oehY0euhcKtqJ94mdv7H
 0wRhfuZtpN7+mkZsWcEjnpnyuQ8Q
X-Google-Smtp-Source: APXvYqx/ePL4wqBgo8Cb8Msua5c9BTKyNhRERKjmTQlRjWG9QILwfoslJuCvIE7zrlrIRc2eVFLk3g==
X-Received: by 2002:adf:9d8b:: with SMTP id p11mr4433633wre.226.1563268811228; 
 Tue, 16 Jul 2019 02:20:11 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r12sm24000571wrt.95.2019.07.16.02.20.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 02:20:10 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/amd/amdgpu: Add missing select_me_pipe_q() for
 gfx10
To: "StDenis, Tom" <Tom.StDenis@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190712134406.30374-1-tom.stdenis@amd.com>
 <20190712134406.30374-2-tom.stdenis@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <37368717-dc54-266a-fe4f-7d49f28be60e@gmail.com>
Date: Tue, 16 Jul 2019 11:20:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712134406.30374-2-tom.stdenis@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5eqfWaxDuoq2L+H3LuQJoLY7qtCtUo8MG6Y0LMMzEl0=;
 b=b9SH9dzAqXCXmltkkKjd/OCeoCK2lCJFSt+/ivt2DEFEPWtTQ2QO2uKF4YMik9rB9f
 xsG0y/BK38weiFh973IrFxVbsWw4oRfLOI98PbF07vgJGrP2LgWe6iNZI9wwAYI+8mY7
 Shp2nLRQk+WRwYESWUJUA3siR7e9Oc8CTz+KtkfgDo73h3MYSelR6K/Q+oYsgOAz+U1U
 ETJA093kzgrmnr/DCJ3TBG42LVIB/dIfp0GK58FI2uEjdbzOHeNt8rx4eftXKMNxpG8K
 0Fxv61RYf14v6T9UR/TYPVovXgLtsuzL06Rg+GjxLZULeLa6h6v0Tbx9P0CSfQljVE+g
 UDvQ==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTIuMDcuMTkgdW0gMTU6NDQgc2NocmllYiBTdERlbmlzLCBUb206Cj4gU2lnbmVkLW9mZi1i
eTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCA3ICsrKysrKysKPiAgIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBf
MC5jCj4gaW5kZXggMGQ5NGM4MTJkZjFiLi43ZDUyMDdiYmUzODIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwo+IEBAIC0xMDYxLDYgKzEwNjEsMTIgQEAgc3RhdGlj
IHZvaWQgZ2Z4X3YxMF8wX3JlYWRfd2F2ZV92Z3BycyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgdWludDMyX3Qgc2ltZCwKPiAgIAkJc3RhcnQgKyBTUUlORF9XQVZFX1ZHUFJTX09GRlNFVCwg
c2l6ZSwgZHN0KTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgdm9pZCBnZnhfdjEwXzBfc2VsZWN0X21l
X3BpcGVfcShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiArCQkJCQkJCQkJICB1MzIgbWUs
IHUzMiBwaXBlLCB1MzIgcSwgdTMyIHZtKQoKTG9va3Mgb2RkbHkgaW5kZW50ZWQsIGJ1dCBjb3Vs
ZCBhcyB3ZWxsIGJlIGp1c3QgbXkgbWFpbCBjbGllbnQuCgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3aGVuIHlvdSBkb3VibGUgCmNoZWNrZWQg
dGhhdC4KCkNocmlzdGlhbi4KCj4gKyB7Cj4gKyAgICAgICBudl9ncmJtX3NlbGVjdChhZGV2LCBt
ZSwgcGlwZSwgcSwgdm0pOwo+ICsgfQo+ICsKPiAgIAo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBh
bWRncHVfZ2Z4X2Z1bmNzIGdmeF92MTBfMF9nZnhfZnVuY3MgPSB7Cj4gICAJLmdldF9ncHVfY2xv
Y2tfY291bnRlciA9ICZnZnhfdjEwXzBfZ2V0X2dwdV9jbG9ja19jb3VudGVyLAo+IEBAIC0xMDY4
LDYgKzEwNzQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nZnhfZnVuY3MgZ2Z4X3Yx
MF8wX2dmeF9mdW5jcyA9IHsKPiAgIAkucmVhZF93YXZlX2RhdGEgPSAmZ2Z4X3YxMF8wX3JlYWRf
d2F2ZV9kYXRhLAo+ICAgCS5yZWFkX3dhdmVfc2dwcnMgPSAmZ2Z4X3YxMF8wX3JlYWRfd2F2ZV9z
Z3BycywKPiAgIAkucmVhZF93YXZlX3ZncHJzID0gJmdmeF92MTBfMF9yZWFkX3dhdmVfdmdwcnMs
Cj4gKwkuc2VsZWN0X21lX3BpcGVfcSA9ICZnZnhfdjEwXzBfc2VsZWN0X21lX3BpcGVfcSwKPiAg
IH07Cj4gICAKPiAgIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9ncHVfZWFybHlfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
