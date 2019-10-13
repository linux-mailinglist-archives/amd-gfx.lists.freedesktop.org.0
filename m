Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7341D56E0
	for <lists+amd-gfx@lfdr.de>; Sun, 13 Oct 2019 18:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D524089CA8;
	Sun, 13 Oct 2019 16:50:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FF0899E7
 for <amd-gfx@lists.freedesktop.org>; Sun, 13 Oct 2019 16:50:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j18so16931917wrq.10
 for <amd-gfx@lists.freedesktop.org>; Sun, 13 Oct 2019 09:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VW5uVo8QDGjNJp7vgAn27lqEXKXB/TElGKzDqTI/u9c=;
 b=qitDbIF4pU9CdBCuuNVrn9GRb2mEA67B8xCVxfN37ik3w9lIuQ1U1yxJw3YVCjLANT
 aROA6OQJNkY9QW2BDFKTEmNQ5CcDJR4+bg4I1jwf7bFEd1ieVTmVF41FHYPvbMj4splu
 KdIsO4H7c/3tHZB5SzF0Uv+NKYx+OeCRw5sdlUFKEPPhb05pvLAtIi94iJ4MSmKz5xjY
 PHjSshVJy3S0rO2dYdIvrVtCxIhVzck+nZJNIH5oBR4iGUBJoxi94PTNsTq4A75Og4Lr
 kLBagNKFe5wXyqTQDjaRjB6dwtcHcnooehIVFuVPPobip1JRNwXcsaMqDy9uHmrH0dhA
 EVyQ==
X-Gm-Message-State: APjAAAXXclMbzmGN6AkQasZJSSShbmTvPTphE5SZTBDBf64+WXDqa1go
 yIiV1aU1fttOw43wUo+42Sg216u9uLpfmOZK5Eybfg==
X-Google-Smtp-Source: APXvYqwmC4rFbe7YAw1QRlIHdmp6m7GiUUxaRJemEgwQ2SW+icV78e//U16nhrYUhNdZWR5ykF/7zZ1G546BE1tpYNA=
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr3791919wrw.206.1570985418343; 
 Sun, 13 Oct 2019 09:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191011014536.10869-1-alexander.deucher@amd.com>
 <20191011014536.10869-3-alexander.deucher@amd.com>
 <20191012114527.akspejxsm3hvrzil@wunner.de>
In-Reply-To: <20191012114527.akspejxsm3hvrzil@wunner.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 13 Oct 2019 12:50:05 -0400
Message-ID: <CADnq5_NDvGMNF4dsrP5eEbo-a4EN4qsWaBDv-YJ0gCJZhJPyKQ@mail.gmail.com>
Subject: Re: [PATCH 02/19] drm/amdgpu: add supports_baco callback for soc15
 asics.
To: Lukas Wunner <lukas@wunner.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VW5uVo8QDGjNJp7vgAn27lqEXKXB/TElGKzDqTI/u9c=;
 b=OnRzwpj2wafniVgchZZgeiLGj5WQUlYNKQuqLGInSpcziOEOxIRU3tyDU/cj+tav2p
 WYqlsXTf6+a358rdyKVVTG8i1R/xWCWTypl6m36RKFGrVx/aphetoKZkAPT9tX37+0X2
 zWoAm1q6Bh3yju6aJKyBkAVCCH7yxWRW1RnYWcyZTjJBCdNgD1cScl+OfoncAf/tUwjV
 P8UjrGM8yw2gd3a7oMYh3cT9cnRRblau8waBh1hURDDIhxDYCBmZ36tTiQgJCmEr8E6n
 1IktvJ0ky1/896ZlEnXSRocI79Hb6htQanJz6kleWzLLeA3Cp8HdwewJDszHbE4pmojd
 sgFA==
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
Cc: Takashi Iwai <tiwai@suse.de>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMTIsIDIwMTkgYXQgNzo0NSBBTSBMdWthcyBXdW5uZXIgPGx1a2FzQHd1bm5l
ci5kZT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAxMCwgMjAxOSBhdCAwODo0NToxOVBNIC0wNTAw
LCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gPiBDaGVjayB0aGUgQkFDTyBjYXBhYmlsaXRpZXMgZnJv
bSB0aGUgcG93ZXJwbGF5IHRhYmxlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBbLi4uXQo+ID4gQEAgLTk5Nyw2ICsxMDIw
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfYXNpY19mdW5jcyB2ZWdhMjBfYXNpY19m
dW5jcyA9Cj4gPiAgICAgICAucmVhZF9iaW9zX2Zyb21fcm9tID0gJnNvYzE1X3JlYWRfYmlvc19m
cm9tX3JvbSwKPiA+ICAgICAgIC5yZWFkX3JlZ2lzdGVyID0gJnNvYzE1X3JlYWRfcmVnaXN0ZXIs
Cj4gPiAgICAgICAucmVzZXQgPSAmc29jMTVfYXNpY19yZXNldCwKPiA+ICsgICAgIC5yZXNldF9t
ZXRob2QgPSAmc29jMTVfYXNpY19yZXNldF9tZXRob2QsCj4gPiAgICAgICAuc2V0X3ZnYV9zdGF0
ZSA9ICZzb2MxNV92Z2Ffc2V0X3N0YXRlLAo+ID4gICAgICAgLmdldF94Y2xrID0gJnNvYzE1X2dl
dF94Y2xrLAo+ID4gICAgICAgLnNldF91dmRfY2xvY2tzID0gJnNvYzE1X3NldF91dmRfY2xvY2tz
LAo+ID4gQEAgLTEwMDksNyArMTAzMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2Fz
aWNfZnVuY3MgdmVnYTIwX2FzaWNfZnVuY3MgPQo+ID4gICAgICAgLmdldF9wY2llX3VzYWdlID0g
JnZlZ2EyMF9nZXRfcGNpZV91c2FnZSwKPiA+ICAgICAgIC5uZWVkX3Jlc2V0X29uX2luaXQgPSAm
c29jMTVfbmVlZF9yZXNldF9vbl9pbml0LAo+ID4gICAgICAgLmdldF9wY2llX3JlcGxheV9jb3Vu
dCA9ICZzb2MxNV9nZXRfcGNpZV9yZXBsYXlfY291bnQsCj4gPiAtICAgICAucmVzZXRfbWV0aG9k
ID0gJnNvYzE1X2FzaWNfcmVzZXRfbWV0aG9kCj4KPiBTZWVtaW5nbHkgdW5yZWxhdGVkIGNoYW5n
ZSB3aXRob3V0IGV4cGxhbmF0aW9uLgoKSnVzdCBtb3ZlcyB0aGUgc2V0dGluZyBvZiB0aGF0IGNh
bGxiYWNrIHRvIGJldHRlciBhbGlnbiB3aXRoIHRoZQpzdHJ1Y3QgZGVmaW5pdGlvbiBhbmQgb3Ro
ZXIgb3RoZXIgc3RydWN0cyBkZWZpbmVkIGluIHRoaXMgZmluZS4gIEkgY2FuCmRyb3AgaXQuCgpB
bGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
