Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F60030DCAF
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Feb 2021 15:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBB489ED6;
	Wed,  3 Feb 2021 14:27:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0603C89F1B
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Feb 2021 14:27:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id p15so24483555wrq.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Feb 2021 06:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=5dWoeYhsK7onz3kVESI3mbfiNswWbGGVQnOqq3keG0k=;
 b=ZDgR0P0zOK0VCZKMQZpzy01bHRWi9mCdo/YigSxXt1SMX0FOXVJBeam0MEK+J+zJSS
 d8QlbuH3FtFwIeOa9UFIA14V4mbLl6XasTFsKgBjgiZ6dypseAtUwJvalSeZ5z8uHiNa
 mOAacXvKRSkeHUrLaeZm7zE/9S3gjUINr/ZQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=5dWoeYhsK7onz3kVESI3mbfiNswWbGGVQnOqq3keG0k=;
 b=WhXTqANIJmufIuKMWHVIzu1tWxl09sGDuxjTCdWCqeBUIbnAJiVCvEUHn6op6+HF99
 qT3wwcFiDmTi43C0BN/NFEvb1Ohpa2Dt1mGLR2gI5+fYCsuTUYr8U3xAf2onQI1BS6jx
 V/4q1xlzkFMsobjxMiQ16/M29HS+zQhApgeiq5ql/9WMAsmNzZUDXTjILzrJy+DKlOII
 3/SZ6kpO1tDsL2zL2Aa9DlVOjS5bSAbYWlM8xVnjwdhOM7pkUux2HO4PGmXIrfwAtkJc
 KnttS7GFCTTEr3Orf5Gdolg9M2+jTs/nAcxigPoX9cNteqfe63whsteZ7CiL0EOoq2jo
 oGgw==
X-Gm-Message-State: AOAM530tDsNbEp4MsSSvyyl5EOP6tIlsb5UT/w1fO4Y6rZNHLsEAhO9l
 0zza120fzqNpe2yhsYmol5zlbQ==
X-Google-Smtp-Source: ABdhPJzDl99nXVUchLkMKLDYndNQUA1k2Rmn6F43km93FudlRF+qh2gvLEpwV4TjYvnNtDxc6pI/Sg==
X-Received: by 2002:adf:ffce:: with SMTP id x14mr3960981wrs.390.1612362425598; 
 Wed, 03 Feb 2021 06:27:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o17sm3915538wrm.52.2021.02.03.06.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 06:27:04 -0800 (PST)
Date: Wed, 3 Feb 2021 15:27:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [amdgpu] deadlock
Message-ID: <YBqytmXrUNL6BQIa@phenom.ffwll.local>
Mail-Followup-To: Alex Deucher <alexdeucher@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Gomez <daniel@qtec.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <58e41b62-b8e0-b036-c87d-a84d53f5a26e@amd.com>
 <CAKMK7uGTFYWnBG+JtbAK=zQVT1dT=nKor_SHP-t958oebgn8_A@mail.gmail.com>
 <fa170c5c-2f46-58ef-6847-e0bc9907fc8b@amd.com>
 <CAKMK7uE8qNUSNpX3TS6Fgif-6rCc7uZth_-F-kYPrOUSz5K3_A@mail.gmail.com>
 <CAH1Ww+QhiKYOJTWAigDhC761EhqeCUuh_bdZn=r4DAcEcb5Yyw@mail.gmail.com>
 <CAH1Ww+Q=9TnxB2QW1=wb-NAoYmt0_+DueFj8vowqPjPFe_Cw8w@mail.gmail.com>
 <538682ee-3e12-a345-2205-2c0f16b496ff@gmail.com>
 <YBqWCgTPTLomYvAt@phenom.ffwll.local>
 <e34c8d2a-aded-a3be-334a-2adc4d552373@amd.com>
 <CADnq5_NA2oGMyP8b0qNH9kmuYD4+A70pkw41uGErRDOvzF0RxA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NA2oGMyP8b0qNH9kmuYD4+A70pkw41uGErRDOvzF0RxA@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Daniel Gomez <daniel@qtec.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMDMsIDIwMjEgYXQgMDg6NTY6MTdBTSAtMDUwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IE9uIFdlZCwgRmViIDMsIDIwMjEgYXQgNzozMCBBTSBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4KPiA+IEFtIDAzLjAyLjIxIHVtIDEz
