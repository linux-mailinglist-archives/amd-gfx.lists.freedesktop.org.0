Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A983DDDB78
	for <lists+amd-gfx@lfdr.de>; Sun, 20 Oct 2019 01:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F104389452;
	Sat, 19 Oct 2019 23:41:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C6989452
 for <amd-gfx@lists.freedesktop.org>; Sat, 19 Oct 2019 23:41:13 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id c2so4625908wrr.10
 for <amd-gfx@lists.freedesktop.org>; Sat, 19 Oct 2019 16:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zFnNYKMMn3Hs9qlJpCFhKr3nZN7l8qk00vS/PQpFTPw=;
 b=D7iTDTD6TzRtgVSYE0WXi0kYNUCLETrLC8uGJPQAhnOAj/S4tv9qLU0f/it8PhgYh8
 P9RyUqJ+27oKK3hJsaeuDpY7DyCGg56qcoX5aoKg7FcNm3g0DRVPx8IwSmlPtHRWJ7d2
 r6KdkULAoojZVM7ZVb6s+vtBBWzgFOsMUGzPGRdu8ifSGvb1SFr22FPwwl/RdbuiVNTK
 ujm2f8bvjotHZxyvlWo1nSQu1QjQyQGLoZ78FG7PqjiDdjobEmzxRaCnTtrLez6p/1Zj
 tzEUL5p6BVbOSRhfVCVgV3zAK0jOap5TT+2RR9veTN6fztQTGbk1kdE3Mf9lvYV/jKUk
 9nQg==
X-Gm-Message-State: APjAAAXG262hklX8ee91Vsmm9yUydUSEE7Oydq365itbe+3xOVuSyqIj
 FZN3MHq2ZsCojSgCg9lYUTWmA3xIPAHv8CYIIOY=
X-Google-Smtp-Source: APXvYqyLJYKPDV+lZMDazuU/SoDYBscgB9vKmiDwoQwau3pcgFGisft7pEco2hfX4POwrDCvlLabf9inPInX3352sAM=
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr5839710wro.234.1571528471771; 
 Sat, 19 Oct 2019 16:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
 <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
 <CAHL+j08qsu1pSOZPLB9-XWw9ZmT2OamaWPBJV4T3Vzx_C8cD7g@mail.gmail.com>
 <67658520-b3f4-d2f9-7247-dd434ab5c30b@amd.com>
 <CAHL+j0-Nm+6VFXi_w4iciNdG40zubpqvh1RXs3MFfXJK2mFr0Q@mail.gmail.com>
 <CAHL+j0_=r1XBOzwiQmbZTVoRsZ5=Du3pAPd_n7pia81FegdHhw@mail.gmail.com>
 <57826a9e-5842-4ddd-a456-67d1d1b9a9ce@amd.com>
 <CAHL+j0-NJ8F4RpMJ5m9_9gk_t+zhwFwVmG6MMy4TBYa4XjnWEA@mail.gmail.com>
 <CADnq5_MTYe5z0gbtY0eCnUax2D=HZYBQF7YWPS86pikDXGVWOA@mail.gmail.com>
 <CAHL+j0_Dn9VZ7CN-yaaFP4kk39gWTKu4fLZ6SN4Dj17e2z+4RQ@mail.gmail.com>
 <CAHL+j08BgqmOoQHnsfE3xtZFsz14cOZ=Xui3o7mENJd3Fq0z0g@mail.gmail.com>
