Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3729EF31
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 17:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90B289AB3;
	Tue, 27 Aug 2019 15:42:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B82389AB3
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 15:42:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y8so19283497wrn.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 08:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jpdx9z5ie0ncovLhhk5enC20IoN7+MD5rnLxVR1FfdE=;
 b=PXF4f8Ecr8pJPbOyqtalo82T/r+W9osL9Jgb7tU5lpBM7UC7poYKCGTXglXida/oke
 fadGu4zpQdXRGJjOXQ2F38EpfxJJFFO3v5at5tEOIhCPhqAeoOnKV7BmWQ18jT9NPqRg
 L5Jxswihj7NA3YVO2t/DY2Q4In8WptY9YI0X6UzkZrDwNH5M4q+IJ3ckqbVBoZXFCvn0
 5G69nw+Qt5/RAM4rWseD4Uf/P0MCVSpbX5LeRs4MdI3aCRFJS9aCtxOEDHW2wMmhZh5R
 G9w+PYpiEeKty83rICZB3N69QlAFwvp5RH8rST6i8HdAC4pVcyikFYN54Htg7vdCuFc5
 ll7A==
X-Gm-Message-State: APjAAAUAxBsWkrd6ujAiz5l4GKk7ZlgP3jtnrNlGOdVwCQNgPAgmcTpz
 jDv/HP1QImze3gCtW1/gs4zr/9+6GcJu7T19mBDKi8Zf
X-Google-Smtp-Source: APXvYqz2umF+OBYNCW03/vnOwvHt0fWXQSckxp/Y/APSPRqlEt3h4k8tMvutNdVFuOiO1m41U5qaXEe/NFm+iSr4ANU=
X-Received: by 2002:adf:8004:: with SMTP id 4mr28289677wrk.341.1566920551821; 
 Tue, 27 Aug 2019 08:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <1566920009-8378-1-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1566920009-8378-1-git-send-email-aaron.liu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Aug 2019 11:42:19 -0400
Message-ID: <CADnq5_PY15wyhuDSnMM7EY=7NsOkuPOuaRAvrG8pgEobyrynOw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix commit 4ef9d7d
To: Aaron Liu <aaron.liu@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Jpdx9z5ie0ncovLhhk5enC20IoN7+MD5rnLxVR1FfdE=;
 b=f7iKTNfr+nlkiiUuZEBMoPEomSW8pN3PdxQl6NUuPntBOmCcWJfynX2y3Vw/rHTyT5
 YQREn/I1iUpAjm1kiSNhP8iXmSzb3+hmCepHZPbAFH+b8tF2QDlk1LjPRNQZ+A0tvOEy
 iq5G+vDY4QMENT99smpSXNT5J1VdEKIRpqMxxKz+1FOLgUWbKcwPjK3SieWdHTIgNKAn
 WI3UoMMMrNMPa1U3NTSvhCx8KzO2R/fOrkEEznWLd32j5eGm2Qi6TjfZp6vBqpzltkdT
 ax+Vt/zaS5RM6k8i9YJ7phBf4T2aRTi9/IH6I7CneK0ZzjnfmHU1UPi9SXM6MWqwVAdU
 Vk5w==
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

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTE6MzQgQU0gQWFyb24gTGl1IDxhYXJvbi5saXVAYW1k
LmNvbT4gd3JvdGU6Cj4KPiBGb3IgcGljYXNzbyhhZGV2LT5wZGV2LT5kZXZpY2UgPT0gMHgxNWQ4
KSZyYXZlbjIoYWRldi0+cmV2X2lkID49IDB4OCksCj4gZmlybXdhcmUgaXMgc3VmZmljaWVudCB0
byBzdXBwb3J0IGdmeG9mZi4KPiBJbiBjb21taXQgNGVmOWQ3ZGMyZGIxNjZjYmU4M2ZlNDYyMTM4
NWYwMzRjOTM0N2ZkMiwgZm9yIHBpY2Fzc28mcmF2ZW4yLAo+IHJldHVybiBkaXJlY3RseSBhbmQg
Y2F1c2UgZ2Z4b2ZmIGRpc2FibGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWFyb24gTGl1IDxhYXJv
bi5saXVAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jIHwgMTQgKysrKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+
IGluZGV4IDI3NjJhZTQuLmZkNzk0N2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV8wLmMKPiBAQCAtMTAyNywxNCArMTAyNywxNCBAQCBzdGF0aWMgdm9pZCBnZnhfdjlfMF9j
aGVja19pZl9uZWVkX2dmeG9mZihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAgICAg
IGNhc2UgQ0hJUF9WRUdBMjA6Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2Fz
ZSBDSElQX1JBVkVOOgo+IC0gICAgICAgICAgICAgICBpZiAoYWRldi0+cmV2X2lkID49IDB4OCB8
fCBhZGV2LT5wZGV2LT5kZXZpY2UgPT0gMHgxNWQ4KQo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+IC0gICAgICAgICAgICAgICBpZiAoKGFkZXYtPmdmeC5ybGNfZndfdmVyc2lvbiAh
PSAxMDYgJiYKPiAtICAgICAgICAgICAgICAgICAgICBhZGV2LT5nZngucmxjX2Z3X3ZlcnNpb24g
PCA1MzEpIHx8Cj4gLSAgICAgICAgICAgICAgICAgICAoYWRldi0+Z2Z4LnJsY19md192ZXJzaW9u
ID09IDUzODE1KSB8fAo+IC0gICAgICAgICAgICAgICAgICAgKGFkZXYtPmdmeC5ybGNfZmVhdHVy
ZV92ZXJzaW9uIDwgMSkgfHwKPiAtICAgICAgICAgICAgICAgICAgICFhZGV2LT5nZngucmxjLmlz
X3JsY192Ml8xKQo+ICsgICAgICAgICAgICAgICBpZiAoIShhZGV2LT5yZXZfaWQgPj0gMHg4IHx8
IGFkZXYtPnBkZXYtPmRldmljZSA9PSAweDE1ZDgpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
JiYoKGFkZXYtPmdmeC5ybGNfZndfdmVyc2lvbiAhPSAxMDYgJiYKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGFkZXYtPmdmeC5ybGNfZndfdmVyc2lvbiA8IDUzMSkgfHwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKGFkZXYtPmdmeC5ybGNfZndfdmVyc2lvbiA9PSA1MzgxNSkg
fHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgKGFkZXYtPmdmeC5ybGNfZmVhdHVyZV92
ZXJzaW9uIDwgMSkgfHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIWFkZXYtPmdmeC5y
bGMuaXNfcmxjX3YyXzEpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPnBtLnBwX2Zl
YXR1cmUgJj0gflBQX0dGWE9GRl9NQVNLOwo+ICsKPiAgICAgICAgICAgICAgICAgaWYgKGFkZXYt
PnBtLnBwX2ZlYXR1cmUgJiBQUF9HRlhPRkZfTUFTSykKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBhZGV2LT5wZ19mbGFncyB8PSBBTURfUEdfU1VQUE9SVF9HRlhfUEcgfAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQU1EX1BHX1NVUFBPUlRfQ1AgfAo+IC0tCj4gMi43LjQKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