OjI0IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+ID4gT24gV2VkLCBGZWIgMDMsIDIwMjEgYXQg
MDE6MjE6MjBQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+ID4+IEFtIDAzLjAy
LjIxIHVtIDEyOjQ1IHNjaHJpZWIgRGFuaWVsIEdvbWV6Ogo+ID4gPj4+IE9uIFdlZCwgMyBGZWIg
MjAyMSBhdCAxMDo0NywgRGFuaWVsIEdvbWV6IDxkYW5pZWxAcXRlYy5jb20+IHdyb3RlOgo+ID4g
Pj4+PiBPbiBXZWQsIDMgRmViIDIwMjEgYXQgMTA6MTcsIERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4gd3JvdGU6Cj4gPiA+Pj4+PiBPbiBXZWQsIEZlYiAzLCAyMDIxIGF0IDk6NTEgQU0g
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiA+ID4+
Pj4+PiBBbSAwMy4wMi4yMSB1bSAwOTo0OCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiA+Pj4+
Pj4+IE9uIFdlZCwgRmViIDMsIDIwMjEgYXQgOTozNiBBTSBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4gPj4+Pj4+Pj4gSGkgRGFuaWVsLAo+ID4g
Pj4+Pj4+Pj4KPiA+ID4+Pj4+Pj4+IHRoaXMgaXMgbm90IGEgZGVhZGxvY2ssIGJ1dCByYXRoZXIg
YSBoYXJkd2FyZSBsb2NrdXAuCj4gPiA+Pj4+Pj4+IEFyZSB5b3Ugc3VyZT8gSW1lIGdldHRpbmcg
c3R1Y2sgaW4gZG1hX2ZlbmNlX3dhaXQgaGFzIGdlbmVyYWxseSBnb29kCj4gPiA+Pj4+Pj4+IGNo
YW5jZSBvZiBiZWluZyBhIGRtYV9mZW5jZSBkZWFkbG9jay4gR1BVIGhhbmcgc2hvdWxkIG5ldmVy
IHJlc3VsdCBpbgo+ID4gPj4+Pj4+PiBhIGZvcmV2ZXIgc3R1Y2sgZG1hX2ZlbmNlLgo+ID4gPj4+
Pj4+IFllcywgSSdtIHByZXR0eSBzdXJlLiBPdGhlcndpc2UgdGhlIGhhcmR3YXJlIGNsb2NrcyB3
b3VsZG4ndCBnbyB1cCBsaWtlCj4gPiA+Pj4+Pj4gdGhpcy4KPiA+ID4+Pj4+IE1heWJlIGNsYXJp
ZnlpbmcsIGNvdWxkIGJlIGJvdGguIFREUiBzaG91bGQgbm90aWNlIGFuZCBnZXQgdXMgb3V0IG9m
Cj4gPiA+Pj4+PiB0aGlzLCBidXQgaWYgdGhlcmUncyBhIGRtYV9mZW5jZSBkZWFkbG9jayBhbmQg
d2UgY2FuJ3QgcmUtZW1pdCBvcgo+ID4gPj4+Pj4gZm9yY2UgY29tcGxldGUgdGhlIHBlbmRpbmcg
dGhpbmdzLCB0aGVuIHdlJ3JlIHN0dWNrIGZvciBnb29kLgo+ID4gPj4+Pj4gLURhbmllbAo+ID4g
Pj4+Pj4KPiA+ID4+Pj4+PiBRdWVzdGlvbiBpcyByYXRoZXIgd2h5IHdlIGVuZCB1cCBpbiB0aGUg
dXNlcnB0ciBoYW5kbGluZyBmb3IgR0ZYPyBPdXIKPiA+ID4+Pj4+PiBST0NtIE9wZW5DTCBzdGFj
ayBzaG91bGRuJ3QgdXNlIHRoaXMuCj4gPiA+Pj4+Pj4KPiA+ID4+Pj4+Pj4gRGFuaWVsLCBjYW4g
eW91IHBscyByZS1oYW5nIHlvdXIgbWFjaGluZSBhbmQgdGhlbiBkdW1wIGJhY2t0cmFjZXMgb2YK
PiA+ID4+Pj4+Pj4gYWxsIHRhc2tzIGludG8gZG1lc2cgd2l0aCBzeXNycS10LCBhbmQgdGhlbiBh
dHRhY2ggdGhhdD8gV2l0aG91dCBhbGwKPiA+ID4+Pj4+Pj4gdGhlIGJhY2t0cmFjZXMgaXQncyB0
cmlja3kgdG8gY29uc3RydWN0IHRoZSBmdWxsIGRlcGVuZGVuY3kgY2hhaW4gb2YKPiA+ID4+Pj4+
Pj4gd2hhdCdzIGdvaW5nIG9uLiBBbHNvIGlzIHRoaXMgcGxhaW4gLXJjNiwgbm90IHNvbWUgbW9y
ZSBwYXRjaGVzIG9uCj4gPiA+Pj4+Pj4+IHRvcD8KPiA+ID4+Pj4+PiBZZWFoLCB0aGF0J3Mgc3Rp
bGwgYSBnb29kIGlkZWEgdG8gaGF2ZS4KPiA+ID4+Pj4gSGVyZSB0aGUgZnVsbCBiYWNrdHJhY2Ug
ZG1lc2cgbG9ncyBhZnRlciB0aGUgaGFuZzoKPiA+ID4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGcGFzdGViaW4uY29t
JTJGcmF3JTJGa3ppdm0yTDMmYW1wO2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBh
bWQuY29tJTdDMDQwNjU5NTZlNzRkNGVhNzNiMjQwOGQ4YzgzZWIxNWElN0MzZGQ4OTYxZmU0ODg0
ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDc5NTE4ODg1OTcxMDE5JTdDVW5rbm93
biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJU
aUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAmYW1wO3NkYXRhPWEzOTM0U09PU0Z0UlUz
UnJhVWUlMkJXRGdBRURlZkVOeFFaY2QwcHJtU1pYcyUzRCZhbXA7cmVzZXJ2ZWQ9MAo+ID4gPj4+
Pgo+ID4gPj4+PiBUaGlzIGlzIGFub3RoZXIgZG1lc2cgbG9nIHdpdGggdGhlIGJhY2t0cmFjZXMg
YWZ0ZXIgU0lHS0lMTCB0aGUgbWF0cml4IHByb2Nlc3M6Cj4gPiA+Pj4+IChJIGRpZG4ndCBoYXZl
IHRoZSBzeXNycSBlbmFibGUgYXQgdGhlIHRpbWUpOgo+ID4gPj4+PiBodHRwczovL25hbTExLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZwYXN0ZWJp
bi5jb20lMkZyYXclMkZwUkJ3R2NqMSZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5p
ZyU0MGFtZC5jb20lN0MwNDA2NTk1NmU3NGQ0ZWE3M2IyNDA4ZDhjODNlYjE1YSU3QzNkZDg5NjFm
ZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0Nzk1MTg4ODU5ODEwMTglN0NV
bmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklp
TENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCZhbXA7c2RhdGE9blBvbTlWd0ly
RVpGMDJoU0VuQzVFZjhsSGRRVVJNRUxDYXBJaHdLazJKRSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+ID4g
Pj4+IEkndmUgbm93IHJlbW92ZWQgYWxsIG91ciB2NGwyIHBhdGNoZXMgYW5kIGRpZCB0aGUgc2Ft
ZSB0ZXN0IHdpdGggdGhlICdwbGFpbicKPiA+ID4+PiBtYWlubGluZSB2ZXJzaW9uICgtcmM2KS4K
PiA+ID4+Pgo+ID4gPj4+IFJlZmVyZW5jZTogM2FhZjBhMjdmZmMyOWIxOWE2MjMxNGVkZDY4NGI5
YmM2MzQ2ZjlhOAo+ID4gPj4+Cj4gPiA+Pj4gU2FtZSBlcnJvciwgc2FtZSBiZWhhdmlvdXIuIEZ1
bGwgZG1lc2cgbG9nIGF0dGFjaGVkOgo+ID4gPj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnBhc3RlYmluLmNvbSUyRnJh
dyUyRktnYUVmN1kxJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNv
bSU3QzA0MDY1OTU2ZTc0ZDRlYTczYjI0MDhkOGM4M2ViMTVhJTdDM2RkODk2MWZlNDg4NGU2MDhl
MTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ3OTUxODg4NTk4MTAxOCU3Q1Vua25vd24lN0NU
V0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklr
MWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtzZGF0YT1XUXc2ZzlvQTM4YVQxVnV1Wjgl
MkYxWTQzcEclMkJQbFYlMkY5JTJGUkhqS2RHdlpMSzQlM0QmYW1wO3Jlc2VydmVkPTAKPiA+ID4+
PiBOb3RlOgo+ID4gPj4+ICAgICBkbWVzZyB3aXRoIHN5c3JxLXQgYmVmb3JlIHJ1bm5pbmcgdGhl
IHRlc3Qgc3RhcnRzIGluIFsgIDEyMi4wMTY1MDJdCj4gPiA+Pj4gc3lzcnE6IFNob3cgU3RhdGUK
PiA+ID4+PiAgICAgZG1lc2cgd2l0aCBzeXNycS10IGFmdGVyIHRoZSB0ZXN0IHN0YXJ0cyBpbjog
WyAgNDk1LjU4NzY3MV0gc3lzcnE6IFNob3cgU3RhdGUKPiA+ID4+IFRoZXJlIGlzIG5vdGhpbmcg
YW1kZ3B1IHJlbGF0ZWQgaW4gdGhlcmUgZXhjZXB0IGZvciB3YWl0aW5nIGZvciB0aGUKPiA+ID4+
IGhhcmR3YXJlLgo+ID4gPiBZZWFoLCBidXQgdGhlcmUncyBhbHNvIG5vIG90aGVyIGRyaXZlciB0
aGF0IGNvdWxkIGNhdXNlIGEgc3R1Y2sgZG1hX2ZlbmNlLAo+ID4gPiBzbyB3aHkgaXMgcmVzZXQg
bm90IGNsZWFuaW5nIHVwIHRoZSBtZXNzIGhlcmU/IElycmVzcGVjdGl2ZSBvZiB3aHkgdGhlIGdw
dQo+ID4gPiBpcyBzdHVjaywgdGhlIGtlcm5lbCBzaG91bGQgYXQgbGVhc3QgY29tcGxldGUgYWxs
IHRoZSBkbWFfZmVuY2VzIGV2ZW4gaWYKPiA+ID4gdGhlIGdwdSBmb3Igc29tZSByZWFzb24gaXMg
dGVybWluYWxseSBpbGwgLi4uCj4gPgo+ID4gVGhhdCdzIGEgZ29vZCBxdWVzdGlvbiBhcyB3ZWxs
LiBJJ20gZGlnZ2luZyBpbnRvIHRoaXMuCj4gPgo+ID4gTXkgYmVzdCB0aGVvcnkgaXMgdGhhdCB0
aGUgYW1kZ3B1IHBhY2thZ2VzIGRpc2FibGVkIEdQVSByZXNldCBmb3Igc29tZQo+ID4gcmVhc29u
Lgo+IAo+IFRoZSB0aW1lb3V0IGZvciBjb21wdXRlIHF1ZXVlcyBpcyBpbmZpbml0ZSBiZWNhdXNl
IG9mIGxvbmcgcnVubmluZwo+IGNvbXB1dGUga2VybmVscy4gIFlvdSBjYW4gb3ZlcnJpZGUgd2l0
aCB0aGUgYW1kZ3B1LmxvY2t1cF90aW1lb3V0Cj4gcGFyYW1ldGVyLgoKVWgsIHRoYXQgZG9lc24n
dCB3b3JrLiBJZiB5b3Ugd2FudCBpbmZpbml0ZSBjb21wdXRlIHF1ZXVlcyB5b3UgbmVlZCB0aGUK
YW1ka2ZkIG1vZGVsIHdpdGggcHJlZW1wdC1jdHggZG1hX2ZlbmNlLiBJZiB5b3UgYWxsb3cgbm9y
bWFsIGNzIGlvY3RsIHRvCnJ1biBmb3JldmVyLCB5b3UganVzdCBoYW5nIHRoZSBrZXJuZWwgd2hl
bmV2ZXIgdXNlcnNwYWNlIGZlZWxzIGxpa2UuIE5vdApqdXN0IHRoZSBncHUsIHRoZSBrZXJuZWwg
KGFueXRoaW5nIHRoYXQgYWxsb2NhdGVzIG1lbW9yeSwgaXJyZXNwZWN0aXZlIG9mCnByb2Nlc3Mg
Y2FuIGhhbmcpLiBUaGF0J3Mgbm8gZ29vZC4KLURhbmllbAoKPiAKPiBBbGV4Cj4gCj4gPgo+ID4g
QnV0IHRoZSBtdWNoIG1vcmUgaW50ZXJlc3RpbmcgcXVlc3Rpb24gaXMgd2h5IHdlIGVuZCB1cCBp
biB0aGlzIGNhbGwKPiA+IHBhdGguIEkndmUgcGluZ2VkIGludGVybmFsbHksIGJ1dCBlYXN0IGNv
YXN0IGlzIG5vdCBhd2FrZSB5ZXQgOikKPiA+Cj4gPiBDaHJpc3RpYW4uCj4gPgo+ID4gPiAtRGFu
aWVsCj4gPiA+Cj4gPiA+PiBUaGlzIGlzIGEgcHJldHR5IHN0YW5kYXJkIGhhcmR3YXJlIGxvY2t1
cCwgYnV0IEknbSBzdGlsbCB3YWl0aW5nIGZvciBhbgo+ID4gPj4gZXhwbGFuYXRpb24gd2h5IHdl
IGVuZCB1cCBpbiB0aGlzIGNhbGwgcGF0aCBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gPiA+Pgo+ID4g
Pj4gQ2hyaXN0aWFuLgo+ID4gPj4KPiA+ID4+Pgo+ID4gPj4+Pj4+IENocmlzdGlhbi4KPiA+ID4+
Pj4+Pgo+ID4gPj4+Pj4+PiAtRGFuaWVsCj4gPiA+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+PiBXaGljaCBP
cGVuQ2wgc3RhY2sgYXJlIHlvdSB1c2luZz8KPiA+ID4+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+PiBSZWdh
cmRzLAo+ID4gPj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+ID4gPj4+Pj4+Pj4KPiA+ID4+Pj4+Pj4+IEFt
IDAzLjAyLjIxIHVtIDA5OjMzIHNjaHJpZWIgRGFuaWVsIEdvbWV6Ogo+ID4gPj4+Pj4+Pj4+IEhp
IGFsbCwKPiA+ID4+Pj4+Pj4+Pgo+ID4gPj4+Pj4+Pj4+IEkgaGF2ZSBhIGRlYWRsb2NrIHdpdGgg
dGhlIGFtZGdwdSBtYWlubGluZSBkcml2ZXIgd2hlbiBydW5uaW5nIGluIHBhcmFsbGVsIHR3bwo+
ID4gPj4+Pj4+Pj4+IE9wZW5DTCBhcHBsaWNhdGlvbnMuIFNvIGZhciwgd2UndmUgYmVlbiBhYmxl
IHRvIHJlcGxpY2F0ZSBpdCBlYXNpbHkgYnkgZXhlY3V0aW5nCj4gPiA+Pj4+Pj4+Pj4gY2xpbmZv
IGFuZCBNYXRyaXhNdWx0aXBsaWNhdGlvbiAoZnJvbSBBTUQgb3BlbmNsLXNhbXBsZXMpLiBJdCdz
IHF1aXRlIG9sZCB0aGUKPiA+ID4+Pj4+Pj4+PiBvcGVuY2wtc2FtcGxlcyBzbywgaWYgeW91IGhh
dmUgYW55IG90aGVyIHN1Z2dlc3Rpb24gZm9yIHRlc3RpbmcgSSdkIGJlIHZlcnkKPiA+ID4+Pj4+
Pj4+PiBoYXBweSB0byB0ZXN0IGl0IGFzIHdlbGwuCj4gPiA+Pj4+Pj4+Pj4KPiA+ID4+Pj4+Pj4+
PiBIb3cgdG8gcmVwbGljYXRlIHRoZSBpc3N1ZToKPiA+ID4+Pj4+Pj4+Pgo+ID4gPj4+Pj4+Pj4+
ICMgd2hpbGUgdHJ1ZTsgZG8gL3Vzci9iaW4vTWF0cml4TXVsdGlwbGljYXRpb24gLS1kZXZpY2Ug
Z3B1IFwKPiA+ID4+Pj4+Pj4+PiAgICAgICAgIC0tZGV2aWNlSWQgMCAteCAxMDAwIC15IDEwMDAg
LXogMTAwMCAtcSAtdCAtaSA1MDsgZG9uZQo+ID4gPj4+Pj4+Pj4+ICMgd2hpbGUgdHJ1ZTsgZG8g
Y2xpbmZvOyBkb25lCj4gPiA+Pj4+Pj4+Pj4KPiA+ID4+Pj4+Pj4+PiBPdXRwdXQ6Cj4gPiA+Pj4+
Pj4+Pj4KPiA+ID4+Pj4+Pj4+PiBBZnRlciBhIG1pbnV0ZSBvciBsZXNzIChzb21ldGltZXMgY291
bGQgYmUgbW9yZSkgSSBjYW4gc2VlIHRoYXQKPiA+ID4+Pj4+Pj4+PiBNYXRyaXhNdWx0aXBsaWNh
dGlvbiBhbmQgY2xpbmZvIGhhbmcuIEluIGFkZGl0aW9uLCB3aXRoIHJhZGVvbnRvcCB5b3UgY2Fu
IHNlZQo+ID4gPj4+Pj4+Pj4+IGhvdyB0aGUgR3JhcGhpY3MgcGlwZSBnb2VzIGZyb20gfjUwJSB0
byAxMDAlLiBBbHNvIHRoZSBzaGFkZXIgY2xvY2tzCj4gPiA+Pj4+Pj4+Pj4gZ29lcyB1cCBmcm9t
IH4zNSUgdG8gfjk2JS4KPiA+ID4+Pj4+Pj4+Pgo+ID4gPj4+Pj4+Pj4+IGNsaW5mbyBrZWVwcyBw
cmludGluZzoKPiA+ID4+Pj4+Pj4+PiBpb2N0bCg3LCBEUk1fSU9DVExfU1lOQ09CSl9XQUlULCAw
eDdmZmU0NmU1Zjk1MCkgPSAtMSBFVElNRSAoVGltZXIgZXhwaXJlZCkKPiA+ID4+Pj4+Pj4+Pgo+
ID4gPj4+Pj4+Pj4+IEFuZCBNYXRyaXhNdWx0aXBsaWNhdGlvbiBwcmludHMgdGhlIGZvbGxvd2lu
ZyAoc3RyYWNlKSBpZiB5b3UgdHJ5IHRvCj4gPiA+Pj4+Pj4+Pj4ga2lsbCB0aGUgcHJvY2VzczoK
PiA+ID4+Pj4+Pj4+Pgo+ID4gPj4+Pj4+Pj4+IHNjaGVkX3lpZWxkKCkgICAgICAgICAgICAgICAg
ICAgICAgICAgICA9IDAKPiA+ID4+Pj4+Pj4+PiBmdXRleCgweDU1N2U5NDUzNDNiOCwgRlVURVhf
V0FJVF9CSVRTRVRfUFJJVkFURXxGVVRFWF9DTE9DS19SRUFMVElNRSwgMCwKPiA+ID4+Pj4+Pj4+
PiBOVUxMLCBGVVRFWF9CSVRTRVRfTUFUQ0hfQU5Zc3RyYWNlOiBQcm9jZXNzIDY1MSBkZXRhY2hl
ZAo+ID4gPj4+Pj4+Pj4+ICAgICAgPGRldGFjaGVkIC4uLj4KPiA+ID4+Pj4+Pj4+Pgo+ID4gPj4+
Pj4+Pj4+IEFmdGVyIHRoaXMsIHRoZSBncHUgaXMgbm90IGZ1bmN0aW9uYWwgYXQgYWxsIGFuZCB5
b3UnZCBuZWVkIGEgcG93ZXIgY3ljbGUgcmVzZXQKPiA+ID4+Pj4+Pj4+PiB0byByZXN0b3JlIHRo
ZSBzeXN0ZW0uCj4gPiA+Pj4+Pj4+Pj4KPiA+ID4+Pj4+Pj4+PiBIYXJkd2FyZSBpbmZvOgo+ID4g
Pj4+Pj4+Pj4+IENQVTogQU1EIFJ5emVuIEVtYmVkZGVkIFYxNjA1QiB3aXRoIFJhZGVvbiBWZWdh
IEdmeCAoOCkgQCAyLjAwMEdIego+ID4gPj4+Pj4+Pj4+IEdQVTogQU1EIEFUSSBSYWRlb24gVmVn
YSBTZXJpZXMgLyBSYWRlb24gVmVnYSBNb2JpbGUgU2VyaWVzCj4gPiA+Pj4+Pj4+Pj4KPiA+ID4+
Pj4+Pj4+PiAwMzowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IEFkdmFuY2VkIE1pY3Jv
IERldmljZXMsIEluYy4KPiA+ID4+Pj4+Pj4+PiBbQU1EL0FUSV0gUmF2ZW4gUmlkZ2UgW1JhZGVv
biBWZWdhIFNlcmllcyAvIFJhZGVvbiBWZWdhIE1vYmlsZSBTZXJpZXNdCj4gPiA+Pj4+Pj4+Pj4g
KHJldiA4MykKPiA+ID4+Pj4+Pj4+PiAgICAgICAgIERldmljZU5hbWU6IEJyb2FkY29tIDU3NjIK
PiA+ID4+Pj4+Pj4+PiAgICAgICAgIFN1YnN5c3RlbTogQWR2YW5jZWQgTWljcm8gRGV2aWNlcywg
SW5jLiBbQU1EL0FUSV0gUmF2ZW4gUmlkZ2UKPiA+ID4+Pj4+Pj4+PiBbUmFkZW9uIFZlZ2EgU2Vy
aWVzIC8gUmFkZW9uIFZlZ2EgTW9iaWxlIFNlcmllc10KPiA+ID4+Pj4+Pj4+PiAgICAgICAgIEtl
cm5lbCBkcml2ZXIgaW4gdXNlOiBhbWRncHUKPiA+ID4+Pj4+Pj4+PiAgICAgICAgIEtlcm5lbCBt
b2R1bGVzOiBhbWRncHUKPiA+ID4+Pj4+Pj4+Pgo+ID4gPj4+Pj4+Pj4+IExpbnV4IGtlcm5lbCBp
bmZvOgo+ID4gPj4+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+Pj4gcm9vdEBxdDUyMjI6fiMgdW5hbWUgLWEK
PiA+ID4+Pj4+Pj4+PiBMaW51eCBxdDUyMjIgNS4xMS4wLXJjNi1xdGVjLXN0YW5kYXJkICMyIFNN
UCBUdWUgRmViIDIgMDk6NDE6NDYgVVRDCj4gPiA+Pj4+Pj4+Pj4gMjAyMSB4ODZfNjQgeDg2XzY0
IHg4Nl82NCBHTlUvTGludXgKPiA+ID4+Pj4+Pj4+Pgo+ID4gPj4+Pj4+Pj4+IEJ5IGVuYWJsaW5n
IHRoZSBrZXJuZWwgbG9ja3Mgc3RhdHMgSSBjb3VsZCBzZWUgdGhlIE1hdHJpeE11bHRpcGxpY2F0
aW9uIGlzCj4gPiA+Pj4+Pj4+Pj4gaGFuZ2VkIGluIHRoZSBhbWRncHVfbW5faW52YWxpZGF0ZV9n
ZnggZnVuY3Rpb246Cj4gPiA+Pj4+Pj4+Pj4KPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU5MjAyXSAx
IGxvY2sgaGVsZCBieSBNYXRyaXhNdWx0aXBsaWMvNjUzOgo+ID4gPj4+Pj4+Pj4+IFsgIDczOC4z
NTkyMDZdICAjMDogZmZmZjg4ODEwZTM2NGZlMAo+ID4gPj4+Pj4+Pj4+ICgmYWRldi0+bm90aWZp
ZXJfbG9jayl7Ky4rLn0tezM6M30sIGF0Ogo+ID4gPj4+Pj4+Pj4+IGFtZGdwdV9tbl9pbnZhbGlk
YXRlX2dmeCsweDM0LzB4YTAgW2FtZGdwdV0KPiA+ID4+Pj4+Pj4+Pgo+ID4gPj4+Pj4+Pj4+IEkg
Y2FuIHNlZSBpbiB0aGUgdGhlIGFtZGdwdV9tbl9pbnZhbGlkYXRlX2dmeCBmdW5jdGlvbjogdGhl
Cj4gPiA+Pj4+Pj4+Pj4gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3JjdSB1c2VzIHdhaXRfYWxsIChm
ZW5jZXMpIGFuZCBNQVhfU0NIRURVTEVfVElNRU9VVCBzbywgSQo+ID4gPj4+Pj4+Pj4+IGd1ZXNz
IHRoZSBjb2RlIGdldHMgc3R1Y2sgdGhlcmUgd2FpdGluZyBmb3JldmVyLiBBY2NvcmRpbmcgdG8g
dGhlCj4gPiA+Pj4+Pj4+Pj4gZG9jdW1lbnRhdGlvbjogIldoZW4gc29tZWJvZHkgdHJpZXMgdG8g
aW52YWxpZGF0ZSB0aGUgcGFnZSB0YWJsZXMgd2UgYmxvY2sgdGhlCj4gPiA+Pj4+Pj4+Pj4gdXBk
YXRlIHVudGlsIGFsbCBvcGVyYXRpb25zIG9uIHRoZSBwYWdlcyBpbiBxdWVzdGlvbiBhcmUgY29t
cGxldGVkLCB0aGVuIHRob3NlCj4gPiA+Pj4+Pj4+Pj4gcGFnZXMgYXJlIG1hcmtlZCAgYXMgYWNj
ZXNzZWQgYW5kIGFsc28gZGlydHkgaWYgaXQgd2FzbuKAmXQgYSByZWFkIG9ubHkgYWNjZXNzLiIK
PiA+ID4+Pj4+Pj4+PiBMb29rcyBsaWtlIHRoZSBmZW5jZXMgYXJlIGRlYWRsb2NrZWQgYW5kIHRo
ZXJlZm9yZSwgaXQgbmV2ZXIgcmV0dXJucy4gQ291bGQgaXQKPiA+ID4+Pj4+Pj4+PiBiZSBwb3Nz
aWJsZT8gYW55IGhpbnQgdG8gd2hlcmUgY2FuIEkgbG9vayB0byBmaXggdGhpcz8KPiA+ID4+Pj4+
Pj4+Pgo+ID4gPj4+Pj4+Pj4+IFRoYW5rIHlvdSAgaW4gYWR2YW5jZS4KPiA+ID4+Pj4+Pj4+Pgo+
ID4gPj4+Pj4+Pj4+IEhlcmUgdGhlIGZ1bGwgZG1lc2cgb3V0cHV0Ogo+ID4gPj4+Pj4+Pj4+Cj4g
PiA+Pj4+Pj4+Pj4gWyAgNzM4LjMzNzcyNl0gSU5GTzogdGFzayBNYXRyaXhNdWx0aXBsaWM6NjUz
IGJsb2NrZWQgZm9yIG1vcmUgdGhhbiAxMjIgc2Vjb25kcy4KPiA+ID4+Pj4+Pj4+PiBbICA3Mzgu
MzQ0OTM3XSAgICAgICBOb3QgdGFpbnRlZCA1LjExLjAtcmM2LXF0ZWMtc3RhbmRhcmQgIzIKPiA+
ID4+Pj4+Pj4+PiBbICA3MzguMzUwMzg0XSAiZWNobyAwID4gL3Byb2Mvc3lzL2tlcm5lbC9odW5n
X3Rhc2tfdGltZW91dF9zZWNzIgo+ID4gPj4+Pj4+Pj4+IGRpc2FibGVzIHRoaXMgbWVzc2FnZS4K
PiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4MjQwXSB0YXNrOk1hdHJpeE11bHRpcGxpYyBzdGF0ZTpE
IHN0YWNrOiAgICAwIHBpZDogIDY1Mwo+ID4gPj4+Pj4+Pj4+IHBwaWQ6ICAgICAxIGZsYWdzOjB4
MDAwMDQwMDAKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4MjU0XSBDYWxsIFRyYWNlOgo+ID4gPj4+
Pj4+Pj4+IFsgIDczOC4zNTgyNjFdICA/IGRtYV9mZW5jZV9kZWZhdWx0X3dhaXQrMHgxZWIvMHgy
MzAKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4Mjc2XSAgX19zY2hlZHVsZSsweDM3MC8weDk2MAo+
ID4gPj4+Pj4+Pj4+IFsgIDczOC4zNTgyOTFdICA/IGRtYV9mZW5jZV9kZWZhdWx0X3dhaXQrMHgx
MTcvMHgyMzAKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4Mjk3XSAgPyBkbWFfZmVuY2VfZGVmYXVs
dF93YWl0KzB4MWViLzB4MjMwCj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4LjM1ODMwNV0gIHNjaGVkdWxl
KzB4NTEvMHhjMAo+ID4gPj4+Pj4+Pj4+IFsgIDczOC4zNTgzMTJdICBzY2hlZHVsZV90aW1lb3V0
KzB4Mjc1LzB4MzgwCj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4LjM1ODMyNF0gID8gZG1hX2ZlbmNlX2Rl
ZmF1bHRfd2FpdCsweDFlYi8weDIzMAo+ID4gPj4+Pj4+Pj4+IFsgIDczOC4zNTgzMzJdICA/IG1h
cmtfaGVsZF9sb2NrcysweDRmLzB4NzAKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4MzQxXSAgPyBk
bWFfZmVuY2VfZGVmYXVsdF93YWl0KzB4MTE3LzB4MjMwCj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4LjM1
ODM0N10gID8gbG9ja2RlcF9oYXJkaXJxc19vbl9wcmVwYXJlKzB4ZDQvMHgxODAKPiA+ID4+Pj4+
Pj4+PiBbICA3MzguMzU4MzUzXSAgPyBfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUrMHgzOS8w
eDQwCj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4LjM1ODM2Ml0gID8gZG1hX2ZlbmNlX2RlZmF1bHRfd2Fp
dCsweDExNy8weDIzMAo+ID4gPj4+Pj4+Pj4+IFsgIDczOC4zNTgzNzBdICA/IGRtYV9mZW5jZV9k
ZWZhdWx0X3dhaXQrMHgxZWIvMHgyMzAKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4Mzc1XSAgZG1h
X2ZlbmNlX2RlZmF1bHRfd2FpdCsweDIxNC8weDIzMAo+ID4gPj4+Pj4+Pj4+IFsgIDczOC4zNTgz
ODRdICA/IGRtYV9mZW5jZV9yZWxlYXNlKzB4MWEwLzB4MWEwCj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4
LjM1ODM5Nl0gIGRtYV9mZW5jZV93YWl0X3RpbWVvdXQrMHgxMDUvMHgyMDAKPiA+ID4+Pj4+Pj4+
PiBbICA3MzguMzU4NDA1XSAgZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3JjdSsweDFhYS8weDVlMAo+
ID4gPj4+Pj4+Pj4+IFsgIDczOC4zNTg0MjFdICBhbWRncHVfbW5faW52YWxpZGF0ZV9nZngrMHg1
NS8weGEwIFthbWRncHVdCj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4LjM1ODY4OF0gIF9fbW11X25vdGlm
aWVyX3JlbGVhc2UrMHgxYmIvMHgyMTAKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4NzEwXSAgZXhp
dF9tbWFwKzB4MmYvMHgxZTAKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4NzIzXSAgPyBmaW5kX2hl
bGRfbG9jaysweDM0LzB4YTAKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4NzQ2XSAgbW1wdXQrMHgz
OS8weGUwCj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4LjM1ODc1Nl0gIGRvX2V4aXQrMHg1YzMvMHhjMDAK
PiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4NzYzXSAgPyBmaW5kX2hlbGRfbG9jaysweDM0LzB4YTAK
PiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4NzgwXSAgZG9fZ3JvdXBfZXhpdCsweDQ3LzB4YjAKPiA+
ID4+Pj4+Pj4+PiBbICA3MzguMzU4NzkxXSAgZ2V0X3NpZ25hbCsweDE1Yi8weGM1MAo+ID4gPj4+
Pj4+Pj4+IFsgIDczOC4zNTg4MDddICBhcmNoX2RvX3NpZ25hbF9vcl9yZXN0YXJ0KzB4YWYvMHg3
MTAKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4ODE2XSAgPyBsb2NrZGVwX2hhcmRpcnFzX29uX3By
ZXBhcmUrMHhkNC8weDE4MAo+ID4gPj4+Pj4+Pj4+IFsgIDczOC4zNTg4MjJdICA/IF9yYXdfc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSsweDM5LzB4NDAKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU4ODMx
XSAgPyBrdGltZV9nZXRfbW9ub19mYXN0X25zKzB4NTAvMHhhMAo+ID4gPj4+Pj4+Pj4+IFsgIDcz
OC4zNTg4NDRdICA/IGFtZGdwdV9kcm1faW9jdGwrMHg2Yi8weDgwIFthbWRncHVdCj4gPiA+Pj4+
Pj4+Pj4gWyAgNzM4LjM1OTA0NF0gIGV4aXRfdG9fdXNlcl9tb2RlX3ByZXBhcmUrMHhmMi8weDFi
MAo+ID4gPj4+Pj4+Pj4+IFsgIDczOC4zNTkwNTRdICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2Rl
KzB4MTkvMHg2MAo+ID4gPj4+Pj4+Pj4+IFsgIDczOC4zNTkwNjJdICBlbnRyeV9TWVNDQUxMXzY0
X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGE5Cj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4LjM1OTA2OV0gUklQ
OiAwMDMzOjB4N2Y2Yjg5YTUxODg3Cj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4LjM1OTA3Nl0gUlNQOiAw
MDJiOjAwMDA3ZjZiODJiNTRiMTggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDoKPiA+ID4+Pj4+
Pj4+PiAwMDAwMDAwMDAwMDAwMDEwCj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4LjM1OTA4Nl0gUkFYOiBm
ZmZmZmZmZmZmZmZmZTAwIFJCWDogMDAwMDdmNmI4MmI1NGI1MCBSQ1g6IDAwMDA3ZjZiODlhNTE4
ODcKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU5MDkxXSBSRFg6IDAwMDA3ZjZiODJiNTRiNTAgUlNJ
OiAwMDAwMDAwMGMwMjA2NGMzIFJESTogMDAwMDAwMDAwMDAwMDAwNwo+ID4gPj4+Pj4+Pj4+IFsg
IDczOC4zNTkwOTZdIFJCUDogMDAwMDAwMDBjMDIwNjRjMyBSMDg6IDAwMDAwMDAwMDAwMDAwMDMg
UjA5OiAwMDAwN2Y2YjgyYjU0YmJjCj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4LjM1OTEwMV0gUjEwOiAw
MDAwMDAwMDAwMDAwMDAxIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDAwMDAxNjVhMGJj
MDAKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU5MTA2XSBSMTM6IDAwMDAwMDAwMDAwMDAwMDcgUjE0
OiAwMDAwMDAwMDAwMDAwMDAxIFIxNTogMDAwMDAwMDAwMDAwMDAwMAo+ID4gPj4+Pj4+Pj4+IFsg
IDczOC4zNTkxMjldCj4gPiA+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgIFNob3dpbmcgYWxs
IGxvY2tzIGhlbGQgaW4gdGhlIHN5c3RlbToKPiA+ID4+Pj4+Pj4+PiBbICA3MzguMzU5MTQxXSAx
IGxvY2sgaGVsZCBieSBraHVuZ3Rhc2tkLzU0Ogo+ID4gPj4+Pj4+Pj4+IFsgIDczOC4zNTkxNDhd
ICAjMDogZmZmZmZmZmY4MjlmNjg0MCAocmN1X3JlYWRfbG9jayl7Li4uLn0tezE6Mn0sIGF0Ogo+
ID4gPj4+Pj4+Pj4+IGRlYnVnX3Nob3dfYWxsX2xvY2tzKzB4MTUvMHgxODMKPiA+ID4+Pj4+Pj4+
PiBbICA3MzguMzU5MTg3XSAxIGxvY2sgaGVsZCBieSBzeXN0ZW1kLWpvdXJuYWwvMTc0Ogo+ID4g
Pj4+Pj4+Pj4+IFsgIDczOC4zNTkyMDJdIDEgbG9jayBoZWxkIGJ5IE1hdHJpeE11bHRpcGxpYy82
NTM6Cj4gPiA+Pj4+Pj4+Pj4gWyAgNzM4LjM1OTIwNl0gICMwOiBmZmZmODg4MTBlMzY0ZmUwCj4g
PiA+Pj4+Pj4+Pj4gKCZhZGV2LT5ub3RpZmllcl9sb2NrKXsrLisufS17MzozfSwgYXQ6Cj4gPiA+
Pj4+Pj4+Pj4gYW1kZ3B1X21uX2ludmFsaWRhdGVfZ2Z4KzB4MzQvMHhhMCBbYW1kZ3B1XQo+ID4g
Pj4+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+Pj4gRGFuaWVsCj4gPiA+Pj4+Pj4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPj4+Pj4+Pj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+ID4gPj4+Pj4+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+ID4gPj4+Pj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUy
Rmxpc3RpbmZvJTJGZHJpLWRldmVsJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmln
JTQwYW1kLmNvbSU3QzA0MDY1OTU2ZTc0ZDRlYTczYjI0MDhkOGM4M2ViMTVhJTdDM2RkODk2MWZl
NDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ3OTUxODg4NTk4MTAxOCU3Q1Vu
a25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlM
Q0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtzZGF0YT1Pa0Z2OGppZWhO
b2E0NlElMkI1eU9YVWcyOWNSYnpsOHZvVjJHcUM4ajFWOVElM0QmYW1wO3Jlc2VydmVkPTAKPiA+
ID4+Pj4+IC0tCj4gPiA+Pj4+PiBEYW5pZWwgVmV0dGVyCj4gPiA+Pj4+PiBTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+ID4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtz
LnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJGYmxvZy5mZndsbC5jaCUy
RiZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0MwNDA2NTk1
NmU3NGQ0ZWE3M2IyNDA4ZDhjODNlYjE1YSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUx
ODNkJTdDMCU3QzAlN0M2Mzc0Nzk1MTg4ODU5ODEwMTglN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4
ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhW
Q0k2TW4wJTNEJTdDMzAwMCZhbXA7c2RhdGE9bTBlOURycW51WVFvSll3d1pBeW9uS2xTZmtwOWhG
VFJOb1Q1M09ZM0liVSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+ID4gPj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+Pj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QKPiA+ID4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPj4+IGh0dHBzOi8v
bmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUy
Rmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1w
O2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMDQwNjU5NTZlNzRk
NGVhNzNiMjQwOGQ4YzgzZWIxNWElN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3
QzAlN0MwJTdDNjM3NDc5NTE4ODg1OTgxMDE4JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJ
am9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1u
MCUzRCU3QzMwMDAmYW1wO3NkYXRhPUJ1VUNubkdzS2hTUWMwbGRnQlBWQklReFlVbnZJUHdxcUxN
ZTgxeW5yZ1klM0QmYW1wO3Jlc2VydmVkPTAKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
