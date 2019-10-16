Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB6D8958
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 09:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E923D6E554;
	Wed, 16 Oct 2019 07:24:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D4F6E554
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 07:24:09 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id o12so34708203qtf.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 00:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7/kqUGL2RuhU3S60UdPu4y8clUQwY+VPaSSrwpbmgO0=;
 b=j1zE7znRmJK8J05yc4ZnXqebvubmsBnerjWojxegBoNE9wy07z+5nJq52Gcg16ZaDW
 tR3y+7l+TV/WzQGQwiZbOnptrMNvR51O7ZEM/DnEQH/DksX5KRKjn2Az4XNDBs1pZGKs
 WUT09AbnJrCmVB9r2izi+LW+WaOFQUc/qZkahokpmMdsrO9feAiUwfqWm9kn5vJvth/L
 /j2VF/8utvWclKUPQs659irZRWqAkVzF+FdT3rCktGLjJB3Di99IRQLOrG1Fnx5kgn6Z
 TGHd4gXphpzSMLvqS5KEGhTrffQpsUvVimsEYCbF2e0SHzQGEBuQcxSBwYCVjznDoTDt
 qkAQ==
X-Gm-Message-State: APjAAAW+VFvlMicTb/POjy71GSExqbv+8PBWdKBB+azsLasyhiulKjte
 HUN0Ws1KJ5pbB4ggfFwq8l3OX2eXKSKo9OWZVsc3ew==
X-Google-Smtp-Source: APXvYqy51zkLCTO2KlvsJEzJJFKY46jnl45N81gIEG3DdMwbZeqsL9d89eQ2HFc6D2ejCsrjEsx19pTUKBmd09i1qBo=
X-Received: by 2002:ac8:3021:: with SMTP id f30mr42357999qte.80.1571210648136; 
 Wed, 16 Oct 2019 00:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191015065002.18701-1-drake@endlessm.com>
 <CADnq5_M4Leu0raYS6M72MqTm1+PLg9BjHCHLAYuB2-dEVP56_A@mail.gmail.com>
