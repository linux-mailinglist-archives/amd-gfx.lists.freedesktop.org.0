Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8059CD7EAB
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 20:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65466E876;
	Tue, 15 Oct 2019 18:17:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A586E392
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 18:11:40 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id h195so12984407pfe.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 11:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0za/Sp4Qykw4QW51/H0d9M7C13yw8IHUmkWtTzYXed4=;
 b=aT74poog3CV36JkcTlew0wCtbSCFofIWekOMcsKNZ7XJOzQNKONQlMoHiK+X9RH1tV
 QBkeT7ndwcQ6k/Wa/qOjTZtViUtlL5EjeTpntK5pd8eRkDiAbf8VcKUNYubj7a49KW3k
 5x5sImcz16XQcqHdNboSZ/F+KpqTSyOZXNjdLVDux2AbW0RGskXloaCV4H3GOGgR6QuA
 jcEP/kxeLc9M8mubUNTbZ6h0/NNG6eGZivF+durQI44xoWbc4ZL1PqNXiCzmDiBdQzR5
 3ICfFNh85Fs7x2gwkGXzNSOeA5rhT4hru0dyc2cpeX5lSdUdvbibEKuU/DvoAJ41CMr1
 fKCw==
X-Gm-Message-State: APjAAAXqEPvS4q9r8Y3/jQZys8amKlM257GSLltkMk/NeLNyiVvmBL6T
 sZeD5RNVq5Kv3hxzMVFgucvXDh1rK3iaqYzaDWw9wA==
X-Google-Smtp-Source: APXvYqwH71tuFzG2dIPadc4DHaN36KmLMAfeczkEh8WcUsaRC3O9hofShhek7FG9RlsJ2bWIgB6bl2aaCPI9yVENxt0=
X-Received: by 2002:a65:464b:: with SMTP id k11mr22065858pgr.263.1571163099433; 
 Tue, 15 Oct 2019 11:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
 <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
 <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
 <CAKwvOdnLxm_tZ_qR1D-BE64Z3QaMC2h79ooobdRVAzmCD_2_Sg@mail.gmail.com>
In-Reply-To: <CAKwvOdnLxm_tZ_qR1D-BE64Z3QaMC2h79ooobdRVAzmCD_2_Sg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Oct 2019 11:11:28 -0700
Message-ID: <CAKwvOdmEDQ1yy0A1Z+x-8MX6taBJPaAseghpHxphrUi29wWRfA@mail.gmail.com>
Subject: Re: AMDGPU and 16B stack alignment
To: Arnd Bergmann <arnd@arndb.de>, "S, Shirish" <sshankar@amd.com>
X-Mailman-Approved-At: Tue, 15 Oct 2019 18:17:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0za/Sp4Qykw4QW51/H0d9M7C13yw8IHUmkWtTzYXed4=;
 b=VMmKiwezo3wfATGWffS9Sj68ypdRb4vEBPOvGMn7MGGOcQbnOAkXbVztO2NQGMzoJO
 YPZ5YpKlG2/tQLjWaXlryfMt/l/SH+kE8rvK4L6ocAO+A/ZxMmFeFRe1KdYZSwcvgpeH
 maasw7nZfvZGkCMsSglYvJAXnW2TqXI3ziNYlI5L7DkGrFNShEEirRIpbDdCKcB1MoKk
 g7UaGWlLWG6SInBMl5iDCvNrl2qqIzepqa8aZe6Jcpa77ap4QzpOYkHKhBAG0g3+s3lL
 i3ikKMjlVLlAFMOe4BbolGxDrrc4tWN10WL70e806SpXDWKQLWdTkGxV8q4Y3WKE0vC4
 0Sjg==
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
 clang-built-linux <clang-built-linux@googlegroups.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "S, Shirish" <Shirish.S@amd.com>,
 Matthias Kaehlcke <mka@google.com>, "yshuiv7@gmail.com" <yshuiv7@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTE6MDUgQU0gTmljayBEZXNhdWxuaWVycwo8bmRlc2F1
bG5pZXJzQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTI6
MTkgQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVl
LCBPY3QgMTUsIDIwMTkgYXQgOTowOCBBTSBTLCBTaGlyaXNoIDxzc2hhbmthckBhbWQuY29tPiB3
cm90ZToKPiA+ID4gT24gMTAvMTUvMjAxOSAzOjUyIEFNLCBOaWNrIERlc2F1bG5pZXJzIHdyb3Rl
Ogo+ID4KPiA+ID4gTXkgZ2NjIGJ1aWxkIGZhaWxzIHdpdGggYmVsb3cgZXJyb3JzOgo+ID4gPgo+
ID4gPiBkY25fY2FsY3MuYzoxOjA6IGVycm9yOiAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT0z
IGlzIG5vdCBiZXR3ZWVuIDQgYW5kIDEyCj4gPiA+Cj4gPiA+IGRjbl9jYWxjX21hdGguYzoxOjA6
IGVycm9yOiAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT0zIGlzIG5vdCBiZXR3ZWVuIDQgYW5k
IDEyCj4KPiBJIHdhcyBhYmxlIHRvIHJlcHJvZHVjZSB0aGlzIGZhaWx1cmUgb24gcHJlLTcuMSB2
ZXJzaW9ucyBvZiBHQ0MuICBJdAo+IHNlZW1zIHRoYXQgd2hlbjoKPiAxLiBjb2RlIGlzIHVzaW5n
IGRvdWJsZXMKPiAyLiBzZXR0aW5nIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTMgLW1uby1z
c2UyLCBpZS4gOEIgc3RhY2sgYWxpZ25tZW50Cj4gdGhhbiBHQ0MgcHJvZHVjZXMgdGhhdCBlcnJv
cjoKPiBodHRwczovL2dvZGJvbHQub3JnL3ovN1Q4bmJICj4KCkFsc28sIEkgc3VzcGVjdCB0aGF0
IHZlcnkgZXJyb3Igc29sdmVzIHRoZSBteXN0ZXJ5IG9mICJ3aHkgd2FzIDE2QgpzdGFjayBhbGln
bm1lbnQgZXZlciBzcGVjaWZpZWQ/IgotLSAKVGhhbmtzLAp+TmljayBEZXNhdWxuaWVycwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
