Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D362F3C30
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Jan 2021 23:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78AF8997A;
	Tue, 12 Jan 2021 22:15:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4A38997A;
 Tue, 12 Jan 2021 22:15:55 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id f132so4018583oib.12;
 Tue, 12 Jan 2021 14:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TPk/MoS2a2L1cJbnsXH08Uh897owOozsQ9nh9DxD7sU=;
 b=lBhq03YJ5GEn2JImUYBBlWeFuOih1WcOj1PbqpZTRWteLaYakNQW6YN5+U7HZaQpFR
 a/h/QeHjrBrpX07KvTaZACAFwPzPVomYrsqZJczkgb1eLyPJnhcaj+T0m6zYeQhbr7nD
 aH5wJhPjK50+lykPwUFsFQiKmYDhBUFceGoFtOB4Q8i+jSivxEvtxxkc7LrthOQEuXtg
 haslozWlCBAl0OStHuQsoalfMnNCGIsLh/rnW5x1SRN1yp16zGhqYlG5S3VLaVnsss1G
 5uFeQ6j6gUHf5Jsc9dmTiUp3cff2GKVS9k+5oFqgpQ7+zv/bjTQxxI4sCz9AR66y3OXD
 xcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TPk/MoS2a2L1cJbnsXH08Uh897owOozsQ9nh9DxD7sU=;
 b=j5CUeS96ut7k2w4lDF73lmjbyts4JO29Vpz5YganI0uPO8cT/H66j1hAMhTp3UjJ0i
 mPC43WbQ9cwH3Uw4G4ADNEqPewd/UwU9oEN7i2nGpApiQyV4I3py2dfkAMLn3pPMbaX1
 3p6URK2JqfVZoV5aNdooSg0olni46g1Si6e+JFjYwWqg2nLcvdMDDk6cpUk8jrQ7oOHS
 Nxg4/lD94xqYd0Rzij/qyIFt4bkSE+qRi2QtFF/+fVGg/8lnL1P8VFJ56pRcMcXAjUZi
 aGwDWs5lTEbtPsshU9n19vAKMvMhwkWcRL7sBuJQ+lmH+95EDxQjHwQiFCXFJ/KmH/K/
 GmNA==
X-Gm-Message-State: AOAM532AJQlglFpZm9SiNZmEiLorQ9ygiAtpYD/c3xXYYLfwCb4kMeL9
 miX8X8VNYNxnC2P4HGbpTPhElfTftq5BZCAdXzA=
X-Google-Smtp-Source: ABdhPJwhEOohpitzCJr8DYappiwsBlb20rgQUSGwRS2IYFhoDDVGBSifpAHat+E2bUj0xoyP6n3neab+dqf7xFXO8lM=
X-Received: by 2002:aca:6202:: with SMTP id w2mr765685oib.5.1610489754915;
 Tue, 12 Jan 2021 14:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-18-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-18-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:15:41 -0500
