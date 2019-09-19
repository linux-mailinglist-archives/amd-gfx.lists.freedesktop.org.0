Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03B4B79A7
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 14:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D2C6EBBE;
	Thu, 19 Sep 2019 12:42:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF806EBBE
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 12:42:29 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 7so4355326wme.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 05:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n1suiqet5U56g5KvP3n/bdduHqh5R+gh47fePsK+X4w=;
 b=nRSGRiXDsA7H7m+K+6eGNYJ8l3hDUsRHjwYs4ZGnoVMdbu71rbsWUrJW1SJmlv4uKN
 98HAbt+nyksYLUwUzADPc+Pub9fVFg6J/xx6DV3z9HWVcqw1/MXH92UaH43RebriimMA
 A03kR1K7Rg1OkfDrJ6NkZyyNYK2DdBvULdo2fOJfTSX6orjazYmaHwtIA1UvOJkRNatx
 +s5jTSbgT+djSNncGeminzmCodNJNfX/ezk5Iy7VTDggJhMq5V3MdgP3YDd9kaLLZwUD
 OvpekoWkGQgF/sVPFcWk7ET9fmUcIVbacP3k1Z9t2grvyDV8ERlg50giou7gSOzuZrs6
 3fFw==
X-Gm-Message-State: APjAAAXYIGN0meyU8p6rJihk+jUju1HOXWVuPpihbKhVbnIE80v75ZLf
 hm9XiQn9T0X3GML/2ApHtPZ5pYTEBzVwcbvZpEqsgQ==
X-Google-Smtp-Source: APXvYqxJbPY295+jmTIzOwM9gg4AoDs1HAMlTfcFfJQrkx8vJcfM/koKLytVF61fq8pxFANlfyuM7qTxFyexIJPJgts=
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr2682132wmc.141.1568896947624; 
 Thu, 19 Sep 2019 05:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <1568877274-19001-1-git-send-email-zhexi.zhang@amd.com>
In-Reply-To: <1568877274-19001-1-git-send-email-zhexi.zhang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Sep 2019 08:42:15 -0400
Message-ID: <CADnq5_PiGmxWPL+-UXHsE9SS_uMgz5vh03x6+dmSp6iqOTv=Kg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/powerplay [Vega10]Vega10 BKM0.83 AVFS
 parameters patch for Linux Driver
