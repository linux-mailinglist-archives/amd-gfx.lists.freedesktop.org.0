Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CFAD7E6C
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 20:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A7A6E39B;
	Tue, 15 Oct 2019 18:07:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362E76E38A
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 18:06:09 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id k7so9971192pll.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 11:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBqT9Ybr/Ipic63e3mRedQn/6ltePkNsW7NCVWavp3g=;
 b=pYMigrAjhj7Djv6rXhwd5seCICtKlzgUut4BG4bwoE47HCY/YH+DFgx/KHI29T4wCe
 cIVg/hydeKTTMaYcqNO+dtu8sNAmFPDXj7FLdu/CU3VdWJPFYPF+ZXowfJ/NdZvu1Q4D
 fV1ctj835T42JxK9nyevUGrQ9XqWrTPrmwoPIRzlXkquQLg29A3sdpQHVMUMw4U1aYSC
 mRvjfai6yq2gmi5+n8olvrZX7zR81dMSfq04S5C2Tv0wUvvm9O/X1/X3OdU7OFTXrM6X
 aS7AGmciPX4iK7g4aRePzrf5P2LmrKJ5mucFKvloUSWL1KIM3w5kwinhB39AysBG2dVg
 0Nyg==
X-Gm-Message-State: APjAAAVS2y2qSfQ8vAtkcGpW9uO6vgX6hXm65Sg5YcID14+P2hke+uhg
 3wqixZDrwvZqA2ZB7qmpy4T6O3DFXC4Bk4+BJlsskw==
X-Google-Smtp-Source: APXvYqx/GzA2ea/qqOKmR0URniymnPEQbAPNCRFY3WJQqBqUY31DiRHgDGzArE6Z+eGUbLr7QD5P9iMo1PzrV5IgrKA=
X-Received: by 2002:a17:902:9b83:: with SMTP id
 y3mr36165530plp.179.1571162768113; 
 Tue, 15 Oct 2019 11:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
 <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
 <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
