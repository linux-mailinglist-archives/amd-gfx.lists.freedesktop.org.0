Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 909A010557F
	for <lists+amd-gfx@lfdr.de>; Thu, 21 Nov 2019 16:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0136E1AA;
	Thu, 21 Nov 2019 15:26:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843A36E1AA
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 Nov 2019 15:26:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x26so3888168wmk.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 Nov 2019 07:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dlJqzm8zov1BwMcL/SPiBCTYFYxwHMQK7UC+hj5+nsg=;
 b=iODpGtI8He0o8tcFuz0B54rka0CvMf8oVP6jt+AvF/4U8GTf4XDEW6bulPFJaJkrhh
 aSttEE0bUu7YQTmG08zm9Tt2Rrn9wt7A94jLtyvQycKRZRmqMOqw6JYyfQwuNBSUYf8u
 r4T8JyIrcqcWM3cb0uk2JqFjbxA1AHKTFUevO7JY7cKj2VG5Nw5bfCBBJ5pveAMgMruz
 uXTJBLyHzYi2fkva0VgHgUvbVCmsDi9iCpKArIgjXZl6OorFFKKy9UBv8th1CgJccIBI
 bF96QDDTHJt1nCE6aKb0l5q5fO9anD2zAuYHvDvEaMYO/nVFECIoO3mH0w9ewirz7ydA
 /4Yw==
X-Gm-Message-State: APjAAAUuNWleMqcHu1Lwv3sbWc6SQTxJC8dKXc4rAgLkVhI36tYDOoXX
 nWj3IAIBM3hKm51+oHmyp3ZVHfjVfD0em1hsHVMxJA==
X-Google-Smtp-Source: APXvYqxkYVx1UFttw062mZ0est/xprmsdMBxUIJhYcKIdy2Qk8CktU3axQhWVogT0A09BARsDXvBdtLSV3Z6bhu0eTQ=
X-Received: by 2002:a7b:c408:: with SMTP id k8mr11084011wmi.67.1574350008981; 
 Thu, 21 Nov 2019 07:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20191121061707.25958-1-Jack.Zhang1@amd.com>
 <CADnq5_MrfFWAjC__9ccB46CYzdcLWP=DPKD70aXAm862DJLu1g@mail.gmail.com>
In-Reply-To: <CADnq5_MrfFWAjC__9ccB46CYzdcLWP=DPKD70aXAm862DJLu1g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Nov 2019 10:26:37 -0500
Message-ID: <CADnq5_OE8xi7TmgxWe2PiWVxM8pVhxAtYF=CTtT7AHOhrUhEyA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/amdgpu/sriov skip RLCG s/r list for arcturus
 VF.
To: Jack Zhang <Jack.Zhang1@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dlJqzm8zov1BwMcL/SPiBCTYFYxwHMQK7UC+hj5+nsg=;
 b=UV5ugJy4zDokI94JPNbAFUqWDRr0KBeiVXIyUmcbqywOLx71vpH6s9lGLdBR4sAkf5
 2GQFmcoM/o4fKl30foZls/ZCuudfUpxUFZo0uGm+7MBfA6358+Ab3Q1+tA4YSpdDFo5b
 KbWnYcJ+G8o6k7vbmO+ukFVD+Uf8PXTVte5Vt7TGREDD+1BHhofmDmG+Ihz3Fj1r+9H2
 NBAHLOCZm76GNffEP3otIXxKVscT8Qgvw07gbcnSnv70pHW5weYExdzG3JgVCBX+4p/k
 BN3b5KHhgyA0kQehhXc0iUIwoPiibY94AlkJiVwp1tm5ylYeFADOTsfx0+IOX+xYDFdG
 WlxA==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TmV2ZXJtaW5kLiAgSSBtaXNzZWQgdGhlIHNyLWlvdiBjaGVjay4gUGF0Y2ggaXM6CkFja2VkLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpPbiBUaHUsIE5vdiAy
MSwgMjAxOSBhdCAxMDoyNSBBTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4g
d3JvdGU6Cj4KPiBXb24ndCB0aGlzIGltcGFjdCBiYXJlIG1ldGFsIGh3IHRoYXQgbmVlZHMgdGhp
cz8KPgo+IEFsZXgKPgo+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDE6MTcgQU0gSmFjayBaaGFu
ZyA8SmFjay5aaGFuZzFAYW1kLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWZ0ZXIgcmxjZyBmdyAyLjEs
IGttZCBkcml2ZXIgc3RhcnRzIHRvIGxvYWQgZXh0cmEgZncgZm9yCj4gPiBMSVNUX0NOVEwsR1BN
X01FTSxTUk1fTUVNLiBXZSBuZWVkcyB0byBza2lwIHRoZSB0aHJlZSBmdwo+ID4gYmVjYXVzZSBh
bGwgcmxjZyByZWxhdGVkIGZ3IGhhdmUgYmVlbiBsb2FkZWQgYnkgaG9zdCBkcml2ZXIuCj4gPiBH
dWVzdCBkcml2ZXIgd291bGQgbG9hZCB0aGUgdGhyZWUgZncgZmFpbCB3aXRob3V0IHRoaXMgY2hh
bmdlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphY2sgWmhhbmcgPEphY2suWmhhbmcxQGFtZC5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMg
fCA1ICsrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKPiA+IGlu
ZGV4IGMzYTQyZDMuLmVlY2RlODAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuYwo+ID4gQEAgLTE0NzAsNyArMTQ3MCwxMCBAQCBzdGF0aWMgaW50IHBzcF9u
cF9md19sb2FkKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQo+ID4gICAgICAgICAgICAgICAgICAg
ICB8fCB1Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RFX0lEX1NETUE1Cj4gPiAgICAgICAg
ICAgICAgICAgICAgIHx8IHVjb2RlLT51Y29kZV9pZCA9PSBBTURHUFVfVUNPREVfSURfU0RNQTYK
PiA+ICAgICAgICAgICAgICAgICAgICAgfHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09E
RV9JRF9TRE1BNwo+ID4gLSAgICAgICAgICAgICAgICAgICB8fCB1Y29kZS0+dWNvZGVfaWQgPT0g
QU1ER1BVX1VDT0RFX0lEX1JMQ19HKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgIHx8IHVjb2Rl
LT51Y29kZV9pZCA9PSBBTURHUFVfVUNPREVfSURfUkxDX0cKPiA+ICsgICAgICAgICAgICAgICAg
ICAgfHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNU
X0NOVEwKPiA+ICsgICAgICAgICAgICAgICAgICAgfHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQ
VV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNUX0dQTV9NRU0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgfHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNU
X1NSTV9NRU0pKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgLypza2lwIHVjb2RlIGxvYWRp
bmcgaW4gU1JJT1YgVkYgKi8KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+
ID4KPiA+IC0tCj4gPiAyLjcuNAo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+ID4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
