Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58635347B3F
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Mar 2021 15:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9156EA12;
	Wed, 24 Mar 2021 14:59:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36DD6EA1B
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Mar 2021 14:58:29 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u9so2934187ljd.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Mar 2021 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PLtdqjyb6ZpFLIDzj9Gxiz79SYwzEifApQNTVEfut1U=;
 b=A3EPC3UQ8kD+Rd3alctOKpLMlz4xxaxxrnxbDYlbKDZ8X+oYDBwGzDBJJT5NcJFn5z
 Okdhg9HaLhWsZR/JRw1FzIss7RlY3Tha0v3+gxSo+Yp3POvySTGsEJxAcVfIx0ngHclO
 qNezcOLDQM1V7OjKABpI7pMl1OATgOTUjDx0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PLtdqjyb6ZpFLIDzj9Gxiz79SYwzEifApQNTVEfut1U=;
 b=KfvheRXHIfP8r9z/Lig6cC+HOowags7t8UMA94ck420CEqRsJgJaxlLaZdrI5sgXXb
 0f8tlWKIYTofeRsk30KVWd2CJIYrdEBAfpttK6JlW6+UL46NIUP8QQaWxlVjJ5TaqQmJ
 wxFc/wF5W5mOW3nLCBMQDLECjxIxB3+HmDM0g/LOcNPItzgF65Rx3RsXi1Xh4L8rmUiy
 0tEgLMRjceUUXHb1Dtrr/wdg+IPmLFOuebYg8KRe+ZL6BwkkSDjfN7B0TYnhetpnsBtV
 nubb5xf0/Bjdi+BYvvpz+xZYgdp6ffgVM6HY8x2Cp0w0eioSc4N5N4nyGi7qIxs5mlf/
 Q7oQ==
X-Gm-Message-State: AOAM5318YU+z12eaGsQbqmNPKPHaJ6V/hSBlx/9R3TggDq7E+910RNKm
 O9QUjo7g63slZD6p/7vu9nXVbgVbCnM+U3+k1klh6A==
X-Google-Smtp-Source: ABdhPJzOSWH3/u+MPhUU07Njrv73s8fqFdHTjDExCoqX7Y6oA+pTxQz90sS6GqREY59FPaVymifkHkn8/sj5qqBxcJk=
X-Received: by 2002:a2e:7403:: with SMTP id p3mr2331523ljc.239.1616597907996; 
 Wed, 24 Mar 2021 07:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210310161444.1015500-1-markyacoub@chromium.org>
 <CADnq5_P9aYcedOP2qduSz7VN1fCSnmQEtPa+FdjYu9Co7TwPog@mail.gmail.com>
 <CAC0gqY7Y2WxtAZ3GnWmASPYq7ahYTfmPhOHAAX5UjMNS9k098w@mail.gmail.com>
 <b4070483-5aa5-c712-6435-dcb4a206ca76@daenzer.net>
 <CAP+8YyExtmmZbFfAO_YR=XWHE+HbH6m7JqyJV4LB_hbGwsihBA@mail.gmail.com>
 <CAPj87rP+WkUPbS3yyGGfy0SRm_hsnCCUav99Dg2Q+tXCiJ5D+A@mail.gmail.com>