In-Reply-To: <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Oct 2019 11:05:56 -0700
Message-ID: <CAKwvOdnLxm_tZ_qR1D-BE64Z3QaMC2h79ooobdRVAzmCD_2_Sg@mail.gmail.com>
Subject: Re: AMDGPU and 16B stack alignment
To: Arnd Bergmann <arnd@arndb.de>, "S, Shirish" <sshankar@amd.com>
X-Mailman-Approved-At: Tue, 15 Oct 2019 18:07:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hBqT9Ybr/Ipic63e3mRedQn/6ltePkNsW7NCVWavp3g=;
 b=ljbIiqwTrf9NgeFAUtAMBFbK8YLkRUnSe2tlxycaq/vf6DF+H5f5YZwmFn6BZThyMx
 GMnP05W2z06TEWbrr7e6mBtKXgyQ5vwWFyMHlx0eP1C8o7USaba3spZ3vAdAFxGi5Ych
 6R3em4hnjlCV/+9+5aVmTHipoSIFG1IeYAEjGz4CKeox9hY6sRiPne5GqYdWOhcz8SMs
 ux2fodB3vdy1OJcfDNCV1X1Es8hxIxqLqoRVfszKdjWtw1kgx1acKA9VnvaPt5lEaSSO
 Xuy0A5V5kkr3AnMXf5BTFZe6/IlOrY6vcqNsE8S1jhoMBzXKNhN5JGucaw2Q+m7Wv0na
 +gXw==
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

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTI6MTkgQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCA5OjA4IEFNIFMsIFNoaXJp
c2ggPHNzaGFua2FyQGFtZC5jb20+IHdyb3RlOgo+ID4gT24gMTAvMTUvMjAxOSAzOjUyIEFNLCBO
aWNrIERlc2F1bG5pZXJzIHdyb3RlOgo+Cj4gPiBNeSBnY2MgYnVpbGQgZmFpbHMgd2l0aCBiZWxv
dyBlcnJvcnM6Cj4gPgo+ID4gZGNuX2NhbGNzLmM6MTowOiBlcnJvcjogLW1wcmVmZXJyZWQtc3Rh
Y2stYm91bmRhcnk9MyBpcyBub3QgYmV0d2VlbiA0IGFuZCAxMgo+ID4KPiA+IGRjbl9jYWxjX21h
dGguYzoxOjA6IGVycm9yOiAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT0zIGlzIG5vdCBiZXR3
ZWVuIDQgYW5kIDEyCgpJIHdhcyBhYmxlIHRvIHJlcHJvZHVjZSB0aGlzIGZhaWx1cmUgb24gcHJl
LTcuMSB2ZXJzaW9ucyBvZiBHQ0MuICBJdApzZWVtcyB0aGF0IHdoZW46CjEuIGNvZGUgaXMgdXNp
bmcgZG91YmxlcwoyLiBzZXR0aW5nIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTMgLW1uby1z
c2UyLCBpZS4gOEIgc3RhY2sgYWxpZ25tZW50CnRoYW4gR0NDIHByb2R1Y2VzIHRoYXQgZXJyb3I6
Cmh0dHBzOi8vZ29kYm9sdC5vcmcvei83VDhuYkgKClRoYXQncyBhbHJlYWR5IGEgdGFsbCBvcmRl
ciBvZiBjb25zdHJhaW50cywgc28gaXQncyB1bmRlcnN0YW5kYWJsZQp0aGF0IHRoZSBjb21waWxl
ciB3b3VsZCBqdXN0IGVycm9yIGxpa2VseSBkdXJpbmcgaW5zdHJ1Y3Rpb24Kc2VsZWN0aW9uLCBi
dXQgd2FzIGV2ZW50dWFsbHkgdGF1Z2h0IGhvdyB0byBzb2x2ZSBzdWNoIGNvbnN0cmFpbnRzLgoK
PiA+Cj4gPiBXaGlsZSBHUEYgb2JzZXJ2ZWQgb24gY2xhbmcgYnVpbGRzIHNlZW0gdG8gYmUgZml4
ZWQuCgpUaGFua3MgZm9yIHRoZSByZXBvcnQuICBZb3VyIHRlc3RpbmcgdGhlc2UgcGF0Y2hlcyBp
cyBpbnZhbHVhYmxlLCBTaGlyaXNoIQoKPgo+IE9rLCBzbyBpdCBzZWVtcyB0aGF0IGdjYyBpbnNp
c3RzIG9uIGhhdmluZyBhdCBsZWFzdCAyXjQgYnl0ZXMgc3RhY2sKPiBhbGlnbm1lbnQgd2hlbgo+
IFNTRSBpcyBlbmFibGVkIG9uIHg4Ni02NCwgYnV0IGRvZXMgbm90IGFjdHVhbGx5IHJlbHkgb24g
dGhhdCBmb3IKPiBjb3JyZWN0IG9wZXJhdGlvbgo+IHVubGVzcyBpdCdzIHVzaW5nIHNzZTIuIFNv
IC1tc3NlIGFsd2F5cyBoYXMgdG8gYmUgcGFpcmVkIHdpdGgKPiAgLW1wcmVmZXJyZWQtc3RhY2st
Ym91bmRhcnk9My4KClNlZW1pbmdseSBvbmx5IGZvciBvbGRlciB2ZXJzaW9ucyBvZiBHQ0MsIHBy
ZSA3LjEuCgo+Cj4gRm9yIGNsYW5nLCBpdCBzb3VuZHMgbGlrZSB0aGUgb3Bwb3NpdGUgaXMgdHJ1
ZTogd2hlbiBwYXNzaW5nIDE2IGJ5dGUKPiBzdGFjayBhbGlnbm1lbnQKPiBhbmQgaGF2aW5nIHNz
ZS9zc2UyIGVuYWJsZWQsIGl0IHJlcXVpcmVzIHRoZSBpbmNvbWluZyBzdGFjayB0byBiZSAxNgo+
IGJ5dGUgYWxpZ25lZCwKCkkgZG9uJ3QgdGhpbmsgaXQgcmVxdWlyZXMgdGhlIGluY29taW5nIHN0
YWNrIHRvIGJlIDE2QiBhbGlnbmVkIGZvcgpzc2UyLCBJIHRoaW5rIGl0IHJlcXVpcmVzIHRoZSBp
bmNvbWluZyBhbmQgY3VycmVudCBzdGFjayBhbGlnbm1lbnQgdG8KbWF0Y2guIFRvZGF5IGl0IGRv
ZXMgbm90LCB3aGljaCBpcyB3aHkgd2Ugb2JzZXJ2ZSBHUEZzLgoKPiBidXQgcGFzc2luZyA4IGJ5
dGUgYWxpZ25tZW50IG1ha2VzIGl0IGRvIHRoZSByaWdodCB0aGluZy4KPgo+IFNvLCBzaG91bGQg
d2UganVzdCBhbHdheXMgcGFzcyAkKGNhbGwgY2Mtb3B0aW9uLCAtbXByZWZlcnJlZC1zdGFjay1i
b3VuZGFyeT00KQo+IHRvIGdldCB0aGUgZGVzaXJlZCBvdXRjb21lIG9uIGJvdGg/CgpIbW1tLi4u
SSB3b3VsZCBoYXZlIGxpa2VkIHRvIHJlbW92ZSBpdCBvdXRyaWdodCwgYXMgaXQgaXMgYW4gQUJJ
Cm1pc21hdGNoIHRoYXQgaXMgbGlrZWx5IHRvIHJlc3VsdCBpbiBpbnN0YWJpbGl0eSBhbmQgbm9u
LWZ1bi10by1kZWJ1ZwpydW50aW1lIGlzc3VlcyBpbiB0aGUgZnV0dXJlLiAgSSBzdXNwZWN0IG15
IHBhdGNoIGRvZXMgd29yayBmb3IgR0NDCjcuMSsuICBUaGUgcXVlc3Rpb24gaXM6IERvIHdlIHdh
bnQgdG8gZWl0aGVyOgoxLiBtYXJrIEFNREdQVSBicm9rZW4gZm9yIEdDQyA8IDcuMSwgb3IKMi4g
Y29udGludWUgc3VwcG9ydGluZyBpdCB2aWEgc3RhY2sgYWxpZ25tZW50IG1pc21hdGNoPwoKMiBp
cyBicml0dGxlLCBhbmQgbWF5IGJyZWFrIGF0IGFueSBwb2ludCBpbiB0aGUgZnV0dXJlLCBidXQg
aWYgaXQncwp3b3JraW5nIGZvciBzb21lb25lIGl0IGRvZXMgbWFrZSBtZSBmZWVsIGJhZCB0byBv
dXRyaWdodCBkaXNhYmxlIGl0LgpXaGF0IEknZCBpbWFnZSAyIGxvb2tzIGxpa2UgaXMgKHBzdWVk
byBjb2RlIGluIGEgTWFrZWZpbGUpOgoKaWYgQ0NfSVNfR0NDICYmIEdDQ19WRVJTSU9OIDwgNy4x
OgogIHNldCBzdGFjayBhbGlnbm1lbnQgdG8gMTZCIGFuZCBob3BlIGZvciB0aGUgYmVzdAoKU28g
bXkgZGlmZiB3b3VsZCBiZSBhbWVuZGVkIHRvIGtlZXAgdGhlIHN0YWNrIGFsaWdubWVudCBmbGFn
cywgYnV0Cm9ubHkgdG8gc3VwcG9ydCBHQ0MgPCA3LjEuICBBbmQgdGhhdCBhc3N1bWVzIG15IGNo
YW5nZSBjb21waWxlcyB3aXRoCkdDQyA3LjErLiAoTG9va3MgbGlrZSBpdCBkb2VzIGZvciBtZSBs
b2NhbGx5IHdpdGggR0NDIDguMywgYnV0IEkgd291bGQKZmVlbCBldmVuIG1vcmUgY29uZmlkZW50
IGlmIHNvbWVvbmUgd2l0aCBoYXJkd2FyZSB0byB0ZXN0IG9uIGFuZCBHQ0MKNy4xKyBjb3VsZCBi
b290IHRlc3QpLgotLSAKVGhhbmtzLAp+TmljayBEZXNhdWxuaWVycwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