In-Reply-To: <CADnq5_M4Leu0raYS6M72MqTm1+PLg9BjHCHLAYuB2-dEVP56_A@mail.gmail.com>
From: Daniel Drake <drake@endlessm.com>
Date: Wed, 16 Oct 2019 15:23:56 +0800
Message-ID: <CAD8Lp443ZhPEo0PJRxbTSB9DY9x92OvWBeH29m9Ehpyhg+2n5A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: always reset asic when going into suspend
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7/kqUGL2RuhU3S60UdPu4y8clUQwY+VPaSSrwpbmgO0=;
 b=E6CSpufjtD3JGknIx0r1OwKl8d/peQZ5ZUvYmVDjKJ85JqPi7S5P6RtcCs8+ciTzko
 x3C0s2N2v+HNM5R4jLGcQee/zx3JFZZTh9fV7UvnLMr9YGbzHkxaEScpEy32+Sq7uFE3
 A+15MosWrZHsrV0Tv/yqCDHhhyGBHG16BqIZd8tenP7CnwA+e9joGCSwVRskdX4FhIQr
 tuzmrcNUMAj6IfcY7D/Ph9V4Mp0l8Gz9jazC8W0h0av/efR/8QKvIVWUrftrJOkZknV7
 6LeAWuZQ0GTC/S4r1TTttOzZwWAarjfjsykv/LlNzZ2POlQgIEOrBDLevIYXEim73v9K
 kYgQ==
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMjo0MyBBTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gSXMgczJpZGxlIGFjdHVhbGx5IHBvd2VyaW5nIGRvd24gdGhl
IEdQVT8KCk15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBzMmlkbGUgKGF0IGEgaGlnaCBsZXZlbCkg
anVzdCBjYWxscyBhbGwKZGV2aWNlcyBzdXNwZW5kIHJvdXRpbmVzIGFuZCB0aGVuIHB1dHMgdGhl
IENQVSBpbnRvIGl0cyBkZWVwZXN0CnJ1bm5pbmcgc3RhdGUuClNvIGlmIHRoZXJlIGlzIHNvbWV0
aGluZyBzcGVjaWFsIHRvIGJlIGRvbmUgdG8gcG93ZXIgb2ZmIHRoZSBHUFUsIEkKYmVsaWV2ZSB0
aGF0IGFtZGdwdSBpcyByZXNwb25zaWJsZSBmb3IgbWFraW5nIGFycmFuZ2VtZW50cyBmb3IgdGhh
dCB0bwpoYXBwZW4uCkluIHRoaXMgY2FzZSB0aGUgYW1kZ3B1IGNvZGUgYWxyZWFkeSBkb2VzOgoK
ICAgICAgICBwY2lfZGlzYWJsZV9kZXZpY2UoZGV2LT5wZGV2KTsKICAgICAgICBwY2lfc2V0X3Bv
d2VyX3N0YXRlKGRldi0+cGRldiwgUENJX0QzaG90KTsKCkFuZCB0aGUgUENJIGxheWVyIHdpbGwg
Y2FsbCB0aHJvdWdoIHRvIGFueSBhcHByb3ByaWF0ZSBBQ1BJIG1ldGhvZHMKcmVsYXRlZCB0byB0
aGF0IGxvdyBwb3dlciBzdGF0ZS4KCj4gRG8geW91IHNlZSBhIGRpZmZlcmVuY2UgaW4gcG93ZXIg
dXNhZ2U/ICBJIHRoaW5rIHlvdSBhcmUganVzdCB3b3JraW5nIGFyb3VuZCB0aGUgZmFjdCB0aGF0
IHRoZQo+IEdQVSBuZXZlciBhY3R1YWxseSBnZXRzIHBvd2VyZWQgZG93bi4KCkkgcmFuIGEgc2Vy
aWVzIG9mIGV4cGVyaW1lbnRzLgoKQmFzZSBzZXR1cDogbm8gVUkgcnVubmluZywgcmFuICJzZXR0
ZXJtIC1wb3dlcnNhdmUgMTsgc2V0dGVybSAtYmxhbmsKMSIgYW5kIHdhaXRlZCAxIG1pbnV0ZSBm
b3Igc2NyZWVuIHRvIHR1cm4gb2ZmLgpCYXNlIHBvd2VyIHVzYWdlIGluIHRoaXMgc3RhdGUgaXMg
NC43VyBhcyByZXBvcnRlZCBieSBCQVQwL3Bvd2VyX25vdwoKMS4gUnVuIGFtZGdwdV9kZXZpY2Vf
c3VzcGVuZChkZGV2LCB0cnVlLCB0cnVlKTsgYmVmb3JlIG15IGNoYW5nZQotLT4gUG93ZXIgdXNh
Z2UgaW5jcmVhc2VzIHRvIDYuMVcKCjIuIFJ1biBhbWRncHVfZGV2aWNlX3N1c3BlbmQoZGRldiwg
dHJ1ZSwgdHJ1ZSk7IHdpdGggbXkgY2hhbmdlIGFwcGxpZWQKLS0+IFBvd2VyIHVzYWdlIGluY3Jl
YXNlcyB0byA2LjBXCgozLiBQdXQgYW1kZ3B1IGRldmljZSBpbiBydW50aW1lIHN1c3BlbmQKLS0+
IFBvd2VyIHVzYWdlIGluY3JlYXNlcyB0byA2LjJXCgo0LiBUcnkgdW5tb2RpZmllZCBzdXNwZW5k
IHBhdGggYnV0IGQzY29sZCBpbnN0ZWFkIG9mIGQzaG90Ci0tPiBQb3dlciB1c2FnZSBpbmNyZWFz
ZXMgdG8gNi4xVwoKU28sIGFsbCBvZiB0aGUgc3VzcGVuZCBzY2hlbWVzIGFjdHVhbGx5IGluY3Jl
YXNlIHRoZSBwb3dlciB1c2FnZSBieQpyb3VnaGx5IHRoZSBzYW1lIGFtb3VudCwgcmVzZXQgb3Ig
bm90LCB3aXRoIGFuZCB3aXRob3V0IG15IHBhdGNoIDovCkFueSBpZGVhcz8KClRoYW5rcywKRGFu
aWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
