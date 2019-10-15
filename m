Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE4BD789D
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 16:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F00789BAC;
	Tue, 15 Oct 2019 14:32:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9ED889BAC
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 14:31:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 7so21163275wme.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 07:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8m+ZNAf0qAgJwenH1eCI5UIwFafztdPUMJOJHw/MFpg=;
 b=By2NzGHtMGSxaDWzKW2rJWXur6ASfUAOgk2ivG9s8M3T1QjR057HTCcBYlXkkXtQ/i
 kyBRtSszsI6VNqvpl8xOCRZe86aB4IAafdyR9kGGsKg5EcOPWUad9da1MrWMBOP+JSlc
 4h6+MMNvATtU63c90iO0SgE5lgl47o756E62X/OKWjx8K/zCAgmQCC3wfVUGTepQVUgl
 dLfzay2q8SkKbL+eho7/boeJspDXFrr3Qz7HS8mmJeqeyJDT95VK/hBe/84KulaLLPq/
 0iKZr8Ww+1pNWe8mkQnxBLoAe0+Skk/bbhXDW/pspCHVqpMYfxRVsT7Nz1kYdXkO05Gx
 z9ew==
X-Gm-Message-State: APjAAAVzilm9s61UqT2gzlK3OvOPT32wwHGXYGzAoNzzuRsLXf4KauuN
 TVJl8QnRc9+Ppromdgcl42iPuCnOZNH9cPJl5GE=
X-Google-Smtp-Source: APXvYqzDAmXAswn1R4rRyf7608FBW//Kt80E2K+z/vtCMCsgRHjJNvU4j10ivsADbnX21LV/xomPLMTgy0Qh0m4t06Y=
X-Received: by 2002:a1c:968b:: with SMTP id
 y133mr19563224wmd.141.1571149917179; 
 Tue, 15 Oct 2019 07:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <1571149661-4587-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1571149661-4587-1-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Oct 2019 10:31:43 -0400
Message-ID: <CADnq5_MXPP96AzHDkPPAp7JCSR0qBoqXGg+ip5x4D6eYs0+aMQ@mail.gmail.com>
Subject: Re: dmr/amdgpu: Fix crash on SRIOV for ERREVENT_ATHUB_INTERRUPT
 interrupt.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8m+ZNAf0qAgJwenH1eCI5UIwFafztdPUMJOJHw/MFpg=;
 b=sn5n1b/P9nocWqoZmIV6/+gyETwSeGnpg7lQ+p60K5Q606l/b+dUkj6tE7OjlxowY4
 spFJJgR01fP/SUQ8uZxDgHi3he7IRhcAS3vXkY2A8h8H9D5DDZfR2wpgzcsB8OeUI0uf
 BCEZp0FiBj4JjuNTr4XPiqJu2xus6nFRZkZMrw7qmrq18EzXsvkB7BuVSZLSAumMAWYQ
 ltW5bUQeK0O93Ev4dema8LMg9WVfaGfu849Q+W7kmlfRWj2rbzqw8IjCrNBxUUjTRgy4
 SProLHvcfsOBghQ9wYR+2Wf5JCTj7i92km+Td/g8ipfgwVw+WfA4fYfhadXHnJPQqAMJ
 qxig==
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

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTA6MjcgQU0gQW5kcmV5IEdyb2R6b3Zza3kKPGFuZHJl
eS5ncm9kem92c2t5QGFtZC5jb20+IHdyb3RlOgo+Cj4gSWducmUgdGhlIEVSUkVWRU5UX0FUSFVC
X0lOVEVSUlVQVCBmb3Igc3lzdGVtcyB3aXRob3V0IFJBUy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+IFJldmlld2VkLWFu
ZC10ZXN0ZWQtYnk6IEphY2sgWmhhbmcgPEphY2suWmhhbmcxQGFtZC5jb20+CgpBY2tlZC1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCA2ICsrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5jCj4gaW5kZXggODRkOGMzMy4uY2Q4NDMzMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBAQCAtMTg0NCw2ICsxODQ0LDEyIEBAIGludCBhbWRn
cHVfcmFzX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4KPiAgdm9pZCBhbWRncHVf
cmFzX2dsb2JhbF9yYXNfaXNyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICB7Cj4gKyAg
ICAgICB1aW50MzJfdCBod19zdXBwb3J0ZWQsIHN1cHBvcnRlZDsKPiArCj4gKyAgICAgICBhbWRn
cHVfcmFzX2NoZWNrX3N1cHBvcnRlZChhZGV2LCAmaHdfc3VwcG9ydGVkLCAmc3VwcG9ydGVkKTsK
PiArICAgICAgIGlmICghaHdfc3VwcG9ydGVkKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4g
Kwo+ICAgICAgICAgaWYgKGF0b21pY19jbXB4Y2hnKCZhbWRncHVfcmFzX2luX2ludHIsIDAsIDEp
ID09IDApIHsKPiAgICAgICAgICAgICAgICAgRFJNX1dBUk4oIlJBUyBldmVudCBvZiB0eXBlIEVS
UkVWRU5UX0FUSFVCX0lOVEVSUlVQVCBkZXRlY3RlZCFcbiIpOwo+Cj4gLS0KPiAyLjcuNAo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
