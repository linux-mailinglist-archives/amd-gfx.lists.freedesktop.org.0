Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A4CAE18
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 20:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFBE6EA47;
	Thu,  3 Oct 2019 18:21:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64276EA45
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 18:21:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id v8so3818281wrt.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 03 Oct 2019 11:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GPfPh7FC/wCpk826z5OzzxP9Wza3ChM15zN1h3YPLHs=;
 b=p3AYTl2uX4N/G+n3jk02y6sx9SsV4eq7NICVximCwissaLuOV5GorGejoZVYvPVOID
 9//JNs5i9Rj0WqXI85b3lQFkFKTWL43lqGqPtEW5yESb5U6y8BIqRO684B64TERg+WWe
 EXPjSnEBSevLR1xp/ZynQ0s/Tl08boDsCLbzY080WE8nOBetN0NaUCRVf5UMls4ua8Ff
 d/Hkn8GZXcQ5/Wy7H8ScJ1XN2wRmBzPBIVPQZfBZcJh3fxNNWjBw6tDqKDRWomRF9C2z
 ONYATdESx/xmIvikfVS+wECsWI2/MtqnME3m4jUTVYogZg3ty+9IaI522h5Tvc+qupkt
 VwBg==
X-Gm-Message-State: APjAAAVdCOABF3C37IeT89zH7KU0zaUt6Gluc6AuvN23/xuwtDqNyoXE
 KuEM5q/IJBSuvw034HjatssoSSB/pEb/99hBtNg=
X-Google-Smtp-Source: APXvYqww+2tY4YtfdtybVPwuasrBkrCL1uoxJ4kMVxEmjDHs3VT6jzKp/DEFIlos8ga1lcStog7qIPQZzUeK2VmQeEU=
X-Received: by 2002:adf:f287:: with SMTP id k7mr8571224wro.206.1570126891581; 
 Thu, 03 Oct 2019 11:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <63bd81a9-7166-73df-6605-83489fa7daf1@fedoraproject.org>
 <CADnq5_NdHsap-mBwyhQNRHu_T=Vo_wPAEGjdHD1WxOdLW28-rw@mail.gmail.com>
 <6a36628f-ce09-51a0-66c3-b7f21f0dd67e@fedoraproject.org>
In-Reply-To: <6a36628f-ce09-51a0-66c3-b7f21f0dd67e@fedoraproject.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Oct 2019 14:21:17 -0400
Message-ID: <CADnq5_Pne9CRFASL5Oxq8wGp2_adSXXkUUuafhVMLKCJ=Oj=1A@mail.gmail.com>
Subject: Re: [Follow-up] Status of AMD Sensor Fusion HUB for Linux
To: Luya Tshimbalanga <luya@fedoraproject.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GPfPh7FC/wCpk826z5OzzxP9Wza3ChM15zN1h3YPLHs=;
 b=ar98KLlD0GIAKCLorlrJeC38JEZV9YDep94Fra9gDPltRgsZYkuBOG02i7AIBg0brp
 S7jF8I+Clkr69YdCmKp3v1yeOqGAGcXQ1Mb7ypI6vhnW3AN7FUAuIx2M1VBZHgpQhEDM
 gPm9sfiLlvrxmvlvY88IVXyoCLlkMz6IM5KqcZzv0oHz4fvu8OtXWtePbQclkP+Kq2oY
 iNVmz9JDqmvT05VuGfP4t1FHAvoTD9xqKRk5tx8RQOaImUYGmrg9ugP9mT4HK7El5TC7
 sHm6TAJjOSwlhXcer91Hno52oKoPqxfZ8O60i31+iszA9bXni7fypxz3sMaPI89wnhfX
 cbFg==
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

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCAzOjM1IEFNIEx1eWEgVHNoaW1iYWxhbmdhIDxsdXlhQGZl
ZG9yYXByb2plY3Qub3JnPiB3cm90ZToKPgo+Cj4gT24gMjAxOS0wOS0yNiAxMDowMyBhLm0uLCBB
bGV4IERldWNoZXIgd3JvdGU6Cj4gPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAzOjU5IEFNIEx1
eWEgVHNoaW1iYWxhbmdhCj4gPiA8bHV5YUBmZWRvcmFwcm9qZWN0Lm9yZz4gd3JvdGU6Cj4gPj4g
SGVsbG8sCj4gPj4KPiA+PiBXaGF0IGlzIHRoZSBjdXJyZW50IHN0YXR1cyBvZiB0aGUgZHJpdmVy
IG9yIG1vZHVsZSBmb3IgQU1EIFNlbnNvciBGdXNpb24KPiA+PiBIVUIgZm9yIG1vYmlsZSBSYXZl
biBSaWRnZSBmYW1pbHk/IFRvIHRoaXMgZGF5LCBtYWpvcml0eSBvZiBtb2JpbGUKPiA+PiBwb3dl
cmVkIGRldmljZSBlcXVpcHBlZCB3aXRoIHRoYXQgQVBVIGZhbWlseSBsYWNrcyBneXJvc2NvcGlj
IGZ1bmN0aW9uCj4gPj4gZm9yIHRoZSBzY3JlZW4uCj4gPj4KPiA+IFRoZSBGQ0ggdGVhbSBoYXMg
YW4gaW5pdGlhbCBpbXBsZW1lbnRhdGlvbiBkb25lLiAgSUlSQywgdGhleSBhcmUganVzdAo+ID4g
Y2xlYW5pbmcgdGhpbmdzIHVwIGFuZCByZXN0cnVjdHVyaW5nIGJhc2VkIG9uIGNvbW11bml0eQo+
ID4gcmVjb21tZW5kYXRpb25zLiAgSSB0aGluayB0aGUgcGF0Y2hlcyBzaG91bGQgYmUgYXZhaWxh
YmxlIHNvb24gaWYgdGhleQo+ID4gYXJlIG5vdCBhbHJlYWR5Lgo+ID4KPiA+IEFsZXgKPiA+Cj4g
V2hpY2ggcmVwb3NpdG9yeSBjb3VsZCB3ZSB2aWV3IHRoZSBwYXRjaCBvbmNlIGl0IGxhbmRzPwoK
SElEIHN1YnN5c3RlbSBJIHRoaW5rLgoKQWxleAoKPgo+IC0tCj4gTHV5YSBUc2hpbWJhbGFuZ2EK
PiBGZWRvcmEgRGVzaWduIFRlYW0KPiBGZWRvcmEgRGVzaWduIFN1aXRlIG1haW50YWluZXIKPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