To: Jesse Zhang <zhexi.zhang@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=n1suiqet5U56g5KvP3n/bdduHqh5R+gh47fePsK+X4w=;
 b=ItdaqMBPTrRxaAAQUncb2DHLfe6WDZMuepLMHix7L+QNFi5KwJXItUUhsGRmi+FEyg
 JPVWDFNLb2m0BcS6LfCNTqokeCbB3e1zjHHR1R3W0kwmQE7gmcktuWV7r/ULs7I8n/Gf
 I8ZEWhruSrQC1vCMIkzV0gt6aeuHO/0tCOSpyzqQDKmBjYecBFIOjTjI9Cv+euZj3TM6
 hafUwkk7UzZHLrDozK+7a26lYHNEaWAyprh3uPuuK3eWsUCGR/jPyUqlBu52FbS+/TG/
 n5gxZMhqsMw/FEKOKVQ7EFYBD0JqBEfvmshx9nL7aczYkWuxEdQCs+Wu8XZtni7JSdKb
 VuTQ==
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

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMzoxNCBBTSBKZXNzZSBaaGFuZyA8emhleGkuemhhbmdA
YW1kLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiB6aGV4emhhbiA8emhleGkuemhhbmdAYW1kLmNvbT4K
Pgo+IElzc3VlOiBEUk9PUCBjb2VmIHJlYWQgYnkgSERUIGFwcGVhciB0byBiZSBtaXNtYXRjaCB3
aXRoIHJlcXVpcmVtZW50IG9mIEJLTTAuODMKPgo+IFJvb3QgY2F1c2U6IFRoZXNlIHZhbHVlcyBh
cmUgc3VwcG9zZWQgdG8gYmUgb3ZlcndyaXR0ZW4gYnkgUFBMSUIuCj4gSG93ZXZlciwgZHJpdmVy
IG1pc3NlZCBjb2RlIG9mIHRoaXMgcGFydC4KPgo+IFNvbHV0aW9uOiBBZGQgb3ZlcndyaXRpbmcg
cHJvY2VzcyB3aGVuIHJlYWRpbmcgcHB0YWJsZSBmcm9tIHZCSU9TCj4gSGFyZGNvZGUgc3BlY2lm
aWMgY29lZiB3aXRoIGNvcnJlY3QgdmFsdWVzOgo+IEdiVmRyb29wVGFibGVDa3NvZmZBMCA9IDB4
RkZGQ0QyRTcKPiBHYlZkcm9vcFRhYmxlQ2tzb2ZmQTEgPSAweDI0OTAyCj4gR2JWZHJvb3BUYWJs
ZUNrc29mZkEyID0gMHgyNDlCQQo+Cj4gQ2hhbmdlLUlkOiBJNmNkZGQ3ZmMyMmQ1OWM1NTVmNzg0
YzEyNTk2YWQzYTQ4YjJjZmZjZAo+IFNpZ25lZC1vZmYtYnk6IHpoZXh6aGFuIDx6aGV4aS56aGFu
Z0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9w
cGF0b21md2N0cmwuYyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
cHBhdG9tZndjdHJsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9wcGF0
b21md2N0cmwuYwo+IGluZGV4IDYxNWNmMmMwLi5iODI3YzJjIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3BwYXRvbWZ3Y3RybC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvcHBhdG9tZndjdHJsLmMKPiBAQCAtMjkz
LDYgKzI5MywxMyBAQCBpbnQgcHBfYXRvbWZ3Y3RybF9nZXRfYXZmc19pbmZvcm1hdGlvbihzdHJ1
Y3QgcHBfaHdtZ3IgKmh3bWdyLAo+ICAgICAgICAgZm9ybWF0X3JldmlzaW9uID0gKChzdHJ1Y3Qg
YXRvbV9jb21tb25fdGFibGVfaGVhZGVyICopcHJvZmlsZSktPmZvcm1hdF9yZXZpc2lvbjsKPiAg
ICAgICAgIGNvbnRlbnRfcmV2aXNpb24gPSAoKHN0cnVjdCBhdG9tX2NvbW1vbl90YWJsZV9oZWFk
ZXIgKilwcm9maWxlKS0+Y29udGVudF9yZXZpc2lvbjsKPgo+ICsgICAgICAgaWYgKGZvcm1hdF9y
ZXZpc2lvbiA9PSA0KQo+ICsgICAgICAgewoKeyBzaG91bGQgYmUgb24gdGhlIHNhbWUgbGluZSBh
cyB0aGUgc3RhdGVtZW50LiAgRS5nLiwKaWYgKGZvcm1hdF9yZXZpc2lvbiA9PSA0KSB7CgpXaXRo
IHRoYXQgZml4ZWQ6CkFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+CgoKPiArICAgICAgICAgICAgICAgcHJvZmlsZS0+Z2JfdmRyb29wX3RhYmxlX2Nrc29m
Zl9hMCA9IDB4ZmZmY2QyZTc7Cj4gKyAgICAgICAgICAgICAgIHByb2ZpbGUtPmdiX3Zkcm9vcF90
YWJsZV9ja3NvZmZfYTEgPSAweDI0OTAyOwo+ICsgICAgICAgICAgICAgICBwcm9maWxlLT5nYl92
ZHJvb3BfdGFibGVfY2tzb2ZmX2EyID0gMHgyNDliYTsKPiArICAgICAgIH0KPiArCj4gICAgICAg
ICBpZiAoZm9ybWF0X3JldmlzaW9uID09IDQgJiYgY29udGVudF9yZXZpc2lvbiA9PSAxKSB7Cj4g
ICAgICAgICAgICAgICAgIHBhcmFtLT51bE1heFZkZGMgPSBsZTMyX3RvX2NwdShwcm9maWxlLT5t
YXh2ZGRjKTsKPiAgICAgICAgICAgICAgICAgcGFyYW0tPnVsTWluVmRkYyA9IGxlMzJfdG9fY3B1
KHByb2ZpbGUtPm1pbnZkZGMpOwo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
