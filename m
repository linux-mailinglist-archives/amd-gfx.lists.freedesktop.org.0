Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494AD2F3C55
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Jan 2021 23:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206CA895F5;
	Tue, 12 Jan 2021 22:29:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F55893EB;
 Tue, 12 Jan 2021 22:29:57 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id x5so21700otp.9;
 Tue, 12 Jan 2021 14:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zqgSs5YA1N4P5qw6TX1amzxNau3S2NsbER/l85K2hbo=;
 b=IHsnhu+DCbXPmU/M9sbJ18QTjFnMV9YXipbUdi1/RnHwOE55hDIuyoApG+XCI6t7y6
 AyxkRqCULNSRNqIlIjFxbfAY7O6ErrR9G7MCEneFNPIsPJ419DF5ZIXB9rKupQhG3749
 tc7oAOeX+F5rSibwBPh02stpcALEeLdMW2tPvZJY6ItmIRzkFdB/mOxPt7hpQQ3KNlKp
 PIwk1kZU+c++amsrEh/kCpfxYT1ykTzuZ/C+cWUIz53PwgcLGRJRex+q+2QZ6vKFN9Qn
 u8PD+epq8iOWogGfKxB/s8DajRnzFFNK3uzNhoRLxaUanWXTk9cgVzHepHXLq7N7WU/N
 1Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zqgSs5YA1N4P5qw6TX1amzxNau3S2NsbER/l85K2hbo=;
 b=VQvxQ+MxdxmQncYO2zPHNh/wD0eyLq/e0LbOSzKx7BQCzQzeP+t7tnCKffQ5l8j/TE
 37g1OvHrdNbS9W9cdcZHflxjrjCNrBGvzEACdn9Cmn2lPoSeQTopA5k4QG4lJLLfP5/m
 0rKDtyVrgahlfBVKCbtojkQ2dEkN3kWonxWNmFoJDaWqS997TlksVFGVPqzW4kvDPkH/
 KcLIjLvFa2aqVDCtcXHUkOKRS/VGlxJyznDKjREVxQJyD91vdaBomgufdhwZS1sPJ43h
 kHdktbdxpw7A75AYmDlOmuC6pOMu88OTnltQE39wtwjkotVMmn6h+zZJl3tnJcs3utdP
 a49g==
X-Gm-Message-State: AOAM5326G1cjmP0asTiOXecT70Inz8LrIRU1pBs2+ggDFep1SGlnZ2qX
 rc71KVFM27+8id5Ra8rbtOwZieRMihfkFxabbYI=
X-Google-Smtp-Source: ABdhPJxncpEJztvvar/ck9ystEIB4WhkWvcJRUv+mtBzsU6p56GdYF0ipSWizZC5y+ToIbb1ZnS5LUpN3ga7szu8erk=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr1042650otl.311.1610490596442; 
 Tue, 12 Jan 2021 14:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-27-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-27-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:29:43 -0500
