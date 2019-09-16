Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DABBB4869
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 09:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BB96EB21;
	Tue, 17 Sep 2019 07:41:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEEB6EA83
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 20:51:27 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id i1so644066pfa.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 13:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hx5cpDkGcZnTQwzcsLzafHlpEz/Noyb+pwEcxZ9GhhU=;
 b=mYOKiecyEk8/Sh7BM7IJzT+YhCMGtJ9wlNnkNWVdISU1MG8HVk/7JAjSWRXkeFKf75
 2vMZxCccAFx6alh/0PJ7FKTUxIAhnzUtLVhfMYuGTrOM+dqj9hcGNM9q6UEIb8S96HZG
 R3dVaqopYW3xywEudmT4COR0GfaGxvJnjBr0iXgt+xclG+aLyHVXdGokqx6DHqyfSIt/
 33EjM2x6UfkxG0HgimQ8clZeLwkHDLqwNM+4iUSPy2wxqmpJkfMQ9EKa3dYItFpTFHXu
 34v1rWhPSvKRAJpwNzAlTj8OZb33+uf8Px5s0c8YD6xfKMzuG2sWIOj+2AVpvoiV6us/
 sfrw==
X-Gm-Message-State: APjAAAWtb2EhOOJ9AE28WlHalq2qZJng59qwkywy0TxySc546t9K2PyC
 wS25E93kk/8i4f82XAjMLJ8HmiI32jKkAn8jxbcJzA==
X-Google-Smtp-Source: APXvYqwyQFBvyYitGUwWx5Fnkw3PB3kUsKDCHzTmUynyyYW89JOA/BzOPLYCIOrdYUOpDungPqIDEwoxq2nqQrbhihA=
X-Received: by 2002:a63:7153:: with SMTP id b19mr112686pgn.10.1568667086040;
 Mon, 16 Sep 2019 13:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <1568624607-19067-1-git-send-email-danielliu861@gmail.com>
In-Reply-To: <1568624607-19067-1-git-send-email-danielliu861@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Sep 2019 13:51:15 -0700
Message-ID: <CAKwvOdn8-T3Q=LhiGu6H7dCpwXXrNAjpKJA5z0d+N4qB8bOapQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: build failed for DCN2.1
To: Xinpeng Liu <danielliu861@gmail.com>, Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:41:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Hx5cpDkGcZnTQwzcsLzafHlpEz/Noyb+pwEcxZ9GhhU=;
 b=nEBSkHNXqIT3lGy8v3Quhfq9YC6ey5oSUJoAATPOuj936VaLFELqYdWRKHKSBStdGQ
 UsOwegonx/7llqHO8DOd0khAaoKV1ZZxftO8jsKIIUPIvXRJq8n9B8HCrONQ+q5nU2pk
 i3PB8KBr8YGqmZExIZWKIj87yJHUt5InCY4pfvaw/jp/mdcvgdXmPBVR4rKfXPXabQXB
 fl7yNiC2dz1b56l9QonpWTN8GXayrhE7nqIwMIdxQUbMcc9qAYtjRXOhRpd1p2rtAkSw
 coQ1L1C5mgYUa1RmF5BK4cFSsiEHQMGLXqEbNOGbNwRe2LWyl1RWrra3I2Jto7++3TLK
 I/Cg==
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>, "Li,
 Sun peng \(Leo\)" <sunpeng.li@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Roman.Li@amd.com,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Jun.Lei@amd.com, Bhawanpreet.Lakha@amd.com, "Koenig,
 Christian" <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMTYsIDIwMTkgYXQgMjowMyBBTSBYaW5wZW5nIExpdSA8ZGFuaWVsbGl1ODYx
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2RjL2RtbC9NYWtlZmlsZTo3MDogKioqIG1pc3NpbmcKPiBgZW5kaWYnLiAgU3RvcC4KPiBt
YWtlWzRdOiAqKiogW2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1XSBFcnJvciAyCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBYaW5wZW5nIExpdSA8ZGFuaWVsbGl1ODYxQGdtYWlsLmNvbT4KClRlc3RlZC1i
eTogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+CgorIE1hcmsKSSB0
aGluayB0aGlzIHdhcyBhIHJlc3VsdCBvZiB0aGUgcmVzb2x2ZWQgbWVyZ2UgY29uZmxpY3QuICBT
ZWUgdGhlCi1uZXh0IG9ubHkgY29tbWl0IHRpdGxlZDoKICAgIE1lcmdlIHJlbW90ZS10cmFja2lu
ZyBicmFuY2ggJ2RybS9kcm0tbmV4dCcKCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZG1sL01ha2VmaWxlIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwv
TWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL01ha2VmaWxlCj4g
aW5kZXggYTJlYjU5ZS4uNWIyYTY1YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZG1sL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RtbC9NYWtlZmlsZQo+IEBAIC00NCw2ICs0NCw3IEBAIENGTEFHU18kKEFNRERBTFBB
VEgpL2RjL2RtbC9kY24yMC9kaXNwbGF5X21vZGVfdmJhXzIwLm8gOj0gJChkbWxfY2NmbGFncykK
PiAgQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMvZG1sL2RjbjIwL2Rpc3BsYXlfcnFfZGxnX2NhbGNf
MjAubyA6PSAkKGRtbF9jY2ZsYWdzKQo+ICBDRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kbWwvZGNu
MjAvZGlzcGxheV9tb2RlX3ZiYV8yMHYyLm8gOj0gJChkbWxfY2NmbGFncykKPiAgQ0ZMQUdTXyQo
QU1EREFMUEFUSCkvZGMvZG1sL2RjbjIwL2Rpc3BsYXlfcnFfZGxnX2NhbGNfMjB2Mi5vIDo9ICQo
ZG1sX2NjZmxhZ3MpCj4gK2VuZGlmCj4gIGlmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMQo+
ICBDRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kbWwvZGNuMjEvZGlzcGxheV9tb2RlX3ZiYV8yMS5v
IDo9ICQoZG1sX2NjZmxhZ3MpCj4gIENGTEFHU18kKEFNRERBTFBBVEgpL2RjL2RtbC9kY24yMS9k
aXNwbGF5X3JxX2RsZ19jYWxjXzIxLm8gOj0gJChkbWxfY2NmbGFncykKPiAtLQo+IDEuOC4zLjEK
PgoKCi0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
