Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB71F9E8
	for <lists+amd-gfx@lfdr.de>; Wed, 15 May 2019 20:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D4A89261;
	Wed, 15 May 2019 18:26:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8F08921A
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 18:26:12 +0000 (UTC)
Received: by mail-yw1-xc33.google.com with SMTP id n188so321194ywe.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 11:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tsCIBi2vQPWYtkhsnM3saQYesJzX/fnf7WhTykcBRIc=;
 b=UTfFSIia/0J2r5eHs5fUkB1jMc38WLYMHJZjHvwORROGleSre0ykeahUIDyBCE5JXo
 Fzbd564nuEI83lrIZiZlsPQZE2K6g3kzAZ4Ny4Bm2Dl4dYg0m85UbFE6JSF66Qi9l2iJ
 jStBXWhNka176MDhAEswQlwWjpLoqL48Y3iPkxUV1fk9Zwp7kOD179cUg8MfL6S000QS
 rE//ngNm2e5Mgab4h/Sm/jq+cMZwynsYXyvNECBybNJGLPJgrrfiqpXlzlSyRXq/ABjR
 XtYB6uGL/rNOQzbguLkywGmI5albuva/nUqElTpA9eA+hN8/OT8Z2T0TuPAS/j7B3mLo
 fHBQ==
X-Gm-Message-State: APjAAAW+sx1RM5QZYb5ItmPhgBYoAA8YfGrGo6VqwrbmhkzMUoXoIghU
 4JDwzx5zHIfotGCg5XNrXlOj6QsPlytq4P/47q96E9mlhos=
X-Google-Smtp-Source: APXvYqyHLXtwF+9UNp8mF7PeNLVFVnJIXFQyC7rZxsuAAnlA3BDBQmmejXf7XtPJuBw/aG51oCxlGinVy5jZi2jOGo4=
X-Received: by 2002:a0d:e386:: with SMTP id
 m128mr22039379ywe.283.1557944771354; 
 Wed, 15 May 2019 11:26:11 -0700 (PDT)
MIME-Version: 1.0
From: Micah Morton <mortonm@chromium.org>
Date: Wed, 15 May 2019 11:26:00 -0700
Message-ID: <CAJ-EccO1ue5hTtJ8m4utQp+8dSsWm60JFA5YOT1gCODnYcFUog@mail.gmail.com>
Subject: GPU passthrough support for Stoney [Radeon R2/R3/R4/R5 Graphics]?
To: amd-gfx@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=tsCIBi2vQPWYtkhsnM3saQYesJzX/fnf7WhTykcBRIc=;
 b=HQAb7o3cSQZ+WZO5eq3go0wtSC9vZas4FkQvQ6RswyzQTAa9OqLnor8+20dN845UCc
 ux02e5z0p9tPvQSCLOEx9/s6UkfRNQPNde9UoQMh2YCkPiXdjvIifAaEeMVI5zvXHi7l
 by3fJOjd5kDcK7ZYFxxmv6uxfYWTOd7ugCgWg=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgZm9sa3MsCgpJJ20gaW50ZXJlc3RlZCBpbiBydW5uaW5nIGEgVk0gb24gYSBzeXN0ZW0gd2l0
aCBhbiBpbnRlZ3JhdGVkIFN0b25leQpbUmFkZW9uIFIyL1IzL1I0L1I1IEdyYXBoaWNzXSBjYXJk
IGFuZCBwYXNzaW5nIHRocm91Z2ggdGhlIGdyYXBoaWNzCmNhcmQgdG8gdGhlIFZNIHVzaW5nIHRo
ZSBJT01NVS4gSSdtIHdvbmRlcmluZyB3aGV0aGVyIHRoaXMgaXMgZmVhc2libGUKYW5kIHN1cHBv
c2VkIHRvIGJlIGRvYWJsZSB3aXRoIHRoZSByaWdodCBzZXR1cCAoYXMgb3Bwb3NlZCB0byBwYXNz
aW5nCmEgZGlzY3JldGUgR1BVIHRvIHRoZSBWTSwgd2hpY2ggSSB0aGluayBpcyBkZWZpbml0ZWx5
IGRvYWJsZT8pLgoKU28gZmFyLCBJIGNhbiBkbyBhbGwgdGhlIHFlbXUva3ZtL3ZmaW8vaW9tbXUg
c3R1ZmYgdG8gcnVuIHRoZSBWTSBhbmQKcGFzcyB0aGUgaW50ZWdyYXRlZCBHUFUgdG8gaXQsIGJ1
dCB0aGUgZHJtIGRyaXZlciBpbiB0aGUgVk0gZmFpbHMKZHVyaW5nIGFtZGdwdV9kZXZpY2VfaW5p
dCgpLiBTcGVjaWZpY2FsbHksIHRoZSBsb2dzIHNob3cgdGhlIFNNVSBiZWluZwp1bnJlc3BvbnNp
dmUsIHdoaWNoIGxlYWRzIHRvIGEgJ1NNVSBmaXJtd2FyZSBsb2FkIGZhaWxlZCcgZXJyb3IKbWVz
c2FnZSBhbmQga2VybmVsIHBhbmljLiBJIGNhbiBzaGFyZSBWTSBsb2dzIGFuZCB0aGUgaW52b2Nh
dGlvbiBvZgpxZW11IGFuZCBzdWNoIGlmIGhlbHBmdWwsIGJ1dCBmaXJzdCB3YW50ZWQgdG8ga25v
dyBhdCBhIGhpZ2ggbGV2ZWwgaWYKdGhpcyBzaG91bGQgYmUgZmVhc2libGU/CgpQLlMuOiBJJ20g
bm90IGluaXRpYWxpemluZyB0aGUgR1BVIGluIHRoZSBob3N0IGJpb3Mgb3IgaG9zdCBrZXJuZWwg
YXQKYWxsLCBzbyBJIHNob3VsZCBiZSBwYXNzaW5nIGEgZnJlc2ggR1BVIHRvIHRoZSBWTS4gQWxz
bywgSSdtIHByZXR0eQpzdXJlIEknbSBydW5uaW5nIHRoZSBjb3JyZWN0IFZHQSBiaW9zIGZvciB0
aGlzIEdQVSBpbiB0aGUgZ3Vlc3QgVk0KYmlvcyBiZWZvcmUgZ3Vlc3QgYm9vdC4KCkFueSBjb21t
ZW50cy9zdWdnZXN0aW9ucyB3b3VsZCBiZSBhcHByZWNpYXRlZCEKCk1pY2FoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
