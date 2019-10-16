Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E43BDA332
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 03:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08466E9E7;
	Thu, 17 Oct 2019 01:32:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FFC89A4F
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 23:05:39 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q7so323309pfh.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 16:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dvr2k2cesqfqWN6XGDafc/ENwBi4+yjAQQmmpnGGw1M=;
 b=nm+v8W1qoDGyQrqQFyjEgcFYi/e7rHccmuN9jAqlx1dCI+n8OU8zhAbwuzHDP9G3PB
 M9kiwUGy0owIY/9/5vyxtLJ4trnfyTrLd6Ju2VfWy6hmLTTjAPftF2joLNVxNrwQfo5m
 SPQkDuOu7frpYtMuk5V/kGxSqeVhWc0UVR5n8xwwvM/aUpmrudutC6bEdvGKC826B6RF
 vIFXLFAcAPplGCnQDJ/u7/TXzoRMO9+5qe68r78Fm0OW6+2lIL8AgfH55TR4P9pNo92q
 5G+YRC1cViMj36JpgXAxQbCwKkqQX+Gmj7OHOzlwl7ID9t6vRUJKWXAp54TJJBRetmdF
 Ukww==
X-Gm-Message-State: APjAAAVQ8Edb3e0jvTSgatZCIUCnXkMtSUZPi+Lger9x8V1qZoYLtYn9
 4E335uPsOXxfe8J93OHoJ6lSzBAqkr24SFS9Gq9WLw==
X-Google-Smtp-Source: APXvYqwCWg6vuWk/c7vo6aVbHSfyIrRLJzTxaFNbwVhkRwUofko28zx66hVQm8lxJNsn7OZeLh6uNs1z75f9BLHI7/Y=
X-Received: by 2002:a63:5448:: with SMTP id e8mr679797pgm.10.1571267138767;
 Wed, 16 Oct 2019 16:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
 <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
 <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
 <CAKwvOdnLxm_tZ_qR1D-BE64Z3QaMC2h79ooobdRVAzmCD_2_Sg@mail.gmail.com>
 <20191015202636.GA1671072@rani>
 <CAKwvOd=yGXMwdoxKCD2gcEgevozf41jVmqCkW7CU=Xvd7mqtjw@mail.gmail.com>
 <20191016185500.GA2674383@rani>
In-Reply-To: <20191016185500.GA2674383@rani>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 16 Oct 2019 16:05:27 -0700
Message-ID: <CAKwvOdkXDyqMA-mOz_PE9x0V0ePtA9uFcJS+1ibpBqde6MXX4g@mail.gmail.com>
Subject: Re: AMDGPU and 16B stack alignment
To: Arvind Sankar <nivedita@alum.mit.edu>
X-Mailman-Approved-At: Thu, 17 Oct 2019 01:32:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dvr2k2cesqfqWN6XGDafc/ENwBi4+yjAQQmmpnGGw1M=;
 b=j5ZVArQNVMKzmkp+DRled9bM3rrZ/59tqf72vSdYRblhYDT7OdWKSLu8b4ZhXvnmWY
 RBe0YRjhf+228rDoYlf1FOs4ipUl2vCn9ce/y0H5bt1n78fFi7EPW7r9mFDM9Ik5sCXP
 KFOR6Nb0NkY46WU7xEUn9swCntPjQuLCqe77V1vMCY9uB7LPhRf7+KIZMiZy4wC43aKK
 nmHGIn9otzLVJrfckmeEO6poTKol439elLaDIeGXgzoFcueonkBUVSY1XF1q1BpFvPDG
 u1REr8fQmr++x737PzzimqhhHDd17CdN2S7h/RHfj/hDR5iMB+msu5M68JbMPAfEV35u
 OukA==
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
 Arnd Bergmann <arnd@arndb.de>, Matthias Kaehlcke <mka@google.com>, "S,
 Shirish" <sshankar@amd.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "S, Shirish" <Shirish.S@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 "yshuiv7@gmail.com" <yshuiv7@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTE6NTUgQU0gQXJ2aW5kIFNhbmthciA8bml2ZWRpdGFA