Message-ID: <CADnq5_NqMy0i9S3HzNe3wMCBCcFwwxrx_tUBTJJUbdQ65oFX4Q@mail.gmail.com>
Subject: Re: [PATCH 17/40] drm/amd/display/dc/dce/dce_aux: Remove duplicate
 line causing 'field overwritten' issue
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMi9kY2UxMTJfcmVzb3VyY2UuYzo1OToKPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9hc2ljX3JlZy9kY2UvZGNlXzExXzJf
c2hfbWFzay5oOjEwMDE0OjU4OiB3YXJuaW5nOiBpbml0aWFsaXplZCBmaWVsZCBvdmVyd3JpdHRl
biBbLVdvdmVycmlkZS1pbml0XQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2RjL2RjZS9kY2VfYXV4Lmg6MjE0OjE2OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g
4oCYQVVYX1NXX0RBVEFfX0FVWF9TV19BVVRPSU5DUkVNRU5UX0RJU0FCTEVfX1NISUZU4oCZCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaDox
Mjc6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEFVWF9TRuKAmQo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMi9kY2UxMTJfcmVzb3VyY2Uu
YzoxNzc6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmERDRV9BVVhfTUFTS19TSF9M
SVNU4oCZCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2luY2x1ZGUvYXNpY19yZWcv
ZGNlL2RjZV8xMV8yX3NoX21hc2suaDoxMDAxNDo1ODogbm90ZTogKG5lYXIgaW5pdGlhbGl6YXRp
b24gZm9yIOKAmGF1eF9zaGlmdC5BVVhfU1dfQVVUT0lOQ1JFTUVOVF9ESVNBQkxF4oCZKQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4Lmg6MjE0
OjE2OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQVVYX1NXX0RBVEFfX0FVWF9TV19B
VVRPSU5DUkVNRU5UX0RJU0FCTEVfX1NISUZU4oCZCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaDoxMjc6Mjogbm90ZTogaW4gZXhwYW5zaW9u
IG9mIG1hY3JvIOKAmEFVWF9TRuKAmQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9k
aXNwbGF5L2RjL2RjZTExMi9kY2UxMTJfcmVzb3VyY2UuYzoxNzc6Mjogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvIOKAmERDRV9BVVhfTUFTS19TSF9MSVNU4oCZCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2luY2x1ZGUvYXNpY19yZWcvZGNlL2RjZV8xMV8yX3NoX21hc2suaDox
MDAxMzo1Njogd2FybmluZzogaW5pdGlhbGl6ZWQgZmllbGQgb3ZlcndyaXR0ZW4gWy1Xb3ZlcnJp
ZGUtaW5pdF0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2Uv
ZGNlX2F1eC5oOjIxNDoxNjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEFVWF9TV19E
QVRBX19BVVhfU1dfQVVUT0lOQ1JFTUVOVF9ESVNBQkxFX01BU0vigJkKPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5oOjEyNzoyOiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8g4oCYQVVYX1NG4oCZCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9yZXNvdXJjZS5jOjE4MToyOiBub3Rl
OiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYRENFX0FVWF9NQVNLX1NIX0xJU1TigJkKPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9hc2ljX3JlZy9kY2UvZGNlXzExXzJf
c2hfbWFzay5oOjEwMDEzOjU2OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYYXV4
X21hc2suQVVYX1NXX0FVVE9JTkNSRU1FTlRfRElTQUJMReKAmSkKPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5oOjIxNDoxNjogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEFVWF9TV19EQVRBX19BVVhfU1dfQVVUT0lOQ1JFTUVOVF9E
SVNBQkxFX01BU0vigJkKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9k
Yy9kY2UvZGNlX2F1eC5oOjEyNzoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQVVY
X1NG4oCZCj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4g
Q2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAg
VGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZS9kY2VfYXV4LmggfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5oCj4gaW5kZXggMzgy
NDY1ODYyZjI5Ny4uMjc3NDg0Y2Y4NTNlNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5oCj4gQEAgLTEyNCw3ICsxMjQsNiBAQCBzdHJ1Y3QgZGNl
MTEwX2F1eF9yZWdpc3RlcnMgewo+ICAgICAgICAgQVVYX1NGKEFVWF9TV19DT05UUk9MLCBBVVhf
U1dfR08sIG1hc2tfc2gpLFwKPiAgICAgICAgIEFVWF9TRihBVVhfU1dfREFUQSwgQVVYX1NXX0FV
VE9JTkNSRU1FTlRfRElTQUJMRSwgbWFza19zaCksXAo+ICAgICAgICAgQVVYX1NGKEFVWF9TV19E
QVRBLCBBVVhfU1dfREFUQV9SVywgbWFza19zaCksXAo+IC0gICAgICAgQVVYX1NGKEFVWF9TV19E
QVRBLCBBVVhfU1dfQVVUT0lOQ1JFTUVOVF9ESVNBQkxFLCBtYXNrX3NoKSxcCj4gICAgICAgICBB
VVhfU0YoQVVYX1NXX0RBVEEsIEFVWF9TV19JTkRFWCwgbWFza19zaCksXAo+ICAgICAgICAgQVVY
X1NGKEFVWF9TV19EQVRBLCBBVVhfU1dfREFUQSwgbWFza19zaCksXAo+ICAgICAgICAgQVVYX1NG
KEFVWF9TV19TVEFUVVMsIEFVWF9TV19SRVBMWV9CWVRFX0NPVU5ULCBtYXNrX3NoKSxcCj4gLS0K
PiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
