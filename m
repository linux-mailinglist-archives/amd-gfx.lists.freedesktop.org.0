Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD612D607B
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Dec 2020 16:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BDA6E3F5;
	Thu, 10 Dec 2020 15:53:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D241A6E3F5
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Dec 2020 15:53:51 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id x16so6218216oic.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Dec 2020 07:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0ti8RjSwoiJ3iQT1bxR7QhFgMCWaJpowdLkTHhyk3MI=;
 b=eTIr8hKu9LsvoQBPG09W5pS2PKaFgfOAh2+WB2Y89ztdtjRlassSvRcU1klYxwloAp
 PvZCmtO9J8T6waCCu8kOt9bvP2Qepaahascan+zUpjO0QiqB2tfjPicOZpWfRAzQtRif
 gYuj6uiuVJMFANW0NyoEVVe7CitOrKhzzAq9G4jzwERoyiKJYrlJW0tccz9SOfTslEt1
 FHwmMtisFXAp4e0SHgrCOugss+m3OkGf9pLCUDbhV+TlF2YQWg2HewoLLnFniQS7YLhs
 VPLrt/7FGYKYqn/2XdiUWNxnNz56KmWvg4Z/ww9ljHOp1SIU6i893hNHXn1wyc4jVE8i
 MRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0ti8RjSwoiJ3iQT1bxR7QhFgMCWaJpowdLkTHhyk3MI=;
 b=ACrcbZ2k4rlE9cwpcVghwenk7PWSH78nUwAzklSaPg/wdnAhZq+x7Nv8MYQFQfKPIK
 +zKx2TlqoIuQmqWD+ieanngYbQK/9rpDUnIsxyOWVsB950iEATt21QmSNA2k3vWL09EX
 xlLgYorOvYsDB9w+A3qep8E1upy5jthJvqdsW10vnYiZsprO1/t4qVjmueYwb6e67qcG
 LiG4xOWSSTwsxBvFGR+9ismpxUJt4/O8r27Xk9KL2I+LyhF8u6JGxpOla8jd/geEpk4G
 Xq3KDI3554VHYbzNOjJ2zDuYNtjSkEvRxKcsdSuoeCDSx92NlhFpRD83bd9Qev9RCFSM
 2LLw==
X-Gm-Message-State: AOAM533mhG9hUBNHiqh7kkwA9dE+QxELTF61zkBUjQwxM2VCLGKye6cu
 +BAsB/+ZX7Q1GpXzsYqHmzT7JUY7YZJY9ljv91o=
X-Google-Smtp-Source: ABdhPJxUs43MBFz1VHoy0I9aCfTxZldo7aPYMWWzYLhUNWxaJ8kC++Mlyr1gmTlw1pOTL90boXHMnJVa7skHEVnB9c0=
X-Received: by 2002:aca:4f97:: with SMTP id d145mr5809412oib.123.1607615631078; 
 Thu, 10 Dec 2020 07:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20201204204130.3697-1-alexander.deucher@amd.com>
 <CADnq5_PABFEnCdvnZfm832aDHti66ujdzTjUFur3FT-O-+wbKg@mail.gmail.com>
 <410bc5c9-381b-5e65-5595-ec891f0edae2@amd.com>
 <2eb41038-2e69-68ab-2f6b-017cd1bcb455@gmail.com>
 <dd8e7365-c432-f6bc-407e-e3cb1f88d9f5@amd.com>
In-Reply-To: <dd8e7365-c432-f6bc-407e-e3cb1f88d9f5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Dec 2020 10:53:39 -0500
Message-ID: <CADnq5_OPiZkybCZbF6Zn6fqTGd=fqpb-E117CCqgL7C_BgF4BQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: take runtime pm reference when we attach a
 buffer