In-Reply-To: <CAHL+j08BgqmOoQHnsfE3xtZFsz14cOZ=Xui3o7mENJd3Fq0z0g@mail.gmail.com>
From: Sylvain Munaut <246tnt@gmail.com>
Date: Sun, 20 Oct 2019 01:41:33 +0200
Message-ID: <CAHL+j0-E83G4+xYDcJ2xB2abF9DXA78CXfP9LrVVktTmvsBYvg@mail.gmail.com>
Subject: Re: Spontaneous reboots when using RX 560
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zFnNYKMMn3Hs9qlJpCFhKr3nZN7l8qk00vS/PQpFTPw=;
 b=Pc4eKb1z8yqEbQsoLwmivEidEstYwAJ7cafDR5r32NgZa/FpXzdy0ObFvZNc4DxaB7
 PS/1AjjYyXRXkyDTwM3attouUXr/0uSS0Lj1g/4SStQOl+/y3SDTObKS96683V2exos7
 ReRF3j7rwsaYBsJ1IgGgJFdQI02uthAZ5PU2H1ZY3gUuLRIQmQrWtQAf5ZL1+AvJn4Jw
 1VU2or+JjjyTgWogb5xF4vG8/1uYvUiBkQHbXOv/Ulwr3cbI17BOwX6l/4k1ED5ViFpx
 +9UWfCftXu28lZE5AH8LYiM4z7kvnqpduk7lqGAe19lu8MdTz+jRMXYhpGBL1pPIvNpd
 zgaA==
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RmluYWxseSBzb21lIHByb2dyZXNzICEKCkkgZm91bmQgYSB0aHJlYWQgd2l0aCBhIGNvdXBsZSBv
ZiBwZW9wbGUgaGF2aW5nIHRoZSBzYW1lIHN5bXB0b21zIGFzIEkKZG8gKCBbMV0gKSwgYW5kIGlu
dGVyZXN0aW5nbHkgdGhhdCB3YXMgd2l0aCB0aGUgc2FtZSBicmFuZCAmIG1vZGVsIG9mCmNhcmQu
CkFsdGhvdWdoIHRoZXJlIGlzIG5vIHNvbHV0aW9uLCB0aGVyZSBpcyBhIHdvcmsgYXJvdW5kIHRo
YXQgd29ya3MgOgoKZWNobyAtbiBsb3cgID4gL3N5cy9jbGFzcy9kcm0vY2FyZDAvZGV2aWNlL3Bv
d2VyX2RwbV9mb3JjZV9wZXJmb3JtYW5jZV9sZXZlbAoKVGhlbiB0aGUgY2FyZCBzZWVtcyBzdGFi
bGUuIEF0IGxlYXN0IEkgd2FzIGFibGUgdG8gZ2V0IHRocm91Z2ggYW4KZW50aXJlIEdMIGJlbmNo
bWFyayBhbmQgYWxzbyBhIGJ1bmNoIG9mIENMIHRlc3RzIHdpdGhvdXQgY3Jhc2hpbmcuIChCeQpk
ZWZhdWx0IGl0IGNyYXNoZXMgbmVhcmx5IGluc3RhbnRseSkuCk9mIGNvdXJzZSB0aGUgY2FyZCBp
cyBzbG93IGJ1dCBpdCdzIGJldHRlciB0aGFuIG5vdGhpbmcgYW5kIG1heWJlCmdpdmVzIGEgY2x1
ZSB0byBhIHNvbHV0aW9uID8KCkZvbGxvd2luZyBzb21lIGFkdmljZSBvbiBJUkMsIEkgYWxzbyB0
cmllZCBzZXR0aW5nIGl0IHRvICJoaWdoIi4gVGhpcwpkb2Vzbid0IGNyYXNoIGltbWVkaWF0ZWx5
IHdoZW4gZG9pbmcgdGhhdCBhbmQgdGhlIGRpc3BsYXkgc3RheXMgZmluZQphbmQgSSBjYW4gbW92
ZSB3aW5kb3cgYW5kIGxpZ2h0IHN0dWZmLCBidXQgdHJ5aW5nIHRvIGFjdHVhbGx5IHJ1biBHTApv
ciBDTCBzdHVmZiBhbmQgaXQgdGhlbiBjcmFzaGVzLgoKSSBhbHNvIGR1bXBlZCB0aGUgUG93ZXIg
UGxheSB0YWJsZXMsIHNlZSBbMl0uIEkgY2FuJ3QgcmVhbGx5CnVuZGVyc3RhbmQgdGhlbSwgdGhl
cmUgaXMgZGVmaW5pdGVseSBzb21lIHdlaXJkIHZhbHVlcywgYnV0IG5vdCBzdXJlCmlmIHRoYXQn
cyBub3JtYWwgb3Igbm90LgoKQXMgSSBub3RlZCBlYXJsaWVyIGluIHRoZSB0aHJlYWQsIHdoZW4g
SSBmaXJzdCB1c2VkIHRoZSBjYXJkIG9uCndpbmRvd3MsIHVzaW5nIGp1c3QgQU1EJ3MgZHJpdmVy
IHRoZSBjYXJkIHdhcyBzdHVjayBhdCBpdHMgbG93ZXN0CmNsb2NrIHJhdGUgYW5kIHBlcmZvcm1l
ZCBwb29ybHkgaW4gYmVuY2htYXJrLiBJdCB3YXMgb25seSBhZnRlciBJCmxvYWRlZCBBc3JvY2sn
cyBvd24gdHdlYWsgdXRpbGl0eSB0aGF0IHRoZSBjYXJkIHN0YXJ0ZWQgdG8gYXV0byBhZGFwdApp
dHMgY2xvY2sgLyB2b2x0YWdlcy4gIE5vdCBzdXJlIGlmIHRoZXJlIGlzIGEgd2F5IHRvIGR1bXAg
d2luZG93cwpwb3dlciBwbGF5IGNvbmZpZyA/CgoKQ2hlZXJzLAoKICAgU3lsdmFpbgoKWzFdIGh0
dHBzOi8vd3d3LnBob3Jvbml4LmNvbS9mb3J1bXMvZm9ydW0vbGludXgtZ3JhcGhpY3MteC1vcmct
ZHJpdmVycy9vcGVuLXNvdXJjZS1hbWQtbGludXgvMTExMjEyMS1yeC01NjAtY3Jhc2gtdW5kZXIt
bGlnaHQtbG9hZApbMl0gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L3VXaDZXTG1oCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