Message-ID: <CADnq5_OqT44rxMaaLQatKDs79G-v4D-yshuDwTZqHWh7pF0XcQ@mail.gmail.com>
Subject: Re: [PATCH 26/40] drm/amd/display/dc/dce110/dce110_timing_generator:
 Demote kernel-doc abuses to standard function headers
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
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmM6Nzk6IHdhcm5pbmc6IENhbm5vdCB1bmRl
cnN0YW5kICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS8uLi9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfdGltaW5nX2dlbmVyYXRvci5jOjEyNDogd2Fy
bmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndGcnIG5vdCBkZXNjcmliZWQgaW4g
J2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yX2VuYWJsZV9jcnRjJwo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfdGltaW5nX2dlbmVyYXRvci5j
OjE3OTogd2FybmluZzogQ2Fubm90IHVuZGVyc3RhbmQgICoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90
aW1pbmdfZ2VuZXJhdG9yLmM6MjMzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICd0Zycgbm90IGRlc2NyaWJlZCBpbiAnZGNlMTEwX3RpbWluZ19nZW5lcmF0b3JfZGlzYWJs
ZV9jcnRjJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEx
MC9kY2UxMTBfdGltaW5nX2dlbmVyYXRvci5jOjI1ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyIG9yIG1lbWJlciAndGcnIG5vdCBkZXNjcmliZWQgaW4gJ3Byb2dyYW1faG9yel9jb3VudF9i
eV8yJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMC9k
Y2UxMTBfdGltaW5nX2dlbmVyYXRvci5jOjI1ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAndGltaW5nJyBub3QgZGVzY3JpYmVkIGluICdwcm9ncmFtX2hvcnpfY291bnRf
YnlfMicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAv
ZGNlMTEwX3RpbWluZ19nZW5lcmF0b3IuYzoyODQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvciBtZW1iZXIgJ3RnJyBub3QgZGVzY3JpYmVkIGluICdkY2UxMTBfdGltaW5nX2dlbmVyYXRv
cl9wcm9ncmFtX3RpbWluZ19nZW5lcmF0b3InCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmM6Mjg0OiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkY19jcnRjX3RpbWluZycgbm90IGRl
c2NyaWJlZCBpbiAnZGNlMTEwX3RpbWluZ19nZW5lcmF0b3JfcHJvZ3JhbV90aW1pbmdfZ2VuZXJh
dG9yJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMC9k
Y2UxMTBfdGltaW5nX2dlbmVyYXRvci5jOjM1Njogd2FybmluZzogQ2Fubm90IHVuZGVyc3RhbmQg
ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rp
c3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmM6NTI1OiB3YXJuaW5nOiBD
YW5ub3QgdW5kZXJzdGFuZCAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Iu
Yzo1NjE6IHdhcm5pbmc6IENhbm5vdCB1bmRlcnN0YW5kICAqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBf
dGltaW5nX2dlbmVyYXRvci5jOjExMTg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ3RnJyBub3QgZGVzY3JpYmVkIGluICdkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl92YWxp
ZGF0ZV90aW1pbmcnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmM6MTExODogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAndGltaW5nJyBub3QgZGVzY3JpYmVkIGluICdkY2UxMTBfdGlt
aW5nX2dlbmVyYXRvcl92YWxpZGF0ZV90aW1pbmcnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmM6MTExODog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnc2lnbmFsJyBub3QgZGVzY3Jp
YmVkIGluICdkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl92YWxpZGF0ZV90aW1pbmcnCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdf
Z2VuZXJhdG9yLmM6MTE3NDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAn
dGcnIG5vdCBkZXNjcmliZWQgaW4gJ2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yX3dhaXRfZm9yX3Zi
bGFuaycKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAv
ZGNlMTEwX3RpbWluZ19nZW5lcmF0b3IuYzoxMTk4OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICd0Zycgbm90IGRlc2NyaWJlZCBpbiAnZGNlMTEwX3RpbWluZ19nZW5lcmF0
b3Jfd2FpdF9mb3JfdmFjdGl2ZScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19nZW5lcmF0b3IuYzoxMjA4OiB3YXJuaW5nOiBD
YW5ub3QgdW5kZXJzdGFuZCAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Iu
YzoxMzg2OiB3YXJuaW5nOiBDYW5ub3QgdW5kZXJzdGFuZCAgKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioK
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEw
X3RpbWluZ19nZW5lcmF0b3IuYzoxNzY4OiB3YXJuaW5nOiBDYW5ub3QgdW5kZXJzdGFuZCAgKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19nZW5lcmF0b3IuYzoxODAxOiB3YXJuaW5nOiBGdW5j
dGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd0Zycgbm90IGRlc2NyaWJlZCBpbiAnZGNlMTEwX3Rp
bWluZ19nZW5lcmF0b3JfZGlzYWJsZV92Z2EnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmM6MTg1MTogd2Fy
bmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndGcnIG5vdCBkZXNjcmliZWQgaW4g
J2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yX3NldF9vdmVyc2Nhbl9jb2xvcl9ibGFjaycKPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RpbWlu
Z19nZW5lcmF0b3IuYzoxODUxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVy
ICdjb2xvcicgbm90IGRlc2NyaWJlZCBpbiAnZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Jfc2V0X292
ZXJzY2FuX2NvbG9yX2JsYWNrJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2RjL2RjZTExMC9kY2UxMTBfdGltaW5nX2dlbmVyYXRvci5jOjE4NTE6IHdhcm5pbmc6IEV4
Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3BhcmFtJyBkZXNjcmlwdGlvbiBpbiAnZGNlMTEwX3Rp
bWluZ19nZW5lcmF0b3Jfc2V0X292ZXJzY2FuX2NvbG9yX2JsYWNrJwo+Cj4gQ2M6IEhhcnJ5IFdl
bnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlA
YW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+
IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+Cj4gQ2M6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgo+IENj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4CgoKPiAtLS0KPiAgLi4uL2RjL2RjZTExMC9k
Y2UxMTBfdGltaW5nX2dlbmVyYXRvci5jICAgICAgIHwgNzEgKysrKysrKysrLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBf
dGltaW5nX2dlbmVyYXRvci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEx
MC9kY2UxMTBfdGltaW5nX2dlbmVyYXRvci5jCj4gaW5kZXggOWE2YzQxMWJiN2ZlNi4uZDg4YTc0
NTU5ZWRkNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
MTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmMKPiBAQCAtNzUsNyAr
NzUsNyBAQCBzdGF0aWMgdm9pZCBkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl9hcHBseV9mcm9udF9w
b3JjaF93b3JrYXJvdW5kKAo+ICAgICAgICAgfQo+ICB9Cj4KPiAtLyoqCj4gKy8qCj4gICAqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKgo+ICAgKiAgRnVuY3Rpb246IGlzX2luX3ZlcnRpY2FsX2JsYW5rCj4g
ICAqCj4gQEAgLTExNiw3ICsxMTYsNyBAQCB2b2lkIGRjZTExMF90aW1pbmdfZ2VuZXJhdG9yX3Nl
dF9lYXJseV9jb250cm9sKAo+ICAgICAgICAgZG1fd3JpdGVfcmVnKHRnLT5jdHgsIGFkZHJlc3Ms
IHJlZ3ZhbCk7Cj4gIH0KPgo+IC0vKioKPiArLyoKPiAgICogRW5hYmxlIENSVEMKPiAgICogRW5h
YmxlIENSVEMgLSBjYWxsIEFTSUMgQ29udHJvbCBPYmplY3QgdG8gZW5hYmxlIFRpbWluZyBnZW5l
cmF0b3IuCj4gICAqLwo+IEBAIC0xNzUsNyArMTc1LDcgQEAgdm9pZCBkY2UxMTBfdGltaW5nX2dl
bmVyYXRvcl9wcm9ncmFtX2JsYW5rX2NvbG9yKAo+ICAgICAgICAgZG1fd3JpdGVfcmVnKHRnLT5j
dHgsIGFkZHIsIHZhbHVlKTsKPiAgfQo+Cj4gLS8qKgo+ICsvKgo+ICAgKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioKPiAgICogIEZ1bmN0aW9uOiBkaXNhYmxlX3N0ZXJlbwo+ICAgKgo+IEBAIC0yMjYsNyAr
MjI2LDcgQEAgc3RhdGljIHZvaWQgZGlzYWJsZV9zdGVyZW8oc3RydWN0IHRpbWluZ19nZW5lcmF0
b3IgKnRnKQo+ICB9Cj4gICNlbmRpZgo+Cj4gLS8qKgo+ICsvKgo+ICAgKiBkaXNhYmxlX2NydGMg
LSBjYWxsIEFTSUMgQ29udHJvbCBPYmplY3QgdG8gZGlzYWJsZSBUaW1pbmcgZ2VuZXJhdG9yLgo+
ICAgKi8KPiAgYm9vbCBkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl9kaXNhYmxlX2NydGMoc3RydWN0
IHRpbWluZ19nZW5lcmF0b3IgKnRnKQo+IEBAIC0yNDcsMTEgKzI0NywxMCBAQCBib29sIGRjZTEx
MF90aW1pbmdfZ2VuZXJhdG9yX2Rpc2FibGVfY3J0YyhzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAq
dGcpCj4gICAgICAgICByZXR1cm4gcmVzdWx0ID09IEJQX1JFU1VMVF9PSzsKPiAgfQo+Cj4gLS8q
Kgo+IC0qIHByb2dyYW1faG9yel9jb3VudF9ieV8yCj4gLSogUHJvZ3JhbXMgRHhDUlRDX0hPUlpf
Q09VTlRfQlkyX0VOIC0gMSBmb3IgRFZJIDMwYnBwIG1vZGUsIDAgb3RoZXJ3aXNlCj4gLSoKPiAt
Ki8KPiArLyoKPiArICogcHJvZ3JhbV9ob3J6X2NvdW50X2J5XzIKPiArICogUHJvZ3JhbXMgRHhD
UlRDX0hPUlpfQ09VTlRfQlkyX0VOIC0gMSBmb3IgRFZJIDMwYnBwIG1vZGUsIDAgb3RoZXJ3aXNl
Cj4gKyAqLwo+ICBzdGF0aWMgdm9pZCBwcm9ncmFtX2hvcnpfY291bnRfYnlfMigKPiAgICAgICAg
IHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICp0ZywKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBkY19j
cnRjX3RpbWluZyAqdGltaW5nKQo+IEBAIC0yNzMsNyArMjcyLDcgQEAgc3RhdGljIHZvaWQgcHJv
Z3JhbV9ob3J6X2NvdW50X2J5XzIoCj4gICAgICAgICAgICAgICAgICAgICAgICAgQ1JUQ19SRUco
bW1DUlRDX0NPVU5UX0NPTlRST0wpLCByZWd2YWwpOwo+ICB9Cj4KPiAtLyoqCj4gKy8qCj4gICAq
IHByb2dyYW1fdGltaW5nX2dlbmVyYXRvcgo+ICAgKiBQcm9ncmFtIENSVEMgVGltaW5nIFJlZ2lz
dGVycyAtIER4Q1JUQ19IXyosIER4Q1JUQ19WXyosIFBpeGVsIHJlcGV0aXRpb24uCj4gICAqIENh
bGwgQVNJQyBDb250cm9sIE9iamVjdCB0byBwcm9ncmFtIFRpbWluZ3MuCj4gQEAgLTM1Miw3ICsz
NTEsNyBAQCBib29sIGRjZTExMF90aW1pbmdfZ2VuZXJhdG9yX3Byb2dyYW1fdGltaW5nX2dlbmVy
YXRvcigKPiAgICAgICAgIHJldHVybiByZXN1bHQgPT0gQlBfUkVTVUxUX09LOwo+ICB9Cj4KPiAt
LyoqCj4gKy8qCj4gICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICAgKiAgRnVuY3Rpb246IHNldF9k
cnIKPiAgICoKPiBAQCAtNTIxLDcgKzUyMCw3IEBAIHVpbnQzMl90IGRjZTExMF90aW1pbmdfZ2Vu
ZXJhdG9yX2dldF92YmxhbmtfY291bnRlcihzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqdGcpCj4g
ICAgICAgICByZXR1cm4gZmllbGQ7Cj4gIH0KPgo+IC0vKioKPiArLyoKPiAgICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqCj4gICAqICBGdW5jdGlvbjogZGNlMTEwX3RpbWluZ19nZW5lcmF0b3JfZ2V0X3Bv
c2l0aW9uCj4gICAqCj4gQEAgLTU1Nyw3ICs1NTYsNyBAQCB2b2lkIGRjZTExMF90aW1pbmdfZ2Vu
ZXJhdG9yX2dldF9wb3NpdGlvbihzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqdGcsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgQ1JUQ19WRVJUX0NPVU5UX05PTSk7Cj4gIH0KPgo+IC0vKioKPiAr
LyoKPiAgICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gICAqICBGdW5jdGlvbjogZ2V0X2NydGNfc2Nh
bm91dHBvcwo+ICAgKgo+IEBAIC0xMTA2LDExICsxMTA1LDExIEBAIHZvaWQgZGNlMTEwX3RpbWlu
Z19nZW5lcmF0b3Jfc2V0X3Rlc3RfcGF0dGVybigKPiAgICAgICAgIH0KPiAgfQo+Cj4gLS8qKgo+
IC0qIGRjZTExMF90aW1pbmdfZ2VuZXJhdG9yX3ZhbGlkYXRlX3RpbWluZwo+IC0qIFRoZSB0aW1p
bmcgZ2VuZXJhdG9ycyBzdXBwb3J0IGEgbWF4aW11bSBkaXNwbGF5IHNpemUgb2YgaXMgODE5MiB4
IDgxOTIgcGl4ZWxzLAo+IC0qIGluY2x1ZGluZyBib3RoIGFjdGl2ZSBkaXNwbGF5IGFuZCBibGFu
a2luZyBwZXJpb2RzLiBDaGVjayBIIFRvdGFsIGFuZCBWIFRvdGFsLgo+IC0qLwo+ICsvKgo+ICsg
KiBkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl92YWxpZGF0ZV90aW1pbmcKPiArICogVGhlIHRpbWlu
ZyBnZW5lcmF0b3JzIHN1cHBvcnQgYSBtYXhpbXVtIGRpc3BsYXkgc2l6ZSBvZiBpcyA4MTkyIHgg
ODE5MiBwaXhlbHMsCj4gKyAqIGluY2x1ZGluZyBib3RoIGFjdGl2ZSBkaXNwbGF5IGFuZCBibGFu
a2luZyBwZXJpb2RzLiBDaGVjayBIIFRvdGFsIGFuZCBWIFRvdGFsLgo+ICsgKi8KPiAgYm9vbCBk
Y2UxMTBfdGltaW5nX2dlbmVyYXRvcl92YWxpZGF0ZV90aW1pbmcoCj4gICAgICAgICBzdHJ1Y3Qg
dGltaW5nX2dlbmVyYXRvciAqdGcsCj4gICAgICAgICBjb25zdCBzdHJ1Y3QgZGNfY3J0Y190aW1p
bmcgKnRpbWluZywKPiBAQCAtMTE2Nyw5ICsxMTY2LDkgQEAgYm9vbCBkY2UxMTBfdGltaW5nX2dl
bmVyYXRvcl92YWxpZGF0ZV90aW1pbmcoCj4gICAgICAgICByZXR1cm4gdHJ1ZTsKPiAgfQo+Cj4g
LS8qKgo+IC0qIFdhaXQgdGlsbCB3ZSBhcmUgYXQgdGhlIGJlZ2lubmluZyBvZiBWQmxhbmsuCj4g
LSovCj4gKy8qCj4gKyAqIFdhaXQgdGlsbCB3ZSBhcmUgYXQgdGhlIGJlZ2lubmluZyBvZiBWQmxh
bmsuCj4gKyAqLwo+ICB2b2lkIGRjZTExMF90aW1pbmdfZ2VuZXJhdG9yX3dhaXRfZm9yX3ZibGFu
ayhzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqdGcpCj4gIHsKPiAgICAgICAgIC8qIFdlIHdhbnQg
dG8gY2F0Y2ggYmVnaW5uaW5nIG9mIFZCbGFuayBoZXJlLCBzbyBpZiB0aGUgZmlyc3QgdHJ5IGFy
ZQo+IEBAIC0xMTkxLDkgKzExOTAsOSBAQCB2b2lkIGRjZTExMF90aW1pbmdfZ2VuZXJhdG9yX3dh
aXRfZm9yX3ZibGFuayhzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqdGcpCj4gICAgICAgICB9Cj4g
IH0KPgo+IC0vKioKPiAtKiBXYWl0IHRpbGwgd2UgYXJlIGluIFZBY3RpdmUgKGFueXdoZXJlIGlu
IFZBY3RpdmUpCj4gLSovCj4gKy8qCj4gKyAqIFdhaXQgdGlsbCB3ZSBhcmUgaW4gVkFjdGl2ZSAo
YW55d2hlcmUgaW4gVkFjdGl2ZSkKPiArICovCj4gIHZvaWQgZGNlMTEwX3RpbWluZ19nZW5lcmF0
b3Jfd2FpdF9mb3JfdmFjdGl2ZShzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqdGcpCj4gIHsKPiAg
ICAgICAgIHdoaWxlIChkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl9pc19pbl92ZXJ0aWNhbF9ibGFu
ayh0ZykpIHsKPiBAQCAtMTIwNCw3ICsxMjAzLDcgQEAgdm9pZCBkY2UxMTBfdGltaW5nX2dlbmVy
YXRvcl93YWl0X2Zvcl92YWN0aXZlKHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICp0ZykKPiAgICAg
ICAgIH0KPiAgfQo+Cj4gLS8qKgo+ICsvKgo+ICAgKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAgICog
IEZ1bmN0aW9uOiBkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl9zZXR1cF9nbG9iYWxfc3dhcF9sb2Nr
Cj4gICAqCj4gQEAgLTEyMTUsNyArMTIxNCw2IEBAIHZvaWQgZGNlMTEwX3RpbWluZ19nZW5lcmF0
b3Jfd2FpdF9mb3JfdmFjdGl2ZShzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqdGcpCj4gICAqICBA
cGFyYW0gW2luXSBnc2xfcGFyYW1zOiBzZXR1cCBkYXRhCj4gICAqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Kgo+ICAgKi8KPiAtCj4gIHZvaWQgZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Jfc2V0dXBfZ2xvYmFs
X3N3YXBfbG9jaygKPiAgICAgICAgIHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICp0ZywKPiAgICAg
ICAgIGNvbnN0IHN0cnVjdCBkY3BfZ3NsX3BhcmFtcyAqZ3NsX3BhcmFtcykKPiBAQCAtMTM4Miw3
ICsxMzgwLDcgQEAgdm9pZCBkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl90ZWFyX2Rvd25fZ2xvYmFs
X3N3YXBfbG9jaygKPgo+ICAgICAgICAgZG1fd3JpdGVfcmVnKHRnLT5jdHgsIGFkZHJlc3MsIHZh
bHVlKTsKPiAgfQo+IC0vKioKPiArLyoKPiAgICoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gICAqICBG
dW5jdGlvbjogaXNfY291bnRlcl9tb3ZpbmcKPiAgICoKPiBAQCAtMTc2NCw3ICsxNzYyLDcgQEAg
dm9pZCBkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl9kaXNhYmxlX3Jlc2V0X3RyaWdnZXIoCj4gICAg
ICAgICBkbV93cml0ZV9yZWcodGctPmN0eCwgQ1JUQ19SRUcobW1DUlRDX1RSSUdCX0NOVEwpLCB2
YWx1ZSk7Cj4gIH0KPgo+IC0vKioKPiArLyoKPiAgICoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gICAq
ICBAYnJpZWYKPiAgICogICAgIENoZWNrcyB3aGV0aGVyIENSVEMgdHJpZ2dlcmVkIHJlc2V0IG9j
Y3VycmVkCj4gQEAgLTE3OTEsNyArMTc4OSw3IEBAIGJvb2wgZGNlMTEwX3RpbWluZ19nZW5lcmF0
b3JfZGlkX3RyaWdnZXJlZF9yZXNldF9vY2N1cigKPiAgICAgICAgIHJldHVybiAoZm9yY2UgfHwg
dmVydF9zeW5jKTsKPiAgfQo+Cj4gLS8qKgo+ICsvKgo+ICAgKiBkY2UxMTBfdGltaW5nX2dlbmVy
YXRvcl9kaXNhYmxlX3ZnYQo+ICAgKiBUdXJuIE9GRiBWR0EgTW9kZSBhbmQgVGltaW5nICAtIER4
VkdBX0NPTlRST0wKPiAgICogVkdBIE1vZGUgYW5kIFZHQSBUaW1pbmcgaXMgdXNlZCBieSBWQklP
UyBvbiBDUlQgTW9uaXRvcnM7Cj4gQEAgLTE4MzcsMTQgKzE4MzUsMTMgQEAgdm9pZCBkY2UxMTBf
dGltaW5nX2dlbmVyYXRvcl9kaXNhYmxlX3ZnYSgKPiAgICAgICAgIGRtX3dyaXRlX3JlZyh0Zy0+
Y3R4LCBhZGRyLCB2YWx1ZSk7Cj4gIH0KPgo+IC0vKioKPiAtKiBzZXRfb3ZlcnNjYW5fY29sb3Jf
YmxhY2sKPiAtKgo+IC0qIEBwYXJhbSA6YmxhY2tfY29sb3IgaXMgb25lIG9mIHRoZSBjb2xvciBz
cGFjZQo+IC0qICAgIDp0aGlzIHJvdXRpbmUgd2lsbCBzZXQgb3ZlcnNjYW4gYmxhY2sgY29sb3Ig
YWNjb3JkaW5nIHRvIHRoZSBjb2xvciBzcGFjZS4KPiAtKiBAcmV0dXJuIG5vbmUKPiAtKi8KPiAt
Cj4gKy8qCj4gKyAqIHNldF9vdmVyc2Nhbl9jb2xvcl9ibGFjawo+ICsgKgo+ICsgKiBAcGFyYW0g
OmJsYWNrX2NvbG9yIGlzIG9uZSBvZiB0aGUgY29sb3Igc3BhY2UKPiArICogICAgOnRoaXMgcm91
dGluZSB3aWxsIHNldCBvdmVyc2NhbiBibGFjayBjb2xvciBhY2NvcmRpbmcgdG8gdGhlIGNvbG9y
IHNwYWNlLgo+ICsgKiBAcmV0dXJuIG5vbmUKPiArICovCj4gIHZvaWQgZGNlMTEwX3RpbWluZ19n
ZW5lcmF0b3Jfc2V0X292ZXJzY2FuX2NvbG9yX2JsYWNrKAo+ICAgICAgICAgc3RydWN0IHRpbWlu
Z19nZW5lcmF0b3IgKnRnLAo+ICAgICAgICAgY29uc3Qgc3RydWN0IHRnX2NvbG9yICpjb2xvcikK
PiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