In-Reply-To: <CAPj87rP+WkUPbS3yyGGfy0SRm_hsnCCUav99Dg2Q+tXCiJ5D+A@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 24 Mar 2021 10:58:17 -0400
Message-ID: <CAJUqKUqQ0yrxpr+QVRXYXMk1hBRNByD0TP6mM0oLY54jDZimbw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
To: Daniel Stone <daniel@fooishbar.org>
X-Mailman-Approved-At: Wed, 24 Mar 2021 14:59:46 +0000
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgODoxMCBBTSBEYW5pZWwgU3RvbmUgPGRhbmllbEBmb29p
c2hiYXIub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgMjQgTWFyIDIwMjEgYXQgMTA6NTMsIEJhcyBO
aWV1d2VuaHVpemVuIDxiYXNAYmFzbmlldXdlbmh1aXplbi5ubD4gd3JvdGU6Cj4+Cj4+IE9uIFdl
ZCwgTWFyIDI0LCAyMDIxIGF0IDExOjEzIEFNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnpl
ci5uZXQ+IHdyb3RlOgo+Pj4KPj4+IE5vIG1vZGlmaWVyIHN1cHBvcnQgZG9lcyBub3QgaW1wbHkg
bGluZWFyLiBJdCdzIGdlbmVyYWxseSBzaWduYWxsZWQgdmlhIERSTV9GT1JNQVRfTU9EX0lOVkFM
SUQsIHdoaWNoIHJvdWdobHkgbWVhbnMgInRpbGluZyBpcyBkZXRlcm1pbmVkIGJ5IGRyaXZlciBz
cGVjaWZpYyBtZWNoYW5pc21zIi4KU28geW91IG1lYW4gaXQgd291bGQgbWFrZSBtb3JlIHNlbnNl
IHRvIGJlIG1vcmUgZXhwbGljaXQgaW4gaGFuZGxpbmcKRFJNX0ZPUk1BVF9NT0RfSU5WQUxJRCBh
cyBhbiBpbmNvbWluZyBtb2RpZmllciAod2hpY2ggd2lsbCwganVzdCBsaWtlCkRSTV9GT1JNQVRf
TU9EX0xJTkVBUiwgd2lsbCByZXR1cm4gdHJ1ZSBpbgpkbV9wbGFuZV9mb3JtYXRfbW9kX3N1cHBv
cnRlZCk/Cj4+Cj4+Cj4+IERvZXNuJ3QgcXVpdGUgd29yayB0aGF0IHdheSBpbiB0aGUga2VybmVs
IHNhZGx5LiBJZiB5b3UgZG9uJ3Qgc2V0IERSTV9NT0RFX0ZCX01PRElGSUVSUyB0aGVuIHRoZSBt
b2RpZmllciBmaWVsZHMgaGF2ZSB0byBiZSAwICh3aGljaCBoYXBwZW5zIHRvIGFsaWFzIERSTV9G
T1JNQVRfTU9EX0xJTkVBUiBhbmQgdGhlbiBub3cgZGVwcmVjYXRlZCBEUk1fRk9STUFUX01PRF9O
T05FKS4gVGhpcyBpcyB2ZXJpZmllZCBpbiBzaGFyZWQgZHJtIGNvZGUuCj4+Cj4+IChhbmQgYWxs
IHVzZXJzcGFjZSBjb2RlIEkndmUgc2VlbiBzaW1wbHkgZG9lc24ndCBzZXQgRFJNX01PREVfRkJf
TU9ESUZJRVJTIGlmIHRoZSBpbmNvbWluZyBtb2RpZmllciBpcyBEUk1fRk9STUFUX01PRF9JTlZB
TElEKQo+Cj4KPiBZZXMsIGJ1dCBldmVuIHRob3VnaCB0aGUgZmllbGQgaXMgemVybywgdGhlIGxh
Y2sgb2YgdGhlIGZsYWcgbWVhbnMgaXQgbXVzdCBiZSB0cmVhdGVkIGFzIElOVkFMSUQuIElmIHRo
ZSBrZXJuZWwgaXMgbm90IGRvaW5nIHRoaXMsIHRoZSBrZXJuZWwgaXMgb2JqZWN0aXZlbHkgd3Jv
bmcuIChBbmQgSSBrbm93IGl0IGRvZXNuJ3QgZG8gdGhpcyBpbiBtb3N0IGNhc2VzLCBiZWNhdXNl
IG90aGVyd2lzZSBJIHdvdWxkbid0IGJlIGFibGUgdG8gdXNlIHRoaXMgR05PTUUgc2Vzc2lvbiBv
biBhbiBJbnRlbCBsYXB0b3AsIHdoZXJlIG1vZGlmaWVycyBhcmUgYmxhY2tsaXN0ZWQuKQo+Cj4g
Q2hlZXJzLAo+IERhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