YWx1bS5taXQuZWR1PiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDE1LCAyMDE5IGF0IDA2OjUxOjI2
UE0gLTA3MDAsIE5pY2sgRGVzYXVsbmllcnMgd3JvdGU6Cj4gPiBPbiBUdWUsIE9jdCAxNSwgMjAx
OSBhdCAxOjI2IFBNIEFydmluZCBTYW5rYXIgPG5pdmVkaXRhQGFsdW0ubWl0LmVkdT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IE9uIFR1ZSwgT2N0IDE1LCAyMDE5IGF0IDExOjA1OjU2QU0gLTA3MDAsIE5p
Y2sgRGVzYXVsbmllcnMgd3JvdGU6Cj4gPiA+ID4gSG1tbS4uLkkgd291bGQgaGF2ZSBsaWtlZCB0
byByZW1vdmUgaXQgb3V0cmlnaHQsIGFzIGl0IGlzIGFuIEFCSQo+ID4gPiA+IG1pc21hdGNoIHRo
YXQgaXMgbGlrZWx5IHRvIHJlc3VsdCBpbiBpbnN0YWJpbGl0eSBhbmQgbm9uLWZ1bi10by1kZWJ1
Zwo+ID4gPiA+IHJ1bnRpbWUgaXNzdWVzIGluIHRoZSBmdXR1cmUuICBJIHN1c3BlY3QgbXkgcGF0
Y2ggZG9lcyB3b3JrIGZvciBHQ0MKPiA+ID4gPiA3LjErLiAgVGhlIHF1ZXN0aW9uIGlzOiBEbyB3
ZSB3YW50IHRvIGVpdGhlcjoKPiA+ID4gPiAxLiBtYXJrIEFNREdQVSBicm9rZW4gZm9yIEdDQyA8
IDcuMSwgb3IKPiA+ID4gPiAyLiBjb250aW51ZSBzdXBwb3J0aW5nIGl0IHZpYSBzdGFjayBhbGln
bm1lbnQgbWlzbWF0Y2g/Cj4gPiA+ID4KPiA+ID4gPiAyIGlzIGJyaXR0bGUsIGFuZCBtYXkgYnJl
YWsgYXQgYW55IHBvaW50IGluIHRoZSBmdXR1cmUsIGJ1dCBpZiBpdCdzCj4gPiA+ID4gd29ya2lu
ZyBmb3Igc29tZW9uZSBpdCBkb2VzIG1ha2UgbWUgZmVlbCBiYWQgdG8gb3V0cmlnaHQgZGlzYWJs
ZSBpdC4KPiA+ID4gPiBXaGF0IEknZCBpbWFnZSAyIGxvb2tzIGxpa2UgaXMgKHBzdWVkbyBjb2Rl
IGluIGEgTWFrZWZpbGUpOgo+ID4gPiA+Cj4gPiA+ID4gaWYgQ0NfSVNfR0NDICYmIEdDQ19WRVJT
SU9OIDwgNy4xOgo+ID4gPiA+ICAgc2V0IHN0YWNrIGFsaWdubWVudCB0byAxNkIgYW5kIGhvcGUg
Zm9yIHRoZSBiZXN0Cj4gPiA+ID4KPiA+ID4gPiBTbyBteSBkaWZmIHdvdWxkIGJlIGFtZW5kZWQg
dG8ga2VlcCB0aGUgc3RhY2sgYWxpZ25tZW50IGZsYWdzLCBidXQKPiA+ID4gPiBvbmx5IHRvIHN1
cHBvcnQgR0NDIDwgNy4xLiAgQW5kIHRoYXQgYXNzdW1lcyBteSBjaGFuZ2UgY29tcGlsZXMgd2l0
aAo+ID4gPiA+IEdDQyA3LjErLiAoTG9va3MgbGlrZSBpdCBkb2VzIGZvciBtZSBsb2NhbGx5IHdp
dGggR0NDIDguMywgYnV0IEkgd291bGQKPiA+ID4gPiBmZWVsIGV2ZW4gbW9yZSBjb25maWRlbnQg
aWYgc29tZW9uZSB3aXRoIGhhcmR3YXJlIHRvIHRlc3Qgb24gYW5kIEdDQwo+ID4gPiA+IDcuMSsg
Y291bGQgYm9vdCB0ZXN0KS4KPiA+ID4gPiAtLQo+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiB+Tmlj
ayBEZXNhdWxuaWVycwo+ID4gPgo+ID4gPiBJZiB3ZSBkbyBrZWVwIGl0LCB3b3VsZCBhZGRpbmcg
LW1zdGFja3JlYWxpZ24gbWFrZSBpdCBtb3JlIHJvYnVzdD8KPiA+ID4gVGhhdCdzIHNpbXBsZSBh
bmQgd2lsbCBvbmx5IGFkZCB0aGUgYWxpZ25tZW50IHRvIGZ1bmN0aW9ucyB0aGF0IHJlcXVpcmUK
PiA+ID4gMTYtYnl0ZSBhbGlnbm1lbnQgKGF0IGxlYXN0IG9uIGdjYykuCj4gPgo+ID4gSSB0aGlu
ayB0aGVyZSdzIGFsc28gYC1taW5jb21pbmctc3RhY2stYm91bmRhcnk9YC4KPiA+IGh0dHBzOi8v
Z2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzczNSNpc3N1ZWNvbW1lbnQt
NTQwMDM4MDE3Cj4KPiBZZXMsIGJ1dCAtbXN0YWNrcmVhbGlnbiBsb29rcyBsaWtlIGl0J3Mgc3Vw
cG9ydGVkIGJ5IGNsYW5nIGFzIHdlbGwuCgpHb29kIHRvIGtub3csIGJ1dCBJIHdhbnQgbGVzcyBk
dWN0IHRhcGUsIG5vdCBtb3JlLgoKPiA+Cj4gPiA+Cj4gPiA+IEFsdGVybmF0aXZlIGlzIHRvIHVz
ZQo+ID4gPiBfX2F0dHJpYnV0ZV9fKChmb3JjZV9hbGlnbl9hcmdfcG9pbnRlcikpIG9uIGZ1bmN0
aW9ucyB0aGF0IG1pZ2h0IGJlCj4gPiA+IGNhbGxlZCBmcm9tIDgtYnl0ZS1hbGlnbmVkIGNvZGUu
Cj4gPgo+ID4gV2hpY2ggaXMgaGFyZCB0byBhdXRvbWF0ZSBhbmQgZWFzeSB0byBmb3JnZXQuICBM
aWtlbHkgYSBsYXJnZSBkaWZmIHRvIGZpeCB0b2RheS4KPgo+IFJpZ2h0LCB0aGlzIGlzIGEgbm8t
Z28sIGVzcCB0byBqdXN0IGZpeCBvbGQgY29tcGlsZXJzLgo+ID4KPiA+ID4KPiA+ID4gSXQgbG9v
a3MgbGlrZSAtbXN0YWNrcmVhbGlnbiBzaG91bGQgd29yayBmcm9tIGdjYyA1LjMgb253YXJkcy4K
PiA+Cj4gPiBUaGUga2VybmVsIHdvdWxkIGdlbmVyYWxseSBsaWtlIHRvIHN1cHBvcnQgR0NDIDQu
OSsuCj4gPgo+ID4gVGhlcmUncyBwbGVudHkgb2YgZGlmZmVyZW50IHdheXMgdG8ga2VlcCBsYXll
cmluZyBvbiBkdWN0IHRhcGUgYW5kCj4gPiBiYWlsaW5nIHdpcmUgdG8gc3VwcG9ydCBkaWZmZXJp
bmcgQUJJcywgYnV0IHRoYXQncyBqdXN0IGFkZGluZwo+ID4gdGVjaG5pY2FsIGRlYnQgdGhhdCB3
aWxsIGhhdmUgdG8gYmUgcmVwYWlkIG9uZSBkYXkuICBUaGF0J3Mgd2h5IHRoZQo+ID4gY2xlYW5l
c3Qgc29sdXRpb24gSU1PIGlzIG1hcmsgdGhlIGRyaXZlciBicm9rZW4gZm9yIG9sZCB0b29sY2hh
aW5zLAo+ID4gYW5kIHVzZSBhIGNvZGUtYmFzZS1jb25zaXN0ZW50IHN0YWNrIGFsaWdubWVudC4g
IEJlbmRpbmcgb3Zlcgo+ID4gYmFja3dhcmRzIHRvIHN1cHBvcnQgb2xkIHRvb2xjaGFpbnMgbWVh
bnMgYWNjZXB0aW5nIHN0YWNrIGFsaWdubWVudAo+ID4gbWlzbWF0Y2hlcywgd2hpY2ggaXMgaW4g
dGhlICJ1bnNwZWNpZmllZCBiZWhhdmlvciIgcmluZyBvZiB0aGUKPiA+ICJ1bmRlZmluZWQgYmVo
YXZpb3IiIFZlbm4gZGlhZ3JhbS4gIEkgaGF2ZSB0aGUgc2FtZSBvcGluaW9uIG9uIHJlbHlpbmcK
PiA+IG9uIGV4cGxpY2l0bHkgdW5kZWZpbmVkIGJlaGF2aW9yLgo+ID4KPiA+IEknbGwgc2VuZCBw
YXRjaGVzIGZvciBmaXhpbmcgdXAgQ2xhbmcsIGJ1dCBwbGVhc2UgY29uc2lkZXIgbXkgc3Ryb25n
Cj4gPiBhZHZpY2UgdG8gZ2VuZXJhbGx5IGF2b2lkIHN0YWNrIGFsaWdubWVudCBtaXNtYXRjaGVz
LCByZWdhcmRsZXNzIG9mCj4gPiBjb21waWxlci4KPiA+IC0tCj4gPiBUaGFua3MsCj4gPiB+Tmlj
ayBEZXNhdWxuaWVycwo+Cj4gV2hhdCBJIHN1Z2dlc3RlZCB3YXMgaW4gcmVmZXJlbmNlIHRvIHlv
dXIgcHJvcG9zYWwgZm9yIGRyb3BwaW5nIHRoZQo+IC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5
PTQgZm9yIG1vZGVybiBjb21waWxlcnMsIGJ1dCBrZWVwaW5nIGl0IGZvcgo+IDw3LjEuIC1tc3Rh
Y2tyZWFsaWduIHdvdWxkIGF0IGxlYXN0IGxldCA1LjMgb253YXJkcyBiZSBsZXNzIGxpa2VseSB0
bwo+IGJyZWFrIChhbmQgaXQgZG9lc24ndCBlcnJvciBiZWZvcmUgdGhlbiwgSSB0aGluayBpdCBq
dXN0IGRvZXNuJ3QKPiBhY3R1YWxseSBkbyBhbnl0aGluZywgc28gbm8gd29yc2UgdGhhbiBub3cg
YXQgbGVhc3QpLgo+Cj4gU2ltcGx5IGRyb3BwaW5nIHN1cHBvcnQgZm9yIDw3LjEgd291bGQgYmUg
Y2xlYW5lc3QsIHllcywgYnV0IGl0IHNvdW5kcwo+IGxpa2UgcGVvcGxlIGRvbid0IHdhbnQgdG8g
Z28gdGhhdCBmYXIuCgpUaGF0J3MgZmFpci4gIEkndmUgaW5jbHVkZWQgeW91ciBzdWdnZXN0aW9u
cyBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugb2YKMDIvMDMgb2YgYSBzZXJpZXMgSSBqdXN0IHNlbnQg
YnV0IGZvcmdvdCB0byBpbiByZXBseSB0byB0aGlzIHRocmVhZDoKaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMTkvMTAvMTYvMTcwMAoKQWxzbywgSSBkbyBhcHByZWNpYXRlIHRoZSBzdWdnZXN0aW9u
cyBhbmQgdW5kZXJzdGFuZCB0aGUgdmFsdWUgb2YgYnJhaW5zdG9ybWluZy4KLS0gClRoYW5rcywK
fk5pY2sgRGVzYXVsbmllcnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
