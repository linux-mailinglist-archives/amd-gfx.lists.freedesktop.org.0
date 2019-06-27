Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F5258492
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 16:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CC36E4AF;
	Thu, 27 Jun 2019 14:35:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350926E4AF
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 14:35:12 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c6so5953757wml.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 07:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5cmAiPUBNhkZw4BTKsXx4RekPUrYDfPU66V90FS+rZY=;
 b=DPpJ+YFHnTXATNfL27OguDaLbmPG3u5S3hPVe/tzsm0vk6UNJN32Xi575kqEC02puL
 3+ACuZaFKTEpfZp8UhwgtbYN79xwNKij6bpZUQEnu4o/cS9PRnUefJk+vagzveIUNoWn
 b7MNQ8LCh3D9jPJ6/oPOvlTmQ58gp8PP0LcSEWCkER0vG8+FGa/QYPzENYvYSxzNqtqw
 Vv2EiWIuZL3sYwJsIeA3IdBl95Kawbg6lkbLSfqSZCuPLc2p16pKDFz4zMGLYuF5tsY3
 EWMvJXu1+5xTwHebtTzKdMa0e3GROYc3YPvi6JXIlYbQJf6xCXYPylW3aSH7PdoRAt1q
 pHoQ==
X-Gm-Message-State: APjAAAWzBwIwER1dyKO5XCeqRr8tYzv1N64KbFoG49t1MpwdeNw/Hu1i
 zLrLOxlXW2rG10y1zStj0SiOtZeb5MqFChj5GNHbLTpO
X-Google-Smtp-Source: APXvYqz52GRNxTsYcgtI2YFKSv0Rg4oOAXyoAUOTHjjyg9mPYDnh/CcNTIelxJ1djFIw5o5wBuvyPYJ3+yzmQmOo6wA=
X-Received: by 2002:a1c:a1c5:: with SMTP id k188mr3498950wme.102.1561646110780; 
 Thu, 27 Jun 2019 07:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190627141628.7882-1-alexander.deucher@amd.com>
 <e894eeae-f175-d6b9-6817-7f3f59227fed@daenzer.net>
In-Reply-To: <e894eeae-f175-d6b9-6817-7f3f59227fed@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Jun 2019 10:35:00 -0400
Message-ID: <CADnq5_PpuO2VUY4ZHM-7hPo1MdsbHO69oeSs6MfFcuFNVvUoSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: drop copy/paste leftover to fix big endian
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5cmAiPUBNhkZw4BTKsXx4RekPUrYDfPU66V90FS+rZY=;
 b=KoIU8+F0wcLTBufkJzS+DVNcgBm0W7usnEwlD0C6exkR+/qXyINNxP6Sn+PucashSS
 6NXzjZJLYq/hAz+PT85eJJqywHODhe1zLUM6nF4Xj3SiuvJISHmqxHOKWHcRuPzJVhSt
 DVPx5c5WcQM1ooxZ1m603vi2H62o2aDAw3Ttkov4lrciQ7c4eUDPkys3qz5xY5HNPcbb
 3cRCqTpw3yUcVd3qthCmLU5K+8CM0Gi3/CXgN5wnDZfOTJqdJYveOsNaW9YgcXYi7MRz
 3iJVAT5vGhM8tKjo+9tHtmMKoVGxznkoC2tkifnoBsf3wWE2VWSubBj9P3YJfyYPlu5e
 +CQQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTA6MzIgQU0gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBk
YWVuemVyLm5ldD4gd3JvdGU6Cj4KPiBPbiAyMDE5LTA2LTI3IDQ6MTYgcC5tLiwgQWxleCBEZXVj
aGVyIHdyb3RlOgo+ID4gVGhlIGJ1ZiBzd2FwIGZpZWxkIGRvZXNuJ3QgZXhpc3Qgb24gUkIxLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
IHwgMyAtLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwo+ID4gaW5kZXggMDA2MWEwZThhYjc4Li4y
OTMyYWRlN2RiZDAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjEwXzAuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMKPiA+IEBAIC0yNjI0LDkgKzI2MjQsNiBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9jcF9nZnhf
cmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ID4gICAgICAgcmJfYnVmc3ogPSBv
cmRlcl9iYXNlXzIocmluZy0+cmluZ19zaXplIC8gOCk7Cj4gPiAgICAgICB0bXAgPSBSRUdfU0VU
X0ZJRUxEKDAsIENQX1JCMV9DTlRMLCBSQl9CVUZTWiwgcmJfYnVmc3opOwo+ID4gICAgICAgdG1w
ID0gUkVHX1NFVF9GSUVMRCh0bXAsIENQX1JCMV9DTlRMLCBSQl9CTEtTWiwgcmJfYnVmc3ogLSAy
KTsKPiA+IC0jaWZkZWYgX19CSUdfRU5ESUFOCj4gPiAtICAgICB0bXAgPSBSRUdfU0VUX0ZJRUxE
KHRtcCwgQ1BfUkIxX0NOVEwsIEJVRl9TV0FQLCAxKTsKPiA+IC0jZW5kaWYKPiA+ICAgICAgIFdS
RUczMl9TT0MxNShHQywgMCwgbW1DUF9SQjFfQ05UTCwgdG1wKTsKPiA+ICAgICAgIC8qIEluaXRp
YWxpemUgdGhlIHJpbmcgYnVmZmVyJ3Mgd3JpdGUgcG9pbnRlcnMgKi8KPiA+ICAgICAgIHJpbmct
PndwdHIgPSAwOwo+ID4KPgo+IFNvIHRoZSBSQjAgQlVGX1NXQVAgYml0IGFwcGxpZXMgdG8gUkIx
IGFzIHdlbGw/IE1pZ2h0IGJlIG5pY2UgdG8gY2xhcmlmeQo+IHRoYXQgaW4gdGhlIGNvbW1pdCBs
b2cuCgpNYXliZT8gIEkgc3VzcGVjdCB0aGVyZSBpcyBubyBzd2FwcGluZyBvbiB0aGUgb3RoZXIg
UkIuICBJJ20gbm90IGV2ZW4Kc3VyZSB0aGUgc3dhcHBpbmcgd29ya3Mgb24gUkIwLCBidXQgdGhl
IGJpdHMgYXJlIHN0aWxsIHRoZXJlLiAgU29tZW9uZQp3b3VsZCBwcm9iYWJseSBuZWVkIHRvIHZh
bGlkYXRlIGFsbCBvZiB0aGlzIG9uIEJFIGhhcmR3YXJlLgoKQWxleAoKPgo+IEFueXdheSwKPgo+
IFJldmlld2VkLWJ5OiBNaWNoZWwgRMOkbnplciA8bWljaGVsLmRhZW56ZXJAYW1kLmNvbT4KPgo+
Cj4gLS0KPiBFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAg
ICAgICBodHRwczovL3d3dy5hbWQuY29tCj4gTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAg
ICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