To: Shashank Sharma <shashank.sharma@amd.com>
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
Cc: Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgMTAsIDIwMjAgYXQgODowMyBBTSBTaGFzaGFuayBTaGFybWEgPHNoYXNoYW5r
LnNoYXJtYUBhbWQuY29tPiB3cm90ZToKPgo+Cj4gT24gMTAvMTIvMjAgMzo1OCBwbSwgQ2hyaXN0
aWFuIEvDtm5pZyB3cm90ZToKPiA+IEFtIDEwLjEyLjIwIHVtIDA1OjQ5IHNjaHJpZWIgU2hhc2hh
bmsgU2hhcm1hOgo+ID4+IE9uIDA5LzEyLzIwIDExOjAwIHBtLCBBbGV4IERldWNoZXIgd3JvdGU6
Cj4gPj4+IE9uIEZyaSwgRGVjIDQsIDIwMjAgYXQgMzo0MSBQTSBBbGV4IERldWNoZXIgPGFsZXhk
ZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4+PiBBbmQgZHJvcCBpdCB3aGVuIHdlIGRldGFj
aC4gIElmIHRoZSBzaGFyZWQgYnVmZmVyIGlzIGluIHZyYW0sCj4gPj4+PiB3ZSBuZWVkIHRvIG1h
a2Ugc3VyZSB3ZSBkb24ndCBwdXQgdGhlIGRldmljZSBpbnRvIHJ1bnRpbWUKPiA+Pj4+IHN1c3Bl
bmQuCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+ID4+PiBQaW5nPyAgQW55IHRob3VnaHRzIG9uIHRoaXM/ICBXZSBy
ZWFsbHkgb25seSBuZWVkIHRoaXMgZm9yIHAycCBzaW5jZQo+ID4+PiBkZXZpY2UgbWVtb3J5IGlu
IGludm9sdmVkLCBidXQgSSdtIG5vdCBzdXJlIG9mIHRoZSBiZXN0IHdheSB0byBoYW5kbGUKPiA+
Pj4gdGhhdC4KPiA+Pj4KPiA+Pj4gQWxleAo+ID4+Pgo+ID4+Pgo+ID4+Pj4gLS0tCj4gPj4+PiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMgfCAxNiArKysrKysr
KysrKysrKy0tCj4gPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RtYV9idWYuYwo+ID4+Pj4gaW5kZXggNWI0NjVhYjc3NGQxLi5mNjNmMTgyZjM3ZjkgMTAw
NjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1
Zi5jCj4gPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1
Zi5jCj4gPj4+PiBAQCAtNDAsNiArNDAsNyBAQAo+ID4+Pj4gICAjaW5jbHVkZSA8bGludXgvZG1h
LWJ1Zi5oPgo+ID4+Pj4gICAjaW5jbHVkZSA8bGludXgvZG1hLWZlbmNlLWFycmF5Lmg+Cj4gPj4+
PiAgICNpbmNsdWRlIDxsaW51eC9wY2ktcDJwZG1hLmg+Cj4gPj4+PiArI2luY2x1ZGUgPGxpbnV4
L3BtX3J1bnRpbWUuaD4KPiA+Pj4+Cj4gPj4+PiAgIC8qKgo+ID4+Pj4gICAgKiBhbWRncHVfZ2Vt
X3ByaW1lX3ZtYXAgLSAmZG1hX2J1Zl9vcHMudm1hcCBpbXBsZW1lbnRhdGlvbgo+ID4+Pj4gQEAg
LTE4Nyw5ICsxODgsMTMgQEAgc3RhdGljIGludCBhbWRncHVfZG1hX2J1Zl9hdHRhY2goc3RydWN0
IGRtYV9idWYgKmRtYWJ1ZiwKPiA+Pj4+ICAgICAgICAgIGlmIChhdHRhY2gtPmRldi0+ZHJpdmVy
ID09IGFkZXYtPmRldi0+ZHJpdmVyKQo+ID4+Pj4gICAgICAgICAgICAgICAgICByZXR1cm4gMDsK
PiA+Pj4+Cj4gPj4+PiArICAgICAgIHIgPSBwbV9ydW50aW1lX2dldF9zeW5jKGFkZXZfdG9fZHJt
KGFkZXYpLT5kZXYpOwo+ID4+Pj4gKyAgICAgICBpZiAociA8IDApCj4gPj4+PiArICAgICAgICAg
ICAgICAgZ290byBvdXQ7Cj4gPj4+PiArCj4gPj4gSSBhbSBhIGJpdCBza2VwdGljYWwgaWYgd2Ug
c2hvdWxkIGZhaWwgdGhlIEJPIHJlc2VydmUgaWYgd2UgZG9uJ3QgZ2V0IHRoZSBzeW5jID8gSSB3
YXMgaG9waW5nIHRvIGNvbnRpbnVlIHdpdGggaXQsIHdpdGggYSB3YXJuaW5nIG1heWJlLCBzbyB0
aGF0IGl0IGRvZXNuJ3QgYmxvY2sgdGhlIGV4aXN0aW5nIGZ1bmN0aW9uYWxpdHkgPwo+ID4gSSdt
IG5vdCBzdXJlIHdoeSBwbV9ydW50aW1lX2dldF9zeW5jKCkgY291bGQgZmFpbCwgYnV0IG5vdCBh
dHRhY2hpbmcgdGhlCj4gPiBETUEtYnVmIGlzIGNlcnRhaW5seSB0aGUgYmVzdCB3ZSBjb3VsZCBk
byBoZXJlIGluIHRoYXQgbW9tZW50Lgo+Cj4gQWgsIEkgc2VlLiBKdXN0IGN1cmlvdXMgYWJvdXQs
IGJlZm9yZSB0aGlzIHBhdGNoLCB3aGVuIHdlIHRyaWVkIHRvIHJlc2VydmUgdGhlIEJPLCB3aXRo
b3V0IHRoZSBQTSBzeW5jLCBob3cgd2FzIHRoYXQgZG9pbmcgT0sgPwoKcDJwIGlzIG5vdCB3aWRl
bHkgdXNlZCBhdCB0aGlzIHBvaW50LCBzbyB3ZSBuZXZlciByZWFsbHkgaGl0IGlzIGV4Y2VwdApm
b3Igc3BlY2lmaWMgdGVzdGluZyBvZiB0aGUgZnVuY3Rpb25hbGl0eS4KCkFsZXgKCj4KPiAtIFNo
YXNoYW5rCj4KPiA+IE90aGVyd2lzZSB3ZSBjb3VsZCBlbmQgdXAgaW4gYWNjZXNzaW5nIHRoZSBQ
Q0llIEJBUiB3aXRoIHBvd2VyIGRpc2FibGVkCj4gPiBhbmQgdGhhdCdzIGluZGVlZCBraW5kIG9m
IGJhZC4KPiA+Cj4gPiBDaHJpc3RpYW4uCj4gPgo+ID4+Pj4gICAgICAgICAgciA9IGFtZGdwdV9i
b19yZXNlcnZlKGJvLCBmYWxzZSk7Cj4gPj4+PiAgICAgICAgICBpZiAodW5saWtlbHkociAhPSAw
KSkKPiA+Pj4+IC0gICAgICAgICAgICAgICByZXR1cm4gcjsKPiA+Pj4+ICsgICAgICAgICAgICAg
ICBnb3RvIG91dDsKPiA+Pj4+Cj4gPj4+PiAgICAgICAgICAvKgo+ID4+Pj4gICAgICAgICAgICog
V2Ugb25seSBjcmVhdGUgc2hhcmVkIGZlbmNlcyBmb3IgaW50ZXJuYWwgdXNlLCBidXQgaW1wb3J0
ZXJzCj4gPj4+PiBAQCAtMjAxLDExICsyMDYsMTUgQEAgc3RhdGljIGludCBhbWRncHVfZG1hX2J1
Zl9hdHRhY2goc3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwKPiA+Pj4+ICAgICAgICAgICAqLwo+ID4+
Pj4gICAgICAgICAgciA9IF9fZG1hX3Jlc3ZfbWFrZV9leGNsdXNpdmUoYm8tPnRiby5iYXNlLnJl
c3YpOwo+ID4+Pj4gICAgICAgICAgaWYgKHIpCj4gPj4+PiAtICAgICAgICAgICAgICAgcmV0dXJu
IHI7Cj4gPj4+PiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPj4+Pgo+ID4+Pj4gICAgICAg
ICAgYm8tPnByaW1lX3NoYXJlZF9jb3VudCsrOwo+ID4+Pj4gICAgICAgICAgYW1kZ3B1X2JvX3Vu
cmVzZXJ2ZShibyk7Cj4gPj4+PiAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4+ICsKPiA+Pj4+ICtv
dXQ6Cj4gPj4+PiArICAgICAgIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGFkZXZfdG9fZHJt
KGFkZXYpLT5kZXYpOwo+ID4+IFdoeSBub3QganVzdCBwbV9ydW50aW1lX3B1dF9zeW5jID8gV2h5
IGF1dG9zdXNwZW5kID8KPiA+Pgo+ID4+IC0gU2hhc2hhbmsKPiA+Pgo+ID4+Pj4gKyAgICAgICBy
ZXR1cm4gcjsKPiA+Pj4+ICAgfQo+ID4+Pj4KPiA+Pj4+ICAgLyoqCj4gPj4+PiBAQCAtMjI1LDYg
KzIzNCw5IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbWFfYnVmX2RldGFjaChzdHJ1Y3QgZG1hX2J1
ZiAqZG1hYnVmLAo+ID4+Pj4KPiA+Pj4+ICAgICAgICAgIGlmIChhdHRhY2gtPmRldi0+ZHJpdmVy
ICE9IGFkZXYtPmRldi0+ZHJpdmVyICYmIGJvLT5wcmltZV9zaGFyZWRfY291bnQpCj4gPj4+PiAg
ICAgICAgICAgICAgICAgIGJvLT5wcmltZV9zaGFyZWRfY291bnQtLTsKPiA+Pj4+ICsKPiA+Pj4+
ICsgICAgICAgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShhZGV2X3RvX2RybShhZGV2KS0+ZGV2
KTsKPiA+Pj4+ICsgICAgICAgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoYWRldl90b19kcm0o
YWRldiktPmRldik7Cj4gPj4+PiAgIH0KPiA+Pj4+Cj4gPj4+PiAgIC8qKgo+ID4+Pj4gLS0KPiA+
Pj4+IDIuMjUuNAo+ID4+Pj4KPiA+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+Pj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
JTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wNCU3QzAxJTdDc2hhc2hh
bmsuc2hhcm1hJTQwYW1kLmNvbSU3Qzk5NTdjNWI4MzhmYzQ5YWUyMjVlMDhkODljZjY0OWExJTdD
M2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMSU3QzYzNzQzMTkyODg5NTkw
MjYxNyU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9p
VjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtzZGF0YT1B
TXRXTlNaUnlGWkRSSGhFN2hzSWRCV3hUSFZMR1lWT0haT1NlUlNSMDdzJTNEJmFtcDtyZXNlcnZl
ZD0wCj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiA+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+ID4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gPj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3Rp
bmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wNCU3QzAxJTdDc2hhc2hhbmsuc2hhcm1hJTQwYW1kLmNv
bSU3Qzk5NTdjNWI4MzhmYzQ5YWUyMjVlMDhkODljZjY0OWExJTdDM2RkODk2MWZlNDg4NGU2MDhl
MTFhODJkOTk0ZTE4M2QlN0MwJTdDMSU3QzYzNzQzMTkyODg5NTkwMjYxNyU3Q1Vua25vd24lN0NU
V0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklr
MWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtzZGF0YT1BTXRXTlNaUnlGWkRSSGhFN2hz
SWRCV3hUSFZMR1lWT0haT1NlUlNSMDdzJTNEJmFtcDtyZXNlcnZlZD0wCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeAo=
